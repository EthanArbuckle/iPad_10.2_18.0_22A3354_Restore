@implementation IAPNavigation

- (IAPNavigation)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Invalid Invocation: IAPNavigation: init"), CFSTR("-initWithDelegate: must be called instead"));

  return 0;
}

- (IAPNavigation)initWithDelegate:(id)a3
{
  id v4;
  IAPNavigation *v5;
  uint64_t v6;
  NSSet *availableAccessories;
  dispatch_queue_t v8;
  OS_dispatch_queue *processingQ;
  uint64_t v10;
  NSNotificationCenter *localNotificationCenter;
  void *v12;
  void *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v15;
  OS_xpc_object *iap2d_connection;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IAPNavigation;
  v5 = -[IAPNavigation init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    availableAccessories = v5->_availableAccessories;
    v5->_availableAccessories = (NSSet *)v6;

    objc_storeWeak((id *)&v5->_delegate, v4);
    v5->_connected = 0;
    v8 = dispatch_queue_create("com.apple.iap.navigation.processingQ", 0);
    processingQ = v5->_processingQ;
    v5->_processingQ = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = objc_claimAutoreleasedReturnValue();
    localNotificationCenter = v5->_localNotificationCenter;
    v5->_localNotificationCenter = (NSNotificationCenter *)v10;

    -[NSNotificationCenter addObserver:selector:name:object:](v5->_localNotificationCenter, "addObserver:selector:name:object:", v5, sel__iap2d_server_did_launch, CFSTR("iAP2ServerLaunch"), 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v5->_localNotificationCenter, "addObserver:selector:name:object:", v5, sel__iap2d_server_did_die, CFSTR("iAP2ServerDie"), 0);
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nav_frameworkShouldPollNotification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__getConnectedAccessories, v13, 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v5->_darwinNotificationCenter = DarwinNotifyCenter;
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__iap2dServerLaunched, CFSTR("kIAP2ServerLaunchedNotification"), 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5->_darwinNotificationCenter, 0, (CFNotificationCallback)__iap2dServerDied, CFSTR("kIAP2ServerDiedNotification"), 0, (CFNotificationSuspensionBehavior)0);
    RetainConnectionToIAP2Daemon();
    v15 = objc_claimAutoreleasedReturnValue();
    iap2d_connection = v5->_iap2d_connection;
    v5->_iap2d_connection = (OS_xpc_object *)v15;

    if (v5->_iap2d_connection)
    {
      v5->_connected = 1;
      -[IAPNavigation _getConnectedAccessories](v5, "_getConnectedAccessories");
    }
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSNotificationCenter removeObserver:](self->_localNotificationCenter, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  CFNotificationCenterRemoveObserver(self->_darwinNotificationCenter, 0, CFSTR("kIAP2ServerLaunchedNotification"), 0);
  CFNotificationCenterRemoveObserver(self->_darwinNotificationCenter, 0, CFSTR("kIAP2ServerDiedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)IAPNavigation;
  -[IAPNavigation dealloc](&v4, sel_dealloc);
}

- (void)updateNavigationGuidanceInfo:(id)a3 forAccessory:(id)a4 withComponent:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *processingQ;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    if (!__debugLogEnabled___bNavigationDebug)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug)
LABEL_3:
    NSLog(CFSTR("[#Navigation] ### -(void)updateNavigationGuidanceInfo: info=%@ accessory=%@ component=%@"), v8, v9, v10);
LABEL_4:
  processingQ = self->_processingQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__IAPNavigation_updateNavigationGuidanceInfo_forAccessory_withComponent___block_invoke;
  block[3] = &unk_1E69313B8;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(processingQ, block);

}

void __73__IAPNavigation_updateNavigationGuidanceInfo_forAccessory_withComponent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  xpc_object_t xdict;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 24) && *(_QWORD *)(v1 + 48))
  {
    xdict = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(xdict, "requestType", "nav_sendGuidanceUpdate");
    xpc_dictionary_set_uint64(xdict, "nav_accessoryIdentifier", objc_msgSend(*(id *)(a1 + 40), "identifier"));
    v3 = *(void **)(a1 + 48);
    if (v3)
      xpc_dictionary_set_uint64(xdict, "nav_componentIdentifier", objc_msgSend(v3, "identifier"));
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", *(_QWORD *)(a1 + 56));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(xdict, "nav_payload", (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
    v5 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 48), xdict);
    v6 = v5;
    if (v5)
    {
      v7 = MEMORY[0x1B5E4DB38](v5);
      if (v6 == (void *)MEMORY[0x1E0C81260] && v7 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Navigation] Error: IAPNavigation: -updateNavigationGuidanceInfo: received an XPC_ERROR_CONNECTION_INVALID error."));
      }
      else
      {
        if (v6 != (void *)MEMORY[0x1E0C81258] || v7 != MEMORY[0x1E0C81310])
        {
          if (v7 == MEMORY[0x1E0C812F8])
          {
            if (xpc_dictionary_get_uint64(v6, "result"))
              NSLog(CFSTR("[#Navigation] Error: -updateNavigationGuidanceInfo: received non-zero xpc response"));
          }
          else if (v7 == MEMORY[0x1E0C81310])
          {
            NSLog(CFSTR("[#Navigation] %s:%d Unhandled reply error!"), "-[IAPNavigation updateNavigationGuidanceInfo:forAccessory:withComponent:]_block_invoke", 561);
          }
          else
          {
            NSLog(CFSTR("[#Navigation] %s:%d Unknown reply type %p!"), "-[IAPNavigation updateNavigationGuidanceInfo:forAccessory:withComponent:]_block_invoke", 565, v7);
          }
          goto LABEL_15;
        }
        NSLog(CFSTR("[#Navigation] Error: IAPNavigation: -updateNavigationGuidanceInfo: received an XPC_ERROR_CONNECTION_INTERRUPTED error."));
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("iAP2ServerDie"), 0);

    }
    else
    {
      NSLog(CFSTR("[#Navigation] %s:%d No reply received for message!"), "-[IAPNavigation updateNavigationGuidanceInfo:forAccessory:withComponent:]_block_invoke", 570);
    }
LABEL_15:

  }
}

- (void)updateNavigationManeuverInfo:(id)a3 forAccessory:(id)a4 withComponent:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *processingQ;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    if (!__debugLogEnabled___bNavigationDebug)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug)
LABEL_3:
    NSLog(CFSTR("[#Navigation] ### -(void)updateNavigationManeuverInfo: info=%@ accessory=%@ component=%@"), v8, v9, v10);
LABEL_4:
  processingQ = self->_processingQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__IAPNavigation_updateNavigationManeuverInfo_forAccessory_withComponent___block_invoke;
  block[3] = &unk_1E69313B8;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(processingQ, block);

}

void __73__IAPNavigation_updateNavigationManeuverInfo_forAccessory_withComponent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  xpc_object_t xdict;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 24) && *(_QWORD *)(v1 + 48))
  {
    xdict = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(xdict, "requestType", "nav_sendManeuverUpdate");
    xpc_dictionary_set_uint64(xdict, "nav_accessoryIdentifier", objc_msgSend(*(id *)(a1 + 40), "identifier"));
    v3 = *(void **)(a1 + 48);
    if (v3)
      xpc_dictionary_set_uint64(xdict, "nav_componentIdentifier", objc_msgSend(v3, "identifier"));
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", *(_QWORD *)(a1 + 56));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(xdict, "nav_payload", (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
    v5 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 48), xdict);
    v6 = v5;
    if (v5)
    {
      v7 = MEMORY[0x1B5E4DB38](v5);
      if (v6 == (void *)MEMORY[0x1E0C81260] && v7 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Navigation] Error: IAPNavigation: -updateNavigationGuidanceInfo: received an XPC_ERROR_CONNECTION_INVALID error."));
      }
      else
      {
        if (v6 != (void *)MEMORY[0x1E0C81258] || v7 != MEMORY[0x1E0C81310])
        {
          if (v7 == MEMORY[0x1E0C812F8])
          {
            if (xpc_dictionary_get_uint64(v6, "result"))
              NSLog(CFSTR("[#Navigation] Error: -updateNavigationGuidanceInfo: received non-zero xpc response"));
          }
          else if (v7 == MEMORY[0x1E0C81310])
          {
            NSLog(CFSTR("[#Navigation] %s:%d Unhandled reply error!"), "-[IAPNavigation updateNavigationManeuverInfo:forAccessory:withComponent:]_block_invoke", 628);
          }
          else
          {
            NSLog(CFSTR("[#Navigation] %s:%d Unknown reply type %p!"), "-[IAPNavigation updateNavigationManeuverInfo:forAccessory:withComponent:]_block_invoke", 632, v7);
          }
          goto LABEL_15;
        }
        NSLog(CFSTR("[#Navigation] Error: IAPNavigation: -updateNavigationGuidanceInfo: received an XPC_ERROR_CONNECTION_INTERRUPTED error."));
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("iAP2ServerDie"), 0);

    }
    else
    {
      NSLog(CFSTR("[#Navigation] %s:%d No reply received for message!"), "-[IAPNavigation updateNavigationManeuverInfo:forAccessory:withComponent:]_block_invoke", 637);
    }
LABEL_15:

  }
}

- (void)_iap2d_server_did_launch
{
  NSObject *processingQ;
  _QWORD block[5];

  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    if (!__debugLogEnabled___bNavigationDebug)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug)
LABEL_3:
    NSLog(CFSTR("[#Navigation] ### - (void)_iap2d_server_did_launch"), a2);
LABEL_4:
  processingQ = self->_processingQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__IAPNavigation__iap2d_server_did_launch__block_invoke;
  block[3] = &unk_1E69313E0;
  block[4] = self;
  dispatch_async(processingQ, block);
}

void __41__IAPNavigation__iap2d_server_did_launch__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (__debugLogEnabled___bNavigationDebug != -1)
  {
    if (!__debugLogEnabled___bNavigationDebug)
      goto LABEL_4;
    goto LABEL_3;
  }
  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
  if (__debugLogEnabled___bNavigationDebug)
LABEL_3:
    NSLog(CFSTR("[#Navigation] ### running inside block, connected: %d"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
LABEL_4:
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    RetainConnectionToIAP2Daemon();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 48))
    {
      *(_BYTE *)(v5 + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_getConnectedAccessories");
    }
  }
}

- (void)_iap2d_server_did_die
{
  NSObject *processingQ;
  _QWORD block[5];

  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    if (!__debugLogEnabled___bNavigationDebug)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug)
LABEL_3:
    NSLog(CFSTR("[#Navigation] ### - (void)_iap2d_server_did_die"), a2);
LABEL_4:
  processingQ = self->_processingQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__IAPNavigation__iap2d_server_did_die__block_invoke;
  block[3] = &unk_1E69313E0;
  block[4] = self;
  dispatch_async(processingQ, block);
}

void __38__IAPNavigation__iap2d_server_did_die__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (__debugLogEnabled___bNavigationDebug != -1)
  {
    if (!__debugLogEnabled___bNavigationDebug)
      goto LABEL_4;
    goto LABEL_3;
  }
  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
  if (__debugLogEnabled___bNavigationDebug)
LABEL_3:
    NSLog(CFSTR("[#Navigation] ### running inside block, connected: %d"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24));
LABEL_4:
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    v3 = *(void **)(v2 + 48);
    *(_QWORD *)(v2 + 48) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    v4 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    objc_msgSend(*(id *)(a1 + 32), "_updateInternalStateWithArrayOfAccessories:", v4);

  }
}

- (void)_getConnectedAccessories
{
  NSObject *processingQ;
  _QWORD block[5];

  processingQ = self->_processingQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__IAPNavigation__getConnectedAccessories__block_invoke;
  block[3] = &unk_1E69313E0;
  block[4] = self;
  dispatch_async(processingQ, block);
}

void __41__IAPNavigation__getConnectedAccessories__block_invoke(uint64_t a1)
{
  uint64_t v1;
  xpc_object_t v3;
  void *v4;
  uint64_t v5;
  void *v8;
  void *v9;
  void *v10;
  xpc_object_t message;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 24) && *(_QWORD *)(v1 + 48))
  {
    message = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(message, "requestType", "nav_requestConnectedAccessories");
    v3 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 48), message);
    v4 = v3;
    if (v3)
    {
      v5 = MEMORY[0x1B5E4DB38](v3);
      if (v4 == (void *)MEMORY[0x1E0C81260] && v5 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Navigation] IAPNavigation received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else
      {
        if (v4 != (void *)MEMORY[0x1E0C81258] || v5 != MEMORY[0x1E0C81310])
        {
          if (v5 == MEMORY[0x1E0C812F8])
          {
            if (xpc_dictionary_get_BOOL(v4, "result"))
            {
              xpc_dictionary_get_value(v4, "nav_accessoriesConnected");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              if (__debugLogEnabled())
                NSLog(CFSTR("[#Navigation] ### Connected Accessories xpc object: %@"), v9);
              objc_msgSend(*(id *)(a1 + 32), "_convert_xpc_array_to_NSArray:", v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "_updateInternalStateWithArrayOfAccessories:", v10);

            }
          }
          else if (v5 == MEMORY[0x1E0C81310])
          {
            NSLog(CFSTR("[#Navigation] %s:%d Unhandled reply error!"), "-[IAPNavigation _getConnectedAccessories]_block_invoke", 728);
          }
          else
          {
            NSLog(CFSTR("[#Navigation] %s:%d Unknown reply type %p!"), "-[IAPNavigation _getConnectedAccessories]_block_invoke", 732, v5);
          }
          goto LABEL_20;
        }
        NSLog(CFSTR("[#Navigation] IAPNavigation received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("iAP2ServerDie"), 0);

    }
    else
    {
      NSLog(CFSTR("[#Navigation] %s:%d No reply received for message!"), "-[IAPNavigation _getConnectedAccessories]_block_invoke", 737);
    }
LABEL_20:

  }
}

- (void)_updateInternalStateWithArrayOfAccessories:(id)a3
{
  id v4;
  int AppBooleanValue;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSSet *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  int v48;
  NSSet *availableAccessories;
  void *v50;
  id *p_delegate;
  char *v52;
  void *v53;
  int v54;
  id WeakRetained;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  int v64;
  int v65;
  id *v66;
  char *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  int v77;
  IAPNavigation *v78;
  id *v79;
  char *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  int v90;
  id v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id obj;
  id v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  IAPNavigation *v112;
  id v113;
  char *v114;
  char *v115;
  char *v116;
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
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AppBooleanValue = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    __debugLogEnabled___bNavigationDebug = AppBooleanValue;
  }
  if (AppBooleanValue)
  {
    NSLog(CFSTR("[#Navigation] ###   BEGIN -(void)_updateInternalStateWithArrayOfAccessories"));
    v6 = __debugLogEnabled___bNavigationDebug;
    if (__debugLogEnabled___bNavigationDebug == -1)
    {
      v6 = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
      __debugLogEnabled___bNavigationDebug = v6;
    }
    if (v6)
      NSLog(CFSTR("[#Navigation] Input array: %@"), v4);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v97 = (id)objc_claimAutoreleasedReturnValue();
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
  v112 = self;
  if (v8)
  {
    v9 = (id)v8;
    v10 = 0x1E6930000uLL;
    v11 = *(_QWORD *)v150;
    v93 = v7;
    v96 = *(_QWORD *)v150;
    do
    {
      v12 = 0;
      v99 = v9;
      do
      {
        if (*(_QWORD *)v150 != v11)
          objc_enumerationMutation(obj);
        v13 = (void *)objc_msgSend(objc_alloc(*(Class *)(v10 + 2096)), "initWithDict:", *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)v12));
        if (__debugLogEnabled___bNavigationDebug != -1)
        {
          if (!__debugLogEnabled___bNavigationDebug)
            goto LABEL_16;
LABEL_15:
          NSLog(CFSTR("[#Navigation] IAPNavigationAccessory created: %@"), v13);
          goto LABEL_16;
        }
        __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
        if (__debugLogEnabled___bNavigationDebug)
          goto LABEL_15;
LABEL_16:
        v14 = -[NSSet containsObject:](self->_availableAccessories, "containsObject:", v13);
        v15 = __debugLogEnabled___bNavigationDebug;
        if (!v14)
        {
          if (__debugLogEnabled___bNavigationDebug == -1)
          {
            __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
            if (__debugLogEnabled___bNavigationDebug)
LABEL_28:
              NSLog(CFSTR("[#Navigation]    - accessory is new, adding to available accessories set"));
          }
          else if (__debugLogEnabled___bNavigationDebug)
          {
            goto LABEL_28;
          }
          -[NSSet addObject:](self->_availableAccessories, "addObject:", v13);
          objc_msgSend(v13, "set_wasFoundInLastUpdate:", 1);
          objc_msgSend(v7, "addObject:", v13);
          goto LABEL_46;
        }
        if (__debugLogEnabled___bNavigationDebug == -1)
        {
          v15 = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
          __debugLogEnabled___bNavigationDebug = v15;
        }
        v104 = v12;
        if (v15)
          NSLog(CFSTR("[#Navigation]    - accessory is already in available accessories list"));
        v16 = (void *)MEMORY[0x1E0CB3880];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "identifier"));
        v17 = v13;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "predicateWithFormat:", CFSTR("identifier = %@"), v18);
        v19 = objc_claimAutoreleasedReturnValue();

        -[NSSet allObjects](self->_availableAccessories, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = (id)v19;
        objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "set_wasFoundInLastUpdate:", 1);
        objc_msgSend(v22, "components");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = v17;
        objc_msgSend(v17, "components");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqualToSet:", v24);

        v26 = __debugLogEnabled___bNavigationDebug;
        if (!v25)
        {
          if (__debugLogEnabled___bNavigationDebug == -1)
          {
            __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
            if (__debugLogEnabled___bNavigationDebug)
LABEL_34:
              NSLog(CFSTR("[#Navigation]    - accessory has modified components set"));
          }
          else if (__debugLogEnabled___bNavigationDebug)
          {
            goto LABEL_34;
          }
          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          objc_msgSend(v17, "components");
          v113 = (id)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v146;
            do
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v146 != v31)
                  objc_enumerationMutation(v113);
                v33 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * i);
                v34 = (void *)MEMORY[0x1E0CB3880];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v33, "identifier"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "predicateWithFormat:", CFSTR("identifier = %@"), v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v22, "components");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "allObjects");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "filteredArrayUsingPredicate:", v36);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "firstObject");
                v40 = (void *)objc_claimAutoreleasedReturnValue();

                LODWORD(v39) = objc_msgSend(v33, "isEnabled");
                if ((_DWORD)v39 != objc_msgSend(v40, "isEnabled"))
                {
                  objc_msgSend(v40, "setIsEnabled:", objc_msgSend(v33, "isEnabled"));
                  objc_msgSend(v40, "set_enabledModified:", 1);
                }

              }
              v30 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v145, v160, 16);
            }
            while (v30);
          }

          v7 = v93;
          v27 = v94;
          self = v112;
          v10 = 0x1E6930000;
          v9 = v99;
          v11 = v96;
          v28 = v102;
          v12 = v104;
          goto LABEL_45;
        }
        v9 = v99;
        v11 = v96;
        if (__debugLogEnabled___bNavigationDebug == -1)
        {
          v26 = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
          __debugLogEnabled___bNavigationDebug = v26;
        }
        v27 = v95;
        v28 = v102;
        v12 = v104;
        if (v26)
        {
          NSLog(CFSTR("[#Navigation]    - accessory is unchanged"), v95);
          v27 = v95;
        }
LABEL_45:
        objc_msgSend(v27, "addObject:", v22);

        v13 = v108;
LABEL_46:

        v12 = (char *)v12 + 1;
      }
      while (v12 != v9);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
      v9 = (id)v41;
    }
    while (v41);
  }

  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v42 = self->_availableAccessories;
  v43 = -[NSSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v142;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v142 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * j);
        if (objc_msgSend(v47, "_wasFoundInLastUpdate"))
          objc_msgSend(v47, "set_wasFoundInLastUpdate:", 0);
        else
          objc_msgSend(v97, "addObject:", v47);
      }
      v44 = -[NSSet countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v141, v159, 16);
    }
    while (v44);
  }

  v48 = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    v48 = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    __debugLogEnabled___bNavigationDebug = v48;
  }
  if (v48)
    NSLog(CFSTR("[#Navigation] Adding new accessories to _available accessories: %@"), v7);
  availableAccessories = self->_availableAccessories;
  objc_msgSend(v7, "allObjects");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet addObjectsFromArray:](availableAccessories, "addObjectsFromArray:", v50);

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v103 = v7;
  v109 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
  if (v109)
  {
    p_delegate = (id *)&v112->_delegate;
    v105 = *(_QWORD *)v138;
    do
    {
      v52 = 0;
      do
      {
        if (*(_QWORD *)v138 != v105)
          objc_enumerationMutation(v103);
        v53 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)v52);
        v54 = __debugLogEnabled___bNavigationDebug;
        if (__debugLogEnabled___bNavigationDebug == -1)
        {
          v54 = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
          __debugLogEnabled___bNavigationDebug = v54;
        }
        v114 = v52;
        if (v54)
          NSLog(CFSTR("[#Navigation] Call Delegate on new IAPNavigationAccessoryDidBecomeAvailable:%@"), v53);
        WeakRetained = objc_loadWeakRetained(p_delegate);
        objc_msgSend(WeakRetained, "IAPNavigationAccessoryDidBecomeAvailable:", v53);

        v135 = 0u;
        v136 = 0u;
        v133 = 0u;
        v134 = 0u;
        objc_msgSend(v53, "components");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
        if (v57)
        {
          v58 = v57;
          v59 = *(_QWORD *)v134;
          do
          {
            v60 = 0;
            do
            {
              if (*(_QWORD *)v134 != v59)
                objc_enumerationMutation(v56);
              v61 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v60);
              if (objc_msgSend(v61, "isEnabled"))
              {
                if (__debugLogEnabled___bNavigationDebug == -1)
                {
                  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
                  if (__debugLogEnabled___bNavigationDebug)
LABEL_84:
                    NSLog(CFSTR("[#Navigation] Call Delegate on new IAPNavigationAccessory:%@ didEnableNavigationUpdatesForComponent:%@"), v53, v61);
                }
                else if (__debugLogEnabled___bNavigationDebug)
                {
                  goto LABEL_84;
                }
                v62 = objc_loadWeakRetained(p_delegate);
                objc_msgSend(v62, "IAPNavigationAccessory:didEnableNavigationUpdatesForComponent:", v53, v61);

              }
              ++v60;
            }
            while (v58 != v60);
            v63 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
            v58 = v63;
          }
          while (v63);
        }

        v52 = v114 + 1;
      }
      while (v114 + 1 != (char *)v109);
      v109 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
    }
    while (v109);
  }

  v64 = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    v64 = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    __debugLogEnabled___bNavigationDebug = v64;
  }
  if (v64)
  {
    NSLog(CFSTR("[#Navigation] Available Accessories set now contains: %@"), v112->_availableAccessories);
    v65 = __debugLogEnabled___bNavigationDebug;
    if (__debugLogEnabled___bNavigationDebug == -1)
    {
      v65 = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
      __debugLogEnabled___bNavigationDebug = v65;
    }
    if (v65)
      NSLog(CFSTR("[#Navigation] Updating modified accessories/components: %@"), v94);
  }
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v100 = v94;
  v110 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v129, v156, 16);
  if (v110)
  {
    v66 = (id *)&v112->_delegate;
    v106 = *(_QWORD *)v130;
    do
    {
      v67 = 0;
      do
      {
        if (*(_QWORD *)v130 != v106)
          objc_enumerationMutation(v100);
        v115 = v67;
        v68 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)v67);
        v125 = 0u;
        v126 = 0u;
        v127 = 0u;
        v128 = 0u;
        objc_msgSend(v68, "components");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v125, v155, 16);
        if (v70)
        {
          v71 = v70;
          v72 = *(_QWORD *)v126;
          do
          {
            v73 = 0;
            do
            {
              if (*(_QWORD *)v126 != v72)
                objc_enumerationMutation(v69);
              v74 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v73);
              if (objc_msgSend(v74, "_enabledModified"))
              {
                objc_msgSend(v74, "set_enabledModified:", 0);
                if (objc_msgSend(v74, "isEnabled"))
                {
                  if (__debugLogEnabled___bNavigationDebug == -1)
                  {
                    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
                    if (__debugLogEnabled___bNavigationDebug)
LABEL_114:
                      NSLog(CFSTR("[#Navigation] Call Delegate on modified IAPNavigationAccessory:%@ didEnableNavigationUpdatesForComponent:%@"), v68, v74);
                  }
                  else if (__debugLogEnabled___bNavigationDebug)
                  {
                    goto LABEL_114;
                  }
                  v75 = objc_loadWeakRetained(v66);
                  objc_msgSend(v75, "IAPNavigationAccessory:didEnableNavigationUpdatesForComponent:", v68, v74);
LABEL_120:

                  goto LABEL_121;
                }
                if (__debugLogEnabled___bNavigationDebug == -1)
                {
                  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
                  if (__debugLogEnabled___bNavigationDebug)
LABEL_118:
                    NSLog(CFSTR("[#Navigation] Call Delegate on modified IAPNavigationAccessory:%@ didDisableNavigationUpdatesForComponent:%@"), v68, v74);
                }
                else if (__debugLogEnabled___bNavigationDebug)
                {
                  goto LABEL_118;
                }
                v75 = objc_loadWeakRetained(v66);
                objc_msgSend(v75, "IAPNavigationAccessory:didDisableNavigationUpdatesForComponent:", v68, v74);
                goto LABEL_120;
              }
LABEL_121:
              ++v73;
            }
            while (v71 != v73);
            v76 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v125, v155, 16);
            v71 = v76;
          }
          while (v76);
        }

        v67 = v115 + 1;
      }
      while (v115 + 1 != (char *)v110);
      v110 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v129, v156, 16);
    }
    while (v110);
  }

  v77 = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    v77 = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    __debugLogEnabled___bNavigationDebug = v77;
  }
  v78 = v112;
  if (v77)
    NSLog(CFSTR("[#Navigation] Removing removed accessories: %@"), v97);
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v98 = v97;
  v111 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v121, v154, 16);
  if (v111)
  {
    v79 = (id *)&v112->_delegate;
    v107 = *(_QWORD *)v122;
    do
    {
      v80 = 0;
      do
      {
        if (*(_QWORD *)v122 != v107)
          objc_enumerationMutation(v98);
        v116 = v80;
        v81 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)v80);
        -[NSSet removeObject:](v78->_availableAccessories, "removeObject:", v81);
        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        objc_msgSend(v81, "components");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v117, v153, 16);
        if (v83)
        {
          v84 = v83;
          v85 = *(_QWORD *)v118;
          do
          {
            v86 = 0;
            do
            {
              if (*(_QWORD *)v118 != v85)
                objc_enumerationMutation(v82);
              v87 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v86);
              if (objc_msgSend(v87, "isEnabled"))
              {
                if (__debugLogEnabled___bNavigationDebug == -1)
                {
                  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
                  if (__debugLogEnabled___bNavigationDebug)
LABEL_147:
                    NSLog(CFSTR("[#Navigation] Call Delegate on removed IAPNavigationAccessory:%@ didDisableNavigationUpdatesForComponent:%@"), v81, v87);
                }
                else if (__debugLogEnabled___bNavigationDebug)
                {
                  goto LABEL_147;
                }
                v88 = objc_loadWeakRetained(v79);
                objc_msgSend(v88, "IAPNavigationAccessory:didDisableNavigationUpdatesForComponent:", v81, v87);

              }
              ++v86;
            }
            while (v84 != v86);
            v89 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v117, v153, 16);
            v84 = v89;
          }
          while (v89);
        }

        v90 = __debugLogEnabled___bNavigationDebug;
        if (__debugLogEnabled___bNavigationDebug == -1)
        {
          v90 = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
          __debugLogEnabled___bNavigationDebug = v90;
        }
        if (v90)
          NSLog(CFSTR("[#Navigation] Call Delegate on removed IAPNavigationAccessoryDidBecomeUnavailable:%@"), v81);
        v91 = objc_loadWeakRetained(v79);
        objc_msgSend(v91, "IAPNavigationAccessoryDidBecomeUnavailable:", v81);

        v80 = v116 + 1;
        v78 = v112;
      }
      while (v116 + 1 != (char *)v111);
      v111 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v121, v154, 16);
    }
    while (v111);
  }

  v92 = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    v92 = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    __debugLogEnabled___bNavigationDebug = v92;
  }
  if (v92)
    NSLog(CFSTR("[#Navigation] Available Accessories set now contains: %@"), v78->_availableAccessories);

}

- (id)_convert_xpc_array_to_NSArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD applier[4];
  id v8;

  v3 = a3;
  if (MEMORY[0x1B5E4DB38]() != MEMORY[0x1E0C812C8])
    -[IAPNavigation _convert_xpc_array_to_NSArray:].cold.1();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __47__IAPNavigation__convert_xpc_array_to_NSArray___block_invoke;
  applier[3] = &unk_1E6931430;
  v5 = v4;
  v8 = v5;
  xpc_array_apply(v3, applier);

  return v5;
}

uint64_t __47__IAPNavigation__convert_xpc_array_to_NSArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t uint64;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  uint64_t v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1B5E4DB38](v4);
  v7 = MEMORY[0x1E0C812F8];
  if (v6 == MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v4, "identifier");
    xpc_dictionary_get_array(v4, "components");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", uint64);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("identifier"));

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1B5E4DB38](v9) == MEMORY[0x1E0C812C8])
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __47__IAPNavigation__convert_xpc_array_to_NSArray___block_invoke_2;
      v18 = &unk_1E6931408;
      v19 = v11;
      v20 = v7;
      v14 = v11;
      xpc_array_apply(v9, &v15);
      objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("components"), v15, v16, v17, v18);

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
      v12 = 1;
      goto LABEL_5;
    }

  }
  v12 = 0;
LABEL_5:

  return v12;
}

BOOL __47__IAPNavigation__convert_xpc_array_to_NSArray___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t uint64;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = MEMORY[0x1E0C812F8];
  if (v6 == MEMORY[0x1E0C812F8])
  {
    uint64 = xpc_dictionary_get_uint64(v4, "identifier");
    v9 = xpc_dictionary_get_BOOL(v4, "isEnabled");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", xpc_dictionary_get_string(v4, "name"), 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = xpc_dictionary_get_uint64(v4, "maxLength_CurrentRoadName");
    v12 = xpc_dictionary_get_uint64(v4, "maxLength_DestinationRoadName");
    v22 = xpc_dictionary_get_uint64(v4, "maxLength_PostManeuverRoadName");
    v23 = xpc_dictionary_get_uint64(v4, "maxLength_ManeuverDescription");
    v24 = xpc_dictionary_get_uint64(v4, "maxCapacity_GuidanceManeuver");
    if (v9)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("isEnabled"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", uint64);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v14, CFSTR("identifier"));

    objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("name"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v15, CFSTR("maxLength_CurrentRoadName"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v16, CFSTR("maxLength_DestinationRoadName"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v17, CFSTR("maxLength_PostManeuverRoadName"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v18, CFSTR("maxLength_ManeuverDescription"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v19, CFSTR("maxCapacity_GuidanceManeuver"));

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v7 = MEMORY[0x1E0C812F8];
  }
  v20 = v6 == v7;

  return v20;
}

- (IAPNavigationDelegate)delegate
{
  return (IAPNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)availableAccessories
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAvailableAccessories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_xpc_object)iap2d_connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIap2d_connection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (OS_dispatch_queue)processingQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProcessingQ:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQ, 0);
  objc_storeStrong((id *)&self->_iap2d_connection, 0);
  objc_storeStrong((id *)&self->_availableAccessories, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_localNotificationCenter, 0);
}

- (void)_convert_xpc_array_to_NSArray:.cold.1()
{
  __assert_rtn("-[IAPNavigation _convert_xpc_array_to_NSArray:]", "IAPNavigation.m", 915, "xpc_get_type(x_array) == XPC_TYPE_ARRAY");
}

@end
