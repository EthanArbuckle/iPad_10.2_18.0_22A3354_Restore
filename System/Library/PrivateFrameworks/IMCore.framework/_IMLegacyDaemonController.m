@implementation _IMLegacyDaemonController

- (_IMLegacyDaemonController)init
{
  _IMLegacyDaemonController *v2;
  _IMLegacyDaemonController *v3;
  __CFRunLoop *Main;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSRecursiveLock *v10;
  NSRecursiveLock *connectionLock;
  dispatch_queue_t v12;
  OS_dispatch_queue *localObjectLockQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *remoteMessageQueue;
  dispatch_queue_t v16;
  OS_dispatch_queue *listenerLockQueue;
  dispatch_queue_t v18;
  OS_dispatch_queue *daemonConnectionQueue;
  id v20;
  uint64_t v21;
  NSProtocolChecker *protocol;
  IMReplyingRemoteDaemonProxy *v23;
  IMDaemonProtocol *synchronousReplyingRemoteDaemon;
  IMReplyingRemoteDaemonProxy *v25;
  IMDaemonProtocol *replyingRemoteDaemon;
  IMDaemonQueryController *v27;
  IMDaemonQueryController *queryController;
  _IMLegacyDaemonListener *v29;
  IMDaemonListener *daemonListener;
  NSMutableArray *v31;
  NSMutableArray *services;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CFRunLoopSourceContext context;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)_IMLegacyDaemonController;
  v2 = -[_IMLegacyDaemonController init](&v40, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_IMLegacyDaemonController _setAutoReconnect:](v2, "_setAutoReconnect:", 1);
    Main = CFRunLoopGetMain();
    memset(&context, 0, 72);
    context.perform = (void (__cdecl *)(void *))nullsub_6;
    v3->_runLoopSource = CFRunLoopSourceCreate(0, 0, &context);
    objc_opt_class();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v5 = (id)*MEMORY[0x1E0D36798];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v36;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v5);
          CFRunLoopAddSource(Main, v3->_runLoopSource, *(CFRunLoopMode *)(*((_QWORD *)&v35 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v7);
    }

    v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    connectionLock = v3->_connectionLock;
    v3->_connectionLock = v10;

    v12 = dispatch_queue_create("com.apple.IMDaemonControllerLocalLockQueue", 0);
    localObjectLockQueue = v3->_localObjectLockQueue;
    v3->_localObjectLockQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("com.apple.IMDaemonControllerQueue", 0);
    remoteMessageQueue = v3->_remoteMessageQueue;
    v3->_remoteMessageQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_create("com.apple.IMDaemonControllerListenerLockQueue", 0);
    listenerLockQueue = v3->_listenerLockQueue;
    v3->_listenerLockQueue = (OS_dispatch_queue *)v16;

    v3->_remoteDaemonLock = 0;
    v18 = dispatch_queue_create("com.apple.IMDaemonControllerConnectionQueue", 0);
    daemonConnectionQueue = v3->_daemonConnectionQueue;
    v3->_daemonConnectionQueue = (OS_dispatch_queue *)v18;

    v20 = objc_alloc(MEMORY[0x1E0CB38C0]);
    v21 = objc_msgSend(v20, "initWithProtocol:", &unk_1EE6B41A8, (_QWORD)v35);
    protocol = v3->_protocol;
    v3->_protocol = (NSProtocolChecker *)v21;

    v23 = -[IMReplyingRemoteDaemonProxy initWithDaemonController:synchronousReplies:]([IMReplyingRemoteDaemonProxy alloc], "initWithDaemonController:synchronousReplies:", v3, 1);
    synchronousReplyingRemoteDaemon = v3->_synchronousReplyingRemoteDaemon;
    v3->_synchronousReplyingRemoteDaemon = (IMDaemonProtocol *)v23;

    v25 = -[IMReplyingRemoteDaemonProxy initWithDaemonController:synchronousReplies:]([IMReplyingRemoteDaemonProxy alloc], "initWithDaemonController:synchronousReplies:", v3, 0);
    replyingRemoteDaemon = v3->_replyingRemoteDaemon;
    v3->_replyingRemoteDaemon = (IMDaemonProtocol *)v25;

    v27 = -[IMDaemonQueryController initWithDaemonController:]([IMDaemonQueryController alloc], "initWithDaemonController:", v3);
    queryController = v3->_queryController;
    v3->_queryController = v27;

    v29 = objc_alloc_init(_IMLegacyDaemonListener);
    daemonListener = v3->_daemonListener;
    v3->_daemonListener = (IMDaemonListener *)v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    services = v3->_services;
    v3->_services = v31;

    -[_IMLegacyDaemonController __setCapabilities:](v3, "__setCapabilities:", *MEMORY[0x1E0D36CB8]);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_1A205F714, (CFStringRef)*MEMORY[0x1E0D36C50], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  void *v6;
  NSRecursiveLock *connectionLock;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0D36C50], 0);
  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeListener:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, 0, 0);

  -[_IMLegacyDaemonController _localObjectCleanup](self, "_localObjectCleanup");
  -[_IMLegacyDaemonController _remoteObjectCleanup](self, "_remoteObjectCleanup");
  connectionLock = self->_connectionLock;
  self->_connectionLock = 0;

  v8.receiver = self;
  v8.super_class = (Class)_IMLegacyDaemonController;
  -[_IMLegacyDaemonController dealloc](&v8, sel_dealloc);
}

- (void)_agentDidLaunchNotification:(id)a3
{
  if (!self->_preventReconnect)
  {
    self->_hasCheckedForDaemon = 0;
    -[_IMLegacyDaemonController _disconnectFromDaemonWithForce:](self, "_disconnectFromDaemonWithForce:", 1);
    -[_IMLegacyDaemonController connectToDaemonWithLaunch:](self, "connectToDaemonWithLaunch:", 0);
  }
}

- (void)_handleDaemonException:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Exception returned from daemon: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (BOOL)_makeConnectionWithLaunch:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  BOOL v12;
  void *v14;
  uint64_t v15;
  NSString *listenerID;
  NSObject *v17;
  NSString *v18;
  void *v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *localObjectLockQueue;
  uint64_t v36;
  id WeakRetained;
  char v38;
  id v39;
  void *v40;
  _QWORD v41[5];
  _QWORD v42[4];
  id v43;
  _QWORD block[5];
  __CFDictionary *v45;
  id v46;
  _BYTE *v47;
  BOOL v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v4 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "systemIsShuttingDown") & 1) != 0
    || self->_hasBeenSuspended
    && -[_IMLegacyDaemonController _blocksConnectionAtResume](self, "_blocksConnectionAtResume"))
  {

LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  v8 = IMIsRunningOnAudioAccessory();

  if ((v8 & 1) != 0)
    goto LABEL_17;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      if (v4)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      if (self->_hasCheckedForDaemon)
        v10 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "  Ensuring connection to daemon (will launch: %@   has checked: %@)", buf, 0x16u);
    }

  }
  if (self->_hasCheckedForDaemon && !v4)
    goto LABEL_17;
  self->_hasCheckedForDaemon = 1;
  if (!self->_listenerID)
  {
    IMGetMainBundleIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    listenerID = self->_listenerID;
    self->_listenerID = (NSString *)v14;

  }
  if ((!-[_IMLegacyDaemonController __isLocalObjectValidOnQueue:](self, "__isLocalObjectValidOnQueue:", self->_localObjectLockQueue)|| !-[_IMLegacyDaemonController __isRemoteObjectValid](self, "__isRemoteObjectValid"))&& !self->_requestingConnection)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = self->_listenerID;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "  Grabbing remote daemon port (listener ID: %@)", buf, 0xCu);
      }

    }
    -[_IMLegacyDaemonController listener](self, "listener");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_noteDisconnected");

    self->_lastUpdatedCapabilities = 0;
    -[_IMLegacyDaemonController _localObjectCleanup](self, "_localObjectCleanup");
    v20 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "listener");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_stampForContext:", CFSTR("fileTransfers"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      CFDictionarySetValue(v21, CFSTR("fileTransfers"), v24);

    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "listener");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_stampForContext:", CFSTR("DBModificationStamp"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      CFDictionarySetValue(v21, CFSTR("chatContext"), v27);

    if (v21)
      CFDictionarySetValue(v20, CFSTR("context"), v21);
    v28 = self->_listenerID;
    if (v28)
      CFDictionarySetValue(v20, CFSTR("listenerID"), v28);
    -[_IMLegacyDaemonController _servicesToAllow](self, "_servicesToAllow");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      CFDictionarySetValue(v20, CFSTR("allowedServices"), v29);

    -[_IMLegacyDaemonController _servicesToDeny](self, "_servicesToDeny");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      CFDictionarySetValue(v20, CFSTR("deniedServices"), v30);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_IMLegacyDaemonController capabilities](self, "capabilities"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      CFDictionarySetValue(v20, CFSTR("capabilities"), v31);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
      CFDictionarySetValue(v20, CFSTR("vcCapabilities"), v32);

    IMGetMainBundleIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
      CFDictionarySetValue(v20, CFSTR("bundleID"), v33);

    if (-[_IMLegacyDaemonController remoteObjectExists](self, "remoteObjectExists"))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = sub_1A2060D54;
      v42[3] = &unk_1E471E528;
      v43 = v6;
      objc_msgSend(v34, "__im_performBlock:modes:", v42, *MEMORY[0x1E0D36798]);

    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v50 = sub_1A200AD84;
      v51 = sub_1A200AC34;
      v52 = 0;
      self->_requestingConnection = 1;
      localObjectLockQueue = self->_localObjectLockQueue;
      v36 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1A20605B0;
      block[3] = &unk_1E471F488;
      v48 = v4;
      v47 = buf;
      block[4] = self;
      v45 = v20;
      v46 = v6;
      dispatch_sync(localObjectLockQueue, block);

      _Block_object_dispose(buf, 8);
      if ((IMIsRunningInMobileSMS() & 1) == 0)
      {
        v41[0] = v36;
        v41[1] = 3221225472;
        v41[2] = sub_1A2060D60;
        v41[3] = &unk_1E471E348;
        v41[4] = self;
        if (qword_1ECF123A8 != -1)
          dispatch_once(&qword_1ECF123A8, v41);
      }
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      v38 = objc_opt_respondsToSelector();

      if ((v38 & 1) != 0)
      {
        v39 = objc_loadWeakRetained(&self->_delegate);
        objc_msgSend(v39, "performSelector:withObject:", sel_daemonControllerWillConnect, 0);

      }
      if (!-[IMDaemonListener _hidingDisconnect](self->_daemonListener, "_hidingDisconnect"))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "__mainThreadPostNotificationName:object:", CFSTR("__kIMDaemonWillConnectNotification"), 0);

      }
    }

  }
  v12 = 1;
LABEL_18:

  return v12;
}

+ (BOOL)_applicationWillTerminate
{
  return byte_1EE65F458;
}

- (void)_blockUntilSendQueueIsEmpty
{
  void *v3;
  char v4;
  NSObject *remoteMessageQueue;
  id v6;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "systemIsShuttingDown");

  if ((v4 & 1) == 0 && !self->_acquiringDaemonConnection)
  {
    remoteMessageQueue = self->_remoteMessageQueue;
    if (remoteMessageQueue)
      dispatch_sync(remoteMessageQueue, &unk_1E471D598);
    objc_msgSend(MEMORY[0x1E0D36AB8], "defaultBroadcaster");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "blockUntilSendQueueIsEmpty");

  }
}

- (void)killDaemon
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D36AB8], "defaultBroadcaster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilSendQueueIsEmpty");

  MEMORY[0x1E0DE7D20](self, sel_terminateForcingIfNeeded_);
}

+ (void)_setApplicationWillTerminate
{
  byte_1EE65F458 = 1;
  +[_IMLegacyDaemonController _blockUntilSendQueueIsEmpty](_IMLegacyDaemonController, "_blockUntilSendQueueIsEmpty");
}

- (void)disconnectFromDaemonWithForce:(BOOL)a3
{
  NSLog(CFSTR("NOPE NOT DISCONNECTING"), a2, a3);
}

- (void)_disconnectFromDaemonWithForce:(BOOL)a3
{
  void *v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[13];

  aBlock[12] = *MEMORY[0x1E0C80C00];
  self->_hasCheckedForDaemon = 0;
  self->_lastUpdatedCapabilities = 0;
  -[NSRecursiveLock lock](self->_connectionLock, "lock");
  if (self->_acquiringDaemonConnection)
  {
    self->_acquiringDaemonConnection = 0;
    dispatch_resume((dispatch_object_t)self->_remoteMessageQueue);
  }
  -[NSRecursiveLock unlock](self->_connectionLock, "unlock");
  if (-[_IMLegacyDaemonController localObjectExists](self, "localObjectExists")
    || -[_IMLegacyDaemonController remoteObjectExists](self, "remoteObjectExists"))
  {
    if (!a3)
      +[_IMLegacyDaemonController _blockUntilSendQueueIsEmpty](_IMLegacyDaemonController, "_blockUntilSendQueueIsEmpty");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D36788], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0D365F8], 0);

    -[_IMLegacyDaemonController _remoteObjectCleanup](self, "_remoteObjectCleanup");
    -[_IMLegacyDaemonController _localObjectCleanup](self, "_localObjectCleanup");
    if (!a3)
      self->_preventReconnect = 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A206138C;
    aBlock[3] = &unk_1E471E348;
    aBlock[4] = self;
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__mainThreadPostNotificationName:object:", CFSTR("__k_IMDaemonDidDisconnectNotification"), 0);

    -[_IMLegacyDaemonController listener](self, "listener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setHidingDisconnect:", 1);

    if (-[_IMLegacyDaemonController _autoReconnect](self, "_autoReconnect"))
      im_dispatch_after();
    else
      v7[2](v7);

  }
  -[_IMLegacyDaemonController listener](self, "listener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_noteDisconnected");

}

- (void)_connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  __CFString *v13;
  NSMutableArray *v14;
  NSMutableArray *services;
  void *v16;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (v5)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      if (!(_DWORD)v4)
        -[_IMLegacyDaemonController capabilities](self, "capabilities");
      _IMStringFromFZListenerCapabilities();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_DEBUG, "Connect to daemon with launch: %@   capabilities: %@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "systemIsShuttingDown") & 1) != 0)
  {

    return;
  }
  if (self->_hasBeenSuspended)
  {
    v11 = -[_IMLegacyDaemonController _blocksConnectionAtResume](self, "_blocksConnectionAtResume");

    if (v11)
      return;
  }
  else
  {

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      _IMStringFromFZListenerCapabilities();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_DEBUG, "Connect:  Set capabilities: %@", buf, 0xCu);

    }
  }
  -[_IMLegacyDaemonController _setCapabilities:](self, "_setCapabilities:", v4);
  if (!-[_IMLegacyDaemonController isConnected](self, "isConnected")
    && !-[_IMLegacyDaemonController isConnecting](self, "isConnecting"))
  {
    -[NSRecursiveLock lock](self->_connectionLock, "lock");
    if (!-[_IMLegacyDaemonController remoteObjectExists](self, "remoteObjectExists")
      || !-[_IMLegacyDaemonController __isLocalObjectValidOnQueue:](self, "__isLocalObjectValidOnQueue:", self->_localObjectLockQueue))
    {
      self->_preventReconnect = 0;
      if (!self->_services)
      {
        v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        services = self->_services;
        self->_services = v14;

      }
      if (!self->_acquiringDaemonConnection)
      {
        self->_acquiringDaemonConnection = 1;
        dispatch_suspend((dispatch_object_t)self->_remoteMessageQueue);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1A2061C70;
        aBlock[3] = &unk_1E471E348;
        aBlock[4] = self;
        v16 = _Block_copy(aBlock);
        if (!-[_IMLegacyDaemonController _makeConnectionWithLaunch:completionBlock:](self, "_makeConnectionWithLaunch:completionBlock:", v5, v16)&& self->_acquiringDaemonConnection)
        {
          self->_acquiringDaemonConnection = 0;
          dispatch_resume((dispatch_object_t)self->_remoteMessageQueue);
        }

      }
    }
    -[NSRecursiveLock unlock](self->_connectionLock, "unlock");
  }
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3
{
  -[_IMLegacyDaemonController _connectToDaemonWithLaunch:capabilities:](self, "_connectToDaemonWithLaunch:capabilities:", a3, 0);
  return 1;
}

- (BOOL)connectToDaemon
{
  return -[_IMLegacyDaemonController connectToDaemonWithLaunch:](self, "connectToDaemonWithLaunch:", 1);
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5
{
  _BOOL4 v5;

  v5 = a5;
  -[_IMLegacyDaemonController _connectToDaemonWithLaunch:capabilities:](self, "_connectToDaemonWithLaunch:capabilities:", a3, *(_QWORD *)&a4);
  if (!v5)
    return 1;
  -[_IMLegacyDaemonController blockUntilConnected](self, "blockUntilConnected");
  return -[_IMLegacyDaemonController isConnected](self, "isConnected");
}

- (IMDaemonProtocol)remoteDaemon
{
  NSObject *v3;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Invoking -remoteDaemon on legacy daemon controller", v5, 2u);
    }

  }
  -[_IMLegacyDaemonController replyingRemoteDaemon](self, "replyingRemoteDaemon");
  return (IMDaemonProtocol *)(id)objc_claimAutoreleasedReturnValue();
}

- (IMDaemonProtocol)synchronousRemoteDaemon
{
  NSObject *v3;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Invoking -synchronousRemoteDaemon on legacy daemon controller", v5, 2u);
    }

  }
  -[_IMLegacyDaemonController synchronousReplyingRemoteDaemon](self, "synchronousReplyingRemoteDaemon");
  return (IMDaemonProtocol *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_listenerSetUpdated
{
  unsigned int v3;
  NSObject *listenerLockQueue;
  NSObject *v5;
  NSMutableDictionary *listenerMap;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSMutableDictionary *v11;
  void *v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  NSMutableDictionary *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[_IMLegacyDaemonController capabilities](self, "capabilities");
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  self->_cachedCapabilities = 0;
  listenerLockQueue = self->_listenerLockQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1A206222C;
  v13[3] = &unk_1E471F4D0;
  v13[4] = self;
  v13[5] = &v14;
  dispatch_sync(listenerLockQueue, v13);
  if (*((_BYTE *)v15 + 24))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        listenerMap = self->_listenerMap;
        _IMStringFromFZListenerCapabilities();
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[_IMLegacyDaemonController capabilities](self, "capabilities");
        _IMStringFromFZListenerCapabilities();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v19 = listenerMap;
        v20 = 2112;
        v21 = v7;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Connecting: Listener set updated to: %@ old capabilities: %@ new capabilities: %@", buf, 0x20u);

      }
    }
    if (v3 != -[_IMLegacyDaemonController capabilities](self, "capabilities"))
    {
      -[_IMLegacyDaemonController listener](self, "listener");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_resetPostedSetupCompleted");

    }
    -[_IMLegacyDaemonController _setAutoReconnect:](self, "_setAutoReconnect:", 1);
    -[_IMLegacyDaemonController connectToDaemonWithLaunch:capabilities:blockUntilConnected:](self, "connectToDaemonWithLaunch:capabilities:blockUntilConnected:", 1, -[_IMLegacyDaemonController capabilities](self, "capabilities"), 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = self->_listenerMap;
        -[_IMLegacyDaemonController capabilities](self, "capabilities");
        _IMStringFromFZListenerCapabilities();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v11;
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Disconnecting: Listener set updated to: %@   capabilities: %@", buf, 0x16u);

      }
    }
    -[_IMLegacyDaemonController _setAutoReconnect:](self, "_setAutoReconnect:", 0);
    -[_IMLegacyDaemonController _disconnectFromDaemonWithForce:](self, "_disconnectFromDaemonWithForce:", 0);
  }
  _Block_object_dispose(&v14, 8);
}

- (BOOL)addListenerID:(id)a3 capabilities:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  BOOL v7;
  NSObject *listenerLockQueue;
  _QWORD block[5];
  id v11;
  int v12;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    if (-[_IMLegacyDaemonController hasListenerForID:](self, "hasListenerForID:", v6))
    {
      v7 = -[_IMLegacyDaemonController setCapabilities:forListenerID:](self, "setCapabilities:forListenerID:", v4, v6);
    }
    else
    {
      listenerLockQueue = self->_listenerLockQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1A2062340;
      block[3] = &unk_1E471F4F8;
      block[4] = self;
      v11 = v6;
      v12 = v4;
      dispatch_sync(listenerLockQueue, block);
      -[_IMLegacyDaemonController _listenerSetUpdated](self, "_listenerSetUpdated");

      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasListenerForID:(id)a3
{
  id v4;
  NSObject *listenerLockQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  listenerLockQueue = self->_listenerLockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A2062544;
  block[3] = &unk_1E471F520;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(listenerLockQueue, block);
  LOBYTE(listenerLockQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)listenerLockQueue;
}

- (BOOL)removeListenerID:(id)a3
{
  id v4;
  NSObject *listenerLockQueue;
  BOOL v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    listenerLockQueue = self->_listenerLockQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A2062688;
    block[3] = &unk_1E471F548;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(listenerLockQueue, block);
    if (*((_BYTE *)v12 + 24))
    {
      -[_IMLegacyDaemonController _listenerSetUpdated](self, "_listenerSetUpdated");
      v6 = *((_BYTE *)v12 + 24) != 0;
    }
    else
    {
      v6 = 0;
    }

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unsigned)capabilitiesForListenerID:(id)a3
{
  id v4;
  NSObject *listenerLockQueue;
  unsigned int v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    listenerLockQueue = self->_listenerLockQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A206294C;
    block[3] = &unk_1E471F520;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(listenerLockQueue, block);
    v6 = *((_DWORD *)v12 + 6);

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = -[_IMLegacyDaemonController capabilities](self, "capabilities");
  }

  return v6;
}

- (BOOL)setCapabilities:(unsigned int)a3 forListenerID:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *listenerLockQueue;
  BOOL v10;
  _QWORD block[5];
  id v13;
  unsigned int v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "length") && -[_IMLegacyDaemonController hasListenerForID:](self, "hasListenerForID:", v6))
  {
    if (!a3 || -[_IMLegacyDaemonController capabilitiesForListenerID:](self, "capabilitiesForListenerID:", v6) != a3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          _IMStringFromFZListenerCapabilities();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v16 = v8;
          v17 = 2112;
          v18 = v6;
          _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Set capabilities: %@  for listener ID: %@", buf, 0x16u);

        }
      }
      listenerLockQueue = self->_listenerLockQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1A2062B48;
      block[3] = &unk_1E471F4F8;
      block[4] = self;
      v14 = a3;
      v13 = v6;
      dispatch_sync(listenerLockQueue, block);
      -[_IMLegacyDaemonController _listenerSetUpdated](self, "_listenerSetUpdated");

    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)processCapabilities
{
  return -[_IMLegacyDaemonController capabilities](self, "capabilities");
}

- (id)_remoteObject
{
  return self->_remoteObject;
}

- (void)_setBlocksConnectionAtResume:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  id v8;

  if (self->__blocksConnectionAtResume != a3)
  {
    v3 = a3;
    self->__blocksConnectionAtResume = a3;
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    if (v3)
    {
      v6 = objc_msgSend(v5, "isActive");

      if ((v6 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setActive:", 1);

      }
      objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_addEarlyListener:", self);
    }
    else
    {
      objc_msgSend(v5, "_removeEarlyListener:", self);
    }

  }
}

- (BOOL)_acquiringDaemonConnection
{
  return self->_acquiringDaemonConnection;
}

- (BOOL)isConnecting
{
  _BOOL4 v2;
  void *v4;
  char v5;

  if (self->_acquiringDaemonConnection)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = -[_IMLegacyDaemonController __isLocalObjectValidOnQueue:](self, "__isLocalObjectValidOnQueue:", self->_localObjectLockQueue);
    if (v2)
    {
      -[_IMLegacyDaemonController listener](self, "listener");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isSetupComplete");

      LOBYTE(v2) = (v5 & 1) == 0 && -[_IMLegacyDaemonController __isRemoteObjectValid](self, "__isRemoteObjectValid");
    }
  }
  return v2;
}

- (BOOL)isConnected
{
  void *v3;
  char v4;
  _BOOL4 v5;
  void *v6;
  int v7;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNonUIInstall");

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = -[_IMLegacyDaemonController __isLocalObjectValidOnQueue:](self, "__isLocalObjectValidOnQueue:", self->_localObjectLockQueue);
    if (v5)
    {
      -[_IMLegacyDaemonController listener](self, "listener");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isSetupComplete");

      if (v7)
        LOBYTE(v5) = -[_IMLegacyDaemonController __isRemoteObjectValid](self, "__isRemoteObjectValid");
      else
        LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (double)_connectionTimeout
{
  if (qword_1ECF12390 != -1)
    dispatch_once(&qword_1ECF12390, &unk_1E471F568);
  return *(double *)&qword_1ECF12070;
}

- (void)blockUntilConnected
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  int v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  const __CFString *v40;
  NSObject *v41;
  void *v42;
  _QWORD block[5];
  uint8_t buf[4];
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNonUIInstall");

  if ((v4 & 1) != 0)
    return;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Request to block until connected", buf, 2u);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A206371C;
  block[3] = &unk_1E471E348;
  block[4] = self;
  if (qword_1ECF12398 != -1)
    dispatch_once(&qword_1ECF12398, block);
  if (-[_IMLegacyDaemonController isConnected](self, "isConnected"))
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "listener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPostedSetupComplete");

    if (v8)
    {
      if (!IMOSLoggingEnabled())
        return;
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, " => Not blocking, already connected", buf, 2u);
      }
      goto LABEL_28;
    }
  }
  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "systemIsShuttingDown") & 1) != 0)
  {

LABEL_19:
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, " => Not blocking, shutting down", buf, 2u);
    }
    goto LABEL_28;
  }
  if (self->_hasBeenSuspended)
  {
    v11 = -[_IMLegacyDaemonController _blocksConnectionAtResume](self, "_blocksConnectionAtResume");

    if (v11)
      goto LABEL_19;
  }
  else
  {

  }
  if (self->_inBlockingConnect)
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, " => Already blocking, bailing", buf, 2u);
    }
LABEL_28:

    return;
  }
  v12 = -[_IMLegacyDaemonController capabilities](self, "capabilities");
  if ((*MEMORY[0x1E0D36CC8] & v12) != 0
    || (v13 = -[_IMLegacyDaemonController capabilities](self, "capabilities"), (*MEMORY[0x1E0D36CD0] & v13) != 0)
    || (v14 = -[_IMLegacyDaemonController capabilities](self, "capabilities"), (*MEMORY[0x1E0D36CD8] & v14) != 0))
  {
    v15 = +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
    v16 = +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
  }
  self->_inBlockingConnect = 1;
  -[NSLock lock](self->_blockingLock, "lock");
  if (!-[_IMLegacyDaemonController isConnected](self, "isConnected")
    && !-[_IMLegacyDaemonController isConnecting](self, "isConnecting"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, " => Starting connect", buf, 2u);
      }

    }
    -[_IMLegacyDaemonController connectToDaemonWithLaunch:](self, "connectToDaemonWithLaunch:", 1);
  }
  if (-[_IMLegacyDaemonController remoteObjectExists](self, "remoteObjectExists") || self->_acquiringDaemonConnection)
  {
    dispatch_sync((dispatch_queue_t)self->_daemonConnectionQueue, &unk_1E471F588);
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    objc_msgSend(MEMORY[0x1E0D36AE8], "IMCoreSetupTimingCollection");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "startTimingForKey:", CFSTR("IMCoreSetup: Blocking connection"));
    -[_IMLegacyDaemonController _connectionTimeout](self, "_connectionTimeout");
    v21 = v20;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v45 = v21;
        _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "connection timeout: %f", buf, 0xCu);
      }

    }
    v23 = *MEMORY[0x1E0D36790];
    while (1)
    {
      v24 = -[_IMLegacyDaemonController isConnected](self, "isConnected")
         || -[_IMLegacyDaemonController isConnecting](self, "isConnecting");
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "listener");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "hasPostedSetupComplete");

      if (((v27 | !v24) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "runMode:beforeDate:", v23, v28);

        v24 = -[_IMLegacyDaemonController isConnected](self, "isConnected")
           || -[_IMLegacyDaemonController isConnecting](self, "isConnecting");
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "listener");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v27) = objc_msgSend(v30, "hasPostedSetupComplete");

      }
      if ((v27 & 1) != 0 || !v24)
        break;
      objc_msgSend(v19, "timeIntervalSinceNow");
      if (v21 <= -v31)
      {
        -[NSLock unlock](self->_blockingLock, "unlock");
        goto LABEL_61;
      }
    }
    -[NSLock unlock](self->_blockingLock, "unlock");
    if ((v27 & 1) != 0)
    {
      v32 = 1;
      goto LABEL_68;
    }
LABEL_61:
    -[_IMLegacyDaemonController _disconnectFromDaemonWithForce:](self, "_disconnectFromDaemonWithForce:", 1);
    objc_msgSend(v19, "timeIntervalSinceNow");
    if (v21 <= -v33)
    {
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "processName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("%@ timed out connecting to imagent"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v45 = *(double *)&v37;
          _os_log_impl(&dword_1A1FF4000, v38, OS_LOG_TYPE_INFO, "************* %@, please file a radar, and attach the stackshots generated ***********************", buf, 0xCu);
        }

      }
      IMLogGenerateStackshotWithReason();

    }
    v32 = 0;
LABEL_68:
    objc_msgSend(v42, "stopTimingForKey:", CFSTR("IMCoreSetup: Blocking connection"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = CFSTR("NO");
        if (v32)
          v40 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v45 = *(double *)&v40;
        _os_log_impl(&dword_1A1FF4000, v39, OS_LOG_TYPE_INFO, "Done blocking  (Success: %@)", buf, 0xCu);
      }

    }
    self->_inBlockingConnect = 0;

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v41, OS_LOG_TYPE_INFO, " => No remote object, can't block", buf, 2u);
      }

    }
    -[NSLock unlock](self->_blockingLock, "unlock");
    self->_inBlockingConnect = 0;
  }
}

- (void)_noteSetupComplete
{
  __CFRunLoop *Main;

  CFRunLoopSourceSignal(self->_runLoopSource);
  Main = CFRunLoopGetMain();
  CFRunLoopWakeUp(Main);
}

- (BOOL)__isLocalObjectValidOnQueue:(id)a3
{
  NSObject *v4;
  void (**v5)(_QWORD);
  void *v6;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A2063850;
  v9[3] = &unk_1E471F4D0;
  v9[4] = self;
  v9[5] = &v10;
  v5 = (void (**)(_QWORD))_Block_copy(v9);
  v6 = v5;
  if (v4)
    dispatch_sync(v4, v5);
  else
    v5[2](v5);
  v7 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)__isRemoteObjectValid
{
  _IMLegacyDaemonController *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A206393C;
  v5[3] = &unk_1E471F4D0;
  v5[4] = self;
  v5[5] = &v6;
  v3 = _Block_copy(v5);
  sub_1A205F944((uint64_t)&v2->_remoteDaemonLock, v3);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)remoteObjectExists
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A2063A18;
  v4[3] = &unk_1E471F4D0;
  v4[4] = self;
  v4[5] = &v5;
  sub_1A205F944((uint64_t)&self->_remoteDaemonLock, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)localObjectExists
{
  NSObject *localObjectLockQueue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  localObjectLockQueue = self->_localObjectLockQueue;
  if (localObjectLockQueue)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_1A2063AD8;
    v5[3] = &unk_1E471F4D0;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(localObjectLockQueue, v5);
    v3 = *((_BYTE *)v7 + 24) != 0;
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_localObjectCleanup
{
  NSObject *localObjectLockQueue;
  _QWORD block[5];

  localObjectLockQueue = self->_localObjectLockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A2063B4C;
  block[3] = &unk_1E471E348;
  block[4] = self;
  dispatch_sync(localObjectLockQueue, block);
}

- (void)_remoteObjectCleanup
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1A2063BE8;
  v2[3] = &unk_1E471E348;
  v2[4] = self;
  sub_1A205F944((uint64_t)&self->_remoteDaemonLock, v2);
}

- (void)listener:(id)a3 setListenerCapabilities:(unsigned int)a4
{
  -[_IMLegacyDaemonController _setCapabilities:](self, "_setCapabilities:", *(_QWORD *)&a4);
}

- (unsigned)capabilities
{
  unsigned int v3;
  unsigned int cachedCapabilities;
  NSObject *listenerLockQueue;
  uint64_t *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v3 = -[_IMLegacyDaemonController _capabilities](self, "_capabilities");
  cachedCapabilities = self->_cachedCapabilities;
  if (!cachedCapabilities)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    listenerLockQueue = self->_listenerLockQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1A2063CD4;
    v8[3] = &unk_1E471F5D8;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(listenerLockQueue, v8);
    v6 = v10;
    self->_cachedCapabilities = *((_DWORD *)v10 + 6);
    cachedCapabilities = *((_DWORD *)v6 + 6);
    _Block_object_dispose(&v9, 8);
  }
  return cachedCapabilities | v3;
}

- (void)_setCapabilities:(unsigned int)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = -[_IMLegacyDaemonController capabilities](self, "capabilities");
    v5 = v4;
    if (self->_lastUpdatedCapabilities == (_DWORD)v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          _IMStringFromFZListenerCapabilities();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 138412290;
          v10 = v7;
          _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_DEBUG, "Not updating caps, these were already pushed down: %@", (uint8_t *)&v9, 0xCu);

        }
      }
    }
    else
    {
      self->_lastUpdatedCapabilities = v4;
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setListenerCapabilities:", v5);

    }
  }
}

- (void)localObjectDiedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Disconnected from agent (local)...", buf, 2u);
    }

  }
  -[_IMLegacyDaemonController listener](self, "listener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_noteDisconnected");

  if ((byte_1EE65EA98 & 1) == 0)
  {
    byte_1EE65EA98 = 1;
    -[_IMLegacyDaemonController _localObjectCleanup](self, "_localObjectCleanup");
    -[_IMLegacyDaemonController _remoteObjectCleanup](self, "_remoteObjectCleanup");
    im_dispatch_after();
  }

}

- (void)remoteObjectDiedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t buf[16];

  v4 = a3;
  -[_IMLegacyDaemonController listener](self, "listener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_noteDisconnected");

  if ((byte_1EE65EA98 & 1) == 0)
  {
    byte_1EE65EA98 = 1;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Disconnected from agent (remote)...", buf, 2u);
      }

    }
    im_dispatch_after();
  }

}

- (void)listener:(id)a3 setValue:(id)a4 ofProperty:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  v7 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:ofProperty:", v7, v6);

}

- (void)listener:(id)a3 setValue:(id)a4 ofPersistentProperty:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a5;
  v7 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:ofPersistentProperty:", v7, v6);

}

- (void)sendQueryWithReply:(BOOL)a3 query:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  const __CFString *v7;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v4)
    v7 = CFSTR("QueryWithReplySync");
  else
    v7 = CFSTR("QueryWithReply");
  -[_IMLegacyDaemonController setQueryContext:](self, "setQueryContext:", v7);
  v6[2](v6);

  MEMORY[0x1E0DE7D20](self, sel_unsetQueryContext_);
}

- (void)setQueryContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v7);

}

- (void)unsetQueryContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    objc_msgSend(v4, "removeObjectForKey:", v7);

}

- (BOOL)consumeQueryContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    objc_msgSend(v5, "removeObjectForKey:", v3);

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[NSProtocolChecker methodSignatureForSelector:](self->_protocol, "methodSignatureForSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  _BOOL4 v5;
  BOOL v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  _IMLegacyDaemonController *v11;
  _QWORD aBlock[5];
  id v13;
  BOOL v14;
  BOOL v15;

  v4 = a3;
  v5 = -[_IMLegacyDaemonController consumeQueryContext:](self, "consumeQueryContext:", CFSTR("QueryWithReplySync"));
  v6 = -[_IMLegacyDaemonController consumeQueryContext:](self, "consumeQueryContext:", CFSTR("QueryWithReply"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A2064960;
  aBlock[3] = &unk_1E471F600;
  aBlock[4] = self;
  v14 = v5;
  v15 = v6;
  v7 = v4;
  v13 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v5)
  {
    if (-[_IMLegacyDaemonController connectToDaemonWithLaunch:capabilities:blockUntilConnected:](self, "connectToDaemonWithLaunch:capabilities:blockUntilConnected:", 1, 0, 1))
    {
      objc_msgSend(v7, "retainArguments");
      objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "threadDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("com.apple.IMDaemonControllerForwardingMessageKey"));
      v11 = (_IMLegacyDaemonController *)objc_claimAutoreleasedReturnValue();

      if (v11 == self)
        v8[2](v8);
      else
        dispatch_sync((dispatch_queue_t)self->_remoteMessageQueue, v8);
    }
  }
  else if (-[_IMLegacyDaemonController connectToDaemon](self, "connectToDaemon"))
  {
    objc_msgSend(v7, "retainArguments");
    dispatch_async((dispatch_queue_t)self->_remoteMessageQueue, v8);
  }

}

- (void)systemApplicationDidSuspend
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "System application did suspend", v4, 2u);
    }

  }
  self->_hasBeenSuspended = 1;
}

- (void)systemApplicationDidEnterBackground
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "System application did enter background", v4, 2u);
    }

  }
  self->_hasBeenSuspended = 1;
}

- (void)systemApplicationWillEnterForeground
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[_IMLegacyDaemonController _blocksConnectionAtResume](self, "_blocksConnectionAtResume"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        if (self->_hasBeenSuspended)
          v4 = CFSTR("YES");
        else
          v4 = CFSTR("NO");
        v5 = 138412290;
        v6 = v4;
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "System application did enter foreground (was suspended: %@)", (uint8_t *)&v5, 0xCu);
      }

    }
    if (self->_hasBeenSuspended)
    {
      self->_hasBeenSuspended = 0;
      -[_IMLegacyDaemonController _disconnectFromDaemonWithForce:](self, "_disconnectFromDaemonWithForce:", 1);
      -[_IMLegacyDaemonController blockUntilConnected](self, "blockUntilConnected");
      im_dispatch_after();
    }
  }
}

- (void)systemApplicationDidResume
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[_IMLegacyDaemonController _blocksConnectionAtResume](self, "_blocksConnectionAtResume"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        if (self->_hasBeenSuspended)
          v4 = CFSTR("YES");
        else
          v4 = CFSTR("NO");
        v5 = 138412290;
        v6 = v4;
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "System application did resume (was suspended: %@)", (uint8_t *)&v5, 0xCu);
      }

    }
    if (self->_hasBeenSuspended)
    {
      self->_hasBeenSuspended = 0;
      -[_IMLegacyDaemonController _disconnectFromDaemonWithForce:](self, "_disconnectFromDaemonWithForce:", 1);
      -[_IMLegacyDaemonController blockUntilConnected](self, "blockUntilConnected");
      im_dispatch_after();
    }
  }
}

- (IMDaemonListener)listener
{
  return self->_daemonListener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_daemonListener, a3);
}

- (NSString)listenerID
{
  return self->_listenerID;
}

- (void)_setListenerID:(id)a3
{
  objc_storeStrong((id *)&self->_listenerID, a3);
}

- (BOOL)isRequestingConnection
{
  return self->_requestingConnection;
}

- (IMDaemonProtocol)replyingRemoteDaemon
{
  return self->_replyingRemoteDaemon;
}

- (IMDaemonProtocol)synchronousReplyingRemoteDaemon
{
  return self->_synchronousReplyingRemoteDaemon;
}

- (IMDaemonQueryController)queryController
{
  return self->_queryController;
}

- (NSArray)_servicesToAllow
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)_setServicesToAllow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)_servicesToDeny
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)_setServicesToDeny:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)_blocksConnectionAtResume
{
  return self->__blocksConnectionAtResume;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (IMDaemonProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (NSMutableDictionary)listenerMap
{
  return self->_listenerMap;
}

- (void)setListenerMap:(id)a3
{
  objc_storeStrong((id *)&self->_listenerMap, a3);
}

- (IMLocalObject)localObject
{
  return self->_localObject;
}

- (void)setLocalObject:(id)a3
{
  objc_storeStrong((id *)&self->_localObject, a3);
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (NSProtocolChecker)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_protocol, a3);
}

- (OS_dispatch_queue)listenerLockQueue
{
  return self->_listenerLockQueue;
}

- (void)setListenerLockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_listenerLockQueue, a3);
}

- (os_unfair_recursive_lock_s)remoteDaemonLock
{
  return self->_remoteDaemonLock;
}

- (void)setRemoteDaemonLock:(os_unfair_recursive_lock_s)a3
{
  self->_remoteDaemonLock = a3;
}

- (OS_dispatch_queue)localObjectLockQueue
{
  return self->_localObjectLockQueue;
}

- (void)setLocalObjectLockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_localObjectLockQueue, a3);
}

- (OS_dispatch_queue)daemonConnectionQueue
{
  return self->_daemonConnectionQueue;
}

- (void)setDaemonConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnectionQueue, a3);
}

- (NSRecursiveLock)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(id)a3
{
  objc_storeStrong((id *)&self->_connectionLock, a3);
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  self->_runLoopSource = a3;
}

- (NSLock)blockingLock
{
  return self->_blockingLock;
}

- (void)setBlockingLock:(id)a3
{
  objc_storeStrong((id *)&self->_blockingLock, a3);
}

- (BOOL)hasCheckedForDaemon
{
  return self->_hasCheckedForDaemon;
}

- (void)setHasCheckedForDaemon:(BOOL)a3
{
  self->_hasCheckedForDaemon = a3;
}

- (BOOL)preventReconnect
{
  return self->_preventReconnect;
}

- (void)setPreventReconnect:(BOOL)a3
{
  self->_preventReconnect = a3;
}

- (BOOL)inBlockingConnect
{
  return self->_inBlockingConnect;
}

- (void)setInBlockingConnect:(BOOL)a3
{
  self->_inBlockingConnect = a3;
}

- (BOOL)acquiringDaemonConnection
{
  return self->_acquiringDaemonConnection;
}

- (void)setAcquiringDaemonConnection:(BOOL)a3
{
  self->_acquiringDaemonConnection = a3;
}

- (BOOL)hasBeenSuspended
{
  return self->_hasBeenSuspended;
}

- (void)setHasBeenSuspended:(BOOL)a3
{
  self->_hasBeenSuspended = a3;
}

- (unsigned)gMyFZListenerCapabilities
{
  return self->_gMyFZListenerCapabilities;
}

- (void)setGMyFZListenerCapabilities:(unsigned int)a3
{
  self->_gMyFZListenerCapabilities = a3;
}

- (unsigned)cachedCapabilities
{
  return self->_cachedCapabilities;
}

- (void)setCachedCapabilities:(unsigned int)a3
{
  self->_cachedCapabilities = a3;
}

- (unsigned)lastUpdatedCapabilities
{
  return self->_lastUpdatedCapabilities;
}

- (void)setLastUpdatedCapabilities:(unsigned int)a3
{
  self->_lastUpdatedCapabilities = a3;
}

- (unsigned)_capabilities
{
  return self->__capabilities;
}

- (void)__setCapabilities:(unsigned int)a3
{
  self->__capabilities = a3;
}

- (BOOL)_autoReconnect
{
  return self->__autoReconnect;
}

- (void)_setAutoReconnect:(BOOL)a3
{
  self->__autoReconnect = a3;
}

- (OS_dispatch_queue)remoteMessageQueue
{
  return self->_remoteMessageQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageQueue, 0);
  objc_storeStrong((id *)&self->_blockingLock, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_daemonConnectionQueue, 0);
  objc_storeStrong((id *)&self->_localObjectLockQueue, 0);
  objc_storeStrong((id *)&self->_listenerLockQueue, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_localObject, 0);
  objc_storeStrong((id *)&self->_listenerMap, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->__servicesToDeny, 0);
  objc_storeStrong((id *)&self->__servicesToAllow, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_synchronousReplyingRemoteDaemon, 0);
  objc_storeStrong((id *)&self->_replyingRemoteDaemon, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_daemonListener, 0);
}

@end
