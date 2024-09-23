@implementation IMDaemonController

+ (id)sharedInstance
{
  void *v2;
  void *v3;

  +[IMDaemonController sharedController](IMDaemonController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDaemonProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (IMDistributingProxy)remoteDaemonProxy
{
  return self->_remoteDaemonProxy;
}

+ (IMDaemonController)sharedController
{
  if (qword_1ECF12440 != -1)
    dispatch_once(&qword_1ECF12440, &unk_1E471D4D8);
  return (IMDaemonController *)(id)qword_1ECF12430;
}

- (unint64_t)processCapabilities
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[IMDaemonController multiplexedConnections](self, "multiplexedConnections", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v8 |= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "capabilities");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (NSMapTable)multiplexedConnections
{
  return self->_multiplexedConnections;
}

- (NSMutableDictionary)retainedMultiplexedConnections
{
  return self->_retainedMultiplexedConnections;
}

- (IMDaemonProtocol)replyingRemoteDaemon
{
  void *v2;
  void *v3;

  -[IMDaemonController connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMDaemonProtocol *)v3;
}

- (IMDaemonProtocol)remoteDaemon
{
  void *v2;
  void *v3;

  -[IMDaemonController connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMDaemonProtocol *)v3;
}

- (IMDaemonQueryController)queryController
{
  return self->_queryController;
}

- (NSDictionary)processContext
{
  os_unfair_lock_s *p_lock;
  NSDictionary *processContext;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *v18;
  NSDictionary *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  processContext = self->_processContext;
  if (!processContext)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[IMDaemonController multiplexedConnections](self, "multiplexedConnections", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
          -[IMDaemonController multiplexedConnections](self, "multiplexedConnections");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v14, "context");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v14, "context");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v12);

            }
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v17 = (NSDictionary *)objc_msgSend(v5, "copy");
    v18 = self->_processContext;
    self->_processContext = v17;

    processContext = self->_processContext;
  }
  v19 = processContext;
  os_unfair_lock_unlock(p_lock);
  return v19;
}

- (id)multiplexedConnectionWithLabel:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (void *)MEMORY[0x1E0CB3A28];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDaemonController _multiplexedConnectionWithUniqueID:label:capabilities:context:retain:](self, "_multiplexedConnectionWithUniqueID:label:capabilities:context:retain:", v14, v11, a4, v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (IMDaemonListener)listener
{
  return self->_listener;
}

- (BOOL)isConnected
{
  void *v3;
  void *v4;
  char v5;

  -[IMDaemonController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isConnected"))
  {
    -[IMDaemonController listener](self, "listener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSetupComplete");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (IMDaemonController)init
{
  IMDaemonController *v2;
  _IMLegacyDaemonListener *v3;
  IMDaemonListener *listener;
  IMDaemonConnection *v5;
  IMDaemonConnectionManaging *connection;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *listenerID;
  uint64_t v11;
  NSMapTable *multiplexedConnections;
  NSMutableDictionary *v13;
  NSMutableDictionary *retainedMultiplexedConnections;
  IMDaemonQueryController *v15;
  IMDaemonQueryController *queryController;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  IMDistributingProxy *remoteDaemonProxy;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)IMDaemonController;
  v2 = -[IMDaemonController init](&v32, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_IMLegacyDaemonListener);
    listener = v2->_listener;
    v2->_listener = (IMDaemonListener *)v3;

    v5 = -[IMDaemonConnection initWithListener:]([IMDaemonConnection alloc], "initWithListener:", v2->_listener);
    connection = v2->_connection;
    v2->_connection = (IMDaemonConnectionManaging *)v5;

    IMGetMainBundleIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    listenerID = v2->_listenerID;
    v2->_listenerID = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, 1);
    multiplexedConnections = v2->_multiplexedConnections;
    v2->_multiplexedConnections = (NSMapTable *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    retainedMultiplexedConnections = v2->_retainedMultiplexedConnections;
    v2->_retainedMultiplexedConnections = v13;

    v15 = -[IMDaemonQueryController initWithDaemonController:]([IMDaemonQueryController alloc], "initWithDaemonController:", v2);
    queryController = v2->_queryController;
    v2->_queryController = v15;

    v2->_lock._os_unfair_lock_opaque = 0;
    location = 0;
    objc_initWeak(&location, v2);
    v17 = objc_alloc(MEMORY[0x1E0D398B0]);
    v18 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1A200D1E4;
    v29[3] = &unk_1E471EA48;
    objc_copyWeak(&v30, &location);
    v19 = (void *)objc_msgSend(v17, "initWithProtocol:forwardingHandler:", &unk_1EE6B41A8, v29);
    v20 = objc_alloc(MEMORY[0x1E0D39818]);
    v21 = objc_loadWeakRetained(&location);
    v33[0] = v21;
    v33[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "initWithTargets:", v22);
    remoteDaemonProxy = v2->_remoteDaemonProxy;
    v2->_remoteDaemonProxy = (IMDistributingProxy *)v23;

    v27[0] = v18;
    v27[1] = 3221225472;
    v27[2] = sub_1A200D188;
    v27[3] = &unk_1E471EA70;
    objc_copyWeak(&v28, &location);
    -[IMDaemonConnectionManaging setOnSetupComplete:](v2->_connection, "setOnSetupComplete:", v27);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1A2043FE8, (CFStringRef)*MEMORY[0x1E0D36C50], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (IMDaemonConnectionManaging)connection
{
  return self->_connection;
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Connecting with anonymous multiplexed connection with launch %@", (uint8_t *)&v8, 0xCu);
    }

  }
  -[IMDaemonController _connectWithContextChange:](self, "_connectWithContextChange:", 0);
  return 1;
}

- (unsigned)capabilities
{
  return -[IMDaemonController processCapabilities](self, "processCapabilities");
}

- (unsigned)capabilitiesForListenerID:(id)a3
{
  if (a3)
    return -[IMDaemonController _capabilitiesForMultiplexedConnectionWithUniqueID:](self, "_capabilitiesForMultiplexedConnectionWithUniqueID:");
  else
    return -[IMDaemonController processCapabilities](self, "processCapabilities");
}

- (void)blockUntilConnected
{
  id v3;

  -[IMDaemonController _connectWithContextChange:](self, "_connectWithContextChange:", 0);
  -[IMDaemonController connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitForSetup");

}

- (NSArray)_servicesToDeny
{
  return self->__servicesToDeny;
}

- (NSArray)_servicesToAllow
{
  return self->__servicesToAllow;
}

- (id)_multiplexedConnectionWithUniqueID:(id)a3 label:(id)a4 capabilities:(unint64_t)a5 context:(id)a6 retain:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  IMMultiplexedDaemonConnection *v17;
  void *v18;
  void *v19;
  void *v20;
  IMMultiplexedDaemonConnection *v21;
  NSDictionary *processContext;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id location;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v7 = a7;
  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v29 = a4;
  v12 = a6;
  os_unfair_lock_lock(&self->_lock);
  location = 0;
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A20447E0;
  aBlock[3] = &unk_1E471EA98;
  objc_copyWeak(&v34, &location);
  v14 = v11;
  v33 = v14;
  v15 = _Block_copy(aBlock);
  v30[0] = v13;
  v30[1] = 3221225472;
  v30[2] = sub_1A204481C;
  v30[3] = &unk_1E471E460;
  objc_copyWeak(&v31, &location);
  v16 = _Block_copy(v30);
  v17 = -[IMMultiplexedDaemonConnection initWithLabel:capabilities:context:onInvalidate:onDealloc:]([IMMultiplexedDaemonConnection alloc], "initWithLabel:capabilities:context:onInvalidate:onDealloc:", v29, a5, v12, v15, v16);
  -[IMDaemonController multiplexedConnections](self, "multiplexedConnections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v17, v14);

  -[IMDaemonController retainedMultiplexedConnections](self, "retainedMultiplexedConnections");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v7)
    v21 = v17;
  else
    v21 = 0;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, v14);

  if (v12)
  {
    processContext = self->_processContext;
    self->_processContext = 0;

  }
  os_unfair_lock_unlock(&self->_lock);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      IMStringFromClientCapabilities();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      v26 = MEMORY[0x1E0C9AAA0];
      if (v12)
        v26 = MEMORY[0x1E0C9AAB0];
      *(_DWORD *)buf = 138412802;
      v37 = v29;
      v38 = 2112;
      v39 = v24;
      v40 = 2112;
      v41 = v26;
      _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "Multiplexing connection with label: %@ capabilities: %@ hasContext: %@", buf, 0x20u);

    }
  }
  -[IMDaemonController _capabilitiesDidChangeWithContextChange:](self, "_capabilitiesDidChangeWithContextChange:", v12 != 0);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  return v17;
}

- (void)_connectWithContextChange:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = -[IMDaemonController processCapabilities](self, "processCapabilities");
  -[IMDaemonController processContext](self, "processContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDaemonController connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectWithCapabilities:context:contextChanged:", v5, v7, v3);

}

- (void)_capabilitiesDidChangeWithContextChange:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDaemonController processCapabilities](self, "processCapabilities");
  v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        IMStringFromClientCapabilities();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Process capabilities changed to %@, requesting new setup message", (uint8_t *)&v11, 0xCu);

      }
    }
    -[IMDaemonController _connectWithContextChange:](self, "_connectWithContextChange:", v3);
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Process capabilities changed to nil, disconnecting", (uint8_t *)&v11, 2u);
      }

    }
    -[IMDaemonController connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "disconnect");

  }
}

- (IMDaemonProtocol)synchronousRemoteDaemon
{
  void *v2;
  void *v3;

  -[IMDaemonController connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMDaemonProtocol *)v3;
}

- (void)_connectWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Requesting asynchronous connection and setup for client", buf, 2u);
    }

  }
  -[IMDaemonController connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A20441C4;
  v8[3] = &unk_1E471E528;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "requestSetupIfNeededWithCompletionHandler:", v8);

}

- (BOOL)connectToDaemon
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
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Connecting with anonymous multiplexed connection", v5, 2u);
    }

  }
  -[IMDaemonController _connectWithContextChange:](self, "_connectWithContextChange:", 0);
  return 1;
}

- (BOOL)connectToDaemonWithLaunch:(BOOL)a3 capabilities:(unsigned int)a4 blockUntilConnected:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      IMStringFromClientCapabilities();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("NO");
      if (v5)
        v11 = CFSTR("YES");
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Connecting with anonymous multiplexed connection using capabilities: %@ blockUntilConnected: %@", (uint8_t *)&v14, 0x16u);

    }
  }
  -[IMDaemonController _updateAnonymousMultiplexedConnectionWithAddedCapabilities:](self, "_updateAnonymousMultiplexedConnectionWithAddedCapabilities:", a4);
  -[IMDaemonController _connectWithContextChange:](self, "_connectWithContextChange:", 0);
  if (v5)
  {
    -[IMDaemonController connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "waitForSetup");

  }
  return 1;
}

- (void)disconnectFromDaemon
{
  id v2;

  -[IMDaemonController connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnect");

}

- (void)killDaemon
{
  NSObject *v2;
  uint8_t v3[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "Request to terminate daemon ignored, this function is no longer supported", v3, 2u);
    }

  }
}

- (void)_reconnectIfNeeded
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Request to reconnect if needed", (uint8_t *)&v13, 2u);
    }

  }
  os_unfair_lock_lock(&self->_lock);
  -[IMDaemonController anonymousMultiplexedConnection](self, "anonymousMultiplexedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 2;
  else
    v5 = 1;

  -[IMDaemonController multiplexedConnections](self, "multiplexedConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") < v5;

  os_unfair_lock_unlock(&self->_lock);
  v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Not reconnecting, no non-anonymous multiplexed connections", (uint8_t *)&v13, 2u);
      }

    }
  }
  else
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[IMDaemonController multiplexedConnections](self, "multiplexedConnections");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");
        v13 = 134217984;
        v14 = v12;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Reconnecting, controller has %llu multiplexed connections", (uint8_t *)&v13, 0xCu);

      }
    }
    -[IMDaemonController _connectWithContextChange:](self, "_connectWithContextChange:", 0);
  }
}

- (void)_handleDaemonLaunched:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Daemon launch detected while process was running", v6, 2u);
    }

  }
  -[IMDaemonController _reconnectIfNeeded](self, "_reconnectIfNeeded");

}

- (void)_invalidateMultiplexedConnectionWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[IMDaemonController multiplexedConnections](self, "multiplexedConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[IMDaemonController retainedMultiplexedConnections](self, "retainedMultiplexedConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v4);

  os_unfair_lock_unlock(&self->_lock);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Removed multiplexed connection with uniqueID: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  -[IMDaemonController _capabilitiesDidChange](self, "_capabilitiesDidChange");

}

- (BOOL)_hasMultiplexedConnectionWithUniqueID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[IMDaemonController multiplexedConnections](self, "multiplexedConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7 != 0;
}

- (unint64_t)_capabilitiesForMultiplexedConnectionWithUniqueID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[IMDaemonController multiplexedConnections](self, "multiplexedConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "capabilities");
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)_updateAnonymousMultiplexedConnectionWithAddedCapabilities:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    -[IMDaemonController anonymousMultiplexedConnection](self, "anonymousMultiplexedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[IMDaemonController anonymousMultiplexedConnection](self, "anonymousMultiplexedConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "capabilities");

      v3 |= v7;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          IMStringFromClientCapabilities();
          v9 = (id)objc_claimAutoreleasedReturnValue();
          IMStringFromClientCapabilities();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412546;
          v13 = v9;
          v14 = 2112;
          v15 = v10;
          _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Had existing anonymous capabilities %@, updating to %@", (uint8_t *)&v12, 0x16u);

        }
      }
    }
    -[IMDaemonController _multiplexedConnectionWithUniqueID:label:capabilities:context:retain:](self, "_multiplexedConnectionWithUniqueID:label:capabilities:context:retain:", CFSTR("__IMDaemonControllerAnonymousConnectionIdentifier"), CFSTR("__IMDaemonControllerAnonymousConnectionIdentifier"), v3, 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDaemonController setAnonymousMultiplexedConnection:](self, "setAnonymousMultiplexedConnection:", v11);

  }
}

- (void)_capabilitiesDidChange
{
  -[IMDaemonController _capabilitiesDidChangeWithContextChange:](self, "_capabilitiesDidChangeWithContextChange:", 0);
}

- (BOOL)addListenerID:(id)a3 capabilities:(unsigned int)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[IMDaemonController _multiplexedConnectionWithUniqueID:label:capabilities:context:retain:](self, "_multiplexedConnectionWithUniqueID:label:capabilities:context:retain:", v6, v6, -[IMDaemonController _clientCapabilitiesForLegacyClientWithListenerID:requestedCapabilities:](self, "_clientCapabilitiesForLegacyClientWithListenerID:requestedCapabilities:", v6, a4), 0, 1);
  if (-[IMDaemonController _clientRequiresSynchronousConnectionRescueWithListenerID:](self, "_clientRequiresSynchronousConnectionRescueWithListenerID:", v6))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Forcing block until connected for client %@ to rescue poor asynchronous behavior", (uint8_t *)&v10, 0xCu);
      }

    }
    -[IMDaemonController blockUntilConnected](self, "blockUntilConnected");
  }

  return 1;
}

- (BOOL)hasListenerForID:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel__hasMultiplexedConnectionWithUniqueID_);
}

- (BOOL)removeListenerID:(id)a3
{
  -[IMDaemonController _invalidateMultiplexedConnectionWithUniqueID:](self, "_invalidateMultiplexedConnectionWithUniqueID:", a3);
  return 1;
}

- (BOOL)setCapabilities:(unsigned int)a3 forListenerID:(id)a4
{
  id v4;

  v4 = -[IMDaemonController _multiplexedConnectionWithUniqueID:label:capabilities:context:retain:](self, "_multiplexedConnectionWithUniqueID:label:capabilities:context:retain:", a4, a4, a3, 0, 1);
  return 1;
}

- (BOOL)_clientRequiresSynchronousConnectionRescueWithListenerID:(id)a3
{
  return 0;
}

- (unint64_t)_clientCapabilitiesForLegacyClientWithListenerID:(id)a3 requestedCapabilities:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a4 & 0x200004) == 4)
  {
    v6 = a4 | 0x400000;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Assuming client %@ wants Precached Recent Chats (has no on-demand chat registry capability)", (uint8_t *)&v15, 0xCu);
      }

    }
  }
  else
  {
    v6 = a4;
    v8 = a4;
    if ((a4 & 4) == 0)
      goto LABEL_11;
  }
  v8 = v6 | 0x43200;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Assuming client %@ wants Send Messages, Message History Modify Read State, and Accounts (has chat capability)", (uint8_t *)&v15, 0xCu);
    }

  }
LABEL_11:
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("CKSettingsMessagesController")))
  {
    v8 |= 0x20000000uLL;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Granting synced settings capability to CKSettingsMessagesController listener.", (uint8_t *)&v15, 2u);
      }

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      IMStringFromClientCapabilities();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      IMStringFromClientCapabilities();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v5;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Client %@ requested %@ with legacy API, upgrading capabilities to %@", (uint8_t *)&v15, 0x20u);

    }
  }

  return v8;
}

- (BOOL)isConnecting
{
  void *v3;
  void *v4;
  int v5;

  -[IMDaemonController connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isConnected"))
  {
    -[IMDaemonController listener](self, "listener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSetupComplete") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)requestSetup
{
  id v2;

  -[IMDaemonController connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestSetup");

}

- (void)_setServicesToAllow:(id)a3
{
  objc_storeStrong((id *)&self->__servicesToAllow, a3);
}

- (void)_setServicesToDeny:(id)a3
{
  objc_storeStrong((id *)&self->__servicesToDeny, a3);
}

- (IMDaemonProtocol)synchronousReplyingRemoteDaemon
{
  void *v2;
  void *v3;

  -[IMDaemonController connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMDaemonProtocol *)v3;
}

- (void)_setListenerID:(id)a3
{
  objc_storeStrong((id *)&self->_listenerID, a3);
}

- (void)sendQueryWithReply:(BOOL)a3 query:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (NSString)listenerID
{
  return self->_listenerID;
}

- (BOOL)_blocksConnectionAtResume
{
  return self->__blocksConnectionAtResume;
}

- (void)_setBlocksConnectionAtResume:(BOOL)a3
{
  self->__blocksConnectionAtResume = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (IMMultiplexedDaemonConnection)anonymousMultiplexedConnection
{
  return self->_anonymousMultiplexedConnection;
}

- (void)setAnonymousMultiplexedConnection:(id)a3
{
  objc_storeStrong((id *)&self->_anonymousMultiplexedConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousMultiplexedConnection, 0);
  objc_storeStrong((id *)&self->_retainedMultiplexedConnections, 0);
  objc_storeStrong((id *)&self->_multiplexedConnections, 0);
  objc_storeStrong((id *)&self->_remoteDaemonProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_processContext, 0);
  objc_storeStrong((id *)&self->__servicesToDeny, 0);
  objc_storeStrong((id *)&self->__servicesToAllow, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
