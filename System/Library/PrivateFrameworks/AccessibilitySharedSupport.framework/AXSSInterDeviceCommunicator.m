@implementation AXSSInterDeviceCommunicator

- (AXSSInterDeviceCommunicator)init
{
  AXSSInterDeviceCommunicator *v2;
  NSMutableArray *v3;
  NSMutableArray *availableDevices;
  NSMutableDictionary *v5;
  NSMutableDictionary *deviceTypesByPeerID;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  MCPeerID *localPeerID;
  uint64_t v15;
  IDSService *service;
  NSObject *v17;
  AXSSInterDeviceSecurityHelper *v18;
  AXSSInterDeviceSecurityHelper *securityHelper;
  objc_super v21;
  uint8_t buf[8];
  uint64_t v23;
  Class (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v21.receiver = self;
  v21.super_class = (Class)AXSSInterDeviceCommunicator;
  v2 = -[AXSSInterDeviceCommunicator init](&v21, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    availableDevices = v2->_availableDevices;
    v2->_availableDevices = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceTypesByPeerID = v2->_deviceTypesByPeerID;
    v2->_deviceTypesByPeerID = v5;

    v7 = (void *)MGCopyAnswer();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v7, "axss_stringByTrimmingToLength:encoding:", 63, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UNTITLED_DEVICE"), &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v11 = (void *)getMCPeerIDClass_softClass;
    v30 = getMCPeerIDClass_softClass;
    if (!getMCPeerIDClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __getMCPeerIDClass_block_invoke;
      v25 = &unk_1E5F99048;
      v26 = &v27;
      __getMCPeerIDClass_block_invoke((uint64_t)buf);
      v11 = (void *)v28[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v27, 8);
    v13 = objc_msgSend([v12 alloc], "initWithDisplayName:", v8);
    localPeerID = v2->_localPeerID;
    v2->_localPeerID = (MCPeerID *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.accessibility.switchcontrol"));
    service = v2->_service;
    v2->_service = (IDSService *)v15;

    -[IDSService addDelegate:queue:](v2->_service, "addDelegate:queue:", v2, MEMORY[0x1E0C80D38]);
    AXSSLogForCategory(1);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF5CC000, v17, OS_LOG_TYPE_DEFAULT, "Initialized IDSService.", buf, 2u);
    }

    v18 = objc_alloc_init(AXSSInterDeviceSecurityHelper);
    securityHelper = v2->_securityHelper;
    v2->_securityHelper = v18;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[AXSSInterDeviceCommunicator _tearDownConnectivity](self, "_tearDownConnectivity");
  -[IDSService removeDelegate:](self->_service, "removeDelegate:", self);
  -[NSTimer invalidate](self->_dummyPacketTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AXSSInterDeviceCommunicator;
  -[AXSSInterDeviceCommunicator dealloc](&v3, sel_dealloc);
}

- (id)_stateDescription
{
  return -[AXSSInterDeviceCommunicator _stringForState:](self, "_stringForState:", -[AXSSInterDeviceCommunicator state](self, "state"));
}

- (id)_stringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return off_1E5F99F00[a3];
}

- (void)setState:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int64_t state;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  int v85;
  void *v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    AXSSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.8(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  AXSSLogForCategory(1);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[AXSSInterDeviceCommunicator _stringForState:](self, "_stringForState:", self->_state);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSInterDeviceCommunicator _stringForState:](self, "_stringForState:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 138412546;
    v86 = v14;
    v87 = 2112;
    v88 = v15;
    _os_log_impl(&dword_1AF5CC000, v13, OS_LOG_TYPE_DEFAULT, "IDC State: %@ => %@", (uint8_t *)&v85, 0x16u);

  }
  state = self->_state;
  if (state == a3)
    return;
  self->_state = a3;
  if (a3 != 3 || state != 2)
  {
    if (a3 == 3 && state == 6)
    {
      AXSSLogForCategory(0);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator setState:].cold.3(v38, v39, v40, v41, v42, v43, v44, v45);

      goto LABEL_23;
    }
    if (a3 == 3 && state == 4)
    {
      AXSSLogForCategory(0);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator setState:].cold.4(v48, v49, v50, v51, v52, v53, v54, v55);
    }
    else
    {
      if (a3 != 3 || state != 5)
      {
        if (a3 == 2)
        {
          -[AXSSInterDeviceCommunicator receiver](self, "receiver");
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v63)
          {
            AXSSLogForCategory(0);
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              -[AXSSInterDeviceCommunicator setState:].cold.1(v64, v65, v66, v67, v68, v69, v70, v71);

          }
          -[AXSSInterDeviceCommunicator setSwitchEventIndex:](self, "setSwitchEventIndex:", 0);
          -[AXSSInterDeviceCommunicator connectionListener](self, "connectionListener");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXSSInterDeviceCommunicator receiver](self, "receiver");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "displayName");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "didConnectAsForwarderToDeviceWithName:", v74);

          -[AXSSInterDeviceCommunicator dummyPacketTimer](self, "dummyPacketTimer");
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          if (v75)
          {
            AXSSLogForCategory(0);
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
              -[AXSSInterDeviceCommunicator setState:].cold.6(v76, v77, v78, v79, v80, v81, v82, v83);

          }
          -[AXSSInterDeviceCommunicator setNumberOfBurstPacketsRemaining:](self, "setNumberOfBurstPacketsRemaining:", 10);
          objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__sendDummyPacket, 0, 1, 0.00545454545);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXSSInterDeviceCommunicator setDummyPacketTimer:](self, "setDummyPacketTimer:", v84);

          -[AXSSInterDeviceCommunicator dummyPacketTimer](self, "dummyPacketTimer");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setTolerance:", 0.000545454545);
          goto LABEL_26;
        }
        if (state == 2)
          goto LABEL_13;
        if (state != 6)
          goto LABEL_24;
LABEL_23:
        -[AXSSInterDeviceCommunicator connectionListener](self, "connectionListener");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "didDisconnectAsReceiver");

        goto LABEL_24;
      }
      AXSSLogForCategory(0);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator setState:].cold.5(v48, v56, v57, v58, v59, v60, v61, v62);
    }

    -[AXSSInterDeviceCommunicator setReceiver:](self, "setReceiver:", 0);
    return;
  }
  AXSSLogForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[AXSSInterDeviceCommunicator setState:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);

LABEL_13:
  -[AXSSInterDeviceCommunicator receiver](self, "receiver");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    AXSSLogForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

  }
  -[AXSSInterDeviceCommunicator connectionListener](self, "connectionListener");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSInterDeviceCommunicator receiver](self, "receiver");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "displayName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "didDisconnectAsForwarderFromDeviceWithName:", v36);

  -[AXSSInterDeviceCommunicator dummyPacketTimer](self, "dummyPacketTimer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "invalidate");

  -[AXSSInterDeviceCommunicator setDummyPacketTimer:](self, "setDummyPacketTimer:", 0);
LABEL_24:
  -[AXSSInterDeviceCommunicator setReceiver:](self, "setReceiver:", 0);
  if (!a3)
  {
    -[AXSSInterDeviceCommunicator _tearDownConnectivity](self, "_tearDownConnectivity");
    -[AXSSInterDeviceCommunicator connectionListener](self, "connectionListener");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "didBecomeIdle");
LABEL_26:

  }
}

- (void)_tearDownAdvertiser
{
  void *v3;
  void *v4;
  void *v5;

  -[AXSSInterDeviceCommunicator advertiser](self, "advertiser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXSSInterDeviceCommunicator advertiser](self, "advertiser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAdvertisingPeer");

    -[AXSSInterDeviceCommunicator advertiser](self, "advertiser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    -[AXSSInterDeviceCommunicator setAdvertiser:](self, "setAdvertiser:", 0);
  }
}

- (void)_tearDownSession
{
  void *v3;
  void *v4;
  void *v5;

  -[AXSSInterDeviceCommunicator session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXSSInterDeviceCommunicator session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disconnect");

    -[AXSSInterDeviceCommunicator session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    -[AXSSInterDeviceCommunicator setSession:](self, "setSession:", 0);
  }
}

- (void)_tearDownBrowser
{
  void *v3;
  void *v4;
  void *v5;

  -[AXSSInterDeviceCommunicator browser](self, "browser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXSSInterDeviceCommunicator browser](self, "browser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopBrowsingForPeers");

    -[AXSSInterDeviceCommunicator browser](self, "browser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    -[AXSSInterDeviceCommunicator setBrowser:](self, "setBrowser:", 0);
  }
}

- (void)_tearDownConnectivity
{
  -[AXSSInterDeviceCommunicator _tearDownBrowser](self, "_tearDownBrowser");
  -[AXSSInterDeviceCommunicator _tearDownSession](self, "_tearDownSession");
  -[AXSSInterDeviceCommunicator _tearDownAdvertiser](self, "_tearDownAdvertiser");
  -[NSMutableArray removeAllObjects](self->_availableDevices, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_deviceTypesByPeerID, "removeAllObjects");
  -[AXSSInterDeviceCommunicator setReceiver:](self, "setReceiver:", 0);
  -[AXSSInterDeviceCommunicator setForwarder:](self, "setForwarder:", 0);
}

- (void)_broadcastICloudMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  IDSService *service;
  char v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IDSService devices](self->_service, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXSSLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl(&dword_1AF5CC000, v6, OS_LOG_TYPE_DEFAULT, "Devices: %@", buf, 0xCu);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)IDSCopyIDForDevice();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    service = self->_service;
    v20 = 0;
    v21 = 0;
    v15 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](service, "sendMessage:toDestinations:priority:options:identifier:error:", v4, v7, 300, 0, &v21, &v20);
    v16 = v21;
    v17 = v20;
    AXSSLogForCategory(1);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((v15 & 1) != 0)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v16;
        _os_log_impl(&dword_1AF5CC000, v19, OS_LOG_TYPE_DEFAULT, "Message sent to other devices with identifier %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[AXSSInterDeviceCommunicator _broadcastICloudMessage:].cold.1();
    }

  }
}

- (BOOL)_setUpSessionIfNecessary
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  MCSession *session;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  id v24;
  void *v25;
  MCSession *v26;
  MCSession *v27;
  NSObject *v28;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    AXSSLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.8(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  session = self->_session;
  if (!session)
  {
    -[AXSSInterDeviceCommunicator securityHelper](self, "securityHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "securityIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[AXSSInterDeviceCommunicator state](self, "state") != 1 || v13)
    {
      if (v13)
      {
        v31 = 0;
        v32 = &v31;
        v33 = 0x2050000000;
        v22 = (void *)getMCSessionClass_softClass;
        v34 = getMCSessionClass_softClass;
        if (!getMCSessionClass_softClass)
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __getMCSessionClass_block_invoke;
          v30[3] = &unk_1E5F99048;
          v30[4] = &v31;
          __getMCSessionClass_block_invoke((uint64_t)v30);
          v22 = (void *)v32[3];
        }
        v23 = objc_retainAutorelease(v22);
        _Block_object_dispose(&v31, 8);
        v24 = [v23 alloc];
        -[AXSSInterDeviceCommunicator localPeerID](self, "localPeerID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (MCSession *)objc_msgSend(v24, "initWithPeer:securityIdentity:encryptionPreference:", v25, v13, 1);
        v27 = self->_session;
        self->_session = v26;

        -[MCSession setAWDLDisabled:](self->_session, "setAWDLDisabled:", 1);
        -[MCSession setHeartbeatTimeout:](self->_session, "setHeartbeatTimeout:", 4);
        -[MCSession setDelegate:](self->_session, "setDelegate:", self);
        goto LABEL_18;
      }
    }
    else
    {
      AXSSLogForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator _setUpSessionIfNecessary].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);

    }
    AXSSLogForCategory(1);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator _setUpSessionIfNecessary].cold.1();

LABEL_18:
    session = self->_session;
  }
  return session != 0;
}

- (BOOL)isReceivingSwitchEvents
{
  return -[AXSSInterDeviceCommunicator state](self, "state") == 6;
}

- (BOOL)isForwardingSwitchEvents
{
  return -[AXSSInterDeviceCommunicator state](self, "state") == 2;
}

- (BOOL)isSearching
{
  return -[AXSSInterDeviceCommunicator state](self, "state") == 1;
}

- (BOOL)isIdle
{
  return -[AXSSInterDeviceCommunicator state](self, "state") == 0;
}

- (BOOL)canSearch
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  uint8_t buf[2];

  if (-[AXSSInterDeviceCommunicator state](self, "state"))
    return 0;
  -[IDSService devices](self->_service, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AXSSInterDeviceSecurityHelper securityIdentity](self->_securityHelper, "securityIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return 1;
    AXSSLogForCategory(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v8 = "Can't search because our security identity isn't ready yet.";
    v9 = buf;
    goto LABEL_9;
  }
  AXSSLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 0;
    v8 = "Can't search because no other iCloud devices are available.";
    v9 = (uint8_t *)&v10;
LABEL_9:
    _os_log_impl(&dword_1AF5CC000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
  }
LABEL_10:

  return 0;
}

- (void)search
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_cancelAdvertising
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Timed out while advertising.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_handleTimeoutAsPotentialReceiver
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Timed out while connected as potential receiver.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_advertise
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  MCNearbyServiceAdvertiser *v20;
  MCNearbyServiceAdvertiser *advertiser;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  __int128 buf;
  void (*v34)(uint64_t);
  void *v35;
  uint64_t *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    AXSSLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.8(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  -[AXSSInterDeviceCommunicator setState:](self, "setState:", 3);
  if (!self->_advertiser)
  {
    v11 = MGGetSInt32Answer();
    v12 = CFSTR("phone");
    if (v11 == 3)
      v12 = CFSTR("pad");
    v13 = v12;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v14 = (void *)getMCNearbyServiceAdvertiserClass_softClass;
    v30 = getMCNearbyServiceAdvertiserClass_softClass;
    if (!getMCNearbyServiceAdvertiserClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v34 = __getMCNearbyServiceAdvertiserClass_block_invoke;
      v35 = &unk_1E5F99048;
      v36 = &v27;
      __getMCNearbyServiceAdvertiserClass_block_invoke((uint64_t)&buf);
      v14 = (void *)v28[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v27, 8);
    v16 = [v15 alloc];
    -[AXSSInterDeviceCommunicator localPeerID](self, "localPeerID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = CFSTR("AXSSIDCVersion");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = CFSTR("AXSSIDCDeviceType");
    v32[0] = v18;
    v32[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (MCNearbyServiceAdvertiser *)objc_msgSend(v16, "initWithPeer:discoveryInfo:serviceType:", v17, v19, CFSTR("switchcontrol"));
    advertiser = self->_advertiser;
    self->_advertiser = v20;

    -[AXSSInterDeviceCommunicator advertiser](self, "advertiser");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAWDLDisabled:", 1);

    -[AXSSInterDeviceCommunicator advertiser](self, "advertiser");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", self);

    -[AXSSInterDeviceCommunicator advertiser](self, "advertiser");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "startAdvertisingPeer");

    AXSSLogForCategory(1);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[AXSSInterDeviceCommunicator advertiser](self, "advertiser");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_1AF5CC000, v25, OS_LOG_TYPE_DEFAULT, "Created advertiser: %@", (uint8_t *)&buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__cancelAdvertising, 0);
  -[AXSSInterDeviceCommunicator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__cancelAdvertising, 0, 30.0);
}

- (void)stop
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    AXSSLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.8(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  -[AXSSInterDeviceCommunicator setState:](self, "setState:", 0);
}

- (NSArray)searchResults
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    AXSSLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.8(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  if (-[AXSSInterDeviceCommunicator state](self, "state") != 1)
  {
    AXSSLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator searchResults].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  -[AXSSInterDeviceCommunicator availableDevices](self, "availableDevices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");

  return (NSArray *)v20;
}

- (void)highlightSearchResult:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AXSSInterDeviceCommunicator state](self, "state") != 1)
  {
    AXSSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator searchResults].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  v13 = (void *)MEMORY[0x1E0CB38B0];
  v26 = CFSTR("MessageType");
  v27[0] = CFSTR("HighlightAsPotentialSlave");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v13, "dataWithPropertyList:format:options:error:", v14, 200, 0, &v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;

  if (!v15)
  {
    AXSSLogForCategory(1);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator highlightSearchResult:].cold.1();
    goto LABEL_12;
  }
  -[AXSSInterDeviceCommunicator session](self, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v16;
  v20 = objc_msgSend(v17, "sendData:toPeers:withMode:error:", v15, v19, 0, &v23);
  v21 = v23;

  if ((v20 & 1) == 0)
  {
    AXSSLogForCategory(1);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator highlightSearchResult:].cold.2();
    v16 = v21;
LABEL_12:

    v21 = v16;
  }

}

- (id)_messageForSelection:(BOOL)a3 settings:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v4 = a3;
  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, CFSTR("IsSelected"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("Settings"));

  }
  v12[0] = CFSTR("MessageType");
  v12[1] = CFSTR("MessagePayload");
  v13[0] = CFSTR("Selection");
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)selectSearchResult:(id)a3 settings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  char v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  _BYTE v59[128];
  void *v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    AXSSLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.8(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  AXSSLogForCategory(1);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "peerID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v62 = v17;
    v63 = 2112;
    v64 = v7;
    _os_log_impl(&dword_1AF5CC000, v16, OS_LOG_TYPE_DEFAULT, "Selecting %@ with %@", buf, 0x16u);

  }
  objc_msgSend(v6, "peerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSInterDeviceCommunicator setReceiver:](self, "setReceiver:", v18);

  -[AXSSInterDeviceCommunicator setState:](self, "setState:", 2);
  v19 = (void *)MEMORY[0x1E0CB38B0];
  -[AXSSInterDeviceCommunicator _messageForSelection:settings:](self, "_messageForSelection:settings:", 1, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v19, "dataWithPropertyList:format:options:error:", v20, 200, 0, &v58);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v58;

  if (v21)
  {
    v50 = v6;
    -[AXSSInterDeviceCommunicator session](self, "session");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSInterDeviceCommunicator receiver](self, "receiver");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v22;
    v26 = objc_msgSend(v23, "sendData:toPeers:withMode:error:", v21, v25, 0, &v57);
    v27 = v57;

    if ((v26 & 1) == 0)
    {
      AXSSLogForCategory(1);
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator selectSearchResult:settings:].cold.4();

      -[AXSSInterDeviceCommunicator stop](self, "stop");
      v22 = v27;
      goto LABEL_36;
    }
    v48 = v27;
    v49 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[AXSSInterDeviceCommunicator availableDevices](self, "availableDevices");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v54 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v34, "peerID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXSSInterDeviceCommunicator receiver](self, "receiver");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35 != v36)
          {
            objc_msgSend(v34, "peerID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v37);

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v31);
    }

    if (!objc_msgSend(v28, "count"))
    {
      v44 = v48;
      v7 = v49;
LABEL_35:

      v22 = v44;
LABEL_36:
      v6 = v50;
      goto LABEL_37;
    }
    v38 = (void *)MEMORY[0x1E0CB38B0];
    -[AXSSInterDeviceCommunicator _messageForSelection:settings:](self, "_messageForSelection:settings:", 0, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    objc_msgSend(v38, "dataWithPropertyList:format:options:error:", v39, 200, 0, &v52);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v52;

    v7 = v49;
    if (v40)
    {
      -[AXSSInterDeviceCommunicator session](self, "session");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v41;
      v43 = objc_msgSend(v42, "sendData:toPeers:withMode:error:", v40, v28, 0, &v51);
      v44 = v51;

      if ((v43 & 1) != 0)
      {
LABEL_34:

        goto LABEL_35;
      }
      AXSSLogForCategory(1);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator selectSearchResult:settings:].cold.3();
      v41 = v44;
    }
    else
    {
      AXSSLogForCategory(1);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator selectSearchResult:settings:].cold.2();
    }

    v44 = v41;
    goto LABEL_34;
  }
  AXSSLogForCategory(1);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    -[AXSSInterDeviceCommunicator selectSearchResult:settings:].cold.1();

LABEL_37:
  -[AXSSInterDeviceCommunicator _tearDownBrowser](self, "_tearDownBrowser");

}

- (id)_messageForSwitchEvent:(id)a3 index:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("MessageType");
  v14[1] = CFSTR("MessagePayload");
  v15[0] = CFSTR("SwitchEvent");
  v12[0] = CFSTR("Index");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedLongLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("DictionaryRepresentation");
  v13[0] = v7;
  objc_msgSend(v6, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_sendDataToReceiver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  _BOOL4 v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXSSInterDeviceCommunicator session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSInterDeviceCommunicator receiver](self, "receiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = objc_msgSend(v5, "sendData:toPeers:withMode:error:", v4, v7, 1, &v17);
  v9 = v17;

  if ((v8 & 1) == 0)
  {
    AXSSLogForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator _sendDataToReceiver:].cold.3();

    objc_msgSend(v9, "domain");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v12 = (id *)getMCErrorDomainSymbolLoc_ptr;
    v21 = getMCErrorDomainSymbolLoc_ptr;
    if (!getMCErrorDomainSymbolLoc_ptr)
    {
      v13 = (void *)MultipeerConnectivityLibrary();
      v12 = (id *)dlsym(v13, "MCErrorDomain");
      v19[3] = (uint64_t)v12;
      getMCErrorDomainSymbolLoc_ptr = (uint64_t)v12;
    }
    _Block_object_dispose(&v18, 8);
    if (!v12)
    {
      +[AXSSMotionTrackingCameraInput motionTrackingCameraInputWithAVCaptureDevice:].cold.1();
      __break(1u);
    }
    v14 = *v12;
    if (v11 == v14)
    {
      v15 = objc_msgSend(v9, "code") == 1;

      if (v15)
      {
        AXSSLogForCategory(1);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[AXSSInterDeviceCommunicator _sendDataToReceiver:].cold.2();

        -[AXSSInterDeviceCommunicator setState:](self, "setState:", 0);
      }
    }
    else
    {

    }
  }

}

- (void)forwardSwitchEvent:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  CFAbsoluteTime Current;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    AXSSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.8(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  -[AXSSInterDeviceCommunicator receiver](self, "receiver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    AXSSLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  }
  -[AXSSInterDeviceCommunicator receiver](self, "receiver");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[AXSSInterDeviceCommunicator setSwitchEventIndex:](self, "setSwitchEventIndex:", -[AXSSInterDeviceCommunicator switchEventIndex](self, "switchEventIndex") + 1);
    AXSSLogForCategory(1);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v31 = -[AXSSInterDeviceCommunicator switchEventIndex](self, "switchEventIndex");
      v32 = 2048;
      Current = CFAbsoluteTimeGetCurrent();
      v34 = 2112;
      v35 = v4;
      _os_log_impl(&dword_1AF5CC000, v23, OS_LOG_TYPE_INFO, "Forwarding switch event %llu at time %f: %@", buf, 0x20u);
    }

    v24 = (void *)MEMORY[0x1E0CB38B0];
    -[AXSSInterDeviceCommunicator _messageForSwitchEvent:index:](self, "_messageForSwitchEvent:index:", v4, -[AXSSInterDeviceCommunicator switchEventIndex](self, "switchEventIndex"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v24, "dataWithPropertyList:format:options:error:", v25, 200, 0, &v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v29;

    if (v26)
    {
      -[AXSSInterDeviceCommunicator _sendDataToReceiver:](self, "_sendDataToReceiver:", v26);
    }
    else
    {
      AXSSLogForCategory(1);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator forwardSwitchEvent:].cold.1();

    }
  }

}

- (void)performSysdiagnoseOnReceiver
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Error sending message to perform sysdiagnose on receiver: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_sendDummyPacket
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_3(&dword_1AF5CC000, v0, v1, "Sending burst dummy packet at %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    AXSSLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.8(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  AXSSLogForCategory(1);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[AXSSInterDeviceCommunicator _stateDescription](self, "_stateDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138412546;
    v33 = (uint64_t)v11;
    v34 = 2112;
    v35 = (uint64_t)v22;
    _os_log_impl(&dword_1AF5CC000, v21, OS_LOG_TYPE_DEFAULT, "Did receive message: %@. State: %@", (uint8_t *)&v32, 0x16u);

  }
  -[AXSSInterDeviceCommunicator connectionListener](self, "connectionListener");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "canAdvertise");

  if (!v24)
  {
    AXSSLogForCategory(1);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    LOWORD(v32) = 0;
    v29 = "Could not advertise because the inter device menu item was not enabled.";
    goto LABEL_15;
  }
  objc_msgSend(v10, "deviceForFromID:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    AXSSLogForCategory(1);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v32 = 138412290;
    v33 = (uint64_t)v12;
    v29 = "Received message, but it was not from our account. FromID: %@";
    v30 = v28;
    v31 = 12;
LABEL_20:
    _os_log_impl(&dword_1AF5CC000, v30, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v32, v31);
    goto LABEL_21;
  }
  if (-[AXSSInterDeviceCommunicator state](self, "state") && -[AXSSInterDeviceCommunicator state](self, "state") != 3)
  {
    AXSSLogForCategory(1);
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    LOWORD(v32) = 0;
    v29 = "Didn't advertise because we were in the middle of some other operation";
LABEL_15:
    v30 = v28;
    v31 = 2;
    goto LABEL_20;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AXSSIDCVersion"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "integerValue");

  if (v27 != 1)
  {
    AXSSLogForCategory(1);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 134218240;
      v33 = v27;
      v34 = 2048;
      v35 = 1;
      v29 = "Compatibility version %ld did not match our compatibility version %ld";
      v30 = v28;
      v31 = 22;
      goto LABEL_20;
    }
LABEL_21:

    goto LABEL_22;
  }
  -[AXSSInterDeviceCommunicator _advertise](self, "_advertise");
LABEL_22:

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  AXSSLogForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1AF5CC000, v5, OS_LOG_TYPE_DEFAULT, "Devices changed: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v8 = a6;
  v15 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a7;
  AXSSLogForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1AF5CC000, v12, OS_LOG_TYPE_DEFAULT, "Successfully sent message with identifier %@.", (uint8_t *)&v13, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[AXSSInterDeviceCommunicator service:account:identifier:didSendWithSuccess:error:].cold.1();
  }

}

- (void)_handleSwitchEventMessageWithPayload:(id)a3 fromPeer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  AXSSInterDeviceSwitchEvent *v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  CFAbsoluteTime Current;
  __int16 v21;
  AXSSInterDeviceSwitchEvent *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Index"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[NSObject unsignedLongLongValue](v8, "unsignedLongLongValue");
    }
    else
    {
      AXSSLogForCategory(1);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator _handleSwitchEventMessageWithPayload:fromPeer:].cold.3();

      v9 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DictionaryRepresentation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[AXSSInterDeviceSwitchEvent initWithDictionaryRepresentation:]([AXSSInterDeviceSwitchEvent alloc], "initWithDictionaryRepresentation:", v11);
      v13 = -[AXSSInterDeviceCommunicator state](self, "state");
      AXSSLogForCategory(1);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13 == 6)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v17 = 134218498;
          v18 = v9;
          v19 = 2048;
          Current = CFAbsoluteTimeGetCurrent();
          v21 = 2112;
          v22 = v12;
          _os_log_impl(&dword_1AF5CC000, v15, OS_LOG_TYPE_INFO, "Handling switch event %llu at time %f: %@", (uint8_t *)&v17, 0x20u);
        }

        -[AXSSInterDeviceCommunicator actionReceiver](self, "actionReceiver");
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "displayName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject didReceiveSwitchEvent:forDeviceWithName:](v15, "didReceiveSwitchEvent:forDeviceWithName:", v12, v16);

      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[AXSSInterDeviceCommunicator _handleSwitchEventMessageWithPayload:fromPeer:].cold.1(self, (uint64_t)v12, v15);
      }

    }
    else
    {
      AXSSLogForCategory(1);
      v12 = (AXSSInterDeviceSwitchEvent *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator _handleSwitchEventMessageWithPayload:fromPeer:].cold.2();
    }

  }
  else
  {
    AXSSLogForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator _handleSwitchEventMessageWithPayload:fromPeer:].cold.4();
  }

}

- (void)_handleSelectionMessageWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  AXSSSwitchControlSettings *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  AXSSSwitchControlSettings *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[AXSSInterDeviceCommunicator state](self, "state") == 5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsSelected"));
      v5 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (-[NSObject BOOLValue](v5, "BOOLValue"))
        {
          -[AXSSInterDeviceCommunicator setState:](self, "setState:", 6);
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Settings"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
            v7 = -[AXSSSwitchControlSettings initWithDictionaryRepresentation:]([AXSSSwitchControlSettings alloc], "initWithDictionaryRepresentation:", v6);
          else
            v7 = 0;
          AXSSLogForCategory(1);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v11 = 138412290;
            v12 = v7;
            _os_log_impl(&dword_1AF5CC000, v9, OS_LOG_TYPE_DEFAULT, "Connected as receiver with settings %@", (uint8_t *)&v11, 0xCu);
          }

          -[AXSSInterDeviceCommunicator connectionListener](self, "connectionListener");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "didConnectAsReceiverWithSettings:", v7);

        }
        else
        {
          -[AXSSInterDeviceCommunicator setState:](self, "setState:", 0);
        }
      }
      else
      {
        AXSSLogForCategory(1);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[AXSSInterDeviceCommunicator _handleSelectionMessageWithPayload:].cold.1();

      }
    }
    else
    {
      AXSSLogForCategory(1);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator _handleSelectionMessageWithPayload:].cold.2();
    }
  }
  else
  {
    AXSSLogForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator _handleSelectionMessageWithPayload:].cold.3(self, v5);
  }

}

- (void)_handleHighlightMessage
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_stateDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_4(&dword_1AF5CC000, a2, v4, "Was asked to highlight as a potential receiver, but our state was %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_handlePerformSysdiagnoseMessage
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_stateDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_4(&dword_1AF5CC000, a2, v4, "Was asked to perform a sysdiagnose, but our state was %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_removePeerFromAvailableDevices:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    AXSSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AXSSInterDeviceCommunicator setState:].cold.8(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  -[AXSSInterDeviceCommunicator availableDevices](self, "availableDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__AXSSInterDeviceCommunicator__removePeerFromAvailableDevices___block_invoke;
  v19[3] = &unk_1E5F99E28;
  v14 = v4;
  v20 = v14;
  v15 = objc_msgSend(v13, "indexOfObjectPassingTest:", v19);

  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    AXSSLogForCategory(1);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1AF5CC000, v16, OS_LOG_TYPE_DEFAULT, "Removed from available results: %@", buf, 0xCu);
    }

    -[AXSSInterDeviceCommunicator availableDevices](self, "availableDevices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectAtIndex:", v15);

    -[AXSSInterDeviceCommunicator searchObserver](self, "searchObserver");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didUpdateSearchResults");

  }
}

BOOL __63__AXSSInterDeviceCommunicator__removePeerFromAvailableDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)session:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;
  AXSSInterDeviceCommunicator *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  NSObject *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a4, 0, 0, &v24);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("MessageType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("MessagePayload"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("DummyPacket")))
      {
        AXSSLogForCategory(1);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[AXSSInterDeviceCommunicator session:didReceiveData:fromPeer:].cold.1();
      }
      else
      {
        v16 = objc_msgSend(v12, "isEqualToString:", CFSTR("BurstDummyPacket"));
        AXSSLogForCategory(1);
        v17 = objc_claimAutoreleasedReturnValue();
        v14 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[AXSSInterDeviceCommunicator session:didReceiveData:fromPeer:].cold.2();
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v26 = v10;
          v27 = 2112;
          v28 = v7;
          _os_log_impl(&dword_1AF5CC000, v14, OS_LOG_TYPE_INFO, "Received message %@ from peer %@", buf, 0x16u);
        }
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__AXSSInterDeviceCommunicator_session_didReceiveData_fromPeer___block_invoke;
      block[3] = &unk_1E5F99E50;
      v20 = v12;
      v21 = self;
      v22 = v13;
      v23 = v7;
      v18 = v13;
      v15 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      AXSSLogForCategory(1);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AXSSInterDeviceCommunicator session:didReceiveData:fromPeer:].cold.3((uint64_t)v11, (uint64_t)v7, v15);
    }

  }
  else
  {
    AXSSLogForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v26 = v7;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      _os_log_error_impl(&dword_1AF5CC000, v10, OS_LOG_TYPE_ERROR, "Unexpected format for data from peer %@. Unarchived: %@. Error: %@", buf, 0x20u);
    }
  }

}

void __63__AXSSInterDeviceCommunicator_session_didReceiveData_fromPeer___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("SwitchEvent")))
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleSwitchEventMessageWithPayload:fromPeer:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else if (objc_msgSend(*v2, "isEqualToString:", CFSTR("Selection")))
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleSelectionMessageWithPayload:", *(_QWORD *)(a1 + 48));
  }
  else if (objc_msgSend(*v2, "isEqualToString:", CFSTR("HighlightAsPotentialSlave")))
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleHighlightMessage");
  }
  else if (objc_msgSend(*v2, "isEqualToString:", CFSTR("PerformSysdiagnose")))
  {
    objc_msgSend(*(id *)(a1 + 40), "_handlePerformSysdiagnoseMessage");
  }
  else if ((objc_msgSend(*v2, "isEqualToString:", CFSTR("DummyPacket")) & 1) == 0
         && (objc_msgSend(*v2, "isEqualToString:", CFSTR("BurstDummyPacket")) & 1) == 0)
  {
    AXSSLogForCategory(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __63__AXSSInterDeviceCommunicator_session_didReceiveData_fromPeer___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)session:(id)a3 didStartReceivingResourceWithName:(id)a4 fromPeer:(id)a5 withProgress:(id)a6
{
  NSObject *v6;

  AXSSLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[AXSSInterDeviceCommunicator session:didStartReceivingResourceWithName:fromPeer:withProgress:].cold.1();

}

- (void)session:(id)a3 didFinishReceivingResourceWithName:(id)a4 fromPeer:(id)a5 atURL:(id)a6 withError:(id)a7
{
  NSObject *v7;

  AXSSLogForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[AXSSInterDeviceCommunicator session:didFinishReceivingResourceWithName:fromPeer:atURL:withError:].cold.1();

}

- (void)session:(id)a3 didReceiveStream:(id)a4 withName:(id)a5 fromPeer:(id)a6
{
  NSObject *v6;

  AXSSLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[AXSSInterDeviceCommunicator session:didReceiveStream:withName:fromPeer:].cold.1();

}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int64_t)a5
{
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  AXSSInterDeviceCommunicator *v11;
  int64_t v12;

  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AXSSInterDeviceCommunicator_session_peer_didChangeState___block_invoke;
  block[3] = &unk_1E5F99E78;
  v11 = self;
  v12 = a5;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__AXSSInterDeviceCommunicator_session_peer_didChangeState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  AXSSLogForCategory(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_stateDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 138412802;
    v57 = v3;
    v58 = 2112;
    v59 = v4;
    v60 = 2112;
    v61 = v5;
    _os_log_impl(&dword_1AF5CC000, v2, OS_LOG_TYPE_DEFAULT, "Peer %@ did change state to %@ while our state was %@", (uint8_t *)&v56, 0x20u);

  }
  switch(objc_msgSend(*(id *)(a1 + 40), "state"))
  {
    case 1:
      v17 = *(void **)(a1 + 40);
      if (*(_QWORD *)(a1 + 48) == 2)
      {
        objc_msgSend(v17, "deviceTypesByPeerID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v19, "length"))
        {
          AXSSLogForCategory(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            __59__AXSSInterDeviceCommunicator_session_peer_didChangeState___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);

        }
        if (objc_msgSend(v19, "length"))
        {
          AXSSLogForCategory(1);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *(_QWORD *)(a1 + 32);
            v56 = 138412290;
            v57 = v29;
            _os_log_impl(&dword_1AF5CC000, v28, OS_LOG_TYPE_DEFAULT, "Added to available results: %@", (uint8_t *)&v56, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 40), "availableDevices");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[AXSSInterDeviceSearchResult searchResultWithPeerID:deviceType:](AXSSInterDeviceSearchResult, "searchResultWithPeerID:deviceType:", *(_QWORD *)(a1 + 32), v19);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v31);

          objc_msgSend(*(id *)(a1 + 40), "searchObserver");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "didUpdateSearchResults");

        }
      }
      else
      {
        objc_msgSend(v17, "_removePeerFromAvailableDevices:", *(_QWORD *)(a1 + 32));
      }
      return;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "receiver");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
        AXSSLogForCategory(0);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[AXSSInterDeviceCommunicator setState:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);

      }
      v15 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "receiver");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 4:
      objc_msgSend(*(id *)(a1 + 40), "forwarder");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        AXSSLogForCategory(0);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[AXSSInterDeviceCommunicator _handleHighlightMessage].cold.2(v45, v46, v47, v48, v49, v50, v51, v52);

      }
      v53 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "forwarder");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v53) = objc_msgSend(v53, "isEqual:", v54);

      if (!(_DWORD)v53)
        return;
      v55 = *(_QWORD *)(a1 + 48);
      if (v55)
      {
        if (v55 == 2)
        {
          objc_msgSend(*(id *)(a1 + 40), "setState:", 5);
          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 40), sel__handleTimeoutAsPotentialReceiver, 0);
          objc_msgSend(*(id *)(a1 + 40), "performSelector:withObject:afterDelay:", sel__handleTimeoutAsPotentialReceiver, 0, 120.0);
        }
      }
      else
      {
LABEL_26:
        objc_msgSend(*(id *)(a1 + 40), "setState:", 0);
      }
      return;
    case 5:
    case 6:
      objc_msgSend(*(id *)(a1 + 40), "forwarder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        AXSSLogForCategory(0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[AXSSInterDeviceCommunicator _handleHighlightMessage].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);

      }
      v15 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "forwarder");
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_24:
      v42 = (void *)v16;
      v43 = objc_msgSend(v15, "isEqual:", v16);

      if (v43 && *(_QWORD *)(a1 + 48) != 2)
        goto LABEL_26;
      return;
    default:
      return;
  }
}

- (void)session:(id)a3 didReceiveCertificate:(id)a4 fromPeer:(id)a5 certificateHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  -[AXSSInterDeviceCommunicator securityHelper](self, "securityHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __89__AXSSInterDeviceCommunicator_session_didReceiveCertificate_fromPeer_certificateHandler___block_invoke;
  v15[3] = &unk_1E5F99EA0;
  v16 = v9;
  v17 = v10;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v12, "verifyCertificate:completion:", v11, v15);

}

uint64_t __89__AXSSInterDeviceCommunicator_session_didReceiveCertificate_fromPeer_certificateHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  AXSSLogForCategory(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v5;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_1AF5CC000, v4, OS_LOG_TYPE_DEFAULT, "Should trust peer %@: %i", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)browser:(id)a3 foundPeer:(id)a4 withDiscoveryInfo:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  AXSSInterDeviceCommunicator *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  AXSSLogForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1AF5CC000, v9, OS_LOG_TYPE_DEFAULT, "Found peer %@ with info %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AXSSInterDeviceCommunicator_browser_foundPeer_withDiscoveryInfo___block_invoke;
  block[3] = &unk_1E5F98840;
  v13 = v8;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __67__AXSSInterDeviceCommunicator_browser_foundPeer_withDiscoveryInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AXSSIDCVersion"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AXSSIDCDeviceType")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v3,
        !v5))
  {
    AXSSLogForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __67__AXSSInterDeviceCommunicator_browser_foundPeer_withDiscoveryInfo___block_invoke_cold_1();
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AXSSIDCVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 != 1)
  {
    AXSSLogForCategory(1);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v15 = v7;
      v16 = 2048;
      v17 = 1;
      _os_log_impl(&dword_1AF5CC000, v12, OS_LOG_TYPE_DEFAULT, "Compatibility version %ld did not match our version %ld", buf, 0x16u);
    }
LABEL_8:

    return;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_setUpSessionIfNecessary"))
  {
    objc_msgSend(*(id *)(a1 + 40), "browser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invitePeer:toSession:withContext:timeout:", v9, v10, 0, 30.0);

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("AXSSIDCDeviceType"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "deviceTypesByPeerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 48));

  }
}

- (void)browser:(id)a3 lostPeer:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  AXSSLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1AF5CC000, v6, OS_LOG_TYPE_DEFAULT, "Lost peer %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__AXSSInterDeviceCommunicator_browser_lostPeer___block_invoke;
  v8[3] = &unk_1E5F98988;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __48__AXSSInterDeviceCommunicator_browser_lostPeer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  int v10;
  __int16 v11;
  __int16 v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = *(void **)(a1 + 32);
  if (v2 == 1)
  {
    objc_msgSend(v3, "_removePeerFromAvailableDevices:", *(_QWORD *)(a1 + 40));
    return;
  }
  if (objc_msgSend(v3, "state") == 6
    || objc_msgSend(*(id *)(a1 + 32), "state") == 5
    || objc_msgSend(*(id *)(a1 + 32), "state") == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "forwarder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

    if (v5)
    {
      AXSSLogForCategory(1);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 0;
        v7 = "Lost peer was forwarder, so stopping now";
        v8 = (uint8_t *)&v12;
LABEL_13:
        _os_log_impl(&dword_1AF5CC000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "receiver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40));

    if (v10)
    {
      AXSSLogForCategory(1);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        v7 = "Lost peer was receiver, so stopping now";
        v8 = (uint8_t *)&v11;
        goto LABEL_13;
      }
LABEL_14:

      objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
    }
  }
}

- (void)browser:(id)a3 didNotStartBrowsingForPeers:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD block[5];

  v5 = a4;
  AXSSLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[AXSSInterDeviceCommunicator browser:didNotStartBrowsingForPeers:].cold.1();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AXSSInterDeviceCommunicator_browser_didNotStartBrowsingForPeers___block_invoke;
  block[3] = &unk_1E5F98868;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __67__AXSSInterDeviceCommunicator_browser_didNotStartBrowsingForPeers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
}

- (void)advertiser:(id)a3 didReceiveInvitationFromPeer:(id)a4 withContext:(id)a5 invitationHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  AXSSLogForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1AF5CC000, v12, OS_LOG_TYPE_DEFAULT, "Received invitation from %@ with context %@.", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__AXSSInterDeviceCommunicator_advertiser_didReceiveInvitationFromPeer_withContext_invitationHandler___block_invoke;
  block[3] = &unk_1E5F99EC8;
  block[4] = self;
  v16 = v9;
  v17 = v11;
  v13 = v11;
  v14 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __101__AXSSInterDeviceCommunicator_advertiser_didReceiveInvitationFromPeer_withContext_invitationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_setUpSessionIfNecessary"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setForwarder:", *(_QWORD *)(a1 + 40));
      v2 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "session");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, 1, v3);

      objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
    }
  }
  else
  {
    AXSSLogForCategory(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "_stateDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1AF5CC000, v4, OS_LOG_TYPE_DEFAULT, "State was %@, so ignoring invitation from peer.", (uint8_t *)&v6, 0xCu);

    }
  }
}

- (void)advertiser:(id)a3 didNotStartAdvertisingPeer:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD block[5];

  v5 = a4;
  AXSSLogForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[AXSSInterDeviceCommunicator advertiser:didNotStartAdvertisingPeer:].cold.1();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AXSSInterDeviceCommunicator_advertiser_didNotStartAdvertisingPeer___block_invoke;
  block[3] = &unk_1E5F98868;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __69__AXSSInterDeviceCommunicator_advertiser_didNotStartAdvertisingPeer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
}

- (AXSSInterDeviceConnectionListener)connectionListener
{
  return (AXSSInterDeviceConnectionListener *)objc_loadWeakRetained((id *)&self->_connectionListener);
}

- (void)setConnectionListener:(id)a3
{
  objc_storeWeak((id *)&self->_connectionListener, a3);
}

- (AXSSInterDeviceActionReceiver)actionReceiver
{
  return (AXSSInterDeviceActionReceiver *)objc_loadWeakRetained((id *)&self->_actionReceiver);
}

- (void)setActionReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_actionReceiver, a3);
}

- (AXSSInterDeviceSearchObserver)searchObserver
{
  return (AXSSInterDeviceSearchObserver *)objc_loadWeakRetained((id *)&self->_searchObserver);
}

- (void)setSearchObserver:(id)a3
{
  objc_storeWeak((id *)&self->_searchObserver, a3);
}

- (IDSService)service
{
  return self->_service;
}

- (int64_t)state
{
  return self->_state;
}

- (MCPeerID)localPeerID
{
  return self->_localPeerID;
}

- (MCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (MCNearbyServiceBrowser)browser
{
  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_browser, a3);
}

- (MCNearbyServiceAdvertiser)advertiser
{
  return self->_advertiser;
}

- (void)setAdvertiser:(id)a3
{
  objc_storeStrong((id *)&self->_advertiser, a3);
}

- (NSMutableArray)availableDevices
{
  return self->_availableDevices;
}

- (void)setAvailableDevices:(id)a3
{
  objc_storeStrong((id *)&self->_availableDevices, a3);
}

- (NSMutableDictionary)deviceTypesByPeerID
{
  return self->_deviceTypesByPeerID;
}

- (void)setDeviceTypesByPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceTypesByPeerID, a3);
}

- (MCPeerID)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
  objc_storeStrong((id *)&self->_receiver, a3);
}

- (MCPeerID)forwarder
{
  return self->_forwarder;
}

- (void)setForwarder:(id)a3
{
  objc_storeStrong((id *)&self->_forwarder, a3);
}

- (unint64_t)switchEventIndex
{
  return self->_switchEventIndex;
}

- (void)setSwitchEventIndex:(unint64_t)a3
{
  self->_switchEventIndex = a3;
}

- (NSTimer)dummyPacketTimer
{
  return self->_dummyPacketTimer;
}

- (void)setDummyPacketTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dummyPacketTimer, a3);
}

- (unint64_t)numberOfBurstPacketsRemaining
{
  return self->_numberOfBurstPacketsRemaining;
}

- (void)setNumberOfBurstPacketsRemaining:(unint64_t)a3
{
  self->_numberOfBurstPacketsRemaining = a3;
}

- (AXSSInterDeviceSecurityHelper)securityHelper
{
  return self->_securityHelper;
}

- (void)setSecurityHelper:(id)a3
{
  objc_storeStrong((id *)&self->_securityHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityHelper, 0);
  objc_storeStrong((id *)&self->_dummyPacketTimer, 0);
  objc_storeStrong((id *)&self->_forwarder, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_deviceTypesByPeerID, 0);
  objc_storeStrong((id *)&self->_availableDevices, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_localPeerID, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_searchObserver);
  objc_destroyWeak((id *)&self->_actionReceiver);
  objc_destroyWeak((id *)&self->_connectionListener);
}

- (void)setState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setState:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setState:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setState:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setState:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setState:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setState:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_broadcastICloudMessage:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_1AF5CC000, v0, (uint64_t)v0, "Error sending message %@: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_setUpSessionIfNecessary
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)searchResults
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)highlightSearchResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Error serializing message to highlight receiver: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)highlightSearchResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Error highlighting search result: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)selectSearchResult:settings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Error serializing message to select search result: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)selectSearchResult:settings:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Error serializing message to deselect search results: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)selectSearchResult:settings:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Error rejecting devices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)selectSearchResult:settings:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Error accepting device: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_sendDataToReceiver:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Disconnected from receiver without being notified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_sendDataToReceiver:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Unable to send data to receiver: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)forwardSwitchEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Error serializing message to forward switch event: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)service:account:identifier:didSendWithSuccess:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_1AF5CC000, v0, (uint64_t)v0, "Failed to send message with identifier %@. Error: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_handleSwitchEventMessageWithPayload:(NSObject *)a3 fromPeer:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_stateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  v8 = a2;
  OUTLINED_FUNCTION_9(&dword_1AF5CC000, a3, v6, "Received switch event while we were not connected as a receiver. State: %@, event: %@", v7);

}

- (void)_handleSwitchEventMessageWithPayload:fromPeer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Unexpected type for switch event dictionary representation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleSwitchEventMessageWithPayload:fromPeer:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Unexpected type for switch event index: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleSwitchEventMessageWithPayload:fromPeer:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Unexpected type for switch event payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleSelectionMessageWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Unexpected type for selection flag: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleSelectionMessageWithPayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Unexpected format for selection message to potential receiver", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_handleSelectionMessageWithPayload:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_stateDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_4(&dword_1AF5CC000, a2, v4, "Received selection message while in unexpected state: %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)session:didReceiveData:fromPeer:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_3(&dword_1AF5CC000, v0, v1, "Received dummy packet at %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)session:didReceiveData:fromPeer:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_3(&dword_1AF5CC000, v0, v1, "Received burst dummy packet at %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)session:(uint64_t)a1 didReceiveData:(uint64_t)a2 fromPeer:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int16 v6;
  id v7;
  id v8;
  uint8_t v9[14];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_13();
  v10 = a1;
  v11 = v6;
  v12 = a2;
  v8 = v7;
  _os_log_error_impl(&dword_1AF5CC000, a3, OS_LOG_TYPE_ERROR, "Unexpected class: %@ for message type: %@ from peer: %@", v9, 0x20u);

}

void __63__AXSSInterDeviceCommunicator_session_didReceiveData_fromPeer___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a2, a3, "Unexpected type for message: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)session:didStartReceivingResourceWithName:fromPeer:withProgress:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Unexpected delegate callback: didStartReceivingResourceWithName", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)session:didFinishReceivingResourceWithName:fromPeer:atURL:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Unexpected delegate callback: didFinishReceivingResourceWithName", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)session:didReceiveStream:withName:fromPeer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Unexpected delegate callback: didReceiveStream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__AXSSInterDeviceCommunicator_session_peer_didChangeState___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, a1, a3, "Assertion failed: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __67__AXSSInterDeviceCommunicator_browser_foundPeer_withDiscoveryInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1AF5CC000, v0, v1, "Peer did not advertise compatibility version or device type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)browser:didNotStartBrowsingForPeers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Error browsing: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)advertiser:didNotStartAdvertisingPeer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1AF5CC000, v0, v1, "Did not start advertising: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
