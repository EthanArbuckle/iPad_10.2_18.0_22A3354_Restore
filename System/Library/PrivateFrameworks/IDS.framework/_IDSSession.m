@implementation _IDSSession

- (id)daemonListener
{
  void *v2;
  void *v3;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)daemonController
{
  return +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
}

- (id)_initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 connectionCountHint:(unint64_t)a6 needsToWaitForPreConnectionData:(BOOL)a7 uniqueID:(id)a8 delegateContext:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  _IDSSession *v19;
  void *v20;
  int v21;
  NSObject *v22;
  _IDSSession *v23;
  NSString *v24;
  NSString *uniqueID;
  void *v26;
  uint64_t v27;
  NSString *accountID;
  NSSet *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  NSSet *destinations;
  NSSet *v37;
  uint64_t v38;
  id delegateContext;
  OS_dispatch_queue *queue;
  CUTWeakReference *delegate;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  unint64_t v50;
  BOOL v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a8;
  v17 = a9;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1907FC54C((uint64_t)self, v18);

    v19 = 0;
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "assertQueueIsCurrent");

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1907FC5CC();

    }
    v57.receiver = self;
    v57.super_class = (Class)_IDSSession;
    v23 = -[_IDSSession init](&v57, sel_init);
    if (v23)
    {
      v50 = a6;
      if (objc_msgSend(v16, "length"))
      {
        v24 = (NSString *)v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      uniqueID = v23->_uniqueID;
      v23->_uniqueID = v24;
      v51 = a7;

      objc_msgSend(v14, "_internal");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "uniqueID");
      v27 = objc_claimAutoreleasedReturnValue();
      accountID = v23->_accountID;
      v23->_accountID = (NSString *)v27;

      v29 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v52 = v15;
      v30 = v15;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v54 != v33)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "destinationURIs");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSSet unionSet:](v29, "unionSet:", v35);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v32);
      }

      destinations = v23->_destinations;
      v23->_destinations = v29;
      v37 = v29;

      objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v17);
      v38 = objc_claimAutoreleasedReturnValue();
      delegateContext = v23->_delegateContext;
      v23->_delegateContext = (id)v38;

      queue = v23->_queue;
      v23->_queue = 0;

      delegate = v23->_delegate;
      v23->_delegate = 0;

      v23->_state = 0;
      v23->_transportType = 0;
      v23->_isAudioEnabled = 0;
      v23->_sessionEndedReason = 0;
      v23->_socket = -1;
      v23->_connectionCountHint = v50;
      v23->_needsToWaitForPreConnectionData = v51;
      objc_msgSend(v14, "_internal");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "serviceName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.screensharing"));

      v23->_isLegacy = v44;
      objc_msgSend(v14, "_internal");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "serviceName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.phonecontinuity"));

      if (v47)
        v23->_shouldUseSocketForTransport = 1;
      -[_IDSSession daemonListener](v23, "daemonListener");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addHandler:", v23);

      v15 = v52;
    }
    self = v23;
    v19 = self;
  }

  return v19;
}

- (id)_initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _IDSSession *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _IDSSession *v19;
  void *v20;
  NSString *v21;
  NSString *uniqueID;
  void *v23;
  uint64_t v24;
  NSString *accountID;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  id delegateContext;
  OS_dispatch_queue *queue;
  CUTWeakReference *delegate;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSString *clientUUID;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  NSMutableDictionary *sessionConfig;
  void *v62;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907FC54C((uint64_t)self, v14);

    v15 = 0;
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "assertQueueIsCurrent");

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1907FC658();

    }
    v69.receiver = self;
    v69.super_class = (Class)_IDSSession;
    v19 = -[_IDSSession init](&v69, sel_init);
    if (v19)
    {
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34C50]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v20;
      if (objc_msgSend(v20, "length"))
      {
        v21 = v20;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID", v20);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      uniqueID = v19->_uniqueID;
      v19->_uniqueID = v21;

      objc_msgSend(v10, "_internal");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uniqueID");
      v24 = objc_claimAutoreleasedReturnValue();
      accountID = v19->_accountID;
      v19->_accountID = (NSString *)v24;

      v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v64 = v11;
      v27 = v11;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v66 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "destinationURIs", v62);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "unionSet:", v32);

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
        }
        while (v29);
      }

      objc_storeStrong((id *)&v19->_destinations, v26);
      objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v13);
      v33 = objc_claimAutoreleasedReturnValue();
      delegateContext = v19->_delegateContext;
      v19->_delegateContext = (id)v33;

      queue = v19->_queue;
      v19->_queue = 0;

      delegate = v19->_delegate;
      v19->_delegate = 0;

      v19->_state = 0;
      v19->_isAudioEnabled = 0;
      v19->_sessionEndedReason = 0;
      v19->_socket = -1;
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34C48]);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_transportType = objc_msgSend(v37, "integerValue");

      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BD0]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_connectionCountHint = objc_msgSend(v38, "unsignedIntegerValue");

      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BF0]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_disallowCellularInterface = objc_msgSend(v39, "BOOLValue");

      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BF8]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_disallowWifiInterface = objc_msgSend(v40, "BOOLValue");

      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34C38]);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_preferredAddressFamily = objc_msgSend(v41, "unsignedIntegerValue");

      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34C30]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_preferCellularForCallSetup = objc_msgSend(v42, "BOOLValue");

      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BC8]);
      v43 = objc_claimAutoreleasedReturnValue();
      clientUUID = v19->_clientUUID;
      v19->_clientUUID = (NSString *)v43;

      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BE8]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_disableEncryption = objc_msgSend(v45, "BOOLValue");

      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34C40]);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_enableSingleChannelDirectMode = objc_msgSend(v46, "BOOLValue");

      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34BB8]);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_alwaysSkipSelf = objc_msgSend(v47, "BOOLValue");

      v48 = *MEMORY[0x1E0D34C58];
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34C58]);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
        v50 = v48;
      else
        v50 = *MEMORY[0x1E0D34C20];
      objc_msgSend(v12, "objectForKey:", v50, v62);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_needsToWaitForPreConnectionData = objc_msgSend(v51, "BOOLValue");

      objc_msgSend(v10, "_internal");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "serviceName");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.screensharing"));

      v19->_isLegacy = v54;
      objc_msgSend(v10, "_internal");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "serviceName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.phonecontinuity"));

      if (v57)
        v19->_shouldUseSocketForTransport = 1;
      -[_IDSSession daemonListener](v19, "daemonListener");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addHandler:", v19);

      v59 = objc_msgSend(v12, "mutableCopy");
      sessionConfig = v19->_sessionConfig;
      v19->_sessionConfig = (NSMutableDictionary *)v59;

      v11 = v64;
    }
    self = v19;
    v15 = self;
  }

  return v15;
}

- (_IDSSession)initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 uniqueID:(id)a6 delegateContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _IDSSession *v17;
  void *v18;
  int v19;
  NSObject *v20;
  __CFDictionary *v21;
  void *v22;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907FC54C((uint64_t)self, v16);
    v17 = 0;
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "assertQueueIsCurrent");

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1907FC6E4();

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    if (v14)
      CFDictionarySetValue(v21, (const void *)*MEMORY[0x1E0D34C50], v14);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      CFDictionarySetValue((CFMutableDictionaryRef)v16, (const void *)*MEMORY[0x1E0D34C48], v22);

    CFDictionarySetValue((CFMutableDictionaryRef)v16, (const void *)*MEMORY[0x1E0D34BD0], &unk_1E2CAE588);
    CFDictionarySetValue((CFMutableDictionaryRef)v16, (const void *)*MEMORY[0x1E0D34C58], MEMORY[0x1E0C9AAA0]);
    self = (_IDSSession *)-[_IDSSession _initWithAccount:destinations:options:delegateContext:](self, "_initWithAccount:destinations:options:delegateContext:", v12, v13, v16, v15);
    v17 = self;
  }

  return v17;
}

- (_IDSSession)initWithAccount:(id)a3 destinations:(id)a4 transportType:(int64_t)a5 delegateContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _IDSSession *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907FC54C((uint64_t)self, v13);
    v14 = 0;
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "assertQueueIsCurrent");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1907FC770();

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      CFDictionarySetValue((CFMutableDictionaryRef)v13, (const void *)*MEMORY[0x1E0D34C48], v18);

    CFDictionarySetValue((CFMutableDictionaryRef)v13, (const void *)*MEMORY[0x1E0D34BD0], &unk_1E2CAE588);
    CFDictionarySetValue((CFMutableDictionaryRef)v13, (const void *)*MEMORY[0x1E0D34C58], MEMORY[0x1E0C9AAA0]);
    self = (_IDSSession *)-[_IDSSession _initWithAccount:destinations:options:delegateContext:](self, "_initWithAccount:destinations:options:delegateContext:", v10, v11, v13, v12);
    -[_IDSSession _broadcastNewSessionToDaemon](self, "_broadcastNewSessionToDaemon");
    v14 = self;
  }

  return v14;
}

- (_IDSSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 delegateContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _IDSSession *v15;
  void *v16;
  int v17;
  NSObject *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907FC54C((uint64_t)self, v14);

    v15 = 0;
  }
  else
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "assertQueueIsCurrent");

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1907FC7FC();

    }
    self = (_IDSSession *)-[_IDSSession _initWithAccount:destinations:options:delegateContext:](self, "_initWithAccount:destinations:options:delegateContext:", v10, v11, v12, v13);
    -[_IDSSession _broadcastNewSessionToDaemon](self, "_broadcastNewSessionToDaemon");
    v15 = self;
  }

  return v15;
}

- (void)dealloc
{
  void *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  id v7;
  int socket;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  id v12;
  NSString *v13;

  -[_IDSSession daemonController](self, "daemonController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_uniqueID;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1907D9C68;
  v11[3] = &unk_1E2C607A8;
  v12 = v3;
  v6 = v4;
  v13 = v6;
  v7 = v3;
  objc_msgSend(v5, "performBlock:", v11);

  socket = self->_socket;
  if ((socket & 0x80000000) == 0)
  {
    close(socket);
    self->_socket = -1;
  }
  -[_IDSSession _cleanupSocketPairConnections](self, "_cleanupSocketPairConnections");
  -[_IDSSession daemonListener](self, "daemonListener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeHandler:", self);

  v10.receiver = self;
  v10.super_class = (Class)_IDSSession;
  -[_IDSSession dealloc](&v10, sel_dealloc);
}

- (void)daemonDisconnected
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSString *uniqueID;
  int v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FC888();

  }
  if (-[NSString length](self->_uniqueID, "length"))
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      v8 = 138412290;
      v9 = uniqueID;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Disconnected from daemon, notifying client of session %@", (uint8_t *)&v8, 0xCu);
    }

    -[_IDSSession sessionEnded:withReason:error:](self, "sessionEnded:withReason:error:", self->_uniqueID, 16, 0);
  }
}

- (void)_broadcastNewSessionToDaemon
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *accountID;
  NSString *uniqueID;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *clientUUID;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *sessionConfig;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FCA70();

  }
  if (!-[NSString length](self->_uniqueID, "length"))
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907FC9FC(v6, v7, v8);

  }
  if (!-[NSString length](self->_accountID, "length"))
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907FC988(v9, v10, v11);

  }
  if (!-[NSSet count](self->_destinations, "count"))
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907FC914(v12, v13, v14);

  }
  accountID = self->_accountID;
  if (accountID)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BB0], accountID);
  uniqueID = self->_uniqueID;
  if (uniqueID)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C50], uniqueID);
  -[NSSet allObjects](self->_destinations, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BE0], v17);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_transportType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C48], v18);

  -[_IDSSession daemonController](self, "daemonController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "listenerID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BC0], v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_connectionCountHint);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BD0], v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_needsToWaitForPreConnectionData);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C58], v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disallowCellularInterface);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BF0], v23);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disallowWifiInterface);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BF8], v24);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_preferredAddressFamily);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C38], v25);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preferCellularForCallSetup);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C30], v26);

  clientUUID = self->_clientUUID;
  if (clientUUID)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BC8], clientUUID);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disableEncryption);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BE8], v28);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableSingleChannelDirectMode);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34C40], v29);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_alwaysSkipSelf);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionConfig, (const void *)*MEMORY[0x1E0D34BB8], v30);

  -[_IDSSession daemonController](self, "daemonController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setupNewSessionWithConfiguration:", self->_sessionConfig);

  sessionConfig = self->_sessionConfig;
  self->_sessionConfig = 0;

}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *queue;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "assertQueueIsCurrent");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1907FCAFC();

    }
    -[CUTWeakReference object](self->_delegate, "object");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    queue = self->_queue;
    if (queue && v8)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = sub_1907DA2C8;
      v11[3] = &unk_1E2C60E00;
      v13 = v4;
      v12 = v9;
      dispatch_async(queue, v11);

    }
  }

}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  CUTWeakReference *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  CUTWeakReference *v12;
  CUTWeakReference *delegate;
  _QWORD v14[5];
  uint8_t buf[4];
  CUTWeakReference *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (CUTWeakReference *)a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907FCB88();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v6;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Setting up session delegate %p", buf, 0xCu);
  }

  if (self->_delegate != v6)
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v6);
    v12 = (CUTWeakReference *)objc_claimAutoreleasedReturnValue();
    delegate = self->_delegate;
    self->_delegate = v12;

  }
  objc_storeStrong((id *)&self->_queue, a4);
  if (self->_state == 2)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1907DA494;
    v14[3] = &unk_1E2C650F0;
    v14[4] = self;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v14);
  }
  else if (self->_isLegacy)
  {
    -[_IDSSession _setupSocketPairToDaemon](self, "_setupSocketPairToDaemon");
  }

}

- (int)socket
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FCC14();

  }
  if (self->_state == 1)
    return self->_socket;
  else
    return -1;
}

- (NSString)uniqueID
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FCCA0();

  }
  return self->_uniqueID;
}

- (void)_setupUnreliableSocketPairConnection
{
  void *v3;
  int v4;
  NSObject *v5;
  IDSBaseSocketPairConnection *unreliableSocketPairConnection;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t socket;
  void *v13;
  IDSBaseSocketPairConnection *v14;
  IDSBaseSocketPairConnection *v15;
  uint8_t v16[16];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FCDA0();

  }
  unreliableSocketPairConnection = self->_unreliableSocketPairConnection;
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (unreliableSocketPairConnection)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FCD2C(v8, v9, v10);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Setting up socket pair to daemon", v16, 2u);
    }

    v11 = objc_alloc(MEMORY[0x1E0D34CC0]);
    socket = self->_socket;
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject queue](v8, "queue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (IDSBaseSocketPairConnection *)objc_msgSend(v11, "initWithSocket:queue:delegate:", socket, v13, self);
    v15 = self->_unreliableSocketPairConnection;
    self->_unreliableSocketPairConnection = v14;

  }
}

- (void)_setupSocketPairToDaemon
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  xpc_object_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27[2];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FD3AC();

  }
  *(_QWORD *)v27 = 0xAAAAAAAAAAAAAAAALL;
  if (socketpair(1, 2, 0, v27) < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907FD32C();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  v7 = fcntl(v27[0], 3, 0);
  if (v7 < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907FD2AC();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  if (fcntl(v27[0], 4, v7 | 4u) < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907FD22C();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  v10 = fcntl(v27[1], 3, 0);
  if (v10 < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907FD1AC();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  if (fcntl(v27[1], 4, v10 | 4u) < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907FD12C();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  v26 = 1;
  if (setsockopt(v27[0], 0xFFFF, 4130, &v26, 4u) < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907FD0AC();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  if (setsockopt(v27[1], 0xFFFF, 4130, &v26, 4u) < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907FD02C();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  v25 = 0x40000;
  if (setsockopt(v27[0], 0xFFFF, 4097, &v25, 4u) < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1907FCFAC();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  if (setsockopt(v27[1], 0xFFFF, 4097, &v25, 4u) < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907FCF2C();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  if (setsockopt(v27[0], 0xFFFF, 4098, &v25, 4u) < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1907FCEAC();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  if (setsockopt(v27[1], 0xFFFF, 4098, &v25, 4u) < 0)
  {
    __error();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1907FCE2C();

    if ((v27[0] & 0x80000000) == 0)
    {
      close(v27[0]);
      v27[0] = -1;
    }
    if ((v27[1] & 0x80000000) == 0)
    {
      close(v27[1]);
      v27[1] = -1;
    }
    -[_IDSSession endSession](self, "endSession");
  }
  v19 = v27[1];
  self->_socket = v27[0];
  v20 = xpc_fd_create(v19);
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v21, "setObject:forKey:", CFSTR("socket"), CFSTR("object-type"));
  objc_msgSend(v21, "setObject:forKey:", CFSTR("session-socket"), CFSTR("socket-type"));
  objc_msgSend(v21, "setObject:forKey:", self->_uniqueID, CFSTR("sessionID"));
  -[CUTWeakReference object](self->_delegate, "object");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("raw-socket"));

  }
  -[_IDSSession daemonController](self, "daemonController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendXPCObject:objectContext:", v20, v21);

  if (v20)
  close(v19);

}

- (void)_cleanupSocketPairConnections
{
  IDSBaseSocketPairConnection *unreliableSocketPairConnection;

  -[IDSBaseSocketPairConnection endSession](self->_unreliableSocketPairConnection, "endSession");
  unreliableSocketPairConnection = self->_unreliableSocketPairConnection;
  self->_unreliableSocketPairConnection = 0;

}

- (void)sendAllocationRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FD440();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Sending allocation request with options %@", (uint8_t *)&v10, 0xCu);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendAllocationRequest:options:", self->_uniqueID, v4);

}

- (void)sendInvitationWithOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FD4CC();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation with options %@", (uint8_t *)&v10, 0xCu);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendInvitation:withOptions:", self->_uniqueID, v4);

}

- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907FD558();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v6, "length");
    v12 = CFSTR("NO");
    if (v4)
      v12 = CFSTR("YES");
    v14 = 134218242;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation with data (%lu bytes), declineOnError %@", (uint8_t *)&v14, 0x16u);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendInvitation:withData:declineOnError:", self->_uniqueID, v6, v4);

}

- (void)cancelInvitation
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FD5E4();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Cancel", v8, 2u);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelInvitation:", self->_uniqueID);

}

- (void)cancelInvitationWithData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FD670();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Cancel with data (%lu bytes)", (uint8_t *)&v10, 0xCu);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelInvitation:withData:", self->_uniqueID, v4);

}

- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FD6FC();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Cancel with Reason %u", (uint8_t *)v10, 8u);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelInvitation:withRemoteEndedReasonOverride:", self->_uniqueID, v3);

}

- (void)acceptInvitation
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FD788();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Accept", v8, 2u);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acceptInvitation:", self->_uniqueID);

}

- (void)acceptInvitationWithData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FD814();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Accept with data (%lu bytes)", (uint8_t *)&v10, 0xCu);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "acceptInvitation:withData:", self->_uniqueID, v4);

}

- (void)declineInvitation
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FD8A0();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Decline", v8, 2u);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "declineInvitation:", self->_uniqueID);

}

- (void)declineInvitationWithData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FD92C();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Sending Session Invitation Decline with data (%lu bytes)", (uint8_t *)&v10, 0xCu);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "declineInvitation:withData:", self->_uniqueID, v4);

}

- (void)reconnectSession
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FD9B8();

  }
  -[_IDSSession daemonController](self, "daemonController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reconnectSessionWithUniqueID:", self->_uniqueID);

}

- (void)endSession
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FDA44();

  }
  -[_IDSSession daemonController](self, "daemonController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endSession:", self->_uniqueID);

  -[_IDSSession _cleanupSocketPairConnections](self, "_cleanupSocketPairConnections");
  self->_state = 2;
}

- (void)endSessionWithData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FDAD0();

  }
  -[_IDSSession daemonController](self, "daemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endSession:withData:", self->_uniqueID, v4);

}

- (void)sendSessionMessage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FDB5C();

  }
  -[_IDSSession daemonController](self, "daemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendSessionMessage:toDestinations:forSessionWithUniqueID:", v4, self->_destinations, self->_uniqueID);

}

- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  NSSet *destinations;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  NSSet *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v6 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907FDBE8();

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = v6;
  objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v6);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "destinationURIs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (-[NSSet containsObject:](self->_destinations, "containsObject:", v16))
        {
          objc_msgSend(v10, "addObject:", v16);
        }
        else
        {
          +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            destinations = self->_destinations;
            *(_DWORD *)buf = 138478083;
            v28 = v16;
            v29 = 2113;
            v30 = destinations;
            _os_log_error_impl(&dword_1906E0000, v17, OS_LOG_TYPE_ERROR, "Skipping destination %{private}@, which is not in this session's list of destinations: %{private}@", buf, 0x16u);
          }

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v13);
  }

  -[_IDSSession daemonController](self, "daemonController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendSessionMessage:toDestinations:forSessionWithUniqueID:", v22, v10, self->_uniqueID);

}

- (void)setAudioEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v3 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FDC74();

  }
  -[_IDSSession daemonController](self, "daemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAudioEnabled:forSessionWithUniqueID:", v3, self->_uniqueID);

}

- (BOOL)getAudioEnabled
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FDD00();

  }
  return self->_isAudioEnabled;
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v3 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FDD8C();

  }
  -[_IDSSession daemonController](self, "daemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMuted:forSessionWithUniqueID:", v3, self->_uniqueID);

}

- (BOOL)getMuted
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FDE18();

  }
  return self->_isMuted;
}

- (void)setPreferences:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *preferences;
  void *v10;

  v4 = (NSMutableDictionary *)a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FDEA4();

  }
  if (self->_preferences != v4)
  {
    v8 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v4, "mutableCopy");
    preferences = self->_preferences;
    self->_preferences = v8;

    -[_IDSSession daemonController](self, "daemonController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreferences:forSessionWithUniqueID:", v4, self->_uniqueID);

  }
}

- (id)getPreferences
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FDF30();

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_preferences);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setInviteTimeout:(int64_t)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FDFBC();

  }
  -[_IDSSession daemonController](self, "daemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInviteTimetout:forSessionWithUniqueID:", a3, self->_uniqueID);

}

- (int64_t)inviteTimeout
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FE048();

  }
  return self->_inviteTimeout;
}

- (unsigned)sessionEndedReason
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907FE0D4();

  }
  return self->_sessionEndedReason;
}

- (BOOL)shouldUseSocketForTransport
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_shouldUseSocketForTransport)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Asked if shouldUseSocketForTransport %@", (uint8_t *)&v6, 0xCu);
  }

  return self->_shouldUseSocketForTransport;
}

- (unint64_t)MTUForAddressFamily:(unint64_t)a3
{
  if (a3 == 1)
    return 1378;
  else
    return 1228;
}

- (BOOL)sendData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907FE2BC();

  }
  if (self->_state != 1)
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907FE248(v14, v15, v16);

    if (a4)
    {
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v18 = *MEMORY[0x1E0D34C00];
      v19 = 1;
LABEL_15:
      v13 = 0;
      *a4 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, v19, 0);
      goto LABEL_20;
    }
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  if (!self->_unreliableSocketPairConnection)
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1907FE160(v20, v21, v22);

    goto LABEL_19;
  }
  v10 = objc_msgSend(v6, "length");
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907FE1D4(v12, v24, v25);

    if (a4)
    {
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v18 = *MEMORY[0x1E0D34C00];
      v19 = 2;
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v26 = 134218240;
    v27 = objc_msgSend(v6, "hash");
    v28 = 2048;
    v29 = objc_msgSend(v6, "length");
    _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_INFO, "Sending data Client -> Daemon  (hash: %lu)  (length: %lu)", (uint8_t *)&v26, 0x16u);
  }

  -[IDSBaseSocketPairConnection sendData:](self->_unreliableSocketPairConnection, "sendData:", v6);
  v13 = 1;
LABEL_20:

  return v13;
}

- (void)sessionAcceptReceived:(id)a3 fromID:(id)a4 withData:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSSet *v15;
  NSSet *destinations;
  NSObject *v17;
  NSString *uniqueID;
  _QWORD v19[5];
  NSString *v20;
  id v21;
  uint8_t buf[4];
  NSString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907FE348();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Session accept received fromID %@ sessionID %@ with data %@", buf, 0x20u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    v15 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v9, 0);
    destinations = self->_destinations;
    self->_destinations = v15;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1907DCA0C;
    v19[3] = &unk_1E2C65118;
    v19[4] = self;
    v20 = v9;
    v21 = v10;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v19);

  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v23 = uniqueID;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring accept, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)sessionDeclineReceived:(id)a3 fromID:(id)a4 withData:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSSet *v15;
  NSSet *destinations;
  NSObject *v17;
  NSString *uniqueID;
  _QWORD v19[5];
  NSString *v20;
  id v21;
  uint8_t buf[4];
  NSString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907FE3D4();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Session decline received fromID %@ sessionID %@ with data %@", buf, 0x20u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    v15 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v9, 0);
    destinations = self->_destinations;
    self->_destinations = v15;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1907DCCF4;
    v19[3] = &unk_1E2C65118;
    v19[4] = self;
    v20 = v9;
    v21 = v10;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v19);

  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v23 = uniqueID;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring decline, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)sessionCancelReceived:(id)a3 fromID:(id)a4 withData:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSSet *v15;
  NSSet *destinations;
  NSObject *v17;
  NSString *uniqueID;
  _QWORD v19[5];
  NSString *v20;
  id v21;
  uint8_t buf[4];
  NSString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907FE460();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Session cancel received fromID %@ sessionID %@ with data %@", buf, 0x20u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    v15 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v9, 0);
    destinations = self->_destinations;
    self->_destinations = v15;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1907DCFDC;
    v19[3] = &unk_1E2C65118;
    v19[4] = self;
    v20 = v9;
    v21 = v10;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v19);

  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v23 = uniqueID;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring cancel, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)sessionMessageReceived:(id)a3 fromID:(id)a4 withData:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSString *uniqueID;
  _QWORD v17[5];
  NSString *v18;
  id v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907FE4EC();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v21 = v9;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Session message received fromID %@ sessionID %@ with data %@", buf, 0x20u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1907DD294;
    v17[3] = &unk_1E2C65118;
    v17[4] = self;
    v18 = v9;
    v19 = v10;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v17);

  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v21 = uniqueID;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring message, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)sessionEndReceived:(id)a3 fromID:(id)a4 withData:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSString *uniqueID;
  _QWORD v17[5];
  NSString *v18;
  id v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907FE578();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v21 = v9;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v10;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Session end received fromID %@ sessionID %@ with data %@", buf, 0x20u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1907DD51C;
    v17[3] = &unk_1E2C65118;
    v17[4] = self;
    v18 = v9;
    v19 = v10;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v17);

  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v21 = uniqueID;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring end, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)session:(id)a3 invitationSentToTokens:(id)a4 shouldBreakBeforeMake:(BOOL)a5
{
  _BOOL4 v5;
  NSString *v8;
  NSString *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  NSString *uniqueID;
  _QWORD v17[5];
  NSString *v18;
  BOOL v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907FE604();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 2112;
    if (v5)
      v14 = CFSTR("YES");
    v23 = v9;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Session %@ invitation sent to tokens %@ shouldBreakBeforeMake %@", buf, 0x20u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1907DD7A4;
    v17[3] = &unk_1E2C65140;
    v17[4] = self;
    v18 = v9;
    v19 = v5;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v17);

  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v21 = uniqueID;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring session:invitationSentToTokens:, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)allocationDone:(id)a3 sessionInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSString *uniqueID;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907FE690();

  }
  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1907DD9E4;
    v13[3] = &unk_1E2C65168;
    v13[4] = self;
    v14 = v7;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v13);

  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v16 = uniqueID;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring session started, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)sessionStarted:(id)a3
{
  NSString *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSString *uniqueID;
  _QWORD v12[5];
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907FE71C();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Session started for IDSSessionID: %@", buf, 0xCu);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v4) & 1) != 0)
  {
    v9 = MEMORY[0x1E0C809B0];
    self->_state = 1;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = sub_1907DDC18;
    v12[3] = &unk_1E2C650F0;
    v12[4] = self;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v12);
  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v14 = uniqueID;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring session started, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  NSString *v8;
  NSString *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  unsigned int v14;
  NSObject *v15;
  NSString *uniqueID;
  _QWORD v17[5];
  NSString *v18;
  unsigned int v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = (NSString *)a3;
  v9 = (NSString *)a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907FE7A8();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Session ended %@ with error: %@", buf, 0x16u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v8) & 1) != 0)
  {
    -[_IDSSession _cleanupSocketPairConnections](self, "_cleanupSocketPairConnections");
    self->_state = 2;
    if (a4 <= 1)
      v14 = 1;
    else
      v14 = a4;
    self->_sessionEndedReason = v14;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1907DDE98;
    v17[3] = &unk_1E2C65190;
    v17[4] = self;
    v19 = a4;
    v18 = v9;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v17);

  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v21 = uniqueID;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring session ended, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)session:(id)a3 audioEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  NSString *uniqueID;
  int v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907FE834();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v4)
      v11 = CFSTR("YES");
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Session audio enabled ? %@", (uint8_t *)&v14, 0xCu);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) != 0)
  {
    self->_isAudioEnabled = v4;
  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      v14 = 138412546;
      v15 = (const __CFString *)uniqueID;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring audioEnabled, session doesn't match %@ vs. %@", (uint8_t *)&v14, 0x16u);
    }

  }
}

- (void)session:(id)a3 muted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  NSString *uniqueID;
  int v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907FE8C0();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v4)
      v11 = CFSTR("YES");
    v14 = 138412290;
    v15 = v11;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Session muted ? %@", (uint8_t *)&v14, 0xCu);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) != 0)
  {
    self->_isMuted = v4;
  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      v14 = 138412546;
      v15 = (const __CFString *)uniqueID;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring muted, session doesn't match %@ vs. %@", (uint8_t *)&v14, 0x16u);
    }

  }
}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  id v6;
  const __CFDictionary *Value;
  const __CFDictionary *v8;
  void *v9;
  const __CFDictionary *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSString *v14;
  NSObject *v15;
  NSString *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  NSObject *v21;
  int socket;
  unint64_t initialLinkType;
  NSString *uniqueID;
  int v25;
  _BYTE v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  Value = (const __CFDictionary *)a4;
  v8 = Value;
  if (Value)
  {
    v9 = (id)CFDictionaryGetValue(Value, CFSTR("object-type"));
    Value = (const __CFDictionary *)CFDictionaryGetValue(v8, CFSTR("sessionID"));
  }
  else
  {
    v9 = 0;
  }
  v10 = Value;
  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v10) & 1) != 0)
  {
    -[__CFDictionary objectForKey:](v8, "objectForKey:", CFSTR("error"));
    v11 = objc_claimAutoreleasedReturnValue();
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412546;
      *(_QWORD *)v26 = v6;
      *(_WORD *)&v26[8] = 2112;
      *(_QWORD *)&v26[10] = v8;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "xpc object: [%@] context: [%@]", (uint8_t *)&v25, 0x16u);
    }

    if (objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("session-device-socket")))
    {
      if (v6)
      {
        v13 = xpc_fd_dup(v6);
      }
      else
      {
        self->_shouldUseSocketForTransport = 0;
        v13 = -1;
      }
      -[_IDSSession _cleanupSocketPairConnections](self, "_cleanupSocketPairConnections");
      self->_socket = v13;
      +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        socket = self->_socket;
        v25 = 67109378;
        *(_DWORD *)v26 = socket;
        *(_WORD *)&v26[4] = 2112;
        *(_QWORD *)&v26[6] = v11;
        _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "Received XPC Response/Socket: %d    Error: %@", (uint8_t *)&v25, 0x12u);
      }

      -[_IDSSession sessionStarted:](self, "sessionStarted:", self->_uniqueID);
      goto LABEL_28;
    }
    if (objc_msgSend(v9, "isEqualToIgnoringCase:", CFSTR("session-initial-link-type")))
    {
      if (v6 && MEMORY[0x1940102E4](v6) == MEMORY[0x1E0C81328])
      {
        self->_initialLinkType = xpc_int64_get_value(v6);
        +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          initialLinkType = self->_initialLinkType;
          uniqueID = self->_uniqueID;
          v25 = 67109634;
          *(_DWORD *)v26 = initialLinkType;
          *(_WORD *)&v26[4] = 2112;
          *(_QWORD *)&v26[6] = uniqueID;
          *(_WORD *)&v26[14] = 2112;
          *(_QWORD *)&v26[16] = v11;
          v17 = "Received initial link type %d for session %@ with error %@.";
          v18 = v15;
          v19 = 28;
          goto LABEL_26;
        }
      }
      else
      {
        +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_uniqueID;
          v25 = 138412546;
          *(_QWORD *)v26 = v16;
          *(_WORD *)&v26[8] = 2112;
          *(_QWORD *)&v26[10] = v11;
          v17 = "Received invalid initial link type xpc object for session %@ with error %@.";
          v18 = v15;
          v19 = 22;
LABEL_26:
          _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v25, v19);
        }
      }

      goto LABEL_28;
    }
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      *(_QWORD *)v26 = v9;
      _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Received invalid xpc object type: %@.", (uint8_t *)&v25, 0xCu);
    }

  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_uniqueID;
      v25 = 138412546;
      *(_QWORD *)v26 = v14;
      *(_WORD *)&v26[8] = 2112;
      *(_QWORD *)&v26[10] = v10;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring xpc object, session doesn't match %@ vs. %@", (uint8_t *)&v25, 0x16u);
    }
  }
LABEL_28:

}

- (void)session:(id)a3 didReceiveReport:(id)a4
{
  NSString *v6;
  NSString *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSString *uniqueID;
  _QWORD v14[5];
  NSString *v15;
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907FE94C();

  }
  +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Session %@ received the report: %@", buf, 0x16u);
  }

  if ((-[NSString isEqualToIgnoringCase:](self->_uniqueID, "isEqualToIgnoringCase:", v6) & 1) != 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1907DE88C;
    v14[3] = &unk_1E2C65168;
    v14[4] = self;
    v15 = v7;
    -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v14);

  }
  else
  {
    +[IDSLogging _IDSSession](IDSLogging, "_IDSSession");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uniqueID = self->_uniqueID;
      *(_DWORD *)buf = 138412546;
      v17 = uniqueID;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring didReceiveReport, session doesn't match %@ vs. %@", buf, 0x16u);
    }

  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _IDSSession *v12;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907FE9D8();

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1907DE9CC;
  v10[3] = &unk_1E2C65168;
  v11 = v5;
  v12 = self;
  v9 = v5;
  -[_IDSSession _callDelegateWithBlock:](self, "_callDelegateWithBlock:", v10);

}

- (unsigned)state
{
  return self->_state;
}

- (id)boostContext
{
  return self->_boostContext;
}

- (void)setBoostContext:(id)a3
{
  objc_storeStrong(&self->_boostContext, a3);
}

- (unint64_t)initialLinkType
{
  return self->_initialLinkType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionConfig, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_unreliableSocketPairConnection, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong(&self->_boostContext, 0);
  objc_storeStrong(&self->_delegateContext, 0);
}

@end
