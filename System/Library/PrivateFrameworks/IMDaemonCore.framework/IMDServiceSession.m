@implementation IMDServiceSession

- (id)groups
{
  return 0;
}

- (NSDictionary)buddyProperties
{
  void *v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary copy](self->_buddies, "copy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

+ (id)__allServiceSessionsWeakReferenceArray
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  if (qword_1ED935F48 != -1)
    dispatch_once(&qword_1ED935F48, &unk_1E9228AF8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED935F50;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D144858C;
  v7[3] = &unk_1E9228B20;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  if (objc_msgSend(v4, "count"))
    objc_msgSend((id)qword_1ED935F50, "removeObjectsInArray:", v4);
  v5 = (id)qword_1ED935F50;

  return v5;
}

+ (void)__registerNewServiceSession:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "__allServiceSessionsWeakReferenceArray");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v5);
}

+ (id)allServiceSessions
{
  return (id)objc_msgSend((id)qword_1ED935F50, "__imArrayByApplyingBlock:", &unk_1E9228B60);
}

+ (id)existingServiceSessionForService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1D1448768;
  v16 = sub_1D1448778;
  v17 = 0;
  objc_msgSend(a1, "allServiceSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D1448780;
  v9[3] = &unk_1E9228B88;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (IMDServiceSession)initWithAccount:(id)a3 service:(id)a4
{
  return -[IMDServiceSession initWithAccount:service:replicatingForSession:](self, "initWithAccount:service:replicatingForSession:", a3, a4, 0);
}

- (IMDServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v9;
  id v10;
  IMDServiceSession *v11;
  IMDServiceSession *v12;
  IMDServiceSession *v13;
  NSString *pwRequestID;
  NSRecursiveLock *v15;
  NSRecursiveLock *lock;
  NSTimer *reconnectTimer;
  uint64_t v18;
  IMDAccount *account;
  id *p_account;
  NSMutableArray *v21;
  NSMutableArray *accounts;
  uint64_t v23;
  IMDService *service;
  uint64_t v25;
  NSMutableDictionary *buddies;
  NSMutableArray *v27;
  NSMutableArray *v28;
  uint64_t v29;
  NSMutableDictionary *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  IMDServiceAttachmentController *v37;
  IMDServiceAttachmentController *baseAttachmentController;
  NSMutableArray *v39;
  NSMutableArray *serviceSessionDelegates;
  uint64_t v41;
  NSObject *v42;
  id v43;
  id v44;
  void *v45;
  objc_super v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (IMDServiceSession *)a5;
  v47.receiver = self;
  v47.super_class = (Class)IMDServiceSession;
  v12 = -[IMDServiceSession init](&v47, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D36B20], "enableNotifications");
    if (v11)
      v13 = v11;
    else
      v13 = v12;
    objc_storeWeak((id *)&v12->_mainSession, v13);
    pwRequestID = v12->_pwRequestID;
    v12->_pwRequestID = 0;

    v12->_buddyChangeLevel = 0;
    v12->_saveKeychainPassword = 0;
    v12->_badPass = 0;
    v15 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v12->_lock;
    v12->_lock = v15;

    -[NSRecursiveLock lock](v12->_lock, "lock");
    reconnectTimer = v12->_reconnectTimer;
    v12->_reconnectTimer = 0;

    if (v11)
    {
      -[IMDServiceSession account](v11, "account");
      v18 = objc_claimAutoreleasedReturnValue();
      p_account = (id *)&v12->_account;
      account = v12->_account;
      v12->_account = (IMDAccount *)v18;

      v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      accounts = v12->_accounts;
      v12->_accounts = v21;

      -[NSMutableArray addObject:](v12->_accounts, "addObject:", v9);
      -[IMDServiceSession service](v11, "service");
      v23 = objc_claimAutoreleasedReturnValue();
      service = v12->_service;
      v12->_service = (IMDService *)v23;

      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 14);
      buddies = v12->_buddies;
      v12->_buddies = (NSMutableDictionary *)v25;

      objc_storeWeak((id *)&v12->_replicationAccount, v9);
      objc_storeWeak((id *)&v12->_replicationService, v10);
    }
    else
    {
      p_account = (id *)&v12->_account;
      objc_storeStrong((id *)&v12->_account, a3);
      v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v28 = v12->_accounts;
      v12->_accounts = v27;

      -[NSMutableArray addObject:](v12->_accounts, "addObject:", v9);
      objc_storeStrong((id *)&v12->_service, a4);
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 14);
      v30 = v12->_buddies;
      v12->_buddies = (NSMutableDictionary *)v29;

    }
    -[IMDServiceSession service](v12, "service");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_shouldReconnect = objc_msgSend(v31, "wantsNullHostReachability");

    if (v12->_shouldReconnect)
      -[IMDServiceSession _setAutoReconnectTimer](v12, "_setAutoReconnectTimer");
    -[NSRecursiveLock unlock](v12->_lock, "unlock");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v12, sel__managedPrefsNotification_, CFSTR("__kIMDManagedPreferencesChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v12, sel__networkChanged_, *MEMORY[0x1E0D366D0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v12, sel__callMonitorStateChanged_, *MEMORY[0x1E0D36338], 0);

    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWatchesSystemLockState:", 1);

    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addListener:", v12);

    if (((v11 == 0) & objc_msgSend(v10, "supportsOneSessionForAllAccounts")) == 1)
      objc_msgSend((id)objc_opt_class(), "__registerNewServiceSession:", v12);
    v37 = -[IMDServiceAttachmentController initWithSession:]([IMDServiceAttachmentController alloc], "initWithSession:", v12);
    baseAttachmentController = v12->_baseAttachmentController;
    v12->_baseAttachmentController = v37;

    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    serviceSessionDelegates = v12->_serviceSessionDelegates;
    v12->_serviceSessionDelegates = v39;

    if (IMOSLoggingEnabled(v41))
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*p_account, "accountID");
        v43 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "internalName");
        v44 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accountDefaults");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v49 = v43;
        v50 = 2112;
        v51 = v44;
        v52 = 2112;
        v53 = v45;
        _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "initWithAccount: %@       service:%@  defaults: %@", buf, 0x20u);

      }
    }
  }

  return v12;
}

- (void)addDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDServiceSession serviceSessionDelegates](self, "serviceSessionDelegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDServiceSession serviceSessionDelegates](self, "serviceSessionDelegates");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  IMDServiceSession *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "DEALLOC: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeListener:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, 0, 0);

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeListener:", self);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__processNetworkMonitorUpdate, 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_login, 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[IMDServiceSession _abandonSystemProxySettingsFetcher](self, "_abandonSystemProxySettingsFetcher");
  -[IMDServiceSession _abandonPWFetcher](self, "_abandonPWFetcher");
  -[IMDServiceSession _clearAutoReconnectTimer](self, "_clearAutoReconnectTimer");
  -[IMDServiceSession _clearNetworkMonitor](self, "_clearNetworkMonitor");
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[IMTimer invalidate](self->_messageRoutingTimer, "invalidate");
  -[IMTimer invalidate](self->_messageExpireStateTimer, "invalidate");
  -[IMTimer invalidate](self->_messageWatchdogTimer, "invalidate");
  -[IMDAutoReplying setReplyDelegate:](self->_messageAutoReplier, "setReplyDelegate:", 0);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v7.receiver = self;
  v7.super_class = (Class)IMDServiceSession;
  -[IMDServiceSession dealloc](&v7, sel_dealloc);
}

- (BOOL)accountNeedsLogin
{
  void *v2;
  char v3;

  -[IMDServiceSession service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsLogin");

  return v3;
}

- (BOOL)accountNeedsPassword
{
  void *v2;
  char v3;

  -[IMDServiceSession service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsPassword");

  return v3;
}

- (BOOL)accountShouldBeAlwaysLoggedIn
{
  void *v2;
  char v3;

  -[IMDServiceSession service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldBeAlwaysLoggedIn");

  return v3;
}

- (void)addAccount:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  IMDServiceSession *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "[%@ addAccount:%@]", (uint8_t *)&v6, 0x16u);
    }

  }
  -[NSMutableArray addObject:](self->_accounts, "addObject:", v4);

}

- (void)removeAccount:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  IMDServiceSession *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "[%@ removeAccount:%@]", (uint8_t *)&v6, 0x16u);
    }

  }
  -[NSMutableArray removeObject:](self->_accounts, "removeObject:", v4);

}

- (BOOL)isActive
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_accounts;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isActive", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)accountID
{
  return -[IMDAccount accountID](self->_account, "accountID");
}

- (NSString)displayName
{
  void *v2;
  void *v3;
  void *v4;

  -[IMDServiceSession service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D36258]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSDictionary)accountDefaults
{
  return -[IMDAccount accountDefaults](self->_account, "accountDefaults");
}

- (void)markItemForOnGridRelay:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "setNeedsRelay:", 1);
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v3, 0, 1, 1, 0x40000000000);

  objc_msgSend(v3, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D38F70]);
  v8 = v7;
  v9 = IMOSLoggingEnabled(v7);
  if (v8)
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Marking iMessage Lite message as needing relay, guid: %@", (uint8_t *)&v14, 0xCu);

      }
    }
  }
  else if (v9)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Marking SMS Satellite message as needing relay, guid: %@", (uint8_t *)&v14, 0xCu);

    }
  }
  IMSetDomainBoolForKey();

}

- (BOOL)isReplicating
{
  IMDServiceSession *v2;
  IMDServiceSession *v3;

  v2 = self;
  -[IMDServiceSession mainSession](self, "mainSession");
  v3 = (IMDServiceSession *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 != v2;

  return (char)v2;
}

- (NSArray)replicationSessions
{
  void *v3;
  void *v4;

  if (-[IMDServiceSession isReplicating](self, "isReplicating"))
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[IMDServiceSession account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replicationSessions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v3;
}

- (IMDServiceSession)replicationProxy
{
  IMDServiceSession *replicationProxy;
  void *v4;
  IMDServiceSession *v5;
  IMDServiceSession *v6;
  IMDServiceSession *v7;

  if (-[IMDServiceSession isOutgoingReplicationEnabled](self, "isOutgoingReplicationEnabled"))
  {
    replicationProxy = self->_replicationProxy;
    if (!replicationProxy)
    {
      -[IMDServiceSession replicationSessions](self, "replicationSessions");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "count"))
      {
        v5 = (IMDServiceSession *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39818]), "initWithTargets:", v4);
        v6 = self->_replicationProxy;
        self->_replicationProxy = v5;

      }
      replicationProxy = self->_replicationProxy;
    }
    v7 = replicationProxy;
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_replicationSessionsChanged
{
  IMDServiceSession *replicationProxy;

  replicationProxy = self->_replicationProxy;
  self->_replicationProxy = 0;

}

- (BOOL)messageServiceNamed:(id)a3 canProcessMessagesFromServiceNamed:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", v5) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceWithName:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "relayMessageDelegates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "containsObject:", v5);

  }
  return v7;
}

- (BOOL)acceptsIncomingReplicatedMessagesFromAccount:(id)a3 toIdentifier:(id)a4 isSOS:(BOOL)a5
{
  id v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Rejecting incoming replicated messages from account: %@, service session not configured for replicated messages", (uint8_t *)&v10, 0xCu);
    }

  }
  return 0;
}

- (id)outgoingReplicationCallerIDForChat:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Returning nil outgoing replication caller ID for chat %@, service session not configured for replicated messages", (uint8_t *)&v6, 0xCu);
    }

  }
  return 0;
}

- (BOOL)isOutgoingReplicationEnabled
{
  return 0;
}

- (id)preferredAccountForReplicationOnService:(id)a3 eligibleAccounts:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Returning nil preferred account for replication for %@, service session not configured for replicated messages", (uint8_t *)&v9, 0xCu);
    }

  }
  return 0;
}

- (id)sessionSpecificTransferIDForTransferID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (-[IMDServiceSession isReplicating](self, "isReplicating"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[IMDServiceSession service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internalName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession accountID](self, "accountID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Replication/%@/%@/%@"), v7, v8, v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (void)sessionDidBecomeActive
{
  NSObject *v3;
  void *v4;
  char v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  IMDServiceSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = self;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "[%@ sessionDidBecomeActive]", (uint8_t *)&v10, 0xCu);
    }

  }
  self->_activated = 1;
  -[IMDServiceSession _updateNetworkMonitorFromAccountDefaultsIgnoringProxy:](self, "_updateNetworkMonitorFromAccountDefaultsIgnoringProxy:", 0);
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUnderFirstDataProtectionLock");

  v7 = IMOSLoggingEnabled(v6);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Not scheduling routing, expire, watchdog timer before first unlock", (uint8_t *)&v10, 2u);
      }

    }
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Scheduling watchdog after first unlock", (uint8_t *)&v10, 2u);
      }

    }
    -[IMDServiceSession _updateWatchdogTimerWithInterval:](self, "_updateWatchdogTimerWithInterval:", 60.0);
  }
}

- (void)sessionWillBecomeInactiveWithAccount:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  IMDServiceSession *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "[%@ sessionWillBecomeInactiveWithAccount:%@]", (uint8_t *)&v6, 0x16u);
    }

  }
  if (!-[IMDServiceSession isActive](self, "isActive"))
  {
    self->_activated = 0;
    -[IMDServiceSession _clearAutoReconnectTimer](self, "_clearAutoReconnectTimer");
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__processNetworkMonitorUpdate, 0);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_login, 0);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  }

}

- (id)networkMonitor
{
  return self->_networkMonitor;
}

- (void)_clearNetworkMonitor
{
  NSObject *v3;
  IMNetworkMonitor *networkMonitor;
  IMNetworkMonitor **p_networkMonitor;
  IMNetworkMonitor *v6;
  IMNetworkMonitor *v7;
  int v8;
  IMNetworkMonitor *v9;
  __int16 v10;
  IMDServiceSession *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      networkMonitor = self->_networkMonitor;
      v8 = 138412546;
      v9 = networkMonitor;
      v10 = 2112;
      v11 = self;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_DEBUG, "-[IMDServiceSession _networkMonitor] monitor: %@:%@", (uint8_t *)&v8, 0x16u);
    }

  }
  v6 = self->_networkMonitor;
  p_networkMonitor = &self->_networkMonitor;
  -[IMNetworkMonitor clear](v6, "clear");
  v7 = *p_networkMonitor;
  *p_networkMonitor = 0;

}

- (void)_updateNetworkMonitorWithRemoteHost:(id)a3
{
  IMNetworkMonitor *v4;
  IMNetworkMonitor *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  IMNetworkMonitor *networkMonitor;
  NSObject *v13;
  IMNetworkMonitor *v14;
  void *v15;
  IMNetworkMonitor *v16;
  IMNetworkMonitor *v17;
  IMNetworkMonitor *v18;
  IMNetworkMonitor *v19;
  uint64_t v20;
  NSObject *v21;
  IMNetworkMonitor *v22;
  dispatch_time_t v23;
  _QWORD block[5];
  uint8_t buf[4];
  IMNetworkMonitor *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (IMNetworkMonitor *)a3;
  v5 = v4;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[IMDAccount accountID](self->_account, "accountID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v5;
        v27 = 2112;
        v28 = v7;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEBUG, "_updateNetworkMonitorWithRemoteHost: %@:%@", buf, 0x16u);

      }
    }
    -[IMDServiceSession service](self, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supportsCapability:", *MEMORY[0x1E0D38ED0]);

    -[IMDServiceSession service](self, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "wantsNullHostReachability");

    networkMonitor = self->_networkMonitor;
    if (v11)
    {
      if (networkMonitor)
      {
        if (IMOSLoggingEnabled(networkMonitor))
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v14 = self->_networkMonitor;
            *(_DWORD *)buf = 138412290;
            v26 = v14;
            _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEBUG, "Already have connection monitor to global reachability: %@", buf, 0xCu);
          }

        }
      }
      else
      {
        v18 = (IMNetworkMonitor *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39978]), "initWithRemoteHost:delegate:supportsConstrainedNetwork:", 0, self, v9);
        v19 = self->_networkMonitor;
        self->_networkMonitor = v18;

        if (IMOSLoggingEnabled(v20))
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v22 = self->_networkMonitor;
            *(_DWORD *)buf = 138412290;
            v26 = v22;
            _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_DEBUG, "Creating connection monitor to global reachability: %@", buf, 0xCu);
          }

        }
        v23 = dispatch_time(0, 10000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1D144A180;
        block[3] = &unk_1E92287A0;
        block[4] = self;
        dispatch_after(v23, MEMORY[0x1E0C80D38], block);
      }
    }
    else
    {
      -[IMNetworkMonitor remoteHost](networkMonitor, "remoteHost");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v5 != 0) != (v15 != 0) || (-[IMNetworkMonitor isEqual:](v5, "isEqual:", v15) & 1) == 0)
      {
        -[IMDServiceSession _clearNetworkMonitor](self, "_clearNetworkMonitor");
        v16 = (IMNetworkMonitor *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39978]), "initWithRemoteHost:delegate:supportsConstrainedNetwork:", v5, self, v9);
        v17 = self->_networkMonitor;
        self->_networkMonitor = v16;

      }
    }
  }

}

- (void)_updateNetworkMonitorFromAccountDefaultsIgnoringProxy:(BOOL)a3
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  unsigned __int16 v15;
  id v16;
  void *v17;
  IMSystemProxySettingsFetcher *v18;
  IMSystemProxySettingsFetcher *systemProxySettingsFetcher;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  if (self->_activated)
  {
    -[IMDServiceSession accountDefaults](self, "accountDefaults");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D36FD8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D36FC8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D36FD0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = (_QWORD *)MEMORY[0x1E0D36F98];
    if (v6)
    {
      v12 = (_QWORD *)MEMORY[0x1E0D36FA0];
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x1E0D36F88];
      v12 = (_QWORD *)MEMORY[0x1E0D36F90];
    }
    objc_msgSend(v24, "objectForKey:", *v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", *v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    if (!a3 && v8)
    {
      if (v10)
      {
        -[IMDServiceSession _abandonSystemProxySettingsFetcher](self, "_abandonSystemProxySettingsFetcher");
        v16 = objc_alloc(MEMORY[0x1E0D36AD8]);
        -[IMDServiceSession server](self, "server");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (IMSystemProxySettingsFetcher *)objc_msgSend(v16, "initWithHost:port:delegate:", v17, v15, self);
        systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
        self->_systemProxySettingsFetcher = v18;

        -[IMSystemProxySettingsFetcher retrieveProxySettings](self->_systemProxySettingsFetcher, "retrieveProxySettings");
        v20 = 0;
      }
      else
      {
        objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0D36F38]);
        v20 = objc_claimAutoreleasedReturnValue();
      }

      v13 = (void *)v20;
    }
    objc_msgSend(v13, "stringByRemovingWhitespace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (!v22)
    {
      -[IMDServiceSession server](self, "server");
      v23 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v23;
    }
    -[IMDServiceSession _updateNetworkMonitorWithRemoteHost:](self, "_updateNetworkMonitorWithRemoteHost:", v13);

  }
}

- (void)_reconnectIfNecessary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[IMDServiceSession accounts](self, "accounts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[IMDServiceSession _reconnectIfNecessaryWithAccount:](self, "_reconnectIfNecessaryWithAccount:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_reconnectIfNecessaryWithAccount:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  _BOOL4 v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  __CFString *v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_activated)
    goto LABEL_36;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[IMDServiceSession loginID](self, "loginID");
      v7 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[IMDAccount accountID](self->_account, "accountID");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = 138412546;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEBUG, "_reconnectIfNecessary: %@:%@", (uint8_t *)&v22, 0x16u);

    }
  }
  v9 = -[IMDServiceSession accountShouldBeAlwaysLoggedIn](self, "accountShouldBeAlwaysLoggedIn");
  v10 = objc_msgSend(v5, "loginStatus");
  if (v10 == 1)
  {
    v10 = objc_msgSend(v5, "serviceDisconnectReason");
    if ((v10 + 1) <= 8)
      v11 = (0xCAu >> (v10 + 1)) & 1;
    else
      v11 = 1;
    if (!v9)
      goto LABEL_11;
  }
  else
  {
    v11 = 0;
    if (!v9)
    {
LABEL_11:
      if (self->_shouldReconnect)
        v12 = 1;
      else
        v12 = v11;
      goto LABEL_16;
    }
  }
  v12 = 1;
LABEL_16:
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      if (v9)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      if (self->_shouldReconnect)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      if (v11)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v17 = objc_msgSend(v5, "loginStatus");
      v18 = objc_msgSend(v5, "serviceDisconnectReason");
      v22 = 138413314;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      v28 = 2048;
      v29 = v17;
      v30 = 1024;
      v31 = v18;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEBUG, "  shouldAlwaysBeLoggedIn: %@    shouldReconnect: %@   wasLikelyNetworkError: %@  loginStatus: %lu  disconnectReason: %d", (uint8_t *)&v22, 0x30u);
    }

  }
  if (v12)
  {
    v19 = objc_msgSend(v5, "loginStatus");
    if (v19 != 4)
    {
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[IMDServiceSession loginID](self, "loginID");
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v22 = 138412290;
          v23 = v21;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_DEBUG, "%@: we're disconnected properly - and we're supposed to try to reconnect now, ", (uint8_t *)&v22, 0xCu);

        }
      }
      -[IMDServiceSession _doLoginIgnoringProxy:withAccount:](self, "_doLoginIgnoringProxy:withAccount:", 0, v5);
    }
  }
LABEL_36:

}

- (void)_processNetworkMonitorUpdate
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  IMDServiceSession *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!self->_activated || !-[IMDServiceSession _processesNetworkEvents](self, "_processesNetworkEvents"))
    return;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__processNetworkMonitorUpdate, 0);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[IMDServiceSession accounts](self, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v5 |= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "loginStatus") > 2;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v4);

    if ((v5 & 1) == 0)
      goto LABEL_29;
    if ((-[IMNetworkMonitor immediatelyReachable](self->_networkMonitor, "immediatelyReachable") & 1) != 0)
      goto LABEL_29;
    v8 = -[IMDServiceSession overrideNetworkAvailability](self, "overrideNetworkAvailability");
    if (v8)
      goto LABEL_29;
    v9 = IMOSLoggingEnabled(v8);
    if ((_DWORD)v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = self;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "%@       forcing disconnect", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[IMDServiceSession server](self, "server");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = self;
        v38 = 2112;
        v39 = v12;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "%@: Network connection to %@ is down -- disconnecting", buf, 0x16u);

      }
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[IMDServiceSession accounts](self, "accounts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v3);
          -[IMDServiceSession logoutServiceSessionWithAccount:](self, "logoutServiceSessionWithAccount:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
        }
        v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v13);
    }
  }

LABEL_29:
  v16 = -[IMNetworkMonitor immediatelyReachable](self->_networkMonitor, "immediatelyReachable");
  if ((v16 & 1) != 0
    || (v16 = -[IMDServiceSession overrideNetworkAvailability](self, "overrideNetworkAvailability"), (_DWORD)v16))
  {
    if (IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = self;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_DEBUG, "%@       I can be reached", buf, 0xCu);
      }

    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[IMDServiceSession accounts](self, "accounts", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v23;
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v18);
          -[IMDServiceSession _reconnectIfNecessaryWithAccount:](self, "_reconnectIfNecessaryWithAccount:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k));
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v19);
    }

  }
}

- (void)_setPendingNetworkMonitorUpdate
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__processNetworkMonitorUpdate, 0);
  if (self->_activated)
    -[IMDServiceSession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__processNetworkMonitorUpdate, 0, 2.0);
}

- (BOOL)_processesNetworkEvents
{
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  IMNetworkMonitor *networkMonitor;
  int v9;
  IMDServiceSession *v10;
  __int16 v11;
  IMNetworkMonitor *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[IMDServiceSession isReplicating](self, "isReplicating") && (v3 = IMGetCachedDomainBoolForKey(), (v3 & 1) == 0))
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        networkMonitor = self->_networkMonitor;
        v9 = 138412546;
        v10 = self;
        v11 = 2112;
        v12 = networkMonitor;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "%@ refuses to process network changes - networkMonitor: %@", (uint8_t *)&v9, 0x16u);
      }

    }
    LOBYTE(v5) = 0;
  }
  else
  {
    -[IMDServiceSession service](self, "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ignoresNetworkConnectivity") ^ 1;

  }
  return v5;
}

- (void)_processPotentialNetworkChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  IMDServiceSession *v27;
  uint64_t v28;
  NSObject *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  const __CFString *v33;
  uint64_t v34;
  NSObject *v35;
  const __CFString *v36;
  NSObject *v37;
  int v38;
  const __CFString *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  IMDServiceSession *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  const __CFString *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!-[IMDServiceSession _processesNetworkEvents](self, "_processesNetworkEvents") || !self->_activated)
    return;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[IMDServiceSession accounts](self, "accounts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v41 != v5)
          objc_enumerationMutation(v3);
        if ((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "loginStatus") > 2)
        {
          v7 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_13:

  v8 = (-[IMNetworkMonitor immediatelyReachable](self->_networkMonitor, "immediatelyReachable") & 1) != 0
    || -[IMDServiceSession overrideNetworkAvailability](self, "overrideNetworkAvailability");
  objc_msgSend(MEMORY[0x1E0D36A00], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isOnTelephonyCall");

  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsSimultaneousVoiceAndDataRightNow");

  if ((v8 & (v10 ^ 1 | v12)) == 1)
  {
    v13 = -[IMDServiceSession processNetworkDataAvailabilityChange:](self, "processNetworkDataAvailabilityChange:", 1);
    v14 = 1;
    if ((v7 & 1) != 0)
      goto LABEL_18;
  }
  else
  {
    v14 = -[IMDServiceSession overrideNetworkAvailability](self, "overrideNetworkAvailability");
    v13 = -[IMDServiceSession processNetworkDataAvailabilityChange:](self, "processNetworkDataAvailabilityChange:", 0);
    if (v7 == v14)
    {
LABEL_18:
      v15 = IMOSLoggingEnabled(v13);
      if ((_DWORD)v15)
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = CFSTR("NO");
          *(_DWORD *)buf = 138413570;
          v45 = self;
          if (v7)
            v18 = CFSTR("YES");
          else
            v18 = CFSTR("NO");
          v46 = 2112;
          v47 = v18;
          if (v14)
            v19 = CFSTR("YES");
          else
            v19 = CFSTR("NO");
          v48 = 2112;
          if (v10)
            v20 = CFSTR("YES");
          else
            v20 = CFSTR("NO");
          v49 = v19;
          if (v12)
            v17 = CFSTR("YES");
          v50 = 2112;
          v51 = v20;
          v52 = 2112;
          v53 = v17;
          v54 = 2112;
          v55 = v19;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "%@ networkMonitorDidUpdate: Currently connected: %@   (Reachable: %@  On Call: %@  Data+Voice: %@   Result: %@)", buf, 0x3Eu);
        }
LABEL_48:

        goto LABEL_49;
      }
      goto LABEL_49;
    }
  }
  v15 = IMOSLoggingEnabled(v13);
  if ((_DWORD)v15)
  {
    OSLogHandleForIMEventCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v21 = CFSTR("NO");
      *(_DWORD *)buf = 138413570;
      v45 = self;
      if (v7)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      v46 = 2112;
      v47 = v22;
      if (v14)
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      v48 = 2112;
      if (v10)
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      v49 = v23;
      if (v12)
        v21 = CFSTR("YES");
      v50 = 2112;
      v51 = v24;
      v52 = 2112;
      v53 = v21;
      v54 = 2112;
      v55 = v23;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "%@ networkMonitorDidUpdate: Currently connected: %@   (Reachable: %@  On Call: %@  Data+Voice: %@   Result: %@)", buf, 0x3Eu);
    }
    goto LABEL_48;
  }
LABEL_49:
  v25 = IMOSLoggingEnabled(v15);
  if ((_DWORD)v25)
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      -[IMNetworkMonitor remoteHost](self->_networkMonitor, "remoteHost");
      v27 = (IMDServiceSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = v27;
      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_DEBUG, "                                        remoteHost: %@", buf, 0xCu);

    }
  }
  v28 = IMOSLoggingEnabled(v25);
  if ((_DWORD)v28)
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v30 = CFSTR("NO");
      if (v8)
        v30 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v45 = (IMDServiceSession *)v30;
      _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_DEBUG, "                                       isReachable: %@", buf, 0xCu);
    }

  }
  v31 = IMOSLoggingEnabled(v28);
  if ((_DWORD)v31)
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = CFSTR("NO");
      if (v10)
        v33 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v45 = (IMDServiceSession *)v33;
      _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_DEBUG, "                                          isOnCall: %@", buf, 0xCu);
    }

  }
  v34 = IMOSLoggingEnabled(v31);
  if ((_DWORD)v34)
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v36 = CFSTR("NO");
      if (v12)
        v36 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v45 = (IMDServiceSession *)v36;
      _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_DEBUG, "                  supportsSimultaneousDataAndVoice: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled(v34))
  {
    OSLogHandleForIMFoundationCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = -[IMNetworkMonitor immediatelyReachable](self->_networkMonitor, "immediatelyReachable");
      v39 = CFSTR("NO");
      if (v38)
        v39 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v45 = (IMDServiceSession *)v39;
      _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_DEBUG, "                            isImmediatelyReachable: %@", buf, 0xCu);
    }

  }
  if (v7)
    -[IMDServiceSession _setPendingNetworkMonitorUpdate](self, "_setPendingNetworkMonitorUpdate");
  else
    -[IMDServiceSession _processNetworkMonitorUpdate](self, "_processNetworkMonitorUpdate");
}

- (void)networkMonitorDidUpdate:(id)a3
{
  if (self->_activated)
    im_dispatch_after();
}

- (void)_callMonitorStateChanged:(id)a3
{
  if (self->_activated)
    im_dispatch_after();
}

- (void)_networkChanged:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_activated)
  {
    objc_msgSend(MEMORY[0x1E0D36B20], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isNetworkUp") & 1) != 0)
    {

    }
    else
    {
      v6 = -[IMDServiceSession overrideNetworkAvailability](self, "overrideNetworkAvailability");

      if (!v6)
        goto LABEL_13;
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[IMDServiceSession accounts](self, "accounts", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          -[IMDServiceSession _reconnectIfNecessaryWithAccount:](self, "_reconnectIfNecessaryWithAccount:", v12);
          -[IMDServiceSession autoReconnectWithAccount:](self, "autoReconnectWithAccount:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
LABEL_13:

}

- (id)_IDSService
{
  return 0;
}

- (BOOL)overrideNetworkAvailability
{
  return 0;
}

- (BOOL)networkConditionsAllowLogin
{
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  IMNetworkMonitor *networkMonitor;
  uint64_t v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  IMNetworkMonitor *v13;
  _BYTE v14[12];
  __int16 v15;
  IMDServiceSession *v16;
  __int16 v17;
  IMNetworkMonitor *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[IMDServiceSession overrideNetworkAvailability](self, "overrideNetworkAvailability"))
    return 1;
  if (!self->_activated)
    return 0;
  -[IMDServiceSession service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ignoresNetworkConnectivity");

  if (v5)
  {
    if (!IMOSLoggingEnabled(v6))
      return 1;
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v14 = 138412546;
      *(_QWORD *)&v14[4] = CFSTR("YES");
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEBUG, "-[IMDServiceSession networkConditionsAllowLogin]: %@ (%@)   (Ignoring network)", v14, 0x16u);
    }
LABEL_8:

    return 1;
  }
  networkMonitor = self->_networkMonitor;
  if (!networkMonitor)
  {
    if (!IMOSLoggingEnabled(0))
      return 1;
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v14 = 138412546;
      *(_QWORD *)&v14[4] = CFSTR("YES");
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEBUG, "-[IMDServiceSession networkConditionsAllowLogin]: %@ (%@)   (Fallback)", v14, 0x16u);
    }
    goto LABEL_8;
  }
  v9 = -[IMNetworkMonitor immediatelyReachable](networkMonitor, "immediatelyReachable");
  v10 = v9;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = CFSTR("NO");
      v13 = self->_networkMonitor;
      *(_DWORD *)v14 = 138412802;
      if (v10)
        v12 = CFSTR("YES");
      *(_QWORD *)&v14[4] = v12;
      v15 = 2112;
      v16 = self;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_DEBUG, "-[IMDServiceSession networkConditionsAllowLogin]: %@ (%@)   ([[%@]_networkMonitor immediatelyReachable])", v14, 0x20u);
    }

  }
  return -[IMNetworkMonitor immediatelyReachable](self->_networkMonitor, "immediatelyReachable", *(_QWORD *)v14);
}

- (BOOL)allowedAsChild
{
  void *v3;
  void *v4;

  +[IMDLocalDaemon sharedDaemon](IMDLocalDaemon, "sharedDaemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentalControls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "disableServiceSession:", self) ^ 1;

  return (char)self;
}

- (int64_t)transcodeTarget
{
  return 0;
}

- (void)_managedPrefsNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  if (self->_activated)
  {
    +[IMDLocalDaemon sharedDaemon](IMDLocalDaemon, "sharedDaemon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parentalControls");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "active");

    if (v6)
    {
      if (!-[IMDServiceSession allowedAsChild](self, "allowedAsChild"))
        -[IMDServiceSession logout](self, "logout");
    }
  }

}

- (id)canonicalFormOfID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMDServiceSession service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession canonicalFormOfID:withIDSensitivity:](self, "canonicalFormOfID:withIDSensitivity:", v4, objc_msgSend(v5, "idSensitivity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)canonicalFormOfID:(id)a3 withIDSensitivity:(int)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[IMDServiceSession service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "caseInsensitivityByHandleType");
  IMCanonicalFormOfIDWithSensitivity();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)canonicalFormOfChatRoom:(id)a3
{
  return (id)objc_msgSend(a3, "lowercaseString");
}

- (BOOL)equalID:(id)a3 andID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
    {
      -[IMDServiceSession canonicalFormOfID:](self, "canonicalFormOfID:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession canonicalFormOfID:](self, "canonicalFormOfID:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqualToString:", v11);

    }
  }

  return v9;
}

- (void)refreshServiceCapabilities
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[IMDServiceSession capabilities](self, "capabilities");
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      _IMStringFromFZCapabilities();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Refreshing capabilities: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  -[IMDServiceSession broadcaster](self, "broadcaster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession accountID](self, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account:capabilitiesChanged:", v7, v3);

}

- (id)broadcaster
{
  void *v3;
  void *v4;
  void *v5;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcasterForListenersSupportingService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)broadcasterForChatListeners
{
  void *v3;
  void *v4;
  void *v5;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcasterForChatListenersSupportingService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)broadcasterForChatListenersWithBlackholeStatus:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession service](self, "service");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "broadcasterForBlackholeChatListenersSupportingService:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)broadcasterForChatObserverListeners
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  IMDInvocationForwarder *v7;
  void *v8;
  IMDInvocationForwarder *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "broadcasterForSentMessageListenersSupportingService:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [IMDInvocationForwarder alloc];
  v11[0] = v3;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IMDInvocationForwarder initWithTargets:](v7, "initWithTargets:", v8);

  return v9;
}

- (id)broadcasterForAVConferenceListeners
{
  void *v3;
  void *v4;
  void *v5;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcasterForAVConferenceListenersSupportingService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)broadcasterForACConferenceListeners
{
  void *v3;
  void *v4;
  void *v5;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcasterForACConferenceListenersSupportingService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)broadcasterForVCConferenceListeners
{
  void *v3;
  void *v4;
  void *v5;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcasterForVCConferenceListenersSupportingService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)broadcasterForNotificationsListeners
{
  void *v3;
  void *v4;
  void *v5;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcasterForNotificationListenersSupportingService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)broadcasterForCollaborationListeners
{
  void *v3;
  void *v4;
  void *v5;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcasterForCollaborationListenersSupportingService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_clearDowngradeMarkersForChat:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  if (self->_activated)
  {
    v17 = v4;
    v5 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D36C28];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D36C30];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, v7, v8, v9, v10, *MEMORY[0x1E0D36C38], 0);

    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v12, "updateProperties:chat:style:", v11, v17, 45);

    if ((_DWORD)v8)
    {
      -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v17, 45);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "guid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "properties");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "chat:propertiesUpdated:", v15, v16);

      }
    }

    v4 = v17;
  }

}

- (BOOL)shouldInferRecoverableDeleteForCommandDictionary:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isPermanentDelete"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("recoverableDeleteDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == 0;

  }
  return v6;
}

- (id)deleteCommandDictionaryWithIncomingDictionary:(id)a3 inferredRecoverableDeleteForLegacyCommandsWithDate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("permanentDeleteChatMetadataArray"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("permanentDeleteChatMetadataArray"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("chat"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("isPermanentDelete"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("recoverableDeleteDate"));

  v8 = (void *)objc_msgSend(v6, "copy");
  return v8;
}

- (void)_blocklistIfNeededForChatDict:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wasReportedAsJunk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("groupID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D39868], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "blocklistGroupId:", v6);

      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = 138412290;
          v11 = v6;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Blocklisted GroupID: %@", (uint8_t *)&v10, 0xCu);
        }
LABEL_10:

      }
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "IMDServiceSession | Expected to blocklist chat for chatDict: %@ but groupID nil", (uint8_t *)&v10, 0xCu);
      }
      goto LABEL_10;
    }

  }
}

- (void)deleteChatsForCommandDictionary:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  int v39;
  _QWORD v40[4];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  void *v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  const __CFString *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("isPermanentDelete"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v39 = v5;
  if (v5)
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("permanentDeleteChatMetadataArray"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
  }
  else
  {
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("chat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("recoverableDeleteDate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v6;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  if (v32)
  {
    v7 = CFSTR("NO");
    v31 = *(_QWORD *)v48;
    if (v5)
      v7 = CFSTR("YES");
    v34 = v7;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v48 != v31)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v33 = v8;
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v8);
        -[IMDServiceSession _blocklistIfNeededForChatDict:](self, "_blocklistIfNeededForChatDict:", v10);
        -[IMDServiceSession _chatsForDeleteAndRecoveryChatMetadataDictionary:](self, "_chatsForDeleteAndRecoveryChatMetadataDictionary:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("deleteIncomingMessages"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if (!objc_msgSend(v11, "count") && IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v55 = v10;
            _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "IMDServiceSession | Deletion: did not find any chats for chat metadata %@", buf, 0xCu);
          }

        }
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v36 = v11;
        v15 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
        v16 = v15;
        if (v15)
        {
          v17 = *(_QWORD *)v44;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v44 != v17)
                objc_enumerationMutation(v36);
              v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v18);
              if (IMOSLoggingEnabled(v15))
              {
                OSLogHandleForIMFoundationCategory();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v55 = v19;
                  v56 = 2112;
                  v57 = v34;
                  _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "removing chat: %@, permanently: %@", buf, 0x16u);
                }

              }
              objc_msgSend(v19, "guid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v19, "isBlackholed");
              v23 = v38;
              if (v22)
                v23 = v37;
              v24 = v23;
              -[IMDServiceSession chatRegistry](self, "chatRegistry");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v39)
              {
                v53 = v21;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v40[0] = MEMORY[0x1E0C809B0];
                v40[1] = 3221225472;
                v40[2] = sub_1D144CAB4;
                v40[3] = &unk_1E9228840;
                v41 = v24;
                v42 = v21;
                objc_msgSend(v25, "permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:completionHandler:", v26, v40);

                v27 = v41;
              }
              else
              {
                v52 = v21;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "moveMessagesInChatsWithGUIDsToRecentlyDeleted:deleteDate:", v28, v35);

                -[IMDServiceSession _updateLastMessageTimeStampForChat:broadcaster:](self, "_updateLastMessageTimeStampForChat:broadcaster:", v19, v24);
                v51 = v21;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "movedMessagesToRecentlyDeletedForChatsWithGUIDs:queryID:", v27, 0);
              }

              objc_msgSend(v19, "setDeletingIncomingMessages:", v13);
              ++v18;
            }
            while (v16 != v18);
            v15 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
            v16 = v15;
          }
          while (v15);
        }

        v8 = v33 + 1;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    }
    while (v32);
  }

}

- (void)deleteMessagesForCommandDictionary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Deleting %@: messages", (uint8_t *)&v23, 0xCu);

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isPermanentDelete"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "chatForMessageGUID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = IMOSLoggingEnabled(v15);
  if ((v9 & 1) != 0)
  {
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v23 = 138412290;
        v24 = v5;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Permanently deleting messages with GUID %@: ", (uint8_t *)&v23, 0xCu);
      }

    }
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "deleteMessageGUIDs:", v5);
  }
  else
  {
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v23 = 138412290;
        v24 = v5;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Recoverably deleting messages with GUID %@: ", (uint8_t *)&v23, 0xCu);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recoverableDeleteDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v18))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v23 = 138412290;
        v24 = v18;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Recently Deleted | messages delete date: %@", (uint8_t *)&v23, 0xCu);
      }

    }
    -[IMDServiceSession chatRegistry](self, "chatRegistry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "moveMessagesWithGUIDsToRecentlyDeleted:deleteDate:", v5, v18);

  }
  -[IMDServiceSession _updateLastMessageTimeStampForChat:broadcaster:](self, "_updateLastMessageTimeStampForChat:broadcaster:", v14, v10);
  objc_msgSend(v10, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:", v5, 0, 0);
  objc_msgSend(v11, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:", v5, 0, 0);

}

- (void)recoverChatsForCommandDictionary:(id)a3
{
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  NSObject *v15;
  id v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("recoverChatMetadataArray"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[IMDServiceSession _chatsForDeleteAndRecoveryChatMetadataDictionary:](self, "_chatsForDeleteAndRecoveryChatMetadataDictionary:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          objc_msgSend(v6, "arrayByApplyingSelector:", sel_guid);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDServiceSession chatRegistry](self, "chatRegistry");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "recoverMessagesWithChatGUIDs:", v7);

          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v10 = v6;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v21 != v12)
                  objc_enumerationMutation(v10);
                v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
                -[IMDServiceSession _updateLastMessageTimeStampForChat:broadcaster:](self, "_updateLastMessageTimeStampForChat:broadcaster:", v14, v8);
                objc_msgSend(v14, "setDeletingIncomingMessages:", 0);
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v11);
          }

          objc_msgSend(v8, "recoveredMessagesFromRecentlyDeletedForChatsWithGUIDs:", v7);
        }
        else if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v5;
            _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "IMDServiceSession | Recovery: did not find any chats for chat metadata %@", buf, 0xCu);
          }

        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v19);
  }

}

- (void)deleteMessagePartsForCommandDictionary:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  id obj;
  void *v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("parts"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v31;
  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("isPermanentDelete"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (!v5)
    {
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("recoverableDeleteDate"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled(v35))
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = objc_msgSend(v31, "count");
          objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v49 = v9;
          v50 = 2112;
          v51 = v10;
          _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Deleting message parts from %lu messages: %@", buf, 0x16u);

        }
      }
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v31;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v11)
      {
        v36 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v44 != v36)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("messageGuid"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("deleteSubject"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "BOOLValue");

            +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "messageWithGUID:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              v41 = 0;
              v42 = 0;
              +[IMDDeletePartsHelper _convertDeletedPartsDict:toIndexSet:toMap:](IMDDeletePartsHelper, "_convertDeletedPartsDict:toIndexSet:toMap:", v13, &v42, &v41);
              v20 = v42;
              v21 = v41;
              if (objc_msgSend(v20, "count"))
              {
                objc_msgSend(MEMORY[0x1E0D39918], "_messageItemWithIndexesDeleted:subRangesToDeleteMapping:deleteSubject:deleteTransferCallback:createItemCallback:fromMessageItem:", v20, v21, v16, 0, 0, v18);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (IMOSLoggingEnabled(v22))
                {
                  OSLogHandleForIMFoundationCategory();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v49 = (uint64_t)v18;
                    v50 = 2112;
                    v51 = v22;
                    _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Recently Deleted | Removed parts from old item %@, got new item: %@", buf, 0x16u);
                  }

                }
                objc_msgSend(v18, "body");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v37[0] = MEMORY[0x1E0C809B0];
                v37[1] = 3221225472;
                v37[2] = sub_1D144D8C0;
                v37[3] = &unk_1E9228868;
                v38 = v20;
                v39 = v18;
                v40 = v32;
                objc_msgSend(v24, "__im_visitMessageParts:", v37);

                +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "chatForMessageGUID:", v14);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                -[IMDServiceSession _updateLastMessageTimeStampForChat:broadcaster:](self, "_updateLastMessageTimeStampForChat:broadcaster:", v26, v35);
                objc_msgSend(v22, "accountID");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "account:chat:style:chatProperties:messageUpdated:", v27, 0, 0, 0, v22);

              }
              else if (IMOSLoggingEnabled(0))
              {
                OSLogHandleForIMFoundationCategory();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = (uint64_t)v14;
                  _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "IMDServiceSession: Recently Deleted | did not find indexes to delete at for GUID: %@", buf, 0xCu);
                }

              }
            }
            else if (IMOSLoggingEnabled(v19))
            {
              OSLogHandleForIMFoundationCategory();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v49 = (uint64_t)v14;
                _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "IMDServiceSession: Recently Deleted | could not find messageItem for GUID: %@", buf, 0xCu);
              }

            }
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v11);
      }

      goto LABEL_39;
    }
    v3 = v31;
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "IMDServiceSession: Recently Deleted | Received permanent delete command. This is unsupported", buf, 2u);
      }
LABEL_6:

LABEL_39:
      v3 = v31;
    }
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "IMDServiceSession: Recently Deleted | Received empty parts-mardid command", buf, 2u);
    }
    goto LABEL_6;
  }

}

- (id)_chatsForDeleteAndRecoveryChatMetadataDictionary:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("guid"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("groupID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ptcpts"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v48 = (uint64_t)v38;
      v49 = 2112;
      v50 = v37;
      v51 = 2112;
      v52 = v40;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Finding chats for delete or recovery using guid %@ groupID %@ participants %@", buf, 0x20u);
    }

  }
  -[IMDServiceSession chatRegistry](self, "chatRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingChatWithGUID:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v39, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = (uint64_t)v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Found chat with specific guid %@ for chat metadata", buf, 0xCu);

      }
    }
    objc_msgSend(v39, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

  }
  -[IMDServiceSession chatRegistry](self, "chatRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "existingChatsWithGroupID:", v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = 134218498;
        v48 = v16;
        v49 = 2112;
        v50 = v37;
        v51 = 2112;
        v52 = v13;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Found %llu chats with specific group ID %@ for chat metadata: %@", buf, 0x20u);
      }

    }
    objc_msgSend(v13, "arrayByApplyingSelector:", sel_guid);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v17);

  }
  if ((unint64_t)objc_msgSend(v40, "count") >= 2)
  {
    -[IMDServiceSession chatRegistry](self, "chatRegistry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession service](self, "service");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "existingChatsForIDs:onService:style:", v40, v19, 43);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = sub_1D144E028;
    v45[3] = &unk_1E92288B8;
    v45[4] = self;
    objc_msgSend(v20, "__imArrayByFilteringWithBlock:", v45);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "count");
    if (v22)
    {
      if (IMOSLoggingEnabled(v22))
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = objc_msgSend(v21, "count");
          *(_DWORD *)buf = 134218498;
          v48 = v24;
          v49 = 2112;
          v50 = v40;
          v51 = 2112;
          v52 = v21;
          _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Found %llu chats with handles: %@ chats: %@", buf, 0x20u);
        }

      }
      objc_msgSend(v21, "arrayByApplyingSelector:", sel_guid);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v25);

    }
  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = v5;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v42;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(v27);
        v31 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v30);
        -[IMDServiceSession chatRegistry](self, "chatRegistry");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "existingChatWithGUID:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
          objc_msgSend(v26, "addObject:", v33);

        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v28);
  }

  if (IMOSLoggingEnabled(v34))
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v48 = (uint64_t)v26;
      v49 = 2112;
      v50 = v38;
      _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Found %llu chats for delete command with guid %@", buf, 0x16u);
    }

  }
  return v26;
}

- (BOOL)allowedToOverwriteOriginalGroupIDForChat:(id)a3
{
  return 0;
}

- (IMDChatRegistry)chatRegistry
{
  return +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
}

- (void)_updateLastMessageTimeStampForChat:(id)a3 broadcaster:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastMessageForChatWithRowID:", objc_msgSend(v5, "rowID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastMessage:", v9);

    objc_msgSend(v5, "lastMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "lastMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "time");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      objc_msgSend(v5, "setLastMessageTimeStampOnLoad:", (uint64_t)v13);

    }
    else
    {
      objc_msgSend(v5, "setLastMessageTimeStampOnLoad:", 0);
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isAVLessSharePlayEnabled");

    if (v16)
    {
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastTUConversationItemForChat:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v19, "time");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v19, "time");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setLastTUConversationCreatedDate:", v21);

        }
        else
        {
          IMLogHandleForCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            sub_1D1666194((uint64_t)v19, v22);

        }
      }
      else
      {
        objc_msgSend(v5, "setLastTUConversationCreatedDate:", 0);
      }

    }
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "guid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "lastMessage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "time");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceReferenceDate");
        objc_msgSend(v25, "numberWithDouble:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412546;
        v31 = v24;
        v32 = 2112;
        v33 = v28;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Recently Deleted | IMDChat: %@, updating last message timestamp on load: %@", (uint8_t *)&v30, 0x16u);

      }
    }
    objc_msgSend(v5, "guid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chat:lastMessageTimeStampOnLoadUpdated:", v29, (double)objc_msgSend(v5, "lastMessageTimeStampOnLoad"));

  }
  else if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Recently Deleted | _updateLastMessageTimeStampForChat received nil chat", (uint8_t *)&v30, 2u);
    }

  }
}

- (void)cancelScheduledMessageWithGUID:(id)a3
{
  NSObject *v3;

  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_1D166636C();

}

- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5
{
  NSObject *v5;

  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1D166636C();

}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9
{
  NSObject *v9;

  IMLogHandleForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_1D1666398();

}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  NSObject *v8;

  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1D16663C4();

}

- (void)renewTTLForScheduledAttachmentTransfer:(id)a3
{
  NSObject *v3;

  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_1D16663F0();

}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id obj;
  IMDServiceSession *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "messagesDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  v34 = self;
  -[IMDServiceSession service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internalName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-ReachableHandles"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isInternalInstall"))
    v14 = objc_msgSend(v12, "count") != 0;
  else
    v14 = 0;

  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v6, "handleIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  v31 = v6;
  v32 = v12;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    LODWORD(v19) = v14;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v22 = objc_alloc(MEMORY[0x1E0D39A38]);
        -[IMDServiceSession service](v34, "service");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "internalName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v22, "initWithHandleID:service:isReachable:", v21, v24, 1);

        if (v14)
          objc_msgSend(v25, "setReachable:", objc_msgSend(v32, "containsObject:", v21));
        v19 = v19 & objc_msgSend(v25, "isReachable");
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, v21);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v17);
  }
  else
  {
    v19 = v14;
  }

  v26 = objc_alloc(MEMORY[0x1E0D39A50]);
  -[IMDServiceSession service](v34, "service");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "internalName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v26, "initWithService:error:handleResults:isFinal:allAreReachable:didCheckServer:", v28, 0, v15, 1, v19, 0);

  objc_msgSend(v30, "reachabilityRequest:updatedWithResult:", v31, v29);
}

- (void)markItemFailedWithGUID:(id)a3 errorCode:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[IMDServiceSession itemWithGUID:](self, "itemWithGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IMDServiceSession chatForItemWithGUID:](self, "chatForItemWithGUID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EFCC8F70))
      {
        objc_msgSend(v7, "setErrorCode:", v4);
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v9, "storeItem:forceReplace:", v7, 1);

        -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", objc_msgSend(v8, "isBlackholed"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "accountID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (!v11)
        {
          -[IMDServiceSession accountID](self, "accountID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "chatIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v8, "style");
        objc_msgSend(v8, "chatProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "groupID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "personCentricID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "account:chat:style:chatProperties:groupID:chatPersonCentricID:messageReceived:", v12, v13, v14, v15, v16, v17, v7);

        if (!v11)
      }
      else
      {
        IMLogHandleForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_1D166641C();

      }
    }

  }
}

- (BOOL)_messageDowngradesWhenSentFromCurrentService:(id)a3
{
  return 0;
}

- (BOOL)_messageUpgradesWhenSentFromCurrentService:(id)a3
{
  return 0;
}

- (NSString)serverHost
{
  return self->_serverHost;
}

- (unsigned)serverPort
{
  return self->_serverPort;
}

- (int64_t)proxyType
{
  return self->_proxyType;
}

- (NSString)proxyHost
{
  return self->_proxyHost;
}

- (unsigned)proxyPort
{
  return self->_proxyPort;
}

- (NSString)proxyAccount
{
  return self->_proxyAccount;
}

- (NSString)proxyPassword
{
  return self->_proxyPassword;
}

- (BOOL)useSSL
{
  return self->_useSSL;
}

- (NSString)password
{
  return self->_password;
}

- (IMDAccount)account
{
  return self->_account;
}

- (IMDService)service
{
  return self->_service;
}

- (IMDServiceAttachmentController)baseAttachmentController
{
  return self->_baseAttachmentController;
}

- (NSMutableArray)serviceSessionDelegates
{
  return self->_serviceSessionDelegates;
}

- (IMDServiceSession)mainSession
{
  return (IMDServiceSession *)objc_loadWeakRetained((id *)&self->_mainSession);
}

- (IMDAccount)replicationAccount
{
  return (IMDAccount *)objc_loadWeakRetained((id *)&self->_replicationAccount);
}

- (IMDService)replicationService
{
  return (IMDService *)objc_loadWeakRetained((id *)&self->_replicationService);
}

- (NSArray)accounts
{
  return &self->_accounts->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_replicationService);
  objc_destroyWeak((id *)&self->_replicationAccount);
  objc_destroyWeak((id *)&self->_mainSession);
  objc_storeStrong((id *)&self->_serviceSessionDelegates, 0);
  objc_storeStrong((id *)&self->_replicationProxy, 0);
  objc_storeStrong((id *)&self->_baseAttachmentController, 0);
  objc_storeStrong((id *)&self->_serverHost, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyAccount, 0);
  objc_storeStrong((id *)&self->_proxyHost, 0);
  objc_storeStrong((id *)&self->_buddies, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_otcUtilities, 0);
  objc_storeStrong((id *)&self->_systemProxySettingsFetcher, 0);
  objc_storeStrong((id *)&self->_pwRequestID, 0);
  objc_storeStrong((id *)&self->_loginID, 0);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_messageAutoReplier, 0);
  objc_storeStrong((id *)&self->_messageWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_messageExpireStateTimer, 0);
  objc_storeStrong((id *)&self->_messageRoutingTimer, 0);
  objc_storeStrong((id *)&self->_chatRoomToGroupChatIdentifierMap, 0);
  objc_storeStrong((id *)&self->_groupChatIdentifierToChatRoomMap, 0);
  objc_storeStrong((id *)&self->_changedBuddies, 0);
  objc_storeStrong((id *)&self->_localProperties, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (NSNumber)globalReadReceiptSettingVersion
{
  return (NSNumber *)IMGetCachedDomainValueForKey();
}

- (void)setGlobalReadReceiptSettingVersion:(id)a3
{
  IMSetDomainValueForKey();
}

- (BOOL)readReceiptsGloballyEnabled
{
  if ((IMGetDomainBoolForKey() & 1) != 0)
    return 1;
  else
    return IMGetDomainBoolForKey();
}

- (void)setReadReceiptsGloballyEnabled:(BOOL)a3
{
  IMSetDomainBoolForKey();
}

- (BOOL)shouldSendReadReceiptsForChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = -[IMDServiceSession readReceiptsGloballyEnabled](self, "readReceiptsGloballyEnabled");
  -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D37770]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (_IMWillLog())
  {
    if (v10)
      objc_msgSend(v10, "longValue");
    _IMAlwaysLog();
  }
  if (v10)
    v7 = objc_msgSend(v10, "BOOLValue");

  return v7;
}

- (void)overwritePerChatReadReceiptSettingsWithGlobalValue:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v25 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  if (_IMWillLog())
    _IMAlwaysLog();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v28 = *(_QWORD *)v30;
    v7 = *MEMORY[0x1E0D37840];
    v8 = *MEMORY[0x1E0D37770];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v10, "properties", v21, v22, v23, v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        objc_msgSend(v12, "valueForKey:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "integerValue"))
        {
          v14 = objc_msgSend(v10, "isOscarChat");
          v15 = v14;
          if (v14 && _IMWillLog())
            _IMAlwaysLog();
          objc_msgSend(v12, "valueForKey:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (_IMWillLog())
          {
            if (v16)
              v17 = objc_msgSend(v16, "longValue");
            else
              v17 = -1;
            v23 = objc_msgSend(v13, "longValue");
            v24 = v10;
            v21 = v25;
            v22 = v17;
            _IMAlwaysLog();
          }
          if ((v15 & 1) != 0 || objc_msgSend(v16, "BOOLValue") != v25)
          {
            objc_msgSend(v12, "removeObjectForKey:", v8, v21, v22, v23, v24);
            objc_msgSend(v12, "removeObjectForKey:", v7);
            objc_msgSend(v10, "updateProperties:", v12);
            -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "guid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "properties");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "chat:propertiesUpdated:", v19, v20);

          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v6);
  }

}

- (BOOL)_canHandleTransferAccept:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(a3, "serviceFromUserInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  -[IMDServiceSession service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v7 = v4;
    v9 = v8;
  }
  else
  {
    v9 = (void *)*MEMORY[0x1E0D38F68];
  }
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  return v10;
}

- (void)_handleFileTransferAccepted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void (**v10)(void *, _QWORD);
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void (**v22)(void *, _QWORD);
  _QWORD aBlock[4];
  id v24;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceFromUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMDServiceSession _canHandleTransferAccept:](self, "_canHandleTransferAccept:", v4))
  {
    objc_msgSend(v4, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_IMWillLog())
    {
      -[IMDServiceSession service](self, "service");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "internalName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v4;
      _IMAlwaysLog();

    }
    if (v6)
    {
      v8 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D14E53B0;
      aBlock[3] = &unk_1E9227F58;
      v9 = v6;
      v24 = v9;
      v10 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
      v11 = objc_msgSend(v4, "transferState");
      v12 = _IMWillLog();
      if (v11 > 1)
      {
        if (v12)
          _IMAlwaysLog();
        if (IMIsRunningInAutomation())
          v10[2](v10, 0);
      }
      else
      {
        if (v12)
        {
          v16 = v4;
          _IMAlwaysLog();
        }
        objc_msgSend(v4, "_setNeedsWrapper:", 0, v16, v17);
        if (IMFileTransferGUIDIsTemporary())
        {
          -[IMDServiceSession fallbackToDownloadIfPossible:transfer:](self, "fallbackToDownloadIfPossible:transfer:", v9, v4);
        }
        else
        {
          if (_IMWillLog())
            _IMAlwaysLog();
          +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "startTransfer:", v9);

          +[IMDCKAttachmentSyncController sharedInstance](IMDCKAttachmentSyncController, "sharedInstance");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v8;
          v19[1] = 3221225472;
          v19[2] = sub_1D14E53FC;
          v19[3] = &unk_1E922BBF0;
          v19[4] = self;
          v20 = v9;
          v21 = v4;
          v22 = v10;
          objc_msgSend(v15, "acceptFileTransfer:completion:", v21, v19);

        }
      }

    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
    goto LABEL_22;
  }
  if (_IMWillLog())
  {
    -[IMDServiceSession service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "internalName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

LABEL_22:
  }

}

- (void)_handleFileTransferBatchAccepted:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  IMDServiceSession *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_IMWillLog())
  {
    v24 = v3;
    _IMAlwaysLog();
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v10, "guid", v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          if (!_IMWillLog())
            goto LABEL_18;
          v24 = v10;
LABEL_17:
          _IMAlwaysLog();
          goto LABEL_18;
        }
        v12 = objc_msgSend(v10, "transferState");
        v13 = _IMWillLog();
        if (v12 > 1)
        {
          if (!v13)
            goto LABEL_18;
          v24 = v10;
          goto LABEL_17;
        }
        if (v13)
        {
          v24 = v10;
          _IMAlwaysLog();
        }
        objc_msgSend(v10, "_setNeedsWrapper:", 0, v24);
        objc_msgSend(v4, "addObject:", v10);
LABEL_18:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v7);
  }

  if (_IMWillLog())
    _IMAlwaysLog();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance", v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "guid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "startTransfer:", v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v16);
  }

  +[IMDCKAttachmentSyncController sharedInstance](IMDCKAttachmentSyncController, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1D14E57A8;
  v26[3] = &unk_1E9228840;
  v27 = v14;
  v28 = self;
  v23 = v14;
  objc_msgSend(v22, "acceptFileTransfers:completion:", v23, v26);

}

- (void)fallbackToDownloadIfPossible:(id)a3 transfer:(id)a4
{
  id v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = -[IMDServiceSession _isTransferAvailableForDownload:](self, "_isTransferAvailableForDownload:", v6);
  v8 = _IMWillLog();
  if (v7)
  {
    if (v8)
      _IMAlwaysLog();
    objc_msgSend(v6, "_setTransferState:", 0);
    -[IMDServiceSession baseAttachmentController](self, "baseAttachmentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "acceptFileTransfer:", v6);

  }
  else
  {
    if (v8)
      _IMAlwaysLog();
    -[IMDServiceSession _resetTransferToTapDownloadState:](self, "_resetTransferToTapDownloadState:", v10);
  }

}

- (BOOL)_isTransferAvailableForDownload:(id)a3
{
  return objc_msgSend(a3, "isDownloadExpired") ^ 1;
}

- (void)_resetTransferToTapDownloadState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (_IMWillLog())
  {
    v8 = v9;
    _IMAlwaysLog();
  }
  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferForGUID:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MessageServiceSession"), 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetTransfer:andPostError:", v9, v6);

  objc_msgSend(v4, "_setTransferState:", 0);
  objc_msgSend(v4, "_setError:", -1);
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateFileTransfer:", v4);

}

- (void)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 calculateUnreadCount:(BOOL)a7 flagMask:(unint64_t)a8 didReplaceBlock:(id)a9 shouldStoreBlock:(id)a10 didStoreBlock:(id)a11 block:(id)a12
{
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v16;
  id v17;
  void (**v18)(id, _QWORD, id, id);
  uint64_t v19;
  id v20;
  void (**v21)(id, id);
  NSObject *v22;
  void (**v23)(id, id);
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  _BOOL4 v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void (*v40)(void *);
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  NSObject *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  _BOOL4 v71;
  id v72;
  void (**v73)(id, id);
  void (**v74)(id, id);
  uint8_t v75[4];
  void *v76;
  uint8_t buf[16];
  __int128 v78;
  uint64_t v79;
  uint64_t v80;

  v14 = a6;
  v15 = a5;
  v16 = a4;
  v80 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v72 = a9;
  v73 = (void (**)(id, id))a10;
  v74 = (void (**)(id, id))a11;
  v18 = (void (**)(id, _QWORD, id, id))a12;
  if (!v18)
    goto LABEL_72;
  v19 = objc_msgSend(v17, "scheduleType");
  v71 = v19 != 1;
  if (v19 == 1)
  {
    v21 = v73;
    if (IMOSLoggingEnabled(1))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Not storing scheduled message %@", buf, 0xCu);
      }

      v21 = v73;
    }
    v20 = v17;
    if (!v21)
      goto LABEL_17;
    goto LABEL_10;
  }
  v20 = 0;
  v21 = v73;
  if (v73)
  {
LABEL_10:
    v23 = v21;
    v24 = v19 != 1;
    v23[2](v23, v17);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v17)
      v27 = v25 == 0;
    else
      v27 = 0;
    v28 = !v27 && v24;
    v71 = v28;

    v17 = v26;
  }
LABEL_17:
  if ((objc_msgSend(v17, "isTypingMessage") & 1) == 0)
  {
    v29 = objc_msgSend(v17, "scheduleType");
    if (v29 != 1)
    {
      if (IMOSLoggingEnabled(v29))
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v17;
          _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Storing message: %@", buf, 0xCu);
        }

      }
    }
  }
  if (v71)
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE3(v70) = 0;
    *(_WORD *)((char *)&v70 + 1) = 0;
    LOBYTE(v70) = a7;
    objc_msgSend(v31, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:", v17, v16, v15, v14, a8, 1, v70, v72);
    v32 = objc_claimAutoreleasedReturnValue();

    v20 = (id)v32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *(_OWORD *)buf = xmmword_1E922DE30;
    v78 = *(_OWORD *)off_1E922DE40;
    v79 = 184;
    v33 = (void *)MEMORY[0x1E0CB3940];
    v34 = IMFileLocationTrimFileName();
    v35 = v79;
    v36 = (void *)MEMORY[0x1E0CB3940];
    v37 = objc_opt_class();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("input and output message types are not the same. input message has type %@. output message has type %@"), v37, objc_opt_class());
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Unexpected false '%@' in %s at %s:%d. %@"), CFSTR("[resultMessage isKindOfClass:[message class]]"), "-[IMDServiceSession(IMDServiceSession_Chat_Private) storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:]", v34, v35, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v40)
    {
      v40(v39);
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v75 = 138412290;
        v76 = v39;
        _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", v75, 0xCu);
      }

    }
  }
  v42 = objc_msgSend(v17, "isTapToRetry");
  if ((_DWORD)v42)
  {
    if (IMOSLoggingEnabled(v42))
    {
      OSLogHandleForIMEventCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v20, "guid");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v44;
        _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "Set tap to retry for message %@", buf, 0xCu);

      }
    }
    objc_msgSend(v20, "setIsTapToRetry:", 1);
  }
  v45 = objc_msgSend(v17, "isTypingMessage");
  if ((v45 & 1) == 0 && IMOSLoggingEnabled(v45))
  {
    OSLogHandleForIMEventCategory();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "  => Result message: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v17, "contactsAvatarRecipeData");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    objc_msgSend(v20, "contactsAvatarRecipeData");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48 == 0;

    if (v49)
    {
      if (IMOSLoggingEnabled(v50))
      {
        OSLogHandleForIMFoundationCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v20, "guid");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v52;
          _os_log_impl(&dword_1D1413000, v51, OS_LOG_TYPE_INFO, "Set avatar likeness data for message %@", buf, 0xCu);

        }
      }
      objc_msgSend(v17, "contactsAvatarRecipeData");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setContactsAvatarRecipeData:", v53);

    }
  }
  objc_msgSend(v17, "bizIntent");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    objc_msgSend(v20, "bizIntent");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55 == 0;

    if (v56)
    {
      if (IMOSLoggingEnabled(v57))
      {
        OSLogHandleForIMFoundationCategory();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v20, "guid");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v59;
          _os_log_impl(&dword_1D1413000, v58, OS_LOG_TYPE_INFO, "Set biz intent data for message %@", buf, 0xCu);

        }
      }
      objc_msgSend(v17, "bizIntent");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBizIntent:", v60);

    }
  }
  objc_msgSend(v17, "locale");
  v61 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)v61;
  if (v61)
  {
    objc_msgSend(v20, "locale");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63 == 0;

    if (v64)
    {
      if (IMOSLoggingEnabled(v61))
      {
        OSLogHandleForIMFoundationCategory();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v20, "guid");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v66;
          _os_log_impl(&dword_1D1413000, v65, OS_LOG_TYPE_INFO, "Set locale data for message %@", buf, 0xCu);

        }
      }
      objc_msgSend(v17, "locale");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLocale:", v67);

    }
  }
  if (IMOSLoggingEnabled(v61))
  {
    OSLogHandleForIMFoundationCategory();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v20, "guid");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v69;
      _os_log_impl(&dword_1D1413000, v68, OS_LOG_TYPE_INFO, "Set meCard sharing preferences data for message %@", buf, 0xCu);

    }
  }
  objc_msgSend(v20, "setShouldSendMeCard:", objc_msgSend(v17, "shouldSendMeCard"));
  if (v74)
    v74[2](v74, v20);
  ((void (**)(id, _BOOL4, id, id))v18)[2](v18, v71, v17, v20);

LABEL_72:
}

- (id)_sharedAccountController
{
  return +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
}

- (id)_sharedMessageStore
{
  return +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
}

- (void)useChatRoom:(id)a3 forGroupChatIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *groupChatIdentifierToChatRoomMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *chatRoomToGroupChatIdentifierMap;
  id v11;

  v6 = a4;
  -[IMDServiceSession canonicalFormOfChatRoom:](self, "canonicalFormOfChatRoom:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_groupChatIdentifierToChatRoomMap)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    groupChatIdentifierToChatRoomMap = self->_groupChatIdentifierToChatRoomMap;
    self->_groupChatIdentifierToChatRoomMap = v7;

  }
  if (!self->_chatRoomToGroupChatIdentifierMap)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    chatRoomToGroupChatIdentifierMap = self->_chatRoomToGroupChatIdentifierMap;
    self->_chatRoomToGroupChatIdentifierMap = v9;

  }
  -[NSMutableDictionary setObject:forKey:](self->_groupChatIdentifierToChatRoomMap, "setObject:forKey:", v11, v6);
  -[NSMutableDictionary setObject:forKey:](self->_chatRoomToGroupChatIdentifierMap, "setObject:forKey:", v6, v11);

}

- (id)groupChatIdentifierForChatRoom:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_chatRoomToGroupChatIdentifierMap, "objectForKey:", a3);
}

- (id)chatRoomForGroupChatIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_groupChatIdentifierToChatRoomMap, "objectForKey:", a3);
}

- (id)_guidForChat:(id)a3 style:(unsigned __int8)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[IMDServiceSession service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)IMCopyGUIDForChat();

  return v8;
}

- (void)registerChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[IMDServiceSession account](self, "account");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = 0;
  -[IMDServiceSession registerChat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:](self, "registerChat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:", v6, v4, 0, 0, 0, 0, 0, 0, v8, v7);

}

- (void)registerChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 isBlackholed:(BOOL)a12
{
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  _BOOL4 v26;
  int v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  id v48;
  NSObject *v49;
  BOOL v50;
  uint64_t v51;
  NSObject *v52;
  int v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  IMDHandle *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  IMDHandle *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  _BOOL4 v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  NSObject *v87;
  void *v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id obj;
  id v108;
  id v109;
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
  _QWORD v123[5];
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  unsigned __int8 v131;
  BOOL v132;
  id v133;
  unsigned __int8 v134;
  _BYTE v135[128];
  _BYTE v136[128];
  uint8_t v137[128];
  uint8_t buf[4];
  id v139;
  __int16 v140;
  int v141;
  __int16 v142;
  void *v143;
  __int16 v144;
  id v145;
  __int16 v146;
  id v147;
  __int16 v148;
  id v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v134 = a4;
  v100 = a5;
  v101 = a6;
  v102 = a7;
  v104 = a8;
  v105 = a9;
  v106 = a10;
  v18 = a11;
  if (v17)
  {
    v19 = v18;
    if (!v18)
    {
      -[IMDServiceSession account](self, "account");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSRecursiveLock lock](self->_lock, "lock");
    v133 = v17;
    -[IMDServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v133, &v134);
    v20 = v133;

    -[IMDServiceSession _guidForChat:style:](self, "_guidForChat:style:", v20, v134);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v99))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413570;
        v139 = v20;
        v140 = 1024;
        v141 = v134;
        v142 = 2112;
        v143 = v99;
        v144 = 2112;
        v145 = v106;
        v146 = 2112;
        v147 = v104;
        v148 = 2112;
        v149 = v105;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Registering chat identifier: %@   style: %d  guid: %@ handleInfo: %@ lastAddressedHandle %@ lastAddressedSIMID %@", buf, 0x3Au);
      }

    }
    v22 = v134;
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = sub_1D158D868;
    v123[3] = &unk_1E922DE60;
    v123[4] = self;
    v124 = v20;
    v131 = v134;
    v95 = v100;
    v125 = v95;
    v97 = v101;
    v126 = v97;
    v96 = v102;
    v127 = v96;
    v93 = v104;
    v128 = v93;
    v92 = v105;
    v129 = v92;
    v98 = v19;
    v130 = v98;
    v132 = a12;
    v109 = v124;
    -[IMDServiceSession _calculateHandleInfoOverrideIfPermittedForChatIdentifier:style:completion:](self, "_calculateHandleInfoOverrideIfPermittedForChatIdentifier:style:completion:", v124, v22, v123);
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "existingChatWithGUID:", v99);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      objc_msgSend(v103, "participants");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "count"))
      {

      }
      else
      {
        v50 = objc_msgSend(v106, "count") == 0;

        if (!v50)
        {
          if (IMOSLoggingEnabled(v51))
          {
            OSLogHandleForIMFoundationCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v139 = v106;
              _os_log_impl(&dword_1D1413000, v52, OS_LOG_TYPE_INFO, " => Found chat, but it had no particpants. Updating with handleInfo: %@", buf, 0xCu);
            }

          }
          goto LABEL_44;
        }
      }
      v25 = -[IMDServiceSession _shouldConvergeChatParticipants:withHandleInfo:](self, "_shouldConvergeChatParticipants:withHandleInfo:", v103, v106);
      v26 = v25;
      v27 = IMOSLoggingEnabled(v25);
      if (!v26)
      {
        if (v27)
        {
          OSLogHandleForIMFoundationCategory();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v139 = v103;
            _os_log_impl(&dword_1D1413000, v49, OS_LOG_TYPE_INFO, " => We already have one, nothing to do here. Chat: [%@]", buf, 0xCu);
          }

        }
        goto LABEL_89;
      }
      if (v27)
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v139 = v106;
          _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, " => Found chat, but it had a different set of participants. Updating with handleInfo: %@", buf, 0xCu);
        }

      }
      v29 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v103, "participantHandles");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "initWithArray:", v30);

      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v32 = v106;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v120;
        v35 = *MEMORY[0x1E0D36D90];
        v36 = *MEMORY[0x1E0D36C20];
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v120 != v34)
              objc_enumerationMutation(v32);
            v38 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
            objc_msgSend(v38, "objectForKeyedSubscript:", v35);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "removeObject:", v39);
            objc_msgSend(v38, "objectForKeyedSubscript:", v36);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "intValue");
            if (v41)
              v42 = v41;
            else
              v42 = 2;
            v43 = -[IMDServiceSession didChangeMemberStatus:forHandle:forChat:style:](self, "didChangeMemberStatus:forHandle:forChat:style:", v42, v39, v109, v134);

          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
        }
        while (v33);
      }

      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v44 = v31;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
      if (v45)
      {
        v46 = *(_QWORD *)v116;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v116 != v46)
              objc_enumerationMutation(v44);
            v48 = -[IMDServiceSession didChangeMemberStatus:forHandle:forChat:style:](self, "didChangeMemberStatus:forHandle:forChat:style:", 3, *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j), v109, v134);
          }
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
        }
        while (v45);
      }

    }
LABEL_44:
    v53 = v134;
    v54 = v109;
    if (v134 == 45)
      v54 = 0;
    v94 = v54;
    if (v53 == 43)
    {
      v108 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      obj = v106;
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v135, 16);
      if (v63)
      {
        v64 = *(_QWORD *)v112;
        v65 = *MEMORY[0x1E0D36D90];
        v66 = *MEMORY[0x1E0D36E10];
        v67 = *MEMORY[0x1E0D36D68];
        do
        {
          for (k = 0; k != v63; ++k)
          {
            if (*(_QWORD *)v112 != v64)
              objc_enumerationMutation(obj);
            v69 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * k);
            objc_msgSend(v69, "objectForKey:", v65);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectForKey:", v66);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectForKey:", v67);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            if (v70)
            {
              v73 = -[IMDHandle initWithID:unformattedID:countryCode:]([IMDHandle alloc], "initWithID:unformattedID:countryCode:", v70, v71, v72);
              objc_msgSend(v108, "addObject:", v73);

            }
          }
          v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v135, 16);
        }
        while (v63);
      }

      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v91) = a12;
      objc_msgSend(v74, "chatForHandles:account:chatIdentifier:style:groupID:originalGroupID:displayName:guid:lastAddressedHandle:lastAddressedSIMID:isBlackholed:", v108, v98, v109, 43, v97, v96, v95, v99, v93, v92, v91);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v53 == 45)
    {
      objc_msgSend(v106, "__imFirstObject");
      v108 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectForKey:", *MEMORY[0x1E0D36D90]);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectForKey:", *MEMORY[0x1E0D36E10]);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectForKey:", *MEMORY[0x1E0D36D68]);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectForKey:", *MEMORY[0x1E0D37C60]);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectForKey:", *MEMORY[0x1E0D37708]);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v55)
        v55 = v109;
      v60 = objc_msgSend(v58, "BOOLValue");
      v61 = [IMDHandle alloc];
      if (v60)
        v62 = -[IMDHandle initWithID:unformattedID:countryCode:personCentricID:](v61, "initWithID:unformattedID:countryCode:personCentricID:", v55, v56, v57, v59);
      else
        v62 = -[IMDHandle initWithID:unformattedID:countryCode:](v61, "initWithID:unformattedID:countryCode:", v55, v56, v57);
      v76 = (void *)v62;
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v90) = a12;
      objc_msgSend(v77, "chatForHandle:account:chatIdentifier:guid:lastAddressedHandle:lastAddressedSIMID:isBlackholed:", v76, v98, v109, v99, v93, v92, v90);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v108 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "chatForRoom:account:chatIdentifier:guid:", v94, v98, v109, v99);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v75, "setChatIdentifier:", v109);
    objc_msgSend(v75, "setGroupID:", v97);
    if (v96)
      objc_msgSend(v75, "setOriginalGroupID:");
    objc_msgSend(v75, "setDisplayName:", v95);
    if (objc_msgSend(MEMORY[0x1E0D36AF8], "isEngramEnabled"))
      objc_msgSend(v75, "setCreateEngramGroupOnMessageSend:", 1);
    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "storeChat:", v75);

    v79 = objc_msgSend(MEMORY[0x1E0D39AF8], "isInternationalSpamFilteringEnabled");
    if ((_DWORD)v79)
    {
      v79 = objc_msgSend(v75, "isBlackholed");
      if ((_DWORD)v79)
      {
        objc_msgSend(v75, "participants");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v80, "count") == 1;

        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v82;
        if (v81)
        {
          objc_msgSend(v82, "trackSpamEvent:", 15);

          objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "trackSpamEvent:", 13);
        }
        else
        {
          objc_msgSend(v82, "trackSpamEvent:", 16);

          objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "trackSpamEvent:", 14);
        }

      }
    }
    if (v134 != 45)
      goto LABEL_84;
    objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "isInternalInstall"))
    {
      v86 = objc_msgSend(v109, "hasPrefix:", CFSTR("chat"));

      if (!v86)
      {
LABEL_84:
        if (IMOSLoggingEnabled(v79))
        {
          OSLogHandleForIMFoundationCategory();
          v89 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v139 = v75;
            _os_log_impl(&dword_1D1413000, v89, OS_LOG_TYPE_INFO, "Created chat: %@", buf, 0xCu);
          }

        }
LABEL_89:
        -[NSRecursiveLock unlock](self->_lock, "unlock");

        v18 = v98;
        goto LABEL_90;
      }
      if (IMOSLoggingEnabled(v79))
      {
        OSLogHandleForIMEventCategory();
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v139 = v75;
          _os_log_impl(&dword_1D1413000, v87, OS_LOG_TYPE_INFO, "********** Created bad chat: %@ *************", buf, 0xCu);
        }

      }
      IMLogBacktrace();
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "processName");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogSimulateCrashForProcess();

    }
    goto LABEL_84;
  }
  v109 = 0;
LABEL_90:

}

- (void)canonicalizeChatIdentifier:(id *)a3 style:(unsigned __int8 *)a4
{
  id v7;
  int v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  id v14;

  v7 = *a3;
  v8 = *a4;
  switch(v8)
  {
    case '#':
      v13 = v7;
      -[IMDServiceSession canonicalFormOfChatRoom:](self, "canonicalFormOfChatRoom:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case '+':
      v14 = v7;
      v11 = -[IMDServiceSession shouldImitateGroupChatUsingChatRooms](self, "shouldImitateGroupChatUsingChatRooms");
      v7 = v14;
      if (v11)
      {
        -[IMDServiceSession chatRoomForGroupChatIdentifier:](self, "chatRoomForGroupChatIdentifier:", v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDServiceSession canonicalFormOfChatRoom:](self, "canonicalFormOfChatRoom:", v12);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        *a4 = 35;

        v7 = v14;
      }
      break;
    case '-':
      v13 = v7;
      -[IMDServiceSession canonicalFormOfID:](self, "canonicalFormOfID:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v10 = v9;
      v7 = v13;
      *a3 = v10;
      break;
  }

}

- (void)_mapRoomChatToGroupChat:(id *)a3 style:(unsigned __int8 *)a4
{
  void *v7;
  id v8;

  if (-[IMDServiceSession shouldImitateGroupChatUsingChatRooms](self, "shouldImitateGroupChatUsingChatRooms")
    && *a4 == 35)
  {
    -[IMDServiceSession groupChatIdentifierForChatRoom:](self, "groupChatIdentifierForChatRoom:", *a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      *a3 = objc_retainAutorelease(v7);
      v7 = v8;
      *a4 = 43;
    }

  }
}

- (id)existingChatsForGroupID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "existingChatsWithGroupID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)existingChatForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingChatForID:account:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)existingChatsForIDs:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingChatsForIDs:onService:style:", v6, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)chatForChatIdentifier:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[IMDServiceSession account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession chatForChatIdentifier:style:account:](self, "chatForChatIdentifier:style:account:", v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)chatForChatIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  unsigned __int8 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = a4;
  v7 = a5;
  v26 = a3;
  v8 = a3;
  -[IMDServiceSession canonicalizeChatIdentifier:style:](self, "canonicalizeChatIdentifier:style:", &v26, &v27);
  v9 = v26;

  if (v9)
  {
    -[IMDServiceSession _guidForChat:style:](self, "_guidForChat:style:", v9, v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "existingChatWithGUID:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "account");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v15 == v7;

      if (!v16)
      {
        if (IMOSLoggingEnabled(v17))
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v13, "accountID");
            v19 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "accountID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v29 = v19;
            v30 = 2112;
            v31 = v20;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Updating account ID from: %@ => %@", buf, 0x16u);

          }
        }
        objc_msgSend(v7, "accountID", v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAccountID:", v21);

        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "storeChat:", v13);

      }
    }
    else if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v11;
        v30 = 2112;
        v31 = v9;
        v32 = 1024;
        v33 = v27;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Failed to find chat for guid %@ with chatIdentifier: %@, style: %c", buf, 0x1Cu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Failed to canonicalize chat identifier", buf, 2u);
      }

    }
    v13 = 0;
  }

  return v13;
}

- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "internalName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:serviceName:", v16, v15, v14, v13, v12, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7 originalGroupID:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession service](self, "service");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "internalName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:originalGroupID:serviceName:", v19, v18, v17, v16, v15, v14, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 completionBlock:(id)a7
{
  _BOOL8 v7;
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  -[IMDServiceSession account](self, "account");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession processMessageForSending:toChat:style:allowWatchdog:account:completionBlock:](self, "processMessageForSending:toChat:style:allowWatchdog:account:completionBlock:", v14, v13, v8, v7, v15, v12);

}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7 completionBlock:(id)a8
{
  -[IMDServiceSession processMessageForSending:toChat:style:allowWatchdog:account:didReplaceMessageBlock:completionBlock:](self, "processMessageForSending:toChat:style:allowWatchdog:account:didReplaceMessageBlock:completionBlock:", a3, a4, a5, a6, a7, 0, a8);
}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7 didReplaceMessageBlock:(id)a8 completionBlock:(id)a9
{
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _BOOL8 v31;
  _BOOL4 v32;
  id v33;
  id v34;
  const __CFString *v35;
  const __CFString *v36;
  NSObject *log;
  int v38;
  void *v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  char v46;
  id v47;
  unsigned __int8 v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v11 = a6;
  v57 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v48 = a5;
  v17 = a7;
  v40 = a8;
  v18 = a9;
  v19 = v18;
  if (v15)
  {
    if (!v17)
    {
      -[IMDServiceSession account](self, "account");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v47 = v16;
    -[IMDServiceSession _mapRoomChatToGroupChat:style:](self, "_mapRoomChatToGroupChat:style:", &v47, &v48);
    v20 = v47;

    if (v11
      && (objc_msgSend(v15, "isTypingMessage") & 1) == 0
      && (objc_msgSend(v15, "isSuggestedActionResponse") & 1) == 0)
    {
      objc_msgSend(v15, "guid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession _updateWatchdogForMessageGUID:](self, "_updateWatchdogForMessageGUID:", v21);

    }
    -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](self, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v15, v20, v48, v17);
    -[IMDServiceSession _setOutgoingFlagsOnMessage:](self, "_setOutgoingFlagsOnMessage:", v15);
    objc_msgSend(v15, "setErrorCode:", 0);
    v38 = objc_msgSend(v15, "isBeingRetried");
    v46 = 0;
    v22 = (void *)MEMORY[0x1E0D39960];
    objc_msgSend(v15, "balloonBundleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "body");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "payloadData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "photoShareURLFromPluginBundleID:contentString:payload:shouldAccept:", v23, v24, v25, &v46);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDServiceSession existingChatForID:](self, "existingChatForID:", v20);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v39 && v46)
    {
      if (v26)
      {
        +[IMDMomentShareManager sharedInstance](IMDMomentShareManager, "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "registerAndAcceptMomentShareForMessage:inChat:resetAssetTransfers:", v15, v27, 1);

      }
      else if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "guid");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v50 = v30;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Failed to accept moment share for message guid: %@", buf, 0xCu);

        }
      }
    }
    if (objc_msgSend(v15, "containsRichLink"))
    {
      v31 = -[IMDServiceSession _isMessageSWYSpamMessage:inChat:](self, "_isMessageSWYSpamMessage:inChat:", v15, v27);
      v44 = 0;
      v45 = 0;
      v32 = -[IMDServiceSession _shouldShowSWYQuickActionForMessage:outAppName:outBundleID:](self, "_shouldShowSWYQuickActionForMessage:outAppName:outBundleID:", v15, &v45, &v44);
      v33 = v45;
      v34 = v44;
      if (v31 || v32)
      {
        -[IMDServiceSession _configureSyndicationRangesForMessage:forChat:withSyndicationStatus:](self, "_configureSyndicationRangesForMessage:forChat:withSyndicationStatus:", v15, v27, 2);
        objc_msgSend(v15, "setWasDetectedAsSWYSpam:", v31);
        objc_msgSend(v15, "setSwyAppName:", v33);
        if (IMOSLoggingEnabled(objc_msgSend(v15, "setSwyBundleID:", v34)))
        {
          OSLogHandleForIMFoundationCategory();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            v35 = CFSTR("NO");
            *(_DWORD *)buf = 138413058;
            v50 = v15;
            if (v31)
              v36 = CFSTR("YES");
            else
              v36 = CFSTR("NO");
            v51 = 2112;
            v52 = v36;
            if (v32)
              v35 = CFSTR("YES");
            v53 = 2112;
            v54 = v35;
            v55 = 2112;
            v56 = v33;
            _os_log_impl(&dword_1D1413000, log, OS_LOG_TYPE_INFO, "Configuring Syndication Ranges for Message: %@. isSWYSpam %@, showQuickAction: %@ swyAppName: %@", buf, 0x2Au);
          }

        }
      }

    }
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = sub_1D158E6AC;
    v41[3] = &unk_1E922DE88;
    v41[4] = self;
    v42 = v15;
    v43 = v19;
    -[IMDServiceSession storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:](self, "storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:", v42, v38 ^ 1u, v38 ^ 1u, v38 ^ 1u, 0, 557068, v40, 0, 0, v41);

    v16 = v20;
  }
  else
  {
    (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);
  }

}

- (void)_configureAccountInformationOnItem:(id)a3 withAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setService:", v8);

  objc_msgSend(v5, "accountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccountID:", v9);

  objc_msgSend(v5, "loginID");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccount:", v10);
}

- (void)_configureTimeOnOutgoingItem:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTime:", v4);

  }
}

- (void)_configureIdentifierForOutgoingItem:(id)a3 withIdentifier:(id)a4 withStyle:(unsigned __int8)a5
{
  if (a5 == 45)
    objc_msgSend(a3, "setHandle:", a4);
  else
    objc_msgSend(a3, "setRoomName:", a4);
}

- (void)_configureSessionInformationOnItem:(id)a3 toChat:(id)a4 withStyle:(unsigned __int8)a5 forAccount:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[IMDServiceSession _configureTimeOnOutgoingItem:](self, "_configureTimeOnOutgoingItem:", v12);
  -[IMDServiceSession _configureAccountInformationOnItem:withAccount:](self, "_configureAccountInformationOnItem:withAccount:", v12, v10);

  -[IMDServiceSession _configureIdentifierForOutgoingItem:withIdentifier:withStyle:](self, "_configureIdentifierForOutgoingItem:withIdentifier:withStyle:", v12, v11, v6);
}

- (void)_setOutgoingFlagsOnMessage:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setFlags:", objc_msgSend(v3, "flags") & 0xFFFFFFFFFFFF7FFBLL | 4);

}

- (void)_messageStoreCompletion:(BOOL)a3 inputMessage:(id)a4 outputMessage:(id)a5 originalMessage:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, void *))a7;
  if (a3 || objc_msgSend(v12, "scheduleType") == 1)
  {
    if ((objc_msgSend(v12, "isTypingMessage") & 1) == 0)
    {
      v16 = objc_msgSend(v12, "scheduleType");
      if (v16 != 1)
      {
        if (IMOSLoggingEnabled(v16))
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v20 = 138412546;
            v21 = v12;
            v22 = 2112;
            v23 = v13;
            _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "  => Message was stored. Input: %@   Output: %@", (uint8_t *)&v20, 0x16u);
          }

        }
      }
    }
    -[IMDServiceSession _determineResultMessageForInput:output:original:](self, "_determineResultMessageForInput:output:original:", v12, v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "consumedSessionPayloads");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[IMDServiceSession _shouldDropSendingMessage](self, "_shouldDropSendingMessage"))
    {
      if (v19)
        objc_msgSend(v18, "setConsumedSessionPayloads:", v19);
      objc_msgSend(v18, "setShouldNotifyOnSend:", objc_msgSend(v14, "shouldNotifyOnSend"));
      if (v15)
        v15[2](v15, v18);
    }

  }
}

- (id)_determineResultMessageForInput:(id)a3 output:(id)a4 original:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v8;
  if (v8)
  {
LABEL_2:
    v11 = v10;
    goto LABEL_4;
  }
  v11 = v7;
  if (!v11)
  {
    v15 = IMOSLoggingEnabled(0);
    v10 = v9;
    if (v15)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v9;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "  => No result? Using the requested message: %@", (uint8_t *)&v17, 0xCu);
      }

      v10 = v9;
    }
    goto LABEL_2;
  }
LABEL_4:
  if (objc_msgSend(v9, "isBeingRetried"))
    objc_msgSend(v11, "setIsBeingRetried:", 1);
  objc_msgSend(v9, "retryToParticipant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v9, "retryToParticipant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRetryToParticipant:", v13);

  }
  return v11;
}

- (BOOL)_shouldDropSendingMessage
{
  uint64_t v2;
  BOOL v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = IMGetCachedDomainBoolForKey();
  v3 = v2;
  if ((_DWORD)v2 && IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, " ** DropSendingMessage is enabled, failing send message", v6, 2u);
    }

  }
  return v3;
}

- (id)itemWithGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemWithGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chatForItemWithGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDServiceSession _sharedMessageStore](self, "_sharedMessageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatForMessageGUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Chat: Could not find a chat for itemGUID: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  return v6;
}

- (void)storeItem:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v33;
  id v34;
  _QWORD v35[2];

  v5 = a5;
  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "type") == 6)
    {
      objc_msgSend(v10, "properties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11
        || (objc_msgSend(v10, "properties"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v12, "objectForKey:", CFSTR("lastTUConversationCreatedDate")),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v13,
            v12,
            v11,
            !v13))
      {
        objc_msgSend(v10, "properties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v10, "properties");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (id)objc_msgSend(v15, "mutableCopy");

        }
        else
        {
          v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        }

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setValue:forKey:", v17, CFSTR("lastTUConversationCreatedDate"));

        v18 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(v10, "updateProperties:", v18);

      }
    }
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "storeItem:forceReplace:", v8, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "guid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addMessageWithGUID:toChat:deferSpotlightIndexing:", v22, v10, 1);

    if (v20)
    {
      v35[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)IMCreateSerializedItemsFromArray();

      -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", objc_msgSend(v10, "isBlackholed"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accountID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "chatIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "properties");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "account:chat:style:chatProperties:messagesUpdated:", v27, v28, v5, v29, v25);

      objc_msgSend(v10, "guid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "properties");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "chat:propertiesUpdated:", v30, v31);

    }
    else if (IMOSLoggingEnabled(v23))
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = 138412290;
        v34 = v8;
        _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Failed to store item %@", (uint8_t *)&v33, 0xCu);
      }

    }
  }

}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[IMDServiceSession account](self, "account");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession sendMessage:toChat:style:account:](self, "sendMessage:toChat:style:account:", v9, v8, v5, v10);

}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 destinationHandles:(id)a6
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1D166BF0C(v6, v7, v8, v9, v10, v11, v12, v13);

}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  IMDServiceSession *v23;
  id v24;
  id v25;
  unsigned __int8 v26;
  _QWORD v27[4];
  id v28;
  id v29;
  unsigned __int8 v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v30 = a5;
  v12 = a6;
  if (v10)
  {
    v13 = objc_msgSend(v10, "isBeingRetried");
    if ((_DWORD)v13)
    {
      if (IMOSLoggingEnabled(v13))
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "guid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v32 = v15;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Not sending message up to client because this message is being retried. Guid %@", buf, 0xCu);

        }
      }
    }
    else
    {
      if (!v12)
      {
        -[IMDServiceSession account](self, "account");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v29 = v11;
      -[IMDServiceSession _mapRoomChatToGroupChat:style:](self, "_mapRoomChatToGroupChat:style:", &v29, &v30);
      v16 = v29;

      -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](self, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v10, v16, v30, v12);
      -[IMDServiceSession _setOutgoingFlagsOnMessage:](self, "_setOutgoingFlagsOnMessage:", v10);
      -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v16, v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "scheduleType") == 1)
      {
        if (IMOSLoggingEnabled(1))
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "guid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v32 = v19;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Not storing scheduled message or notifying client about message with GUID: %@ ", buf, 0xCu);

          }
        }
      }
      else
      {
        v20 = MEMORY[0x1E0C809B0];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = sub_1D158F590;
        v27[3] = &unk_1E922DEB0;
        v28 = v17;
        v21[0] = v20;
        v21[1] = 3221225472;
        v21[2] = sub_1D158F7D8;
        v21[3] = &unk_1E922DED8;
        v22 = v28;
        v23 = self;
        v24 = v12;
        v25 = v16;
        v26 = v30;
        -[IMDServiceSession storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:](self, "storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:", v10, 1, 1, 1, 0, 0x2000000800CLL, 0, 0, v27, v21);

      }
      v11 = v16;
    }
  }

}

- (void)revokeSentMessage:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[IMDServiceSession displayName](self, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "guid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "%@ Service session does not support message revocation for %@ in chat %@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (void)relayLegacySatelliteMessage:(id)a3 toChat:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Service session does not support legacy satellite relay", v8, 2u);
    }

  }
}

- (void)downgradeRequestedForHandleID:(id)a3 expirationDate:(id)a4 preferredService:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v24 = v13;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "%@ setting downgrade flag for %@ (expiration: %@) to %@", buf, 0x2Au);

    }
  }
  -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v8, 45);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, " => No chat for %@, joining chat", buf, 0xCu);
      }

    }
    v16 = *MEMORY[0x1E0D36C20];
    v21[0] = *MEMORY[0x1E0D36D90];
    v21[1] = v16;
    v22[0] = v8;
    v22[1] = &unk_1E92716C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:](self, "didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:", v8, 45, 0, 0, 0, 0, v18);

    -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v8, 45);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v14, "setRequestedDowngradeService:", v10);
  if (v9)
  {
    objc_msgSend(v14, "setRequestedDowngradeExpirationDate:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRequestedDowngradeExpirationDate:", v19);

  }
}

- (void)clearDowngradeRequestForHandleID:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "%@ clearing downgrade flag for %@", (uint8_t *)&v11, 0x16u);

    }
  }
  -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v4, 45);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setRequestedDowngradeService:", 0);
    objc_msgSend(v9, "setRequestedDowngradeExpirationDate:", 0);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, " => No existing chat, no change to downgrade flag", (uint8_t *)&v11, 2u);
    }

  }
}

- (BOOL)hasValidDowngradeRequestForHandleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v4, 45);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "requestedDowngradeService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestedDowngradeExpirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (objc_msgSend(v7, "length") && v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "laterDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 == v10)
      {
        if (IMOSLoggingEnabled(v12))
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v25 = 138412546;
            v26 = v7;
            v27 = 2112;
            v28 = v8;
            _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Previous downgrade request to %@ expired on %@, clearing", (uint8_t *)&v25, 0x16u);
          }

        }
        objc_msgSend(v6, "setRequestedDowngradeService:", 0);
        objc_msgSend(v6, "setRequestedDowngradeExpirationDate:", 0);
        v9 = 0;
      }
      else
      {
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDServiceSession service](self, "service");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "internalName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastIncomingMessageForChatWithIdentifier:chatStyle:onService:", v4, 45, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastIncomingMessageForChatWithIdentifier:chatStyle:onService:", v4, 45, v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "time");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "time");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (v16)
          {
            objc_msgSend(v19, "laterDate:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21 == v19;

            v9 = !v22;
          }
          else
          {
            v9 = 1;
          }
        }
        else
        {
          v9 = 0;
        }

      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

- (void)sentDowngradeRequestToHandleID:(id)a3 fromID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Downgrade request was sent to %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  -[IMDServiceSession sendReadReceiptForMessage:toChatID:identifier:style:reflectOnly:](self, "sendReadReceiptForMessage:toChatID:identifier:style:reflectOnly:", a3, a4, a5, a6, 0);
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7
{
  void *v8;
  id v9;

  objc_msgSend(a3, "guid");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendMessageReadReceiptForMessageID:account:](self, "didSendMessageReadReceiptForMessageID:account:", v9, v8);

}

- (void)sendDeliveredQuietlyReceiptForMessage:(id)a3 forIncomingMessageFromIDSID:(id)a4 toChatGuid:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 withWillSendToDestinationsHandler:(id)a8
{
  void *v9;
  id v10;

  objc_msgSend(a3, "guid");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendDeliveredQuietlyReceiptForMessageID:account:](self, "didSendDeliveredQuietlyReceiptForMessageID:account:", v10, v9);

}

- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  void *v7;
  id v8;

  objc_msgSend(a3, "guid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendNotifyRecipientCommandForMessageID:account:](self, "didSendNotifyRecipientCommandForMessageID:account:", v8, v7);

}

- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  void *v7;
  id v8;

  objc_msgSend(a3, "guid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendMessagePlayedReceiptForMessageID:account:](self, "didSendMessagePlayedReceiptForMessageID:account:", v8, v7);

}

- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  id v9;
  id v10;

  v9 = a7;
  objc_msgSend(a3, "guid");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendMessageSavedReceiptForMessageID:account:](self, "didSendMessageSavedReceiptForMessageID:account:", v10, v9);

}

- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  void *v7;
  id v8;

  objc_msgSend(a3, "guid");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendMessageSavedReceiptForMessageID:account:](self, "didSendMessageSavedReceiptForMessageID:account:", v8, v7);

}

- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1D166BF40(v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)sendDeliveryReceiptForMessageID:(id)a3 toID:(id)a4 deliveryContext:(id)a5 needsDeliveryReceipt:(id)a6 callerID:(id)a7 account:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint8_t v20[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Not sending delivery receipt", v20, 2u);
    }

  }
}

- (void)_blastDoorProcessingWithIMMessageItem:(id)a3 chat:(id)a4 account:(id)a5 fromToken:(id)a6 fromIDSID:(id)a7 fromIdentifier:(id)a8 toIdentifier:(id)a9 participants:(id)a10 groupName:(id)a11 groupID:(id)a12 isFromMe:(BOOL)a13 isLastFromStorage:(BOOL)a14 isFromStorage:(BOOL)a15 hideLockScreenNotification:(BOOL)a16 wantsCheckpointing:(BOOL)a17 needsDeliveryReceipt:(id)a18 messageBalloonPayloadAttachmentDictionary:(id)a19 inlineAttachments:(id)a20 attributionInfoArray:(id)a21 nicknameDictionary:(id)a22 availabilityVerificationRecipientChannelIDPrefix:(id)a23 availabilityVerificationRecipientEncryptionValidationToken:(id)a24 availabilityOffGridRecipientSubscriptionValidationToken:(id)a25 availabilityOffGridRecipientEncryptionValidationToken:(id)a26 idsService:(id)a27 messageContext:(id)a28 isFromTrustedSender:(BOOL)a29 isFromSnapTrustedSender:(BOOL)a30 completionBlock:(id)a31
{
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v36 = a4;
  v49 = a5;
  v50 = a6;
  v51 = a7;
  v52 = a8;
  v53 = a9;
  v54 = a10;
  v55 = a11;
  v56 = a12;
  v37 = a18;
  v57 = a19;
  v58 = a20;
  v59 = a21;
  v60 = a22;
  v61 = a23;
  v62 = a24;
  v38 = a25;
  v39 = a26;
  v40 = a27;
  v41 = a28;
  v42 = a31;
  if (IMOSLoggingEnabled(v42))
  {
    OSLogHandleForIMFoundationCategory();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = v36;
      -[IMDServiceSession service](self, "service");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "internalName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v46;
      _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "Not handling, blastdoor not supported in %{public}@ yet", buf, 0xCu);

      v36 = v44;
    }

  }
}

- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationTime:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint8_t v16[16];

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Not requesting group photo, subclass for iMessage should handle", v16, 2u);
    }

  }
}

- (void)sendLocationSharingInfo:(id)a3 toID:(id)a4 completionBlock:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)fetchIncomingPendingMessagesFromHandlesIDs:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  IMDServiceSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Service session %@ does not support message fetching", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (BOOL)_shouldBroadcastSendFailures
{
  return !-[IMDServiceSession isReplicating](self, "isReplicating");
}

- (void)didLeaveChat:(id)a3 style:(unsigned __int8)a4
{
  MEMORY[0x1E0DE7D20](self, sel_didLeaveChat_style_account_);
}

- (void)didLeaveChat:(id)a3 style:(unsigned __int8)a4 account:(id)a5
{
  -[IMDServiceSession didLeaveChat:style:account:messageID:](self, "didLeaveChat:style:account:messageID:", a3, a4, a5, 0);
}

- (void)didLeaveChat:(id)a3 style:(unsigned __int8)a4 account:(id)a5 messageID:(id)a6
{
  uint64_t v8;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  IMDChatStatusChangeContext *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v8 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v24 = a5;
  v25 = a6;
  if (IMOSLoggingEnabled(v25))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v27;
      v35 = 1024;
      v36 = v8;
      v37 = 1024;
      v38 = 3;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Did leave chat: %@  style: %c setting state: %d", buf, 0x18u);
    }

  }
  v26 = objc_alloc_init(IMDChatStatusChangeContext);
  -[IMDChatStatusChangeContext setMessageID:](v26, "setMessageID:", v25);
  -[IMDChatStatusChangeContext setAccount:](v26, "setAccount:", v24);
  -[IMDServiceSession didUpdateChatStatus:chat:style:context:](self, "didUpdateChatStatus:chat:style:context:", 3, v27, v8, v26);
  -[IMDServiceSession _guidForChat:style:](self, "_guidForChat:style:", v27, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allExistingChatsWithIdentifier:style:", v27, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v14)
    goto LABEL_20;
  v15 = 0;
  v16 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v29 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      objc_msgSend(v18, "guid", v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", v11);

      if ((v20 & 1) == 0)
      {
        if (IMOSLoggingEnabled(v21))
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v18;
            _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Leaving sibling chat %@", buf, 0xCu);
          }

        }
        objc_msgSend(v18, "setState:", 0);
        +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "storeChat:", v18);

        v15 = 1;
      }
    }
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v14);

  if ((v15 & 1) != 0)
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateStamp");
LABEL_20:

  }
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4
{
  -[IMDServiceSession didJoinChat:style:displayName:groupID:handleInfo:](self, "didJoinChat:style:displayName:groupID:handleInfo:", a3, a4, 0, 0, 0);
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 handleInfo:(id)a5
{
  -[IMDServiceSession didJoinChat:style:displayName:groupID:handleInfo:](self, "didJoinChat:style:displayName:groupID:handleInfo:", a3, a4, 0, 0, a5);
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 handleInfo:(id)a5 account:(id)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[IMDServiceSession didJoinChat:style:displayName:groupID:handleInfo:account:isBlackholed:](self, "didJoinChat:style:displayName:groupID:handleInfo:account:isBlackholed:", a3, a4, 0, 0, a5, a6, v6);
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 handleInfo:(id)a7
{
  MEMORY[0x1E0DE7D20](self, sel_didJoinChat_style_displayName_groupID_lastAddressedHandle_handleInfo_);
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 handleInfo:(id)a8
{
  -[IMDServiceSession didJoinChat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:](self, "didJoinChat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:", a3, a4, a5, a6, a7, 0, 0, a8);
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 handleInfo:(id)a8
{
  -[IMDServiceSession didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:](self, "didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:", a3, a4, a5, a6, a7, 0, a8);
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 handleInfo:(id)a9
{
  -[IMDServiceSession didJoinChat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:](self, "didJoinChat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:", a3, a4, a5, a6, 0, a7, a8, a9);
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v14 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (IMOSLoggingEnabled(v22))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138414082;
      v25 = v16;
      v26 = 1024;
      v27 = v14;
      v28 = 1024;
      v29 = 2;
      v30 = 2112;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      v34 = 2112;
      v35 = v19;
      v36 = 2112;
      v37 = v20;
      v38 = 2112;
      v39 = v21;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Did join chat: %@  style: %c setting state: %d   name: %@   groupID: %@ originalGroupID: %@ lastAddressedHandle %@ lastAddressedSIMID %@", buf, 0x4Au);
    }

  }
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:](self, "didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:", 2, v16, v14, v17, v18, v19, v20, v21, v22);

}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 handleInfo:(id)a8 category:(int64_t)a9 spamExtensionName:(id)a10
{
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v14 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413826;
      v25 = v16;
      v26 = 1024;
      v27 = v14;
      v28 = 1024;
      v29 = 2;
      v30 = 2112;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      v34 = 2048;
      v35 = a9;
      v36 = 2112;
      v37 = v21;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Did join chat: %@  style: %c setting state: %d   name: %@   groupID: %@  category %ld extensionName %@", buf, 0x40u);
    }

  }
  -[IMDServiceSession account](self, "account");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:handleInfo:account:category:spamExtensionName:](self, "didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:handleInfo:account:category:spamExtensionName:", 2, v16, v14, v17, v18, v19, v20, v23, a9, v21);

}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 handleInfo:(id)a7 account:(id)a8 isBlackholed:(BOOL)a9
{
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v13 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      v23 = v15;
      v24 = 1024;
      v25 = v13;
      v26 = 1024;
      v27 = 2;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Did join chat: %@  style: %c setting state: %d   name: %@   groupID: %@", buf, 0x2Cu);
    }

  }
  LOBYTE(v21) = a9;
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:handleInfo:account:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:handleInfo:account:isBlackholed:", 2, v15, v13, v16, v17, v18, v19, v21);

}

- (void)didJoinReadOnlyChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 handleInfo:(id)a7 category:(int64_t)a8 spamExtensionName:(id)a9
{
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v13 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413826;
      v23 = v15;
      v24 = 1024;
      v25 = v13;
      v26 = 1024;
      v27 = 7;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      v32 = 2048;
      v33 = a8;
      v34 = 2112;
      v35 = v19;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Did join chat: %@  style: %c setting state: %d   name: %@   groupID: %@  category %ld extensionName %@", buf, 0x40u);
    }

  }
  -[IMDServiceSession account](self, "account");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:handleInfo:account:category:spamExtensionName:](self, "didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:handleInfo:account:category:spamExtensionName:", 7, v15, v13, v16, v17, 0, v18, v21, a8, v19);

}

- (void)didReceiveReplaceMessageID:(int)a3 forChat:(id)a4 style:(unsigned __int8)a5
{
  int v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if (v5 == 45)
  {
    v13 = v8;
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession service](self, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "internalName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v9, "deleteMessagesWithReplaceMessageID:fromHandle:onService:", v6, v13, v11);

    v8 = v13;
  }

}

- (void)didReceiveErrorMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unsigned __int8 v17;

  v17 = a5;
  v16 = a4;
  v7 = a4;
  v8 = a3;
  -[IMDServiceSession _mapRoomChatToGroupChat:style:](self, "_mapRoomChatToGroupChat:style:", &v16, &v17);
  v9 = v16;

  v10 = objc_alloc(MEMORY[0x1E0C99D80]);
  v11 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", v8, *MEMORY[0x1E0CB2D50], 0);

  v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v13 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D36350], 0, v11);
  if (!-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
  {
    -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession accountID](self, "accountID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "account:chat:style:chatProperties:error:", v15, v9, v17, 0, v13);

  }
}

- (void)didReceiveError:(unsigned int)a3 forMessageID:(id)a4 forceError:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  -[IMDServiceSession account](self, "account");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didReceiveError:forMessageID:forceError:account:](self, "didReceiveError:forMessageID:forceError:account:", v6, v8, v5, v9);

}

- (void)didReceiveError:(unsigned int)a3 forMessageID:(id)a4 forceError:(BOOL)a5 account:(id)a6
{
  _BOOL4 v7;
  uint64_t v8;
  id v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _BYTE v30[18];
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = CFSTR("NO");
      *(_DWORD *)v30 = 67109634;
      *(_DWORD *)&v30[4] = v8;
      *(_WORD *)&v30[8] = 2112;
      if (v7)
        v13 = CFSTR("YES");
      *(_QWORD *)&v30[10] = v10;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_DEBUG, "error: %d  message: %@  force error: %@", v30, 0x1Cu);
    }

  }
  if (v10)
  {
    -[IMDServiceSession service](self, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportsDatabase");

    if (v15)
    {
      if (!v11)
      {
        -[IMDServiceSession account](self, "account");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance", *(_OWORD *)v30);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messageWithGUID:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        if (v7 || (v18 = objc_msgSend(v17, "isDelivered"), (v18 & 1) == 0))
        {
          if (IMOSLoggingEnabled(v18))
          {
            OSLogHandleForIMFoundationCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v30 = 138412546;
              *(_QWORD *)&v30[4] = v17;
              *(_WORD *)&v30[12] = 1024;
              *(_DWORD *)&v30[14] = v8;
              _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Found old message: %@  for error: %d", v30, 0x12u);
            }

          }
          objc_msgSend(v17, "setErrorCode:", v8);
          v22 = objc_msgSend(v17, "scheduleType");
          if ((_DWORD)v8 && v22 == 2)
            -[IMDServiceSession _handleScheduledMessageFailure:](self, "_handleScheduledMessageFailure:", v17);
          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v17, 0, 1, 0, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (IMOSLoggingEnabled(v24))
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v30 = 138412290;
              *(_QWORD *)&v30[4] = v20;
              _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Updated message: %@", v30, 0xCu);
            }

          }
          if (-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
          {
            objc_msgSend(v20, "guid");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDServiceSession noteSuppressedMessageUpdate:](self, "noteSuppressedMessageUpdate:", v26);
          }
          else
          {
            -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "accountID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "account:chat:style:chatProperties:messageUpdated:", v28, 0, 0, 0, v20);

          }
          objc_msgSend(v20, "guid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1D1591DF4(v29);

        }
        else
        {
          if (IMOSLoggingEnabled(v18))
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v30 = 138412290;
              *(_QWORD *)&v30[4] = v17;
              _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Message is already delivered, and we're not forcing an error here (%@)", v30, 0xCu);
            }

          }
          v20 = v17;
        }
      }
      else
      {
        if (IMOSLoggingEnabled(v18))
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v30 = 67109378;
            *(_DWORD *)&v30[4] = v8;
            *(_WORD *)&v30[8] = 2112;
            *(_QWORD *)&v30[10] = v10;
            _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Unable to mark error: %d, no messages found for guid: %@", v30, 0x12u);
          }

        }
        v20 = 0;
      }

    }
  }

}

- (void)didReceiveOffGridStatus:(BOOL)a3 forID:(id)a4 messageGUID:(id)a5 account:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BYTE v24[12];
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v8 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      *(_DWORD *)v24 = 138412802;
      if (v8)
        v14 = CFSTR("YES");
      *(_QWORD *)&v24[4] = v14;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Received off grid status %@ for %@ sending %@", v24, 0x20u);
    }

  }
  if (!v12)
  {
    -[IMDServiceSession account](self, "account");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance", *(_QWORD *)v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageWithGUID:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D38F68]))
    {
      v18 = objc_msgSend(v16, "isPendingSatelliteSend");

      if (v18 == v8)
      {
        v20 = v16;
        if (v8)
          goto LABEL_17;
        goto LABEL_22;
      }
      objc_msgSend(v16, "setIsPendingSatelliteSend:", v8);
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v16, 0, 0, 1, 0x20000000000);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accountID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "account:chat:style:chatProperties:messageUpdated:", v21, 0, 0, 0, v20);

    }
    else
    {
      v20 = v16;
    }

    if (v8)
      goto LABEL_17;
LABEL_22:
    -[IMDServiceSession _clearOffGridFlagForMessagesInChatWithChatIdentifier:account:](self, "_clearOffGridFlagForMessagesInChatWithChatIdentifier:account:", v10, v12);
    goto LABEL_23;
  }
  v20 = 0;
  if (!v8)
    goto LABEL_22;
LABEL_17:
  objc_msgSend(v20, "time");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    IMSetDomainValueForKey();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();

  }
  -[IMDServiceSession _updateUndeliveredMessagesPendingSatelliteSendForChatWithIdentifier:account:](self, "_updateUndeliveredMessagesPendingSatelliteSendForChatWithIdentifier:account:", v10, v12);
LABEL_23:

}

- (void)_updateUndeliveredMessagesPendingSatelliteSendForChatWithIdentifier:(id)a3 account:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = a4;
  v37 = v6;
  -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v6, 45);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession service](self, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "internalName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastIncomingMessageForChatWithIdentifier:chatStyle:onService:", v6, 45, v9);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "time");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v33 = v13;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %@"), *MEMORY[0x1E0D38298], v13);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0D382B8], MEMORY[0x1E0C9AAB0]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0D36100]);
    objc_msgSend(v38, "guid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithAssociatedChatGUID:", v15);

    v17 = (void *)MEMORY[0x1E0CB3528];
    v47[0] = v35;
    v47[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v19);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v20 = v16;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(v20);
          v24 = (void *)IMDCreateIMMessageItemFromIMDMessageRecordRef(*(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v25 = v24;
            v26 = objc_msgSend(v25, "expectedOffGridCapableDeliveries");
            if (v26)
            {
              if (IMOSLoggingEnabled(v26))
              {
                OSLogHandleForIMFoundationCategory();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v25, "guid");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v45 = v28;
                  _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Updating pending flag for %@", buf, 0xCu);

                }
              }
              objc_msgSend(v25, "setIsPendingSatelliteSend:", 1);
              +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v25, 0, 0, 1, 0x20000000000);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "accountID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "account:chat:style:chatProperties:messageUpdated:", v32, 0, 0, 0, v30);

            }
            else
            {
              v30 = v25;
            }

          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v21);
    }

  }
}

- (void)_clearOffGridFlagForMessagesInChatWithChatIdentifier:(id)a3 account:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = a4;
  v28 = v6;
  -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v6, 45);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v7 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), *MEMORY[0x1E0D382D0], MEMORY[0x1E0C9AAB0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), *MEMORY[0x1E0D382B8], v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D36100]);
    objc_msgSend(v29, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithAssociatedChatGUID:", v9);

    v11 = (void *)MEMORY[0x1E0CB3528];
    v38[0] = v27;
    v38[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v13);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v14);
          v18 = (void *)IMDCreateIMMessageItemFromIMDMessageRecordRef(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = v18;
            if (IMOSLoggingEnabled(v19))
            {
              OSLogHandleForIMFoundationCategory();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v19, "guid");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v36 = v21;
                _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Clearing pending flag for %@", buf, 0xCu);

              }
            }
            objc_msgSend(v19, "setIsPendingSatelliteSend:", 0);
            objc_msgSend(v19, "setExpectedOffGridCapableDeliveries:", 0);
            +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v19, 0, 0, 1, 0x20000000000);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "accountID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "account:chat:style:chatProperties:messageUpdated:", v25, 0, 0, 0, v23);

          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v15);
    }

  }
}

- (void)didReceiveMessageEditingUnsupportedHandleIDs:(id)a3 forMessageGUID:(id)a4 partIndex:(int64_t)a5 previousMessage:(id)a6 backwardCompatibilityMessageGUID:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  IMDServiceSession *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  IMDServiceSession *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int64_t v49;
  id v50;

  v11 = a3;
  v12 = a4;
  v50 = a7;
  if (objc_msgSend(v11, "count"))
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageWithGUID:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v14;
      v49 = a5;
      objc_msgSend(v14, "messageSummaryInfo");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = (void *)MEMORY[0x1E0C9AA70];
      if (v16)
        v18 = (void *)v16;
      v19 = v18;

      v20 = (void *)objc_msgSend(v19, "mutableCopy");
      v21 = *MEMORY[0x1E0D38368];
      objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D38368]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0C9AA60];
      if (v22)
        v23 = v22;
      v24 = v23;

      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v24);
      objc_msgSend(v25, "addObjectsFromArray:", v11);
      objc_msgSend(v25, "array");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, v21);
      v48 = v20;
      v27 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v15, "setMessageSummaryInfo:", v27);

      if (objc_msgSend(v50, "length"))
      {
        v47 = v26;
        objc_msgSend(v15, "historyForMessagePart:", v49);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "count"))
        {
          v29 = (void *)objc_msgSend(v28, "mutableCopy");
          objc_msgSend(v29, "lastObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v25;
          v31 = objc_alloc(MEMORY[0x1E0D39938]);
          objc_msgSend(v30, "messagePartText");
          v46 = v13;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "dateSent");
          v33 = self;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v31, "initWithMessagePartText:dateSent:backwardCompatibleMessageGUID:", v32, v34, v50);

          self = v33;
          objc_msgSend(v29, "removeLastObject");
          objc_msgSend(v29, "addObject:", v35);
          v36 = (void *)objc_msgSend(v29, "copy");
          objc_msgSend(v15, "setHistory:forMessagePart:", v36, v49);

          v13 = v46;
          v25 = v45;

        }
        v26 = v47;
      }
      objc_msgSend(v13, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v15, 1, 0, 0, 0);
      v37 = objc_claimAutoreleasedReturnValue();

      if (-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
      {
        -[IMDServiceSession noteSuppressedMessageUpdate:](self, "noteSuppressedMessageUpdate:", v12);
      }
      else
      {
        -[IMDServiceSession account](self, "account");
        v38 = v25;
        v39 = v13;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "accountID");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = self;
        v43 = (void *)v41;
        -[IMDServiceSession broadcasterForChatListeners](v42, "broadcasterForChatListeners");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "account:chat:style:chatProperties:messageUpdated:", v43, 0, 0, 0, v37);

        v13 = v39;
        v25 = v38;
      }
      sub_1D1591DF4(v12);

    }
    else
    {
      IMLogHandleForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_1D166BF74();
    }

  }
}

- (void)didReceiveMessageEditingSendFailure:(unsigned int)a3 forMessageGUID:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a4;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageWithGUID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;
    if (a6 == 2)
    {
      objc_msgSend(v11, "addFailedRetractPartIndex:", a5);
    }
    else if (a6 == 1)
    {
      objc_msgSend(v11, "addFailedEditPartIndex:", a5);
    }
    objc_msgSend(v10, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v12, 1, 1, 0, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    if (-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
    {
      -[IMDServiceSession noteSuppressedMessageUpdate:](self, "noteSuppressedMessageUpdate:", v9);
    }
    else
    {
      -[IMDServiceSession account](self, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accountID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "account:chat:style:chatProperties:messageUpdated:", v15, 0, 0, 0, v13);

    }
    sub_1D1591DF4(v9);
  }
  else
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1D166BFD4();
  }

}

- (void)didSendMessageEditForMessageGUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageWithGUID:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[NSObject messageSummaryInfo](v6, "messageSummaryInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA70];
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    v12 = *MEMORY[0x1E0D38360];
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D38360]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D38398];
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D38398]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count") || objc_msgSend(v15, "count"))
    {
      IMLogHandleForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1D166C094();

      v17 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v17, "removeObjectForKey:", v12);
      objc_msgSend(v17, "removeObjectForKey:", v14);
      v18 = (void *)objc_msgSend(v17, "copy");
      -[NSObject setMessageSummaryInfo:](v7, "setMessageSummaryInfo:", v18);

      objc_msgSend(v5, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v7, 1, 1, 0, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      if (-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
      {
        -[IMDServiceSession noteSuppressedMessageUpdate:](self, "noteSuppressedMessageUpdate:", v4);
      }
      else
      {
        -[IMDServiceSession account](self, "account");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "accountID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "account:chat:style:chatProperties:messageUpdated:", v21, 0, 0, 0, v19);

      }
      sub_1D1591DF4(v4);
    }
    else
    {
      v19 = v7;
    }

  }
  else
  {
    IMLogHandleForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1D166C034();
  }

}

- (void)didSendMessageReadReceiptForMessageID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDServiceSession account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendMessageReadReceiptForMessageID:account:](self, "didSendMessageReadReceiptForMessageID:account:", v4, v5);

}

- (void)didSendMessageReadReceiptForMessageID:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v30 = 138412290;
      v31 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEBUG, "message: %@", (uint8_t *)&v30, 0xCu);
    }

  }
  if (v6)
  {
    -[IMDServiceSession service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsDatabase");

    if (v10)
    {
      if (!v7)
      {
        -[IMDServiceSession account](self, "account");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageWithGUID:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession service](self, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internalName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12 || !v13 || !v15)
        goto LABEL_26;
      v17 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v15, v13);
      if (v17)
      {
        if (IMOSLoggingEnabled(v17))
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v30 = 138412290;
            v31 = v12;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Found old message for read receipt: %@", (uint8_t *)&v30, 0xCu);
          }

        }
        objc_msgSend(v12, "timeRead");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19 == 0;

        if (v20)
        {
          objc_msgSend(v12, "setFlags:", objc_msgSend(v12, "flags") | 0x2000);
          objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTimeRead:", v22);

          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v12, 0, 0, 1, 0x2000);
          v24 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v24;
        }
        if (IMOSLoggingEnabled(v21))
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v30 = 138412290;
            v31 = v12;
            _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Updated message: %@", (uint8_t *)&v30, 0xCu);
          }

        }
        if (-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
        {
          objc_msgSend(v12, "guid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDServiceSession noteSuppressedMessageUpdate:](self, "noteSuppressedMessageUpdate:", v26);
        }
        else
        {
          -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "accountID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "account:chat:style:chatProperties:messageUpdated:", v28, 0, 0, 0, v12);

        }
        objc_msgSend(v12, "guid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1D1591DF4(v29);

        goto LABEL_36;
      }
      v16 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v15, v13);
      if (!v16)
      {
        if (!IMOSLoggingEnabled(v16))
          goto LABEL_36;
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v30 = 138412546;
          v31 = v13;
          v32 = 2112;
          v33 = v15;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Unable to mark send of read receipt, message is on a different service: %@ vs %@", (uint8_t *)&v30, 0x16u);
        }
      }
      else
      {
LABEL_26:
        if (!IMOSLoggingEnabled(v16))
        {
LABEL_36:

          goto LABEL_37;
        }
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v30 = 138412290;
          v31 = v6;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Unable to mark send of read receipt, no messages found for guid: %@", (uint8_t *)&v30, 0xCu);
        }
      }

      goto LABEL_36;
    }
  }
LABEL_37:

}

- (void)didSendDeliveredQuietlyReceiptForMessageID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDServiceSession account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendDeliveredQuietlyReceiptForMessageID:account:](self, "didSendDeliveredQuietlyReceiptForMessageID:account:", v4, v5);

}

- (void)didSendDeliveredQuietlyReceiptForMessageID:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v29 = 138412290;
      v30 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEBUG, "message: %@", (uint8_t *)&v29, 0xCu);
    }

  }
  if (v6)
  {
    -[IMDServiceSession service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsDatabase");

    if (v10)
    {
      if (!v7)
      {
        -[IMDServiceSession account](self, "account");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageWithGUID:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession service](self, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internalName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12 || !v13 || !v15)
        goto LABEL_31;
      v17 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v15, v13);
      if (v17)
      {
        if (IMOSLoggingEnabled(v17))
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v29 = 138412290;
            v30 = v12;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Found old message for delivered quietly receipt: %@", (uint8_t *)&v29, 0xCu);
          }

        }
        v19 = objc_msgSend(v12, "isFromMe");
        if ((v19 & 1) == 0)
        {
          v19 = objc_msgSend(v12, "wasDeliveredQuietly");
          if ((v19 & 1) == 0)
          {
            if (IMOSLoggingEnabled(v19))
            {
              OSLogHandleForIMFoundationCategory();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v12, "guid");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = 138412290;
                v30 = v21;
                _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Setting was delivered quietly flag on local device for message: %@", (uint8_t *)&v29, 0xCu);

              }
            }
            objc_msgSend(v12, "setFlags:", objc_msgSend(v12, "flags") | 0x400000000);
            +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v12, 0, 0, 1, 0x400000000);
            v23 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v23;
          }
        }
        if (IMOSLoggingEnabled(v19))
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v29 = 138412290;
            v30 = v12;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Updated message: %@", (uint8_t *)&v29, 0xCu);
          }

        }
        if (-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
        {
          objc_msgSend(v12, "guid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDServiceSession noteSuppressedMessageUpdate:](self, "noteSuppressedMessageUpdate:", v25);
        }
        else
        {
          -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "accountID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "account:chat:style:chatProperties:messageUpdated:", v27, 0, 0, 0, v12);

        }
        objc_msgSend(v12, "guid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1D1591DF4(v28);

        goto LABEL_41;
      }
      v16 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v15, v13);
      if (!v16)
      {
        if (!IMOSLoggingEnabled(v16))
          goto LABEL_41;
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v29 = 138412546;
          v30 = v13;
          v31 = 2112;
          v32 = v15;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Unable to mark message delivered quietly, message is on a different service: %@ vs %@", (uint8_t *)&v29, 0x16u);
        }
      }
      else
      {
LABEL_31:
        if (!IMOSLoggingEnabled(v16))
        {
LABEL_41:

          goto LABEL_42;
        }
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v29 = 138412290;
          v30 = v6;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Unable to mark message delivered quietly, no messages found for guid: %@", (uint8_t *)&v29, 0xCu);
        }
      }

      goto LABEL_41;
    }
  }
LABEL_42:

}

- (void)didSendNotifyRecipientCommandForMessageID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDServiceSession account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendNotifyRecipientCommandForMessageID:account:](self, "didSendNotifyRecipientCommandForMessageID:account:", v4, v5);

}

- (void)didSendNotifyRecipientCommandForMessageID:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v29 = 138412290;
      v30 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEBUG, "message: %@", (uint8_t *)&v29, 0xCu);
    }

  }
  if (v6)
  {
    -[IMDServiceSession service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsDatabase");

    if (v10)
    {
      if (!v7)
      {
        -[IMDServiceSession account](self, "account");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageWithGUID:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession service](self, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internalName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12 || !v13 || !v15)
        goto LABEL_31;
      v17 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v15, v13);
      if (v17)
      {
        if (IMOSLoggingEnabled(v17))
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v29 = 138412290;
            v30 = v12;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Found old message for notify recipient command: %@", (uint8_t *)&v29, 0xCu);
          }

        }
        v19 = objc_msgSend(v12, "isFromMe");
        if ((v19 & 1) == 0)
        {
          v19 = objc_msgSend(v12, "didNotifyRecipient");
          if ((v19 & 1) == 0)
          {
            if (IMOSLoggingEnabled(v19))
            {
              OSLogHandleForIMFoundationCategory();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v12, "guid");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = 138412290;
                v30 = v21;
                _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Setting did notify recipient flag on local device for message: %@", (uint8_t *)&v29, 0xCu);

              }
            }
            objc_msgSend(v12, "setFlags:", objc_msgSend(v12, "flags") | 0x800000000);
            +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v12, 0, 0, 1, 0x800000000);
            v23 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v23;
          }
        }
        if (IMOSLoggingEnabled(v19))
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v29 = 138412290;
            v30 = v12;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Updated message: %@", (uint8_t *)&v29, 0xCu);
          }

        }
        if (-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
        {
          objc_msgSend(v12, "guid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDServiceSession noteSuppressedMessageUpdate:](self, "noteSuppressedMessageUpdate:", v25);
        }
        else
        {
          -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "accountID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "account:chat:style:chatProperties:messageUpdated:", v27, 0, 0, 0, v12);

        }
        objc_msgSend(v12, "guid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1D1591DF4(v28);

        goto LABEL_41;
      }
      v16 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v15, v13);
      if (!v16)
      {
        if (!IMOSLoggingEnabled(v16))
          goto LABEL_41;
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v29 = 138412546;
          v30 = v13;
          v31 = 2112;
          v32 = v15;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Unable to mark message notified command, message is on a different service: %@ vs %@", (uint8_t *)&v29, 0x16u);
        }
      }
      else
      {
LABEL_31:
        if (!IMOSLoggingEnabled(v16))
        {
LABEL_41:

          goto LABEL_42;
        }
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v29 = 138412290;
          v30 = v6;
          _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Unable to mark message notified command, no messages found for guid: %@", (uint8_t *)&v29, 0xCu);
        }
      }

      goto LABEL_41;
    }
  }
LABEL_42:

}

- (void)didSendMessagePlayedReceiptForMessageID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDServiceSession account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendMessagePlayedReceiptForMessageID:account:](self, "didSendMessagePlayedReceiptForMessageID:account:", v4, v5);

}

- (void)didSendMessagePlayedReceiptForMessageID:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  void *v21;
  _BOOL4 v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  int v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v35 = 138412290;
      v36 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEBUG, "message: %@", (uint8_t *)&v35, 0xCu);
    }

  }
  if (v6)
  {
    -[IMDServiceSession service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsDatabase");

    if (v10)
    {
      if (!v7)
      {
        -[IMDServiceSession account](self, "account");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageWithGUID:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession service](self, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internalName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12 || !v13 || !v15)
        goto LABEL_25;
      v17 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v15, v13);
      if (v17)
      {
        if (IMOSLoggingEnabled(v17))
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v35 = 138412290;
            v36 = v12;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Found old message for played receipt: %@", (uint8_t *)&v35, 0xCu);
          }

        }
        if (objc_msgSend(v12, "isExpirable")
          && (objc_msgSend(v12, "isFromMe") & 1) == 0
          && (v19 = objc_msgSend(v12, "expireState"), v19 <= 0))
        {
          if (IMOSLoggingEnabled(v19))
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v12, "guid");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = 138412290;
              v36 = v34;
              _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Expire received message played on local device: %@", (uint8_t *)&v35, 0xCu);

            }
          }
          objc_msgSend(v12, "setExpireState:", 1);
          v20 = 1;
        }
        else
        {
          v20 = 0;
        }
        objc_msgSend(v12, "timePlayed");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21 == 0;

        if (v22)
        {
          objc_msgSend(v12, "setFlags:", objc_msgSend(v12, "flags") | 0x400000);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setTimePlayed:", v25);

        }
        else if (!v20)
        {
          goto LABEL_35;
        }
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v12, 0, 0, 1, 0x400000);
        v27 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v27;
LABEL_35:
        if (IMOSLoggingEnabled(v23))
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v35 = 138412290;
            v36 = v12;
            _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Updated message: %@", (uint8_t *)&v35, 0xCu);
          }

        }
        if (-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
        {
          objc_msgSend(v12, "guid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDServiceSession noteSuppressedMessageUpdate:](self, "noteSuppressedMessageUpdate:", v29);
        }
        else
        {
          -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "accountID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "account:chat:style:chatProperties:messageUpdated:", v30, 0, 0, 0, v12);

        }
        if (v20)
        {
          objc_msgSend(v12, "guid");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDServiceSession _updateExpireStateForMessageGUID:](self, "_updateExpireStateForMessageGUID:", v31);

        }
        objc_msgSend(v12, "guid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1D1591DF4(v32);

        goto LABEL_45;
      }
      v16 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v15, v13);
      if (!v16)
      {
        if (!IMOSLoggingEnabled(v16))
          goto LABEL_45;
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v35 = 138412546;
          v36 = v13;
          v37 = 2112;
          v38 = v15;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Unable to mark send of played receipt, message is on a different service: %@ vs %@", (uint8_t *)&v35, 0x16u);
        }
      }
      else
      {
LABEL_25:
        if (!IMOSLoggingEnabled(v16))
        {
LABEL_45:

          goto LABEL_46;
        }
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v35 = 138412290;
          v36 = v6;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Unable to mark send of played receipt, no messages found for guid: %@", (uint8_t *)&v35, 0xCu);
        }
      }

      goto LABEL_45;
    }
  }
LABEL_46:

}

- (void)didSendMessageSavedReceiptForMessageID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDServiceSession account](self, "account");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendMessageSavedReceiptForMessageID:account:](self, "didSendMessageSavedReceiptForMessageID:account:", v4, v5);

}

- (void)didSendMessageSavedReceiptForMessageID:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v27 = 138412290;
      v28 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_DEBUG, "message: %@", (uint8_t *)&v27, 0xCu);
    }

  }
  if (v6)
  {
    -[IMDServiceSession service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsDatabase");

    if (v10)
    {
      if (!v7)
      {
        -[IMDServiceSession account](self, "account");
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageWithGUID:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "service");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession service](self, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "internalName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12 || !v13 || !v15)
        goto LABEL_26;
      v17 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v15, v13);
      if (v17)
      {
        if (IMOSLoggingEnabled(v17))
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v27 = 138412290;
            v28 = v12;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Found old message for saved receipt: %@", (uint8_t *)&v27, 0xCu);
          }

        }
        v19 = objc_msgSend(v12, "expireState");
        if (v19 != 3)
        {
          objc_msgSend(v12, "setExpireState:", 3);
          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v12, 0, 0, 0, 0);
          v21 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v21;
        }
        if (IMOSLoggingEnabled(v19))
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v27 = 138412290;
            v28 = v12;
            _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Updated message: %@", (uint8_t *)&v27, 0xCu);
          }

        }
        if (-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
        {
          objc_msgSend(v12, "guid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDServiceSession noteSuppressedMessageUpdate:](self, "noteSuppressedMessageUpdate:", v23);
        }
        else
        {
          -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "accountID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "account:chat:style:chatProperties:messageUpdated:", v25, 0, 0, 0, v12);

        }
        objc_msgSend(v12, "guid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1D1591DF4(v26);

        goto LABEL_36;
      }
      v16 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v15, v13);
      if (!v16)
      {
        if (!IMOSLoggingEnabled(v16))
          goto LABEL_36;
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v27 = 138412546;
          v28 = v13;
          v29 = 2112;
          v30 = v15;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Unable to mark send of saved receipt, message is on a different service: %@ vs %@", (uint8_t *)&v27, 0x16u);
        }
      }
      else
      {
LABEL_26:
        if (!IMOSLoggingEnabled(v16))
        {
LABEL_36:

          goto LABEL_37;
        }
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v27 = 138412290;
          v28 = v6;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Unable to mark send of saved receipt, no messages found for guid: %@", (uint8_t *)&v27, 0xCu);
        }
      }

      goto LABEL_36;
    }
  }
LABEL_37:

}

- (void)didSendSyndicationActionItem:(id)a3 forChat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  NSObject *v34;
  int v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[IMDServiceSession service](self, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supportsDatabase");

    if (v9)
    {
      if (!v7)
      {
        IMLogHandleForCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1D166C0F4();
        goto LABEL_32;
      }
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "guid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 138412546;
          v36 = v6;
          v37 = 2112;
          v38 = v12;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Received didSendSyndicationAction: %@ for Chat: %@", (uint8_t *)&v35, 0x16u);

        }
      }
      v13 = objc_msgSend(v6, "syndicatedItemType");
      if (v13 == 2)
      {
        v14 = v6;
        v26 = objc_msgSend(v7, "updateDonationStateWithSyndicationAction:", v14);
        v27 = v26;
        if (IMOSLoggingEnabled(v26))
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = -[NSObject isAutoDonatingMessages](v14, "isAutoDonatingMessages");
            -[NSObject chatGUID](v14, "chatGUID");
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v30;
            v32 = CFSTR("NO");
            if (v27)
              v33 = CFSTR("YES");
            else
              v33 = CFSTR("NO");
            v35 = 138412802;
            if (v29)
              v32 = CFSTR("YES");
            v36 = (id)v32;
            v37 = 2112;
            v38 = (void *)v33;
            v39 = 2112;
            v40 = v30;
            _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Updated syndication state to: %@ was successful: %@ for chat with GUID: %@", (uint8_t *)&v35, 0x20u);

          }
        }
        goto LABEL_32;
      }
      if (v13 == 1)
      {
        v14 = v6;
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "updateSyndicatedMessageWithSyndicationMessageAction:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = IMOSLoggingEnabled(v17);
        if (v16)
        {
          if (v18)
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              -[NSObject messagePartGUID](v14, "messagePartGUID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = 138412546;
              v36 = v20;
              v37 = 2112;
              v38 = v14;
              _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Updated message: %@ with action item: %@", (uint8_t *)&v35, 0x16u);

            }
          }
          -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "accountID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "chatIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v7, "style");
          objc_msgSend(v7, "properties");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "account:chat:style:chatProperties:messageUpdated:", v22, v23, v24, v25, v16);

        }
        else if (v18)
        {
          OSLogHandleForIMFoundationCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = 138412290;
            v36 = v14;
            _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Message not update updated for SyndicationAction - doing nothing with syndication action: %@", (uint8_t *)&v35, 0xCu);
          }

        }
LABEL_32:

      }
    }
  }

}

- (BOOL)didReceiveMessageDeliveryReceiptForMessageID:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[IMDServiceSession account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMDServiceSession _didReceiveMessageDeliveryReceiptForMessageID:attempts:date:account:](self, "_didReceiveMessageDeliveryReceiptForMessageID:attempts:date:account:", v7, 0, v6, v8);

  return (char)self;
}

- (BOOL)didReceiveMessageDeliveryReceiptForMessageID:(id)a3 date:(id)a4 account:(id)a5
{
  return -[IMDServiceSession _didReceiveMessageDeliveryReceiptForMessageID:attempts:date:account:](self, "_didReceiveMessageDeliveryReceiptForMessageID:attempts:date:account:", a3, 0, a4, a5);
}

- (BOOL)_didReceiveMessageDeliveryReceiptForMessageID:(id)a3 attempts:(int64_t)a4 date:(id)a5 account:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  uint64_t (**v29)(void);
  id v30;
  id v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  IMDServiceSession *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v10;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEBUG, "message: %@", buf, 0xCu);
    }

  }
  if (v10
    && (-[IMDServiceSession service](self, "service"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "supportsDatabase"),
        v14,
        v15))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D15955F8;
    aBlock[3] = &unk_1E922DF00;
    v16 = v10;
    v34 = v16;
    v35 = self;
    v28 = v11;
    v36 = v28;
    v17 = v12;
    v37 = v17;
    v29 = (uint64_t (**)(void))_Block_copy(aBlock);
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasStoredMessageWithGUID:", v16);

    if (v19)
    {
      v21 = v29[2]();
    }
    else
    {
      v22 = IMOSLoggingEnabled(v20);
      if (a4 >= 6)
      {
        if ((_DWORD)v22)
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v16;
            _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as read, bailing", buf, 0xCu);
          }

        }
      }
      else
      {
        if ((_DWORD)v22)
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v16;
            _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as delivered, trying again in a bit", buf, 0xCu);
          }

        }
        if (a4 == 5)
        {
          if (IMOSLoggingEnabled(v22))
          {
            OSLogHandleForIMFoundationCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
            }

          }
        }
        else if (a4 == 4 && IMOSLoggingEnabled(v22))
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
          }

        }
        v30 = v16;
        v31 = v28;
        v32 = v17;
        im_dispatch_after();

      }
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)_handleScheduledMessageFailure:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v18 = a3;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWithGUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "scheduleType") == 2)
  {
    v6 = objc_msgSend(v5, "scheduleState");
    switch(v6)
    {
      case 3:
        objc_msgSend(v18, "setScheduleType:", objc_msgSend(v5, "scheduleType"));
        objc_msgSend(v18, "setScheduleState:", objc_msgSend(v5, "scheduleState"));
        objc_msgSend(v5, "messageSummaryInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setMessageSummaryInfo:", v9);

        objc_msgSend(v5, "body");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setBody:", v10);

        objc_msgSend(v18, "setErrorCode:", objc_msgSend(v5, "errorCode"));
        break;
      case 2:
        objc_msgSend(v18, "setErrorCode:", 0);
        objc_msgSend(v18, "editedPartIndexes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFailedEditPartIndexes:", v11);

        objc_msgSend(v18, "retractedPartIndexes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFailedRetractPartIndexes:", v12);

        objc_msgSend(v18, "retractedPartIndexes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = sub_1D15961CC;
        v19[3] = &unk_1E922DF50;
        v14 = v18;
        v20 = v14;
        objc_msgSend(v13, "enumerateIndexesUsingBlock:", v19);

        objc_msgSend(v14, "retractedPartIndexes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          objc_msgSend(v14, "scheduledMessageOriginalTransferGUIDs");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setFileTransferGUIDs:", v17);

        }
        break;
      case 1:
        objc_msgSend(v18, "setScheduleState:", 4);
        objc_msgSend(v18, "guid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDScheduledMessageCoordinator notifyPeersWithScheduledMessageUpdate:scheduleState:](IMDScheduledMessageCoordinator, "notifyPeersWithScheduledMessageUpdate:scheduleState:", v7, 4);

        break;
    }
  }
  else
  {
    objc_msgSend(v18, "setScheduleType:", objc_msgSend(v5, "scheduleType"));
    objc_msgSend(v18, "setScheduleState:", objc_msgSend(v5, "scheduleState"));
    objc_msgSend(v18, "setErrorCode:", objc_msgSend(v5, "errorCode"));
    objc_msgSend(v5, "messageSummaryInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMessageSummaryInfo:", v8);

  }
}

- (void)updateChatGUID:(id)a3 withLastReadTimeStamp:(int64_t)a4 withLastSeenMessageGUID:(id)a5 fromMe:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v9 = a5;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chatsForMessageGUID:", v23);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Found chats to mark as read: %@", buf, 0xCu);
    }

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v11;
  v15 = -[__CFString countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  v16 = v15;
  if (v15)
  {
    v17 = *(_QWORD *)v26;
    v18 = CFSTR("NO");
    if (v6)
      v18 = CFSTR("YES");
    v24 = v18;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
        if (IMOSLoggingEnabled(v15))
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v30 = v24;
            v31 = 2112;
            v32 = v20;
            _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Updating local chat (fromMe: %@): %@", buf, 0x16u);
          }

        }
        if (v6)
        {
          objc_msgSend(v20, "updateLastReadMessageTimeStampIfNeeded:", a4);
          objc_msgSend(v20, "updateLastSeenMessageGuidIfNeeded:", v9);
        }
        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:", v20, 0, 0, v6);

        ++v19;
      }
      while (v16 != v19);
      v15 = -[__CFString countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      v16 = v15;
    }
    while (v15);
  }

}

- (void)_didReceiveMessageReadForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  uint64_t (**v12)(_QWORD);
  uint64_t (**v13)(_QWORD);
  uint64_t v14;
  NSObject *v15;
  void *v16;
  char v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  id v38;
  void *v39;
  void (**v40)(_QWORD);
  id v41;
  id v42;
  _QWORD aBlock[4];
  id v44;
  IMDServiceSession *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (uint64_t (**)(_QWORD))a6;
  v13 = v12;
  if (self->_activated)
  {
    v14 = IMOSLoggingEnabled(v12);
    if ((_DWORD)v14)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v10;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }

    }
    if (v10
      && (-[IMDServiceSession service](self, "service"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "supportsDatabase"),
          v16,
          (v17 & 1) != 0))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D1596B60;
      aBlock[3] = &unk_1E92286D8;
      v18 = v10;
      v44 = v18;
      v45 = self;
      v38 = v11;
      v46 = v38;
      v19 = v13;
      v47 = v19;
      v40 = (void (**)(_QWORD))_Block_copy(aBlock);
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hasStoredMessageWithGUID:", v18);

      if (v21)
      {
        v40[2](v40);
      }
      else
      {
        v24 = IMOSLoggingEnabled(v22);
        if (a5 >= 6)
        {
          if (v24)
          {
            OSLogHandleForIMEventCategory();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v18;
              _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as read, bailing", buf, 0xCu);
            }

          }
          -[IMDServiceSession _IDSService](self, "_IDSService", v38);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "_IMDTrackMetric:ForMessageGUID:", 10401, v18);

        }
        else
        {
          if (v24)
          {
            OSLogHandleForIMEventCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v18;
              _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as read, trying again in a bit", buf, 0xCu);
            }

          }
          -[IMDServiceSession _IDSService](self, "_IDSService", v38);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_IMDTrackMetric:ForMessageGUID:", 10401, v18);

          if (a5 == 5)
          {
            if (IMOSLoggingEnabled(v27))
            {
              OSLogHandleForIMFoundationCategory();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
              }

            }
          }
          else if (a5 == 4 && IMOSLoggingEnabled(v27))
          {
            OSLogHandleForIMFoundationCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
            }

          }
          v41 = v18;
          v42 = v39;
          im_dispatch_after();

        }
        if (v19)
          v19[2](v19);
      }

    }
    else
    {
      if (v13)
        v14 = v13[2](v13);
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMEventCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          -[IMDServiceSession service](self, "service");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "supportsDatabase");
          -[IMDServiceSession service](self, "service");
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          v37 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          v49 = v10;
          v50 = 2112;
          if (v34)
            v37 = CFSTR("YES");
          v51 = v37;
          v52 = 2112;
          v53 = v35;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Returning early in _didReceiveMessageReadForMessageID because messageID: %@, [[self service] supportsDatabase]: %@, service: %@", buf, 0x20u);

        }
      }
    }
  }
  else
  {
    if (v12)
      v12 = (uint64_t (**)(_QWORD))v12[2](v12);
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMEventCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Returning early in _didReceiveMessageReadForMessageID because !_activated", buf, 2u);
      }

    }
  }

}

- (void)didReceiveMessageReadForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel__didReceiveMessageReadForMessageID_date_attempts_completionBlock_);
}

- (void)_didReceiveMessageReadReceiptForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  NSObject *v14;
  void *v15;
  char v16;
  id v17;
  void (**v18)(_QWORD);
  void (**v19)(_QWORD);
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  IMDServiceSession *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  v13 = v12;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v10;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }

    }
    if (v10
      && (-[IMDServiceSession service](self, "service"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "supportsDatabase"),
          v15,
          (v16 & 1) != 0))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D1597A7C;
      aBlock[3] = &unk_1E92286D8;
      v17 = v10;
      v32 = v17;
      v33 = self;
      v28 = v11;
      v34 = v28;
      v18 = v13;
      v35 = v18;
      v19 = (void (**)(_QWORD))_Block_copy(aBlock);
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hasStoredMessageWithGUID:", v17);

      if (v21)
      {
        v19[2](v19);
      }
      else
      {
        v23 = IMOSLoggingEnabled(v22);
        if (a5 >= 6)
        {
          if ((_DWORD)v23)
          {
            OSLogHandleForIMFoundationCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v17;
              _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as read, bailing", buf, 0xCu);
            }

          }
        }
        else
        {
          if ((_DWORD)v23)
          {
            OSLogHandleForIMEventCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v17;
              _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as read, trying again in a bit", buf, 0xCu);
            }

          }
          if (a5 == 5)
          {
            if (IMOSLoggingEnabled(v23))
            {
              OSLogHandleForIMFoundationCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
              }

            }
          }
          else if (a5 == 4 && IMOSLoggingEnabled(v23))
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
            }

          }
          v29 = v17;
          v30 = v28;
          im_dispatch_after();

        }
        if (v18)
          v18[2](v18);
      }

    }
    else if (v13)
    {
      v13[2](v13);
    }
  }
  else if (v12)
  {
    v12[2](v12);
  }

}

- (void)didReceiveMessageReadReceiptForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (self->_activated)
  {
    -[IMDServiceSession _didReceiveMessageReadReceiptForMessageID:date:attempts:completionBlock:](self, "_didReceiveMessageReadReceiptForMessageID:date:attempts:completionBlock:", v11, v8, 0, v9);
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_didReceiveMessagePlayedForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  NSObject *v14;
  void *v15;
  char v16;
  id v17;
  void (**v18)(_QWORD);
  void (**v19)(_QWORD);
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  IMDServiceSession *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  v13 = v12;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v10;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }

    }
    if (v10
      && (-[IMDServiceSession service](self, "service"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "supportsDatabase"),
          v15,
          (v16 & 1) != 0))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D1598408;
      aBlock[3] = &unk_1E92286D8;
      v17 = v10;
      v32 = v17;
      v33 = self;
      v28 = v11;
      v34 = v28;
      v18 = v13;
      v35 = v18;
      v19 = (void (**)(_QWORD))_Block_copy(aBlock);
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hasStoredMessageWithGUID:", v17);

      if (v21)
      {
        v19[2](v19);
      }
      else
      {
        v23 = IMOSLoggingEnabled(v22);
        if (a5 >= 6)
        {
          if ((_DWORD)v23)
          {
            OSLogHandleForIMFoundationCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v17;
              _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as played, bailing", buf, 0xCu);
            }

          }
        }
        else
        {
          if ((_DWORD)v23)
          {
            OSLogHandleForIMFoundationCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v17;
              _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as played, trying again in a bit", buf, 0xCu);
            }

          }
          if (a5 == 5)
          {
            if (IMOSLoggingEnabled(v23))
            {
              OSLogHandleForIMFoundationCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
              }

            }
          }
          else if (a5 == 4 && IMOSLoggingEnabled(v23))
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
            }

          }
          v29 = v17;
          v30 = v28;
          im_dispatch_after();

        }
        if (v18)
          v18[2](v18);
      }

    }
    else if (v13)
    {
      v13[2](v13);
    }
  }
  else if (v12)
  {
    v12[2](v12);
  }

}

- (void)didReceiveMessagePlayedForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel__didReceiveMessagePlayedForMessageID_date_attempts_completionBlock_);
}

- (void)_didReceiveMessagePlayedReceiptForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void (**v13)(_QWORD);
  NSObject *v14;
  void *v15;
  char v16;
  id v17;
  void (**v18)(_QWORD);
  void (**v19)(_QWORD);
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  IMDServiceSession *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  v13 = v12;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v10;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }

    }
    if (v10
      && (-[IMDServiceSession service](self, "service"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "supportsDatabase"),
          v15,
          (v16 & 1) != 0))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D1599394;
      aBlock[3] = &unk_1E92286D8;
      v17 = v10;
      v32 = v17;
      v33 = self;
      v28 = v11;
      v34 = v28;
      v18 = v13;
      v35 = v18;
      v19 = (void (**)(_QWORD))_Block_copy(aBlock);
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hasStoredMessageWithGUID:", v17);

      if (v21)
      {
        v19[2](v19);
      }
      else
      {
        v23 = IMOSLoggingEnabled(v22);
        if (a5 >= 6)
        {
          if ((_DWORD)v23)
          {
            OSLogHandleForIMFoundationCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v17;
              _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as played, bailing", buf, 0xCu);
            }

          }
        }
        else
        {
          if ((_DWORD)v23)
          {
            OSLogHandleForIMFoundationCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v17;
              _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as played, trying again in a bit", buf, 0xCu);
            }

          }
          if (a5 == 5)
          {
            if (IMOSLoggingEnabled(v23))
            {
              OSLogHandleForIMFoundationCategory();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
              }

            }
          }
          else if (a5 == 4 && IMOSLoggingEnabled(v23))
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
            }

          }
          v29 = v17;
          v30 = v28;
          im_dispatch_after();

        }
        if (v18)
          v18[2](v18);
      }

    }
    else if (v13)
    {
      v13[2](v13);
    }
  }
  else if (v12)
  {
    v12[2](v12);
  }

}

- (void)didReceiveMessagePlayedReceiptForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5
{
  if (self->_activated)
    MEMORY[0x1E0DE7D20](self, sel__didReceiveMessagePlayedReceiptForMessageID_date_attempts_completionBlock_);
}

- (void)_didReceiveMessageSavedForMessageID:(id)a3 ofType:(int64_t)a4 forChat:(id)a5 fromHandle:(id)a6 fromMe:(BOOL)a7 date:(id)a8 attempts:(int64_t)a9 account:(id)a10 completionBlock:(id)a11
{
  id v15;
  void (**v16)(_QWORD);
  void (**v17)(_QWORD);
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  char v30;
  id v31;
  id v32;
  void (**v33)(_QWORD);
  void (**v34)(_QWORD);
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  id v46;
  _BOOL4 v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD aBlock[4];
  id v59;
  IMDServiceSession *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  int64_t v66;
  BOOL v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t v72[128];
  uint8_t buf[4];
  id v74;
  uint64_t v75;

  v48 = a7;
  v75 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v49 = a5;
  v51 = a6;
  v50 = a8;
  v52 = a10;
  v16 = (void (**)(_QWORD))a11;
  v17 = v16;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v74 = v15;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }

    }
    if (v15
      && (-[IMDServiceSession service](self, "service"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "supportsDatabase"),
          v19,
          (v20 & 1) != 0))
    {
      if (!v52)
      {
        -[IMDServiceSession account](self, "account");
        v52 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v51, "_stripFZIDPrefix");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v48;
      if (!v48)
      {
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "messageActionItemsForOriginalMessageGUID:", v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v69;
          while (2)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v69 != v27)
                objc_enumerationMutation(v25);
              objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "sender");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "isEqualToString:", v21);

              if ((v30 & 1) != 0)
              {

                if (IMOSLoggingEnabled(v41))
                {
                  OSLogHandleForIMFoundationCategory();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "   Message was already marked as saved, ignoring", buf, 2u);
                  }

                }
                if (v17)
                  v17[2](v17);
                goto LABEL_54;
              }
            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
            if (v26)
              continue;
            break;
          }
        }

        v22 = v48;
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D1599EEC;
      aBlock[3] = &unk_1E922DFA0;
      v31 = v15;
      v67 = v22;
      v59 = v31;
      v60 = self;
      v32 = v49;
      v61 = v32;
      v62 = v21;
      v45 = v50;
      v63 = v45;
      v66 = a4;
      v46 = v52;
      v64 = v46;
      v33 = v17;
      v65 = v33;
      v34 = (void (**)(_QWORD))_Block_copy(aBlock);
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "hasStoredMessageWithGUID:", v31);

      if (v36 | !v48)
      {
        v34[2](v34);
      }
      else
      {
        v38 = IMOSLoggingEnabled(v37);
        if (a9 >= 6)
        {
          if ((_DWORD)v38)
          {
            OSLogHandleForIMFoundationCategory();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v74 = v31;
              _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as saved, bailing", buf, 0xCu);
            }

          }
        }
        else
        {
          if ((_DWORD)v38)
          {
            OSLogHandleForIMFoundationCategory();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v74 = v31;
              _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as saved, trying again in a bit", buf, 0xCu);
            }

          }
          if (a9 == 5)
          {
            if (IMOSLoggingEnabled(v38))
            {
              OSLogHandleForIMFoundationCategory();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
              }

            }
          }
          else if (a9 == 4 && IMOSLoggingEnabled(v38))
          {
            OSLogHandleForIMFoundationCategory();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
            }

          }
          v53 = v31;
          v54 = v32;
          v55 = v51;
          v56 = v45;
          v57 = v46;
          im_dispatch_after();

        }
        if (v33)
          v33[2](v33);
      }

LABEL_54:
    }
    else if (v17)
    {
      v17[2](v17);
    }
  }
  else if (v16)
  {
    v16[2](v16);
  }

}

- (void)didReceiveMessageSavedForMessageID:(id)a3 ofType:(int64_t)a4 forChat:(id)a5 fromHandle:(id)a6 fromMe:(BOOL)a7 date:(id)a8 account:(id)a9 completionBlock:(id)a10
{
  -[IMDServiceSession _didReceiveMessageSavedForMessageID:ofType:forChat:fromHandle:fromMe:date:attempts:account:completionBlock:](self, "_didReceiveMessageSavedForMessageID:ofType:forChat:fromHandle:fromMe:date:attempts:account:completionBlock:", a3, a4, a5, a6, a7, a8, 0, a9, a10);
}

- (void)didStartSendingMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[IMDServiceSession account](self, "account");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didStartSendingMessage:forChat:style:account:](self, "didStartSendingMessage:forChat:style:account:", v9, v8, v5, v10);

}

- (void)didStartSendingMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  _BOOL8 v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  int v50;
  int v51;
  id v52;
  unsigned __int8 v53;
  uint8_t buf[4];
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v53 = a5;
  v12 = a6;
  v13 = v12;
  if (!self->_activated)
    goto LABEL_65;
  if (!v12)
  {
    -[IMDServiceSession account](self, "account");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
  }
  if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v10;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
    }

  }
  if (!v10)
  {
LABEL_65:
    v15 = v11;
    goto LABEL_66;
  }
  v52 = v11;
  -[IMDServiceSession _mapRoomChatToGroupChat:style:](self, "_mapRoomChatToGroupChat:style:", &v52, &v53);
  v15 = v52;

  -[IMDServiceSession service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v16, "supportsDatabase");

  v50 = objc_msgSend(v10, "isTypingMessage");
  v49 = objc_msgSend(v10, "isSuggestedActionResponse");
  v17 = objc_msgSend(v10, "errorCode");
  if (v51)
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "guid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "messageWithGUID:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  if (v20)
    v21 = v20;
  else
    v21 = v10;
  v22 = v21;
  if (!-[IMDServiceSession isReplicating](self, "isReplicating")
    || !-[IMDServiceSession _canUpgradeExistingMessageItem:replacementReplicatedMessageItem:](self, "_canUpgradeExistingMessageItem:replacementReplicatedMessageItem:", v20, v10))
  {
    goto LABEL_22;
  }
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "guid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "wasMessageDeduplicatedWithGUID:", v24);

  v27 = IMOSLoggingEnabled(v26);
  if ((v25 & 1) != 0)
  {
    if (v27)
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "guid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v29;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Replicated message %@ is permitted to upgrade but existing message was already marked as deduplicated", buf, 0xCu);

      }
    }
LABEL_22:
    v30 = v22;
    goto LABEL_23;
  }
  if (v27)
  {
    OSLogHandleForIMFoundationCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "guid");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v55 = v42;
      _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Replicated message %@ is permitted to upgrade", buf, 0xCu);

    }
  }
  v30 = v10;

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "markMessageAsDeduplicated:", v30);

LABEL_23:
  if (!v17
    && v20
    && objc_msgSend(v20, "isFinished")
    && (v31 = objc_msgSend(v10, "isFinished"), (v31 & 1) == 0))
  {
    if (IMOSLoggingEnabled(v31))
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "guid");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v40;
        _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Not notifying for message: %@   this is a typing indicator, and we've already stored a completed message", buf, 0xCu);

      }
      goto LABEL_48;
    }
  }
  else
  {
    v32 = objc_msgSend(v10, "isSuggestedActionResponse");
    if ((_DWORD)v32)
    {
      if (IMOSLoggingEnabled(v32))
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "[didStartSendingMessage] Not notifying for suggested action response.", buf, 2u);
        }
LABEL_48:

      }
    }
    else
    {
      if (!v17 || (v34 = objc_msgSend(v10, "isTypingMessage"), !(_DWORD)v34))
      {
        objc_msgSend(v30, "setErrorCode:", objc_msgSend(v10, "errorCode"));
        if (((v20 != 0) | (v50 ^ 1) & 1 || v49 != 1) && (v51 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isScheduledMessagesCoreEnabled");

          v38 = v37 && objc_msgSend(v20, "scheduleType") == 2 && objc_msgSend(v20, "scheduleState") != 0;
          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v30, v38, -[IMDServiceSession _shouldBroadcastSendFailures](self, "_shouldBroadcastSendFailures"), 1, 12);
          v39 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v39 = v30;
        }
        if (objc_msgSend(v10, "isBeingRetried"))
          objc_msgSend(v39, "setIsBeingRetried:", 1);
        objc_msgSend(v10, "retryToParticipant");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          objc_msgSend(v10, "retryToParticipant");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setRetryToParticipant:", v46);

        }
        -[IMDServiceSession chatForChatIdentifier:style:account:](self, "chatForChatIdentifier:style:account:", v15, v53, v13);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v50 & ~(v20 != 0) & v49 & 1) == 0 && ((v51 ^ 1) & 1) == 0)
        {
          +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addMessage:toChat:deferSpotlightIndexing:", v10, v47, -[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"));

        }
        goto LABEL_64;
      }
      if (IMOSLoggingEnabled(v34))
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "guid");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v55 = v35;
          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Not notifying for message: %@   this is a typing indicator, and it failed", buf, 0xCu);

        }
        goto LABEL_48;
      }
    }
  }
LABEL_64:

LABEL_66:
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5
{
  -[IMDServiceSession didSendMessage:forChat:style:forceDate:](self, "didSendMessage:forChat:style:forceDate:", a3, a4, a5, 0);
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 forceDate:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[IMDServiceSession account](self, "account");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didSendMessage:forChat:style:account:forceDate:](self, "didSendMessage:forChat:style:account:forceDate:", v12, v11, v6, v13, v10);

}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7
{
  MEMORY[0x1E0DE7D20](self, sel_didSendMessage_forChat_style_account_forceDate_itemIsComingFromStorage_);
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7 itemIsComingFromStorage:(BOOL)a8
{
  id v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  int v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  __CFString *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  NSObject *v54;
  __CFString *v55;
  void *v56;
  __CFString *v57;
  const __CFString *ShouldAutomaticallySave;
  uint64_t v59;
  NSObject *v60;
  __CFString *v61;
  _BOOL8 v62;
  NSObject *v63;
  int v64;
  int v65;
  const __CFString *v66;
  const __CFString *v67;
  uint64_t v68;
  void *v69;
  int v70;
  _BOOL8 v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  int v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  __CFString *v80;
  int v81;
  NSObject *v82;
  __CFString *v83;
  uint64_t v84;
  __CFString *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  uint64_t v101;
  NSObject *v102;
  int v103;
  void *v104;
  __CFString *v105;
  void *v106;
  void *v107;
  const __CFDictionary *v108;
  __CFNotificationCenter *DistributedCenter;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  unint64_t v114;
  NSObject *v115;
  __CFString *v116;
  __CFString *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  NSObject *v125;
  uint64_t i;
  uint64_t v127;
  NSObject *v128;
  void *v129;
  NSObject *v130;
  __CFString *v131;
  unsigned int v132;
  void *v133;
  void *v134;
  void *v135;
  int v136;
  void *v137;
  uint64_t v138;
  __CFString *v139;
  int v140;
  id v141;
  __CFString *v142;
  __CFString *v143;
  _BOOL4 v144;
  __CFString *v145;
  id v146;
  __CFString *v147;
  __CFString *v148;
  _QWORD block[5];
  __CFString *v150;
  id v151;
  __CFString *v152;
  __CFString *v153;
  unsigned __int8 v154;
  BOOL v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  id v160;
  unsigned __int8 v161;
  _BYTE v162[128];
  _QWORD v163[2];
  _QWORD v164[2];
  uint8_t buf[4];
  const __CFString *v166;
  __int16 v167;
  const __CFString *v168;
  uint64_t v169;

  v144 = a8;
  v169 = *MEMORY[0x1E0C80C00];
  v148 = (__CFString *)a3;
  v13 = a4;
  v161 = a5;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  v145 = v15;
  if (self->_activated)
  {
    if (!v14)
    {
      -[IMDServiceSession account](self, "account");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = v15;
    }
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v166 = v148;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }

    }
    v147 = v14;
    if (v148)
    {
      v160 = v13;
      -[IMDServiceSession _mapRoomChatToGroupChat:style:](self, "_mapRoomChatToGroupChat:style:", &v160, &v161);
      v146 = v160;

      -[IMDServiceSession service](self, "service");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v17, "supportsDatabase");

      v18 = -[__CFString isTypingMessage](v148, "isTypingMessage");
      v136 = -[__CFString isSuggestedActionResponse](v148, "isSuggestedActionResponse");
      v19 = -[__CFString errorCode](v148, "errorCode");
      v138 = -[__CFString flags](v148, "flags");
      if (v140)
      {
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString guid](v148, "guid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "messageWithGUID:", v21);
        v22 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = 0;
      }
      v23 = v148;
      v143 = v22;
      if (v22)
        v23 = v22;
      v24 = v23;
      if (-[IMDServiceSession isReplicating](self, "isReplicating")
        && -[IMDServiceSession _canUpgradeExistingMessageItem:replacementReplicatedMessageItem:](self, "_canUpgradeExistingMessageItem:replacementReplicatedMessageItem:", v22, v148))
      {
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString guid](v22, "guid");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "wasMessageDeduplicatedWithGUID:", v26);

        v29 = IMOSLoggingEnabled(v28);
        if ((v27 & 1) == 0)
        {
          if (v29)
          {
            OSLogHandleForIMFoundationCategory();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              -[__CFString guid](v148, "guid");
              v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v166 = v55;
              _os_log_impl(&dword_1D1413000, v54, OS_LOG_TYPE_INFO, "Replicated message %@ is permitted to upgrade", buf, 0xCu);

            }
          }
          v32 = v148;

          +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "markMessageAsDeduplicated:", v32);

LABEL_24:
          objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isScheduledMessagesCoreEnabled");

          if (v34
            && -[__CFString scheduleType](v22, "scheduleType") == 2
            && -[__CFString scheduleState](v22, "scheduleState"))
          {
            v142 = v148;

            -[__CFString cloudKitRecordID](v22, "cloudKitRecordID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              v36 = -[__CFString scheduleType](v142, "scheduleType") == 2;

              if (!v36)
              {
                -[__CFString setCloudKitSyncState:](v142, "setCloudKitSyncState:", 0);
                objc_msgSend(MEMORY[0x1E0D360F0], "synchronousDatabase");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString guid](v143, "guid");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString cloudKitRecordID](v143, "cloudKitRecordID");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "addScheduledMessageGUIDandCKRecordToDeleteFromCloudKit:recordID:", v38, v39);

              }
            }
          }
          else
          {
            v142 = v32;
          }
          if (!v19)
          {
            if (v143)
            {
              if (-[__CFString isFinished](v143, "isFinished"))
              {
                v40 = -[__CFString isFinished](v148, "isFinished");
                if ((v40 & 1) == 0)
                {
                  if (!IMOSLoggingEnabled(v40))
                    goto LABEL_186;
                  OSLogHandleForIMFoundationCategory();
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                  {
                    -[__CFString guid](v148, "guid");
                    v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v166 = v57;
                    _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "Not notifying for message: %@   this is a typing indicator, and we've already stored a completed message", buf, 0xCu);

                  }
                  goto LABEL_45;
                }
              }
            }
          }
          v41 = -[__CFString isSuggestedActionResponse](v148, "isSuggestedActionResponse");
          if ((_DWORD)v41)
          {
            if (IMOSLoggingEnabled(v41))
            {
              OSLogHandleForIMFoundationCategory();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "[didSendMessage] Not notifying for suggested action response.", buf, 2u);
              }

            }
            goto LABEL_186;
          }
          if (v19)
          {
            v43 = -[__CFString isTypingMessage](v148, "isTypingMessage");
            if ((_DWORD)v43)
            {
              if (!IMOSLoggingEnabled(v43))
              {
LABEL_186:

                goto LABEL_187;
              }
              OSLogHandleForIMFoundationCategory();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              {
                -[__CFString guid](v148, "guid");
                v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v166 = v45;
                _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "Not notifying for message: %@   this is a typing indicator, and it failed", buf, 0xCu);

              }
LABEL_45:

              goto LABEL_186;
            }
          }
          -[__CFString time](v142, "time");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          if (v135)
          {
            objc_msgSend(v133, "timeIntervalSinceDate:", v135);
            v47 = v46;
            if (v46 > 0.0)
            {
              objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v47);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "trackEvent:withStatistic:", *MEMORY[0x1E0D38AC8], v49);

            }
          }
          if ((-[__CFString flags](v142, "flags") & 0x8000) == 0)
          {
            -[IMDServiceSession service](self, "service");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "internalName");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "isEqualToString:", *MEMORY[0x1E0D38F58]);

            if (v52)
              -[__CFString setTime:](v142, "setTime:", v133);
          }
          -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](self, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v142, v146, v161, v147);
          if (v19)
          {
            v53 = 4;
          }
          else if (-[IMDServiceSession isReplicating](self, "isReplicating"))
          {
            v53 = 4;
          }
          else
          {
            v53 = 32772;
          }
          -[__CFString setFlags:](v142, "setFlags:", -[__CFString flags](v142, "flags") | v53);
          if ((v138 & 0x80000000000) != 0)
            -[__CFString setFlags:](v142, "setFlags:", -[__CFString flags](v142, "flags") | v138 & 0x80000000000);
          if (!v19
            && -[__CFString isExpirable](v142, "isExpirable")
            && -[__CFString isFromMe](v142, "isFromMe")
            && -[__CFString expireState](v142, "expireState") <= 0)
          {
            ShouldAutomaticallySave = (const __CFString *)IMMessageItemShouldAutomaticallySave();
            v81 = IMOSLoggingEnabled(ShouldAutomaticallySave);
            if ((_DWORD)ShouldAutomaticallySave)
            {
              if (v81)
              {
                OSLogHandleForIMFoundationCategory();
                v82 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                {
                  -[__CFString guid](v142, "guid");
                  v83 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v166 = v83;
                  _os_log_impl(&dword_1D1413000, v82, OS_LOG_TYPE_INFO, "Automatically saving message sent from local device: %@", buf, 0xCu);

                }
              }
              v84 = 3;
            }
            else
            {
              if (v81)
              {
                OSLogHandleForIMFoundationCategory();
                v130 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
                {
                  -[__CFString guid](v142, "guid");
                  v131 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v166 = v131;
                  _os_log_impl(&dword_1D1413000, v130, OS_LOG_TYPE_INFO, "Expire message sent from local device: %@", buf, 0xCu);

                }
              }
              v84 = 1;
            }
            -[__CFString setExpireState:](v142, "setExpireState:", v84);
            v132 = ShouldAutomaticallySave ^ 1;
          }
          else
          {
            LODWORD(ShouldAutomaticallySave) = 0;
            v132 = 0;
          }
          -[__CFString setErrorCode:](v142, "setErrorCode:", -[__CFString errorCode](v148, "errorCode"));
          -[__CFString consumedSessionPayloads](v148, "consumedSessionPayloads");
          v59 = objc_claimAutoreleasedReturnValue();
          v134 = (void *)v59;
          if (v145)
          {
            if (IMOSLoggingEnabled(v59))
            {
              OSLogHandleForIMFoundationCategory();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                -[__CFString guid](v142, "guid");
                v61 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v166 = v61;
                v167 = 2112;
                v168 = v145;
                _os_log_impl(&dword_1D1413000, v60, OS_LOG_TYPE_INFO, "Updating date on message guid %@ to be: %@", buf, 0x16u);

              }
            }
            -[__CFString setTime:](v142, "setTime:", v145);
          }
          if ((v143 || ((v18 | v136) & 1) == 0) && (v140 & 1) != 0)
          {
            v62 = -[IMDServiceSession isReplicating](self, "isReplicating");
            if (v62)
            {
              if (IMOSLoggingEnabled(v62))
              {
                OSLogHandleForIMFoundationCategory();
                v63 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                {
                  v64 = -[__CFString isSent](v143, "isSent");
                  v65 = -[__CFString isSent](v142, "isSent");
                  v66 = CFSTR("NO");
                  if (v64)
                    v67 = CFSTR("YES");
                  else
                    v67 = CFSTR("NO");
                  if (v65)
                    v66 = CFSTR("YES");
                  *(_DWORD *)buf = 138412546;
                  v166 = v67;
                  v167 = 2112;
                  v168 = v66;
                  _os_log_impl(&dword_1D1413000, v63, OS_LOG_TYPE_INFO, "This is the replicating session. It should not modify sent state. Existing message sent: %@, messageToUpdate sent: %@", buf, 0x16u);
                }

              }
              v68 = 12;
            }
            else
            {
              v68 = 32780;
            }
            objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend(v69, "isScheduledMessagesCoreEnabled");

            v71 = v70
               && -[__CFString scheduleType](v143, "scheduleType") == 2
               && -[__CFString scheduleState](v143, "scheduleState") != 0;
            +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v142, v71, -[IMDServiceSession _shouldBroadcastSendFailures](self, "_shouldBroadcastSendFailures"), 1, v68);
            v139 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v139 = v142;
          }
          if (-[__CFString isBeingRetried](v148, "isBeingRetried"))
            -[__CFString setIsBeingRetried:](v139, "setIsBeingRetried:", 1);
          -[__CFString retryToParticipant](v148, "retryToParticipant");
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73)
          {
            -[__CFString retryToParticipant](v148, "retryToParticipant");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString setRetryToParticipant:](v139, "setRetryToParticipant:", v74);

          }
          -[IMDServiceSession chatForChatIdentifier:style:account:](self, "chatForChatIdentifier:style:account:", v146, v161, v147);
          v75 = objc_claimAutoreleasedReturnValue();
          v137 = (void *)v75;
          if ((v18 & 1) != 0)
          {
            v76 = v140;
            if (!v143)
              v76 = 0;
            if (v76 != 1)
            {
LABEL_112:
              if (!v137)
                goto LABEL_134;
              v75 = -[__CFString isFromMe](v148, "isFromMe");
              if (!(_DWORD)v75)
                goto LABEL_134;
              v75 = -[__CFString isTypingMessage](v148, "isTypingMessage");
              if ((v75 & 1) != 0)
                goto LABEL_134;
              v75 = -[__CFString isSuggestedActionResponse](v148, "isSuggestedActionResponse");
              if ((v75 & 1) != 0)
                goto LABEL_134;
              objc_msgSend(v137, "updateNumberOfTimesRespondedToThread");
              if (objc_msgSend(v137, "isFiltered") > 1 || (v78 = objc_msgSend(v137, "isSMSSpam"), (v78 & 1) != 0))
              {
                v75 = objc_msgSend(v137, "isOscarChat");
                if (!(_DWORD)v75)
                {
LABEL_134:
                  if (IMOSLoggingEnabled(v75))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v86 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v166 = v139;
                      _os_log_impl(&dword_1D1413000, v86, OS_LOG_TYPE_INFO, "Posting sent message: %@", buf, 0xCu);
                    }

                  }
                  if (v134)
                    -[__CFString setConsumedSessionPayloads:](v139, "setConsumedSessionPayloads:", v134);
                  if (!v144 || !-[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"))
                  {
                    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    -[__CFString guid](v139, "guid");
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v87, "messageWithGUID:", v88);
                    v89 = objc_claimAutoreleasedReturnValue();
                    v90 = (void *)v89;
                    v91 = v139;
                    if (v89)
                      v91 = (void *)v89;
                    v141 = v91;

                    -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    -[__CFString accountID](v147, "accountID");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    v94 = v161;
                    objc_msgSend(v137, "groupID");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v137, "personCentricID");
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v92, "account:chat:style:chatProperties:groupID:chatPersonCentricID:messageSent:", v93, v146, v94, 0, v95, v96, v141);

                  }
                  if (-[__CFString isFinished](v148, "isFinished"))
                  {
                    -[__CFString service](v148, "service");
                    v97 = (void *)objc_claimAutoreleasedReturnValue();
                    v98 = objc_msgSend(v97, "isEqual:", *MEMORY[0x1E0D38F68]);

                    if (v98)
                    {
                      -[__CFString guid](v148, "guid");
                      v99 = (void *)objc_claimAutoreleasedReturnValue();
                      -[__CFString fileTransferGUIDs](v148, "fileTransferGUIDs");
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v100, "count");
                      _signpostSendMessage();

                    }
                  }
                  v101 = -[__CFString shouldNotifyOnSend](v148, "shouldNotifyOnSend");
                  if ((_DWORD)v101)
                  {
                    if (IMOSLoggingEnabled(v101))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v102 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
                      {
                        v103 = (int)ShouldAutomaticallySave;
                        -[__CFString guid](v148, "guid");
                        v104 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v19)
                          ShouldAutomaticallySave = CFSTR("NO");
                        else
                          ShouldAutomaticallySave = CFSTR("YES");
                        v105 = v104;
                        *(_DWORD *)buf = 138412546;
                        v166 = ShouldAutomaticallySave;
                        v167 = 2112;
                        v168 = v105;
                        _os_log_impl(&dword_1D1413000, v102, OS_LOG_TYPE_INFO, "Posting distributed notification of send result %@ for message %@", buf, 0x16u);

                        LODWORD(ShouldAutomaticallySave) = v103;
                      }

                    }
                    v163[0] = *MEMORY[0x1E0D38310];
                    -[__CFString guid](v148, "guid");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    v164[0] = v106;
                    v163[1] = *MEMORY[0x1E0D38318];
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19 == 0);
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    v164[1] = v107;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v164, v163, 2);
                    v108 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

                    DistributedCenter = CFNotificationCenterGetDistributedCenter();
                    CFNotificationCenterPostNotification(DistributedCenter, (CFNotificationName)*MEMORY[0x1E0D38308], 0, v108, 1u);

                  }
                  if (v132)
                  {
                    -[__CFString guid](v148, "guid");
                    v110 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDServiceSession _updateExpireStateForMessageGUID:](self, "_updateExpireStateForMessageGUID:", v110);

                  }
                  if ((_DWORD)ShouldAutomaticallySave)
                    -[IMDServiceSession sendSavedReceiptForMessage:toChatID:identifier:style:account:](self, "sendSavedReceiptForMessage:toChatID:identifier:style:account:", v148, 0, v146, v161, v147);
                  if ((-[__CFString isTypingMessage](v148, "isTypingMessage") & 1) == 0
                    && (-[__CFString isDelivered](v148, "isDelivered") & 1) == 0
                    && -[__CFString scheduleType](v148, "scheduleType") != 2
                    && ((-[__CFString canMakeDowngradeRoutingChecks](v147, "canMakeDowngradeRoutingChecks") & 1) != 0
                     || -[__CFString errorCode](v148, "errorCode") == 22))
                  {
                    -[__CFString guid](v148, "guid");
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v137, "guid");
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    -[IMDServiceSession _updateRoutingForMessageGUID:chatGUID:error:account:](self, "_updateRoutingForMessageGUID:chatGUID:error:account:", v111, v112, -[__CFString errorCode](v148, "errorCode"), v147);

                  }
                  if (!v18 || v143)
                  {
                    -[__CFString guid](v148, "guid");
                    v113 = (void *)objc_claimAutoreleasedReturnValue();
                    sub_1D1591DF4(v113);

                  }
                  if (-[__CFString isAssociatedMessageItem](v148, "isAssociatedMessageItem"))
                  {
                    v114 = -[__CFString associatedMessageType](v148, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8;
                    if (v114 == 3000 || v114 == 2000)
                    {
                      IMLogHandleForCategory();
                      v115 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
                      {
                        -[__CFString guid](v148, "guid");
                        v116 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                        -[__CFString associatedMessageGUID](v148, "associatedMessageGUID");
                        v117 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v166 = v116;
                        v167 = 2112;
                        v168 = v117;
                        _os_log_impl(&dword_1D1413000, v115, OS_LOG_TYPE_INFO, "Replacing previous message acknowledgements with new acknowledgment for sent message; sender: '%@':'%@'",
                          buf,
                          0x16u);

                      }
                      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      -[__CFString guid](v148, "guid");
                      v119 = (void *)objc_claimAutoreleasedReturnValue();
                      -[__CFString associatedMessageGUID](v148, "associatedMessageGUID");
                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                      v121 = (id)objc_msgSend(v118, "replaceMessageAcknowledgmentsWithNewMessageAcknowledgment:associatedMessageGUID:sender:", v119, v120, 0);

                    }
                  }
                  v158 = 0u;
                  v159 = 0u;
                  v156 = 0u;
                  v157 = 0u;
                  -[IMDServiceSession serviceSessionDelegates](self, "serviceSessionDelegates");
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                  v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v156, v162, 16);
                  if (v123)
                  {
                    v124 = *(_QWORD *)v157;
                    v125 = MEMORY[0x1E0C80D38];
                    do
                    {
                      for (i = 0; i != v123; ++i)
                      {
                        if (*(_QWORD *)v157 != v124)
                          objc_enumerationMutation(v122);
                        v127 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * i);
                        if ((objc_opt_respondsToSelector() & 1) != 0)
                        {
                          v128 = v125;
                          block[0] = MEMORY[0x1E0C809B0];
                          block[1] = 3221225472;
                          block[2] = sub_1D159C7F0;
                          block[3] = &unk_1E922DFF0;
                          block[4] = v127;
                          v150 = v148;
                          v151 = v146;
                          v154 = v161;
                          v152 = v147;
                          v153 = v145;
                          v155 = v144;
                          dispatch_async(v125, block);

                        }
                      }
                      v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v156, v162, 16);
                    }
                    while (v123);
                  }

                  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v129, "updateLastMessageForChat:hintMessage:", v137, v139);

                  goto LABEL_186;
                }
                if (IMOSLoggingEnabled(v75))
                {
                  OSLogHandleForIMFoundationCategory();
                  v79 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v137, "chatIdentifier");
                    v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v166 = v80;
                    _os_log_impl(&dword_1D1413000, v79, OS_LOG_TYPE_INFO, "iMessage junk chat, updating isFiltered to NO, replying to chatId: %@", buf, 0xCu);

                  }
LABEL_132:

                }
              }
              else if (IMOSLoggingEnabled(v78))
              {
                OSLogHandleForIMFoundationCategory();
                v79 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v137, "chatIdentifier");
                  v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v166 = v85;
                  _os_log_impl(&dword_1D1413000, v79, OS_LOG_TYPE_INFO, "Updating isFiltered to NO, replying to chatId: %@", buf, 0xCu);

                }
                goto LABEL_132;
              }
              v75 = objc_msgSend(v137, "updateIsFiltered:", 0);
              goto LABEL_134;
            }
          }
          else if ((v136 & (v143 == 0)) != 0 || ((v140 ^ 1) & 1) != 0)
          {
            goto LABEL_112;
          }
          +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addMessage:toChat:deferSpotlightIndexing:", v148, v137, -[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"));

          goto LABEL_112;
        }
        if (v29)
        {
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            -[__CFString guid](v148, "guid");
            v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v166 = v31;
            _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Replicated message %@ is permitted to upgrade but existing message was already marked as deduplicated", buf, 0xCu);

          }
        }
      }
      v32 = v24;
      goto LABEL_24;
    }
  }
  else
  {
    v147 = v14;
  }
  v146 = v13;
LABEL_187:

}

- (void)notifyDidSendMessageID:(id)a3
{
  -[IMDServiceSession notifyDidSendMessageID:shouldNotify:](self, "notifyDidSendMessageID:shouldNotify:", a3, 1);
}

- (void)notifyDidSendMessageID:(id)a3 shouldNotify:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[IMDServiceSession account](self, "account");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession notifyDidSendMessageID:account:shouldNotify:](self, "notifyDidSendMessageID:account:shouldNotify:", v6, v7, v4);

}

- (void)notifyDidSendMessageID:(id)a3 account:(id)a4 shouldNotify:(BOOL)a5
{
  MEMORY[0x1E0DE7D20](self, sel_notifyDidSendMessageID_account_shouldNotify_wasDowngraded_);
}

- (void)notifyDidSendMessageID:(id)a3 account:(id)a4 shouldNotify:(BOOL)a5 wasDowngraded:(BOOL)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v7 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (self->_activated)
  {
    if (!self->_account)
    {
      -[IMDServiceSession account](self, "account");
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v10;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }

    }
    if (v10)
    {
      -[IMDServiceSession service](self, "service");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "supportsDatabase");

      if (v16)
      {
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "messageWithGUID:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "service");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDServiceSession service](self, "service");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "internalName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18 || !v19 || !v21)
          goto LABEL_18;
        if (-[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v21, v19))
        {
          if ((objc_msgSend(v18, "isSent") & 1) != 0 || -[IMDServiceSession isReplicating](self, "isReplicating"))
          {
            v23 = 0;
          }
          else
          {
            v25 = 557056;
            if (!a6
              && !-[IMDServiceSession _messageDowngradesWhenSentFromCurrentService:](self, "_messageDowngradesWhenSentFromCurrentService:", v18))
            {
              if (-[IMDServiceSession _messageUpgradesWhenSentFromCurrentService:](self, "_messageUpgradesWhenSentFromCurrentService:", v18))
              {
                -[IMDServiceSession service](self, "service");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "internalName");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setService:", v27);

                -[IMDServiceSession account](self, "account");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "accountID");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setAccountID:", v29);

              }
              v25 = 0x8000;
            }
            objc_msgSend(v18, "setFlags:", objc_msgSend(v18, "flags") | v25);
            objc_msgSend(v18, "setErrorCode:", 0);
            +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v18, 0, 1, 1, v25);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "guid");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1D1591DF4(v32);

            v23 = 1;
            v18 = v31;
          }
          v33 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v18, "time");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "timeIntervalSinceNow");
          objc_msgSend(v33, "numberWithDouble:", fabs(v35));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (IMOSLoggingEnabled(v37))
          {
            OSLogHandleForIMFoundationCategory();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v45 = v18;
              v46 = 2112;
              v47 = v36;
              _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Updated sent message: %@   duration: %@", buf, 0x16u);
            }

          }
          if (v23)
          {
            -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "accountID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "account:chat:style:chatProperties:messageUpdated:", v40, 0, 0, 0, v18);

          }
          if ((objc_msgSend(v18, "flags") & 0x8000) != 0)
          {
            if (objc_msgSend(v18, "isFromMe"))
            {
              if ((objc_msgSend(v18, "isTypingMessage") & 1) == 0
                && !objc_msgSend(v18, "errorCode")
                && v7)
              {
                -[IMDServiceSession broadcasterForChatObserverListeners](self, "broadcasterForChatObserverListeners");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "accountID");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v43) = -[IMDServiceSession isReplicating](self, "isReplicating");
                objc_msgSend(v41, "account:chat:style:chatProperties:notifySentMessage:sendTime:isReplicating:", v42, 0, 0, 0, v18, v36, v43);

                if (!-[IMDServiceSession isReplicating](self, "isReplicating"))
                  +[IMDSoundUtilities playMessageSentSoundIfNeeded:](IMDSoundUtilities, "playMessageSentSoundIfNeeded:", v18);
              }
            }
          }

          goto LABEL_42;
        }
        v22 = -[IMDServiceSession messageServiceNamed:canProcessMessagesFromServiceNamed:](self, "messageServiceNamed:canProcessMessagesFromServiceNamed:", v21, v19);
        if (!v22)
        {
          if (!IMOSLoggingEnabled(v22))
            goto LABEL_42;
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v45 = v19;
            v46 = 2112;
            v47 = v21;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Unable notify about message, message is on an incompatible service: %@ vs %@", buf, 0x16u);
          }
        }
        else
        {
LABEL_18:
          if (!IMOSLoggingEnabled(v22))
          {
LABEL_42:

            goto LABEL_43;
          }
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v10;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Unable notify about message, no messages found for guid: %@", buf, 0xCu);
          }
        }

        goto LABEL_42;
      }
    }
  }
LABEL_43:

}

- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Can't delete on this service %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)didReceiveDisplayNameChange:(id)a3 fromID:(id)a4 toIdentifier:(id)a5 forChat:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  uint64_t v8;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a7;
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v14, "stringGUID");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didReceiveDisplayNameChange:guid:fromID:toIdentifier:forChat:style:account:](self, "didReceiveDisplayNameChange:guid:fromID:toIdentifier:forChat:style:account:", v19, v20, v18, v17, v16, v8, v15);

}

- (void)didReceiveDisplayNameChange:(id)a3 guid:(id)a4 fromID:(id)a5 toIdentifier:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8 account:(id)a9
{
  int v9;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  int v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  unsigned __int8 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v9 = a8;
  v56 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v35 = a4;
  v16 = a5;
  v37 = a6;
  v38 = a7;
  v36 = a9;
  if (IMOSLoggingEnabled(v36))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      v47 = v15;
      v48 = 2112;
      v49 = v16;
      v50 = 2112;
      v51 = v37;
      v52 = 2112;
      v53 = v38;
      v54 = 1024;
      v55 = v9;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_DEBUG, "name: %@   fromID: %@  toIdentifier:%@  identifier: %@ style: %d", buf, 0x30u);
    }

  }
  if (v9 == 45 || !self->_activated)
  {
    v20 = v15;
  }
  else
  {
    v44 = v9;
    v43 = v38;
    v18 = v38;
    -[IMDServiceSession _mapRoomChatToGroupChat:style:](self, "_mapRoomChatToGroupChat:style:", &v43, &v44);
    v34 = v43;

    -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v34, v44);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      IMSharedHelperTruncatedGroupDisplayName();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "displayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = IMSharedHelperAreObjectsLogicallySame();

      if (v22)
      {
        if (IMOSLoggingEnabled(v23))
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Ignoring name update, already the current name", buf, 2u);
          }

        }
      }
      else
      {
        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allExistingChatsWithIdentifier:style:", v34, v44);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v28)
        {
          v29 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v40 != v29)
                objc_enumerationMutation(v27);
              v31 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              v32 = objc_msgSend(v31, "style");
              if (v32 == objc_msgSend(v19, "style"))
                objc_msgSend(v31, "updateDisplayName:sender:", v20, v16);
            }
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          }
          while (v28);
        }

        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39870]), "initWithSender:time:guid:type:", v16, 0, v35, 2);
        -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](self, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v33, v34, v44, v36);
        objc_msgSend(v33, "setSender:", v16);
        objc_msgSend(v33, "setDestinationCallerID:", v37);
        objc_msgSend(v33, "setTitle:", v20);
        -[IMDServiceSession _storeTranscriptItem:inChat:account:](self, "_storeTranscriptItem:inChat:account:", v33, v19, v36);

      }
    }
    else
    {
      v20 = v15;
    }

  }
}

- (void)_updateInputMessage:(id)a3 forExistingMessage:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "isRead");
  if ((_DWORD)v7)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "The existing message was read, let's mark the new one is read", (uint8_t *)&v15, 2u);
      }

    }
    objc_msgSend(v5, "setFlags:", objc_msgSend(v5, "flags") | 0x2000);
  }
  objc_msgSend(v6, "time");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (!v10)
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "time");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "The existing message has a time: %@, so lets set the new message to have the same time", (uint8_t *)&v15, 0xCu);

      }
    }
    objc_msgSend(v6, "time");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTime:", v14);

  }
}

- (void)didReceiveMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 fromIDSID:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[IMDServiceSession account](self, "account");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession didReceiveMessage:forChat:style:account:fromIDSID:](self, "didReceiveMessage:forChat:style:account:fromIDSID:", v12, v11, v6, v13, v10);

}

- (void)didReceiveMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7
{
  uint64_t v8;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;

  v8 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "arrayWithObjects:count:", &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDServiceSession didReceiveMessages:forChat:style:account:fromIDSID:](self, "didReceiveMessages:forChat:style:account:fromIDSID:", v17, v15, v8, v14, v13, v18, v19);
}

- (id)_transcodeController
{
  return (id)objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
}

- (void)_setReplyGUIDOnMessage:(id)a3 forChat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "replyToGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(v5, "replyToGUID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    objc_msgSend(v6, "lastMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "length");
    if (v11)
    {
      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "guid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138412546;
          v15 = v13;
          v16 = 2112;
          v17 = v10;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "We are setting the reply to guid for message %@ to be %@ as a reply to guid has not been set", (uint8_t *)&v14, 0x16u);

        }
      }
      objc_msgSend(v5, "setReplyToGUID:", v10);
    }

  }
}

- (void)_setSortIDForMessage:(id)a3 forChat:(id)a4
{
  id v5;
  id v6;
  IMDMessageSortOrderAssigner *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMSharedHelperSortUsingReplyToGUIDAlgorithm())
  {
    v7 = objc_alloc_init(IMDMessageSortOrderAssigner);
    if (IMOSLoggingEnabled(-[IMDMessageSortOrderAssigner assignSortIDToIncomingMessage:onChat:](v7, "assignSortIDToIncomingMessage:onChat:", v5, v6)))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "sortID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "guid");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412802;
        v13 = v9;
        v14 = 2112;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Assigning sort id %@ to message %@ for chat %@", (uint8_t *)&v12, 0x20u);

      }
    }

  }
}

- (BOOL)_isActivated
{
  return self->_activated;
}

- (id)_collaborationMessageProcessingQueue
{
  if (qword_1EFC63E78 != -1)
    dispatch_once(&qword_1EFC63E78, &unk_1E922E010);
  return (id)qword_1EFC63E70;
}

- (void)_didReceivePotentialCollaborationMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  IMDServiceSession *v30;
  id v31;
  id v32;
  unsigned __int8 v33;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0D397E0]);
  objc_msgSend(v10, "payloadData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setData:", v14);

  objc_msgSend(v10, "guid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMessageGUID:", v15);

  objc_msgSend(v13, "setIsFromMe:", objc_msgSend(v10, "isFromMe"));
  v16 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v10, "body");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUrl:", v19);

  objc_msgSend(v10, "fileTransferGUIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "__imArrayByApplyingBlock:", &unk_1E922E050);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAttachments:", v21);

  -[IMDServiceSession _collaborationMessageProcessingQueue](self, "_collaborationMessageProcessingQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1D159DD88;
  v27[3] = &unk_1E922E0A0;
  v28 = v13;
  v29 = v10;
  v30 = self;
  v31 = v11;
  v33 = a5;
  v32 = v12;
  v23 = v12;
  v24 = v11;
  v25 = v10;
  v26 = v13;
  dispatch_async(v22, v27);

}

- (id)_revokeSiblingMessagesForReplication:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0D36100]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), *MEMORY[0x1E0D382A0], v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteMessageGUIDs:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "   deleted messages: %@", buf, 0xCu);
    }

  }
  v16 = (void *)objc_msgSend(v4, "copy");

  return v16;
}

- (BOOL)didReceiveMessages:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7
{
  NSObject *v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  void (**v21)(void *, _QWORD);
  id v24;
  id v25;
  id v26;
  id obj;
  id v28;
  id v30;
  _QWORD block[4];
  id v32;
  IMDServiceSession *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  _QWORD aBlock[5];
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  __int128 *p_buf;
  unsigned __int8 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  unsigned __int8 v54;
  uint8_t v55[128];
  __int128 buf;
  uint64_t v57;
  char v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v25 = a4;
  v30 = a6;
  v24 = a7;
  if (IMOSLoggingEnabled(v24))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_DEBUG, "messages: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (objc_msgSend(v26, "count") && -[IMDServiceSession _isActivated](self, "_isActivated"))
  {
    if (!v30)
    {
      -[IMDServiceSession account](self, "account");
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    v54 = a5;
    v53 = v25;
    v11 = v25;
    -[IMDServiceSession _mapRoomChatToGroupChat:style:](self, "_mapRoomChatToGroupChat:style:", &v53, &v54);
    v28 = v53;

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v57 = 0x2020000000;
    v58 = 1;
    if (-[IMDServiceSession isReplicating](self, "isReplicating"))
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v12 = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count"));
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v26;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    v16 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      v17 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v50 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          aBlock[0] = v16;
          aBlock[1] = 3221225472;
          aBlock[2] = sub_1D159E6E4;
          aBlock[3] = &unk_1E922E0C8;
          aBlock[4] = self;
          v20 = v28;
          v48 = v54;
          v42 = v20;
          v43 = v19;
          v44 = v30;
          v45 = v14;
          p_buf = &buf;
          v46 = v12;
          v21 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
          v21[2](v21, 0);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v15);
    }

    if ((IMIsRunningInUnitTesting() & 1) == 0)
    {
      block[0] = v16;
      block[1] = 3221225472;
      block[2] = sub_1D159EE14;
      block[3] = &unk_1E922E0F0;
      v32 = v12;
      v33 = self;
      v34 = v28;
      v39 = v54;
      v35 = v14;
      v36 = v30;
      v37 = obj;
      v38 = v24;
      v40 = a5;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    v13 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)testOverrideTextValidationDidFail
{
  return 0;
}

- (BOOL)_storeMessage:(id)a3 chatIdentifier:(id)a4 localChat:(id)a5 style:(unsigned __int8)a6 account:(id)a7 messagesToPostArray:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  IMDServiceSession *v19;
  char v20;
  char v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;
  uint64_t ShouldAutomaticallySave;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  IMDServiceSession *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  char v45;
  char v46;
  char v47;
  _QWORD v48[5];
  id v49;
  __int128 *v50;
  char v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD *v57;
  __int128 *p_buf;
  _QWORD *v59;
  _QWORD *v60;
  char v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;
  __int128 buf;
  uint64_t v69;
  char v70;
  uint64_t v71;

  v10 = a6;
  v71 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v36 = a5;
  v16 = a7;
  v17 = a8;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = sub_1D159F6BC;
  v66[4] = sub_1D159F6CC;
  v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = sub_1D159F6BC;
  v64[4] = sub_1D159F6CC;
  v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = sub_1D159F6BC;
  v62[4] = sub_1D159F6CC;
  v63 = 0;
  -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](self, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v14, v15, v10, v16);
  objc_msgSend(v14, "consumedSessionPayloads");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isFromMe") & 1) == 0)
    objc_msgSend(v14, "setFlags:", objc_msgSend(v14, "flags") | 0x1000);
  v35 = v17;
  if (objc_msgSend(v14, "isExpirable")
    && objc_msgSend(v14, "isFromMe")
    && objc_msgSend(v14, "expireState") <= 0)
  {
    ShouldAutomaticallySave = IMMessageItemShouldAutomaticallySave();
    if ((_DWORD)ShouldAutomaticallySave)
    {
      if (IMOSLoggingEnabled(ShouldAutomaticallySave))
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v14, "guid");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v32;
          _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_DEBUG, "Automatically saving message sent from linked device: %@", (uint8_t *)&buf, 0xCu);

        }
      }
      objc_msgSend(v14, "setExpireState:", 3);
      v19 = self;
      v20 = 0;
      v21 = 1;
    }
    else
    {
      if (IMOSLoggingEnabled(ShouldAutomaticallySave))
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v14, "guid");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v34;
          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_DEBUG, "Expire message sent from linked device: %@", (uint8_t *)&buf, 0xCu);

        }
      }
      objc_msgSend(v14, "setExpireState:", 1);
      v19 = self;
      v21 = 0;
      v20 = 1;
    }
  }
  else
  {
    v19 = self;
    v20 = 0;
    v21 = 0;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v69 = 0x2020000000;
  v70 = 0;
  v22 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = sub_1D159F6D4;
  v52[3] = &unk_1E922E118;
  p_buf = &buf;
  v59 = v64;
  v57 = v66;
  v52[4] = v19;
  v37 = v36;
  v53 = v37;
  v60 = v62;
  v54 = v15;
  v61 = v10;
  v55 = v16;
  v56 = v14;
  v48[0] = v22;
  v48[1] = 3221225472;
  v48[2] = sub_1D15A0AD0;
  v48[3] = &unk_1E922E140;
  v50 = &buf;
  v48[4] = v19;
  v49 = v54;
  v51 = v10;
  v38[0] = v22;
  v38[1] = 3221225472;
  v38[2] = sub_1D15A0C60;
  v38[3] = &unk_1E922E168;
  v23 = v56;
  v39 = v23;
  v40 = v19;
  v24 = v49;
  v41 = v24;
  v45 = v10;
  v25 = v18;
  v42 = v25;
  v26 = v35;
  v43 = v26;
  v46 = v20;
  v27 = v55;
  v44 = v27;
  v47 = v21;
  -[IMDServiceSession storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:](v19, "storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:", v23, 0, 1, 1, 0, 0x81000003009, 0, v52, v48, v38);
  v28 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v62, 8);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);

  return v28;
}

- (BOOL)_canUpgradeExistingMessageItem:(id)a3 replacementReplicatedMessageItem:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  BOOL v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[IMDServiceSession isReplicating](self, "isReplicating");
  if (!v8)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "guid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412290;
        v30 = v18;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Disallowing upgrade of message %@, session is not replicating", (uint8_t *)&v29, 0xCu);

      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v9 = 0;
  if (v6 && v7)
  {
    objc_msgSend(v6, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
    {
      v14 = objc_msgSend(v6, "isFromMe");
      v15 = objc_msgSend(v7, "isFromMe");
      if (v14 == (_DWORD)v15)
      {
        if ((objc_msgSend(v6, "isFromMe") & 1) != 0
          || (objc_msgSend(v6, "sender"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v7, "sender"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v22, "isEqualToString:", v23),
              v23,
              v22,
              (v24 & 1) != 0))
        {
          v9 = 1;
          goto LABEL_19;
        }
        if (!IMOSLoggingEnabled(v25))
          goto LABEL_18;
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "guid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sender");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "sender");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138412802;
          v30 = v26;
          v31 = 2112;
          v32 = v27;
          v33 = 2112;
          v34 = v28;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Disallowing upgrade of %@, different senders (%@ and %@)", (uint8_t *)&v29, 0x20u);

        }
        goto LABEL_17;
      }
      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "guid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138412290;
          v30 = v17;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Disallowing upgrade of %@", (uint8_t *)&v29, 0xCu);

        }
LABEL_17:

      }
    }
    else if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "guid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "guid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412546;
        v30 = v19;
        v31 = 2112;
        v32 = v20;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Disallowing upgrade of message %@, replacement has guid %@", (uint8_t *)&v29, 0x16u);

      }
      goto LABEL_17;
    }
LABEL_18:
    v9 = 0;
  }
LABEL_19:

  return v9;
}

- (void)didReceiveInvitation:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  _BOOL4 v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  char v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v8;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_DEBUG, "message: %@", buf, 0xCu);
    }

  }
  if (v8 && -[IMDServiceSession _isActivated](self, "_isActivated"))
  {
    -[IMDServiceSession accountID](self, "accountID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = !-[IMDServiceSession shouldImitateGroupChatUsingChatRooms](self, "shouldImitateGroupChatUsingChatRooms");
    if ((_DWORD)v5 != 35)
      LOBYTE(v12) = 1;
    if ((v12 & 1) != 0)
    {
      v16 = 0;
    }
    else if (objc_msgSend(v9, "roomNameIsProbablyAutomaticallyGenerated"))
    {
      v13 = v9;
      -[IMDServiceSession useChatRoom:forGroupChatIdentifier:](self, "useChatRoom:forGroupChatIdentifier:", v13, v13);
      v14 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(v13, "dataUsingEncoding:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E0D36CB0], 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = 43;
    }
    else
    {
      v16 = 0;
      v5 = 35;
    }
    -[IMDServiceSession account](self, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](self, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v8, v9, v5, v17);

    -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v9, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isTypingMessage") & 1) != 0 || (objc_msgSend(v8, "isFromMe") & 1) != 0)
      goto LABEL_25;
    -[IMDServiceSession service](self, "service");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "supportsDatabase") & 1) != 0)
    {
      +[IMDDaemonPropertyManager sharedManager](IMDDaemonPropertyManager, "sharedManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "valueOfPersistentProperty:", *MEMORY[0x1E0D36C58]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v21, "intValue") == 0;

      if (!v29)
      {
LABEL_25:
        v25 = MEMORY[0x1E0C809B0];
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = sub_1D15A1D8C;
        v36[3] = &unk_1E922DEB0;
        v37 = v18;
        v30[0] = v25;
        v30[1] = 3221225472;
        v30[2] = sub_1D15A1E10;
        v30[3] = &unk_1E922E190;
        v30[4] = self;
        v35 = v5;
        v31 = v9;
        v32 = v37;
        v33 = v11;
        v34 = v16;
        v26 = v16;
        v27 = v11;
        v28 = v37;
        -[IMDServiceSession storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:](self, "storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:", v8, 0, 0, 1, 0, 9, 0, 0, v36, v30);

        goto LABEL_26;
      }
    }
    else
    {

    }
    if (IMOSLoggingEnabled(v22))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "  Ensuring the app is alive here", buf, 2u);
      }

    }
    +[IMDLocalDaemon sharedDaemon](IMDLocalDaemon, "sharedDaemon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "launchListenerForCapability:", *MEMORY[0x1E0D36CD0]);

    goto LABEL_25;
  }
LABEL_26:

}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5
{
  MEMORY[0x1E0DE7D20](self, sel_didUpdateChatStatus_chat_style_displayName_groupID_handleInfo_);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:handleInfo:account:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:handleInfo:account:isBlackholed:", *(_QWORD *)&a3, a4, a5, 0, 0, 0, a6, v6);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 handleInfo:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel_didUpdateChatStatus_chat_style_displayName_groupID_handleInfo_);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 handleInfo:(id)a8
{
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:lastAddressedHandle:handleInfo:](self, "didUpdateChatStatus:chat:style:displayName:groupID:lastAddressedHandle:handleInfo:", *(_QWORD *)&a3, a4, a5, a6, a7, 0, a8);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 handleInfo:(id)a9
{
  uint64_t v12;
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;

  v12 = a5;
  v14 = *(_QWORD *)&a3;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a4;
  -[IMDServiceSession account](self, "account");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:", v14, v20, v12, v19, v18, v17, 0, v16, v22, v21);

}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10
{
  uint64_t v13;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;

  v13 = a5;
  v15 = *(_QWORD *)&a3;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a4;
  -[IMDServiceSession account](self, "account");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = 0;
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:", v15, v22, v13, v21, v20, v19, v18, v17, v24, v23);

}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 lastAddressedHandle:(id)a9 lastAddressedSIMID:(id)a10 handleInfo:(id)a11
{
  uint64_t v14;
  uint64_t v16;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;

  v14 = a5;
  v16 = *(_QWORD *)&a3;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a4;
  -[IMDServiceSession account](self, "account");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = 0;
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:", v16, v24, v14, v23, v22, v21, v20, v19, v18, v26, v25);

}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 handleInfo:(id)a8 account:(id)a9 isBlackholed:(BOOL)a10
{
  uint64_t v10;

  LOBYTE(v10) = a10;
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:category:spamExtensionName:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:category:spamExtensionName:isBlackholed:", *(_QWORD *)&a3, a4, a5, a6, a7, 0, 0, a8, a9, 0, 0, v10);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 isBlackholed:(BOOL)a12
{
  uint64_t v12;

  LOBYTE(v12) = a12;
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:", *(_QWORD *)&a3, a4, a5, a6, a7, 0, a8, a9, a10, a11, v12);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 lastAddressedHandle:(id)a9 lastAddressedSIMID:(id)a10 handleInfo:(id)a11 account:(id)a12 isBlackholed:(BOOL)a13
{
  uint64_t v13;

  LOBYTE(v13) = a13;
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:category:spamExtensionName:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:category:spamExtensionName:isBlackholed:", *(_QWORD *)&a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0, v13);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 handleInfo:(id)a9 account:(id)a10 category:(int64_t)a11 spamExtensionName:(id)a12
{
  uint64_t v12;

  LOBYTE(v12) = 0;
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:category:spamExtensionName:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:category:spamExtensionName:isBlackholed:", *(_QWORD *)&a3, a4, a5, a6, a7, a8, 0, 0, a9, a10, a11, a12, v12);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 category:(int64_t)a12 spamExtensionName:(id)a13 isBlackholed:(BOOL)a14
{
  uint64_t v14;

  LOBYTE(v14) = a14;
  -[IMDServiceSession didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:category:spamExtensionName:isBlackholed:](self, "didUpdateChatStatus:chat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:category:spamExtensionName:isBlackholed:", *(_QWORD *)&a3, a4, a5, a6, a7, 0, a8, a9, a10, a11, a12, a13, v14);
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 lastAddressedHandle:(id)a9 lastAddressedSIMID:(id)a10 handleInfo:(id)a11 account:(id)a12 category:(int64_t)a13 spamExtensionName:(id)a14 isBlackholed:(BOOL)a15
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unsigned int v30;
  IMDChatStatusChangeContext *v31;

  v30 = a5;
  v19 = a14;
  v20 = a12;
  v21 = a11;
  v22 = a10;
  v23 = a9;
  v24 = a8;
  v25 = a7;
  v26 = a6;
  v27 = a4;
  v31 = objc_alloc_init(IMDChatStatusChangeContext);
  -[IMDChatStatusChangeContext setDisplayName:](v31, "setDisplayName:", v26);

  -[IMDChatStatusChangeContext setGroupID:](v31, "setGroupID:", v25);
  -[IMDChatStatusChangeContext setOriginalGroupID:](v31, "setOriginalGroupID:", v24);

  -[IMDChatStatusChangeContext setLastAddressedHandle:](v31, "setLastAddressedHandle:", v23);
  -[IMDChatStatusChangeContext setLastAddressedSIMID:](v31, "setLastAddressedSIMID:", v22);

  -[IMDChatStatusChangeContext setHandleInfo:](v31, "setHandleInfo:", v21);
  -[IMDChatStatusChangeContext setAccount:](v31, "setAccount:", v20);

  -[IMDChatStatusChangeContext setCategory:](v31, "setCategory:", a13);
  -[IMDChatStatusChangeContext setExtensionName:](v31, "setExtensionName:", v19);

  -[IMDChatStatusChangeContext setIsBlackholed:](v31, "setIsBlackholed:", a15);
  -[IMDServiceSession didUpdateChatStatus:chat:style:context:](self, "didUpdateChatStatus:chat:style:context:", a3, v27, v30, v31);

}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 context:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
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
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t j;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _BOOL4 v78;
  void *v79;
  IMDServiceSession *v80;
  id obj;
  uint64_t v82;
  id v83;
  uint64_t v84;
  id v86;
  void *v87;
  _QWORD block[5];
  id v89;
  id v90;
  int v91;
  unsigned __int8 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  unsigned __int8 v102;
  _BYTE v103[128];
  uint8_t v104[128];
  uint8_t buf[4];
  id v106;
  __int16 v107;
  int v108;
  __int16 v109;
  int v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v102 = a5;
  v10 = a6;
  if (objc_msgSend(v9, "length"))
  {
    if (!self->_activated)
      goto LABEL_63;
    v80 = self;
    v87 = v10;
    objc_msgSend(v10, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v10, "setAccount:", v11);
    }
    else
    {
      -[IMDServiceSession account](self, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setAccount:", v13);

    }
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v87, "lastAddressedHandle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "lastAddressedSIMID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v106 = v9;
        v107 = 1024;
        v108 = a3;
        v109 = 1024;
        v110 = v102;
        v111 = 2112;
        v112 = v16;
        v113 = 2112;
        v114 = v17;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Chat: %@  status update: %d  style: %c lastAddressedHandle %@ lastAddressedSIMID %@", buf, 0x2Cu);

      }
    }
    v101 = v9;
    -[IMDServiceSession _mapRoomChatToGroupChat:style:](v80, "_mapRoomChatToGroupChat:style:", &v101, &v102);
    v86 = v101;

    v78 = 0;
    v18 = a3 + 1;
    if ((a3 + 1) > 8)
      goto LABEL_37;
    if (((1 << v18) & 0x73) != 0)
    {
      -[IMDServiceSession chatForChatIdentifier:style:](v80, "chatForChatIdentifier:style:", v86, v102);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "state");
      v78 = (v20 & 0xFFFFFFFFFFFFFFFELL) == 2;
      if ((v20 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "groupID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "informOfKickFromGroup:", v22);

      }
      objc_msgSend(v19, "setState:", 0);
      objc_msgSend(v19, "guid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession _removeChatGuidFromCoreDuet:](v80, "_removeChatGuidFromCoreDuet:", v23);

    }
    else
    {
      if (((1 << v18) & 0x108) != 0)
      {
        v24 = v102;
        objc_msgSend(v87, "displayName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "groupID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "originalGroupID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "lastAddressedHandle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "lastAddressedSIMID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "handleInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "account");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v77) = objc_msgSend(v87, "isBlackholed");
        -[IMDServiceSession registerChat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:](v80, "registerChat:style:displayName:groupID:originalGroupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:account:isBlackholed:", v86, v24, v25, v26, v27, v28, v29, v30, v31, v77);

        v32 = v102;
        objc_msgSend(v87, "account");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDServiceSession chatForChatIdentifier:style:account:](v80, "chatForChatIdentifier:style:account:", v86, v32, v33);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (a3 == 2)
          v34 = 3;
        else
          v34 = 4;
        objc_msgSend(v19, "setState:", v34);
        if (objc_msgSend(v87, "category") == 2
          || objc_msgSend(v87, "category") == 3
          || objc_msgSend(v87, "category") == 4)
        {
          objc_msgSend(v87, "extensionName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "updateSMSSpamExtensionNameChatProperty:", v35);

        }
        v36 = MEMORY[0x1D17EA338](v86);
        if ((_DWORD)v36)
        {
          if (IMOSLoggingEnabled(v36))
          {
            OSLogHandleForIMFoundationCategory();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v19, "chatIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v106 = v38;
              _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Updating isFiltered to NO, chat ID is a business chat: %@", buf, 0xCu);

            }
          }
          objc_msgSend(v19, "updateIsFiltered:", 0);
        }
      }
      else
      {
        if (a3 != 1)
        {
LABEL_37:
          -[IMDServiceSession chatForChatIdentifier:style:](v80, "chatForChatIdentifier:style:", v86, v102);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (v102 == 45)
          {
            v39 = (void *)MEMORY[0x1E0C99D80];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
            obj = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "dictionaryWithObjectsAndKeys:", v86, *MEMORY[0x1E0D36D90], obj, *MEMORY[0x1E0D36C20], 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "addObject:", v40);

          }
          else
          {
            v99 = 0u;
            v100 = 0u;
            v97 = 0u;
            v98 = 0u;
            objc_msgSend(v87, "handleInfo");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
            if (v41)
            {
              v84 = *(_QWORD *)v98;
              v42 = *MEMORY[0x1E0D36D90];
              v43 = *MEMORY[0x1E0D36E10];
              v44 = *MEMORY[0x1E0D36D68];
              v82 = *MEMORY[0x1E0D36C20];
              do
              {
                for (i = 0; i != v41; ++i)
                {
                  if (*(_QWORD *)v98 != v84)
                    objc_enumerationMutation(obj);
                  v46 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
                  objc_msgSend(v46, "objectForKey:", v42);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "objectForKey:", v43);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "objectForKey:", v44);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v47)
                  {
                    v50 = (void *)MEMORY[0x1E0C99D80];
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "dictionaryWithObjectsAndKeys:", v47, v42, v51, v82, v48, v43, v49, v44, 0);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v83, "addObject:", v52);

                  }
                }
                v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
              }
              while (v41);
            }
          }

          -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](v80, "broadcasterForChatListenersWithBlackholeStatus:", objc_msgSend(v79, "isBlackholed"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "account");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "accountID");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v102;
          objc_msgSend(v79, "chatProperties");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "groupID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "personCentricID");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v76) = a3;
          objc_msgSend(v53, "account:chat:style:chatProperties:groupID:chatPersonCentricID:statusChanged:handleInfo:", v55, v86, v56, v57, v58, v59, v76, v83);

          if (v102 != 45 && v78)
          {
            v61 = objc_alloc(MEMORY[0x1E0D39860]);
            objc_msgSend(v87, "messageID");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = (void *)objc_msgSend(v61, "initWithSender:time:guid:type:", 0, 0, v62, 3);

            v64 = v102;
            objc_msgSend(v87, "account");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](v80, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v63, v86, v64, v65);

            objc_msgSend(v63, "setSender:", 0);
            objc_msgSend(v63, "setActionType:", 0);
            objc_msgSend(v79, "account");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "loginID");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "_stripFZIDPrefix");
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v63, "setDestinationCallerID:", v68);
            objc_msgSend(v87, "account");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDServiceSession _storeTranscriptItem:inChat:account:](v80, "_storeTranscriptItem:inChat:account:", v63, v79, v69);

          }
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          -[IMDServiceSession serviceSessionDelegates](v80, "serviceSessionDelegates");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
          if (v71)
          {
            v72 = *(_QWORD *)v94;
            v73 = MEMORY[0x1E0C80D38];
            do
            {
              for (j = 0; j != v71; ++j)
              {
                if (*(_QWORD *)v94 != v72)
                  objc_enumerationMutation(v70);
                v75 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * j);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  block[0] = MEMORY[0x1E0C809B0];
                  block[1] = 3221225472;
                  block[2] = sub_1D15A30B0;
                  block[3] = &unk_1E922E1B8;
                  block[4] = v75;
                  v91 = a3;
                  v89 = v86;
                  v92 = v102;
                  v90 = v87;
                  dispatch_async(v73, block);

                }
              }
              v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
            }
            while (v71);
          }

          v9 = v86;
          v10 = v87;
          goto LABEL_63;
        }
        -[IMDServiceSession chatForChatIdentifier:style:](v80, "chatForChatIdentifier:style:", v86, v102);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setState:", 2);
      }
      v78 = 0;
    }

    goto LABEL_37;
  }
  if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Invalid chat identifier, ignoring", buf, 2u);
    }

  }
LABEL_63:

}

- (void)willRemoveChat:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Chat: %@ being removed.", buf, 0xCu);
    }

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[IMDServiceSession serviceSessionDelegates](self, "serviceSessionDelegates", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "serviceSession:willRemoveChat:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)willMoveChatToRecentlyDeleted:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Chat: %@ being moved to recently deleted.", buf, 0xCu);
    }

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[IMDServiceSession serviceSessionDelegates](self, "serviceSessionDelegates", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "serviceSession:willMoveChatToRecentlyDeleted:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  char v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v12 = a5;
  v13 = a9;
  v14 = a6;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "existingChatWithGUID:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[IMDServiceSession _canInsertDisplayNameUpdateItemForChat:](self, "_canInsertDisplayNameUpdateItemForChat:", v16))
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasStoredMessageWithGUID:", v13);

    if ((v18 & 1) == 0)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39870]), "initWithSender:time:guid:type:", 0, 0, v13, 2);
      objc_msgSend(v19, "setTitle:", v27);
      -[IMDServiceSession account](self, "account");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "service");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "internalName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setService:", v22);

      objc_msgSend(v19, "setDestinationCallerID:", v12);
      v23 = IMGetCachedDomainBoolForKey();
      v24 = v23;
      if (v23)
        objc_msgSend(v19, "setErrorCode:", 4);
      objc_msgSend(v16, "account");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        -[IMDServiceSession _storeTranscriptItem:inChat:account:](self, "_storeTranscriptItem:inChat:account:", v19, v16, v25);
      }
      else
      {
        -[IMDServiceSession account](self, "account");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDServiceSession _storeTranscriptItem:inChat:account:](self, "_storeTranscriptItem:inChat:account:", v19, v16, v26);

      }
      if ((v24 & 1) == 0)
        objc_msgSend(v16, "updateDisplayName:", v27);

    }
  }

}

- (BOOL)_canInsertDisplayNameUpdateItemForChat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "style") == 45 || (objc_msgSend(v3, "isBusinessChat") & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "isStewieChat") ^ 1;

  return v4;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 forChat:(id)a5 style:(unsigned __int8)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_didChangeMemberStatus_forHandle_unformattedNumber_countryCode_forChat_style_);
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 unformattedNumber:(id)a5 countryCode:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8
{
  uint64_t v8;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  IMDChatMemberStatusChangeContext *v18;
  void *v19;

  v8 = a8;
  v12 = *(_QWORD *)&a3;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  -[IMDChatMemberStatusChangeContext setStatus:](v18, "setStatus:", v12);
  -[IMDChatMemberStatusChangeContext setHandleID:](v18, "setHandleID:", v17);

  -[IMDChatMemberStatusChangeContext setUnformattedNumber:](v18, "setUnformattedNumber:", v16);
  -[IMDChatMemberStatusChangeContext setCountryCode:](v18, "setCountryCode:", v15);

  -[IMDChatMemberStatusChangeContext setChatIdentifier:](v18, "setChatIdentifier:", v14);
  -[IMDChatMemberStatusChangeContext setStyle:](v18, "setStyle:", v8);
  -[IMDServiceSession didChangeMemberStatus:](self, "didChangeMemberStatus:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9
{
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  IMDChatMemberStatusChangeContext *v20;
  void *v21;

  v13 = *(_QWORD *)&a3;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  -[IMDChatMemberStatusChangeContext setStatus:](v20, "setStatus:", v13);
  -[IMDChatMemberStatusChangeContext setHandleID:](v20, "setHandleID:", v19);

  -[IMDChatMemberStatusChangeContext setFromHandleID:](v20, "setFromHandleID:", v18);
  -[IMDChatMemberStatusChangeContext setUnformattedNumber:](v20, "setUnformattedNumber:", v17);

  -[IMDChatMemberStatusChangeContext setCountryCode:](v20, "setCountryCode:", v16);
  -[IMDChatMemberStatusChangeContext setChatIdentifier:](v20, "setChatIdentifier:", v15);

  -[IMDChatMemberStatusChangeContext setStyle:](v20, "setStyle:", a9);
  -[IMDServiceSession didChangeMemberStatus:](self, "didChangeMemberStatus:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10
{
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  IMDChatMemberStatusChangeContext *v22;
  void *v23;

  v15 = *(_QWORD *)&a3;
  v16 = a10;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  -[IMDChatMemberStatusChangeContext setStatus:](v22, "setStatus:", v15);
  -[IMDChatMemberStatusChangeContext setHandleID:](v22, "setHandleID:", v21);

  -[IMDChatMemberStatusChangeContext setFromHandleID:](v22, "setFromHandleID:", v20);
  -[IMDChatMemberStatusChangeContext setUnformattedNumber:](v22, "setUnformattedNumber:", v19);

  -[IMDChatMemberStatusChangeContext setCountryCode:](v22, "setCountryCode:", v18);
  -[IMDChatMemberStatusChangeContext setChatIdentifier:](v22, "setChatIdentifier:", v17);

  -[IMDChatMemberStatusChangeContext setStyle:](v22, "setStyle:", a9);
  -[IMDChatMemberStatusChangeContext setAccount:](v22, "setAccount:", v16);

  -[IMDServiceSession didChangeMemberStatus:](self, "didChangeMemberStatus:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11
{
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  IMDChatMemberStatusChangeContext *v24;
  void *v25;

  v16 = *(_QWORD *)&a3;
  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  -[IMDChatMemberStatusChangeContext setStatus:](v24, "setStatus:", v16);
  -[IMDChatMemberStatusChangeContext setHandleID:](v24, "setHandleID:", v23);

  -[IMDChatMemberStatusChangeContext setFromHandleID:](v24, "setFromHandleID:", v22);
  -[IMDChatMemberStatusChangeContext setUnformattedNumber:](v24, "setUnformattedNumber:", v21);

  -[IMDChatMemberStatusChangeContext setCountryCode:](v24, "setCountryCode:", v20);
  -[IMDChatMemberStatusChangeContext setChatIdentifier:](v24, "setChatIdentifier:", v19);

  -[IMDChatMemberStatusChangeContext setStyle:](v24, "setStyle:", a9);
  -[IMDChatMemberStatusChangeContext setAccount:](v24, "setAccount:", v18);

  -[IMDChatMemberStatusChangeContext setDestinationCallerID:](v24, "setDestinationCallerID:", v17);
  -[IMDServiceSession didChangeMemberStatus:](self, "didChangeMemberStatus:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11 messageTime:(id)a12
{
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  IMDChatMemberStatusChangeContext *v25;
  void *v26;
  id v28;

  v17 = *(_QWORD *)&a3;
  v28 = a12;
  v18 = a11;
  v19 = a10;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  -[IMDChatMemberStatusChangeContext setStatus:](v25, "setStatus:", v17);
  -[IMDChatMemberStatusChangeContext setHandleID:](v25, "setHandleID:", v24);

  -[IMDChatMemberStatusChangeContext setFromHandleID:](v25, "setFromHandleID:", v23);
  -[IMDChatMemberStatusChangeContext setUnformattedNumber:](v25, "setUnformattedNumber:", v22);

  -[IMDChatMemberStatusChangeContext setCountryCode:](v25, "setCountryCode:", v21);
  -[IMDChatMemberStatusChangeContext setChatIdentifier:](v25, "setChatIdentifier:", v20);

  -[IMDChatMemberStatusChangeContext setStyle:](v25, "setStyle:", a9);
  -[IMDChatMemberStatusChangeContext setAccount:](v25, "setAccount:", v19);

  -[IMDChatMemberStatusChangeContext setDestinationCallerID:](v25, "setDestinationCallerID:", v18);
  -[IMDChatMemberStatusChangeContext setMessageTime:](v25, "setMessageTime:", v28);

  -[IMDServiceSession didChangeMemberStatus:](self, "didChangeMemberStatus:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11 messageTime:(id)a12 silently:(BOOL)a13
{
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  IMDChatMemberStatusChangeContext *v26;
  void *v27;
  id v29;

  v18 = *(_QWORD *)&a3;
  v29 = a12;
  v19 = a11;
  v20 = a10;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v26 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  -[IMDChatMemberStatusChangeContext setStatus:](v26, "setStatus:", v18);
  -[IMDChatMemberStatusChangeContext setHandleID:](v26, "setHandleID:", v25);

  -[IMDChatMemberStatusChangeContext setFromHandleID:](v26, "setFromHandleID:", v24);
  -[IMDChatMemberStatusChangeContext setUnformattedNumber:](v26, "setUnformattedNumber:", v23);

  -[IMDChatMemberStatusChangeContext setCountryCode:](v26, "setCountryCode:", v22);
  -[IMDChatMemberStatusChangeContext setChatIdentifier:](v26, "setChatIdentifier:", v21);

  -[IMDChatMemberStatusChangeContext setStyle:](v26, "setStyle:", a9);
  -[IMDChatMemberStatusChangeContext setAccount:](v26, "setAccount:", v20);

  -[IMDChatMemberStatusChangeContext setDestinationCallerID:](v26, "setDestinationCallerID:", v19);
  -[IMDChatMemberStatusChangeContext setMessageTime:](v26, "setMessageTime:", v29);

  -[IMDChatMemberStatusChangeContext setSilently:](v26, "setSilently:", a13);
  -[IMDServiceSession didChangeMemberStatus:](self, "didChangeMemberStatus:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11 messageTime:(id)a12 messageID:(id)a13 silently:(BOOL)a14
{
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  IMDChatMemberStatusChangeContext *v27;
  void *v28;
  id v30;
  id v31;

  v19 = *(_QWORD *)&a3;
  v31 = a13;
  v30 = a12;
  v20 = a11;
  v21 = a10;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  -[IMDChatMemberStatusChangeContext setStatus:](v27, "setStatus:", v19);
  -[IMDChatMemberStatusChangeContext setHandleID:](v27, "setHandleID:", v26);

  -[IMDChatMemberStatusChangeContext setFromHandleID:](v27, "setFromHandleID:", v25);
  -[IMDChatMemberStatusChangeContext setUnformattedNumber:](v27, "setUnformattedNumber:", v24);

  -[IMDChatMemberStatusChangeContext setCountryCode:](v27, "setCountryCode:", v23);
  -[IMDChatMemberStatusChangeContext setChatIdentifier:](v27, "setChatIdentifier:", v22);

  -[IMDChatMemberStatusChangeContext setStyle:](v27, "setStyle:", a9);
  -[IMDChatMemberStatusChangeContext setAccount:](v27, "setAccount:", v21);

  -[IMDChatMemberStatusChangeContext setDestinationCallerID:](v27, "setDestinationCallerID:", v20);
  -[IMDChatMemberStatusChangeContext setMessageTime:](v27, "setMessageTime:", v30);

  -[IMDChatMemberStatusChangeContext setMessageID:](v27, "setMessageID:", v31);
  -[IMDChatMemberStatusChangeContext setSilently:](v27, "setSilently:", a14);
  -[IMDServiceSession didChangeMemberStatus:](self, "didChangeMemberStatus:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_chatForMemberStatusChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  char v14;

  v4 = a3;
  objc_msgSend(v4, "chatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "style");
  v13 = v5;
  -[IMDServiceSession _mapRoomChatToGroupChat:style:](self, "_mapRoomChatToGroupChat:style:", &v13, &v14);
  v6 = v13;

  objc_msgSend(v4, "chatIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "style");

  -[IMDServiceSession _guidForChat:style:](self, "_guidForChat:style:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingChatWithGUID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)didChangeMemberStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  IMDHandle *v17;
  void *v18;
  void *v19;
  void *v20;
  IMDHandle *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  __CFString *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  const __CFString *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  int v83;
  NSObject *v84;
  __CFString *v85;
  void *v86;
  void *v87;
  _BOOL4 v88;
  void *v89;
  void *v90;
  NSObject *v91;
  __CFString *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  int v96;
  int v97;
  id v98;
  IMDServiceSession *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  uint8_t v109[128];
  uint8_t buf[4];
  const __CFString *v111;
  __int16 v112;
  id v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  int v121;
  __int16 v122;
  int v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v99 = self;
  if (self->_activated)
  {
    objc_msgSend(v4, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v98 = v6;
    }
    else
    {
      -[IMDServiceSession account](v99, "account");
      v98 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "chatIdentifier");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fromHandleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unformattedNumber");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "countryCode");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413826;
        v111 = v11;
        v112 = 2112;
        v113 = v12;
        v114 = 2112;
        v115 = v13;
        v116 = 2112;
        v117 = v14;
        v118 = 2112;
        v119 = v15;
        v120 = 1024;
        v121 = objc_msgSend(v5, "status");
        v122 = 1024;
        v123 = objc_msgSend(v5, "style");
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Chat: %@  member: %@ from member: %@ unformated: %@ country: %@ status update: %d  style: %c", buf, 0x40u);

      }
    }
    -[IMDServiceSession _chatForMemberStatusChange:](v99, "_chatForMemberStatusChange:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [IMDHandle alloc];
    objc_msgSend(v5, "handleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unformattedNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[IMDHandle initWithID:unformattedID:countryCode:](v17, "initWithID:unformattedID:countryCode:", v18, v19, v20);

    objc_msgSend(v16, "participants");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "__imArrayByApplyingBlock:", &unk_1E922E1D8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v23, "containsObject:", v24);

    v25 = objc_msgSend(v5, "status") + 1;
    if (v25 > 6)
    {
      LOBYTE(v97) = 0;
    }
    else
    {
      if (v25 != 3)
      {
        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "chatIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "allExistingChatsWithIdentifier:style:", v27, objc_msgSend(v16, "style"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v100, v108, 16);
        if (v30)
        {
          v31 = 0;
          v32 = *(_QWORD *)v101;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v101 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
              v35 = objc_msgSend(v34, "style");
              if (v35 == objc_msgSend(v16, "style"))
                v31 |= objc_msgSend(v34, "removeParticipant:", v21);
            }
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v100, v108, 16);
          }
          while (v30);

          if ((v31 & 1) != 0)
          {
            v96 = 0;
            goto LABEL_39;
          }
          if (!v97)
            goto LABEL_42;
        }
        else
        {

          if ((v97 & 1) == 0)
            goto LABEL_42;
        }
        v96 = 0;
LABEL_40:
        if (objc_msgSend(v16, "style") != 45 && (objc_msgSend(v5, "silently") & 1) == 0)
        {
          if ((v96 & 1) != 0)
          {
            v53 = 0;
          }
          else
          {
            objc_msgSend(v5, "fromHandleID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "handleID");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v54, "isEqualToIgnoringCase:", v55);

          }
          objc_msgSend(v5, "messageID");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          if (v56)
          {
            v58 = v56;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
            v58 = (id)objc_claimAutoreleasedReturnValue();
          }
          v59 = v58;

          if (v53)
          {
            v60 = objc_alloc(MEMORY[0x1E0D39860]);
            objc_msgSend(v5, "fromHandleID");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = (id)objc_msgSend(v60, "initWithSender:time:guid:type:", v61, 0, v59, 3);

            objc_msgSend(v16, "chatIdentifier");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](v99, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v62, v63, objc_msgSend(v16, "style"), v98);

            objc_msgSend(v5, "unformattedNumber");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setOtherUnformattedID:", v64);

            objc_msgSend(v5, "countryCode");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setOtherCountryCode:", v65);

            if (IMOSLoggingEnabled(objc_msgSend(v62, "setActionType:", 0)))
            {
              OSLogHandleForIMFoundationCategory();
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v62, "otherHandle");
                v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v111 = v67;
                _os_log_impl(&dword_1D1413000, v66, OS_LOG_TYPE_INFO, "Storing participant leave: %@", buf, 0xCu);

              }
            }
          }
          else
          {
            v68 = objc_alloc(MEMORY[0x1E0D399A8]);
            objc_msgSend(v5, "fromHandleID");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "messageTime");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = (void *)objc_msgSend(v68, "initWithSender:time:guid:type:", v69, v70, v59, 1);

            objc_msgSend(v16, "chatIdentifier");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](v99, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v71, v72, objc_msgSend(v16, "style"), v98);

            objc_msgSend(v5, "handleID");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setOtherHandle:", v73);

            objc_msgSend(v5, "unformattedNumber");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setOtherUnformattedID:", v74);

            objc_msgSend(v5, "countryCode");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setOtherCountryCode:", v75);

            objc_msgSend(v71, "setUnattributed:", objc_msgSend(v5, "unattributed"));
            if (IMOSLoggingEnabled(objc_msgSend(v71, "setChangeType:", v96 ^ 1u)))
            {
              OSLogHandleForIMFoundationCategory();
              v76 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
              {
                if (v96)
                  v77 = CFSTR("invite");
                else
                  v77 = CFSTR("remove");
                objc_msgSend(v71, "sender");
                v78 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "otherHandle");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v111 = v77;
                v112 = 2112;
                v113 = v78;
                v114 = 2112;
                v115 = v79;
                _os_log_impl(&dword_1D1413000, v76, OS_LOG_TYPE_INFO, "Storing %@ participant change item  %@ => %@", buf, 0x20u);

              }
            }
            v62 = v71;
            if (objc_msgSend(MEMORY[0x1E0D39AF8], "isInternationalSpamFilteringEnabled")
              && objc_msgSend(v16, "isBlackholed")
              && objc_msgSend(v5, "status") == 2)
            {
              v80 = (void *)MEMORY[0x1E0D39AF8];
              objc_msgSend(v5, "handleID");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v80) = objc_msgSend(v80, "isKnownContact:", v81);

              v83 = IMOSLoggingEnabled(v82);
              if ((_DWORD)v80)
              {
                if (v83)
                {
                  OSLogHandleForIMFoundationCategory();
                  v84 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v5, "handleID");
                    v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "guid");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v111 = v85;
                    v112 = 2112;
                    v113 = v86;
                    _os_log_impl(&dword_1D1413000, v84, OS_LOG_TYPE_INFO, "Hawking: New participant (%@) added to chat (%@) is a known contact.", buf, 0x16u);

                  }
                }
                objc_msgSend(v16, "updateIsBlackholed:", 0);
                objc_msgSend(v16, "participants");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = objc_msgSend(v87, "count") == 1;

                objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                v90 = v89;
                if (v88)
                  objc_msgSend(v89, "trackSpamEvent:", 24);
                else
                  objc_msgSend(v89, "trackSpamEvent:", 25);

              }
              else if (v83)
              {
                OSLogHandleForIMFoundationCategory();
                v91 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v16, "guid");
                  v92 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "handleID");
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v111 = v92;
                  v112 = 2112;
                  v113 = v93;
                  _os_log_impl(&dword_1D1413000, v91, OS_LOG_TYPE_INFO, "Hawking: New participant (%@) added to chat (%@) is not a known contact.", buf, 0x16u);

                }
              }
            }

          }
          objc_msgSend(v5, "destinationCallerID");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setDestinationCallerID:", v94);

          -[IMDServiceSession _storeTranscriptItem:inChat:account:](v99, "_storeTranscriptItem:inChat:account:", v62, v16, v98);
          objc_msgSend(v62, "guid");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_43;
        }
LABEL_42:
        v8 = 0;
LABEL_43:

        goto LABEL_44;
      }
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "chatIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "allExistingChatsWithIdentifier:style:", v37, objc_msgSend(v16, "style"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v39 = v38;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v104, v109, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v105;
        do
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v105 != v41)
              objc_enumerationMutation(v39);
            v43 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * j);
            v44 = objc_msgSend(v43, "style");
            if (v44 == objc_msgSend(v16, "style"))
              objc_msgSend(v43, "addParticipant:", v21);
          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v104, v109, 16);
        }
        while (v40);
      }

      LOBYTE(v97) = v97 ^ 1;
    }
    v96 = 1;
LABEL_39:
    -[IMDServiceSession broadcasterForChatListeners](v99, "broadcasterForChatListeners");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "accountID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "chatIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v16, "style");
    objc_msgSend(v16, "chatProperties");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "personCentricID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDHandle handleInfo](v21, "handleInfo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v95) = objc_msgSend(v5, "status");
    objc_msgSend(v45, "account:chat:style:chatProperties:chatPersonCentricID:member:statusChanged:", v46, v47, v48, v49, v50, v51, v95);

    if ((v97 & 1) == 0)
      goto LABEL_42;
    goto LABEL_40;
  }
  v8 = 0;
LABEL_44:

  return v8;
}

- (void)_storeTranscriptItem:(id)a3 inChat:(id)a4 account:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  id *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[2];
  void (*v26)(id *, int, void *, void *);
  void *v27;
  id v28;
  IMDServiceSession *v29;
  id v30;
  id v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IMDServiceSession service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v33 = sub_1D15A50B8;
  v34 = &unk_1E922E200;
  v35 = v9;
  v25[0] = v12;
  v25[1] = 3221225472;
  v26 = sub_1D15A5138;
  v27 = &unk_1E922E228;
  v28 = v8;
  v29 = self;
  v13 = v35;
  v30 = v13;
  v14 = v10;
  v31 = v14;
  v15 = v11;
  v16 = v28;
  v17 = v32;
  v18 = v25;
  v19 = v16;
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v19;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Storing item: %@", buf, 0xCu);
    }

  }
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "storeItem:forceReplace:", v19, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v23))
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v22;
      _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "  => Result item: %@", buf, 0xCu);
    }

  }
  v33((uint64_t)v17, v22);
  v26(v18, 1, v19, v22);

}

- (BOOL)_shouldBlackholeGroupChatFromSender:(id)a3 toRecipient:(id)a4 withOtherParticipants:(id)a5 forAccount:(id)a6
{
  return 0;
}

- (Class)spotlightItemRecorderClass
{
  if (qword_1EFC63E88 != -1)
    dispatch_once(&qword_1EFC63E88, &unk_1E922E248);
  return (Class)(id)qword_1EFC63E80;
}

- (void)_removeChatGuidFromCoreDuet:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Going to remove chat guid from core duet %@", buf, 0xCu);
    }

  }
  if (objc_msgSend(v4, "length"))
  {
    -[objc_class spotlightItemRecorder](-[IMDServiceSession spotlightItemRecorderClass](self, "spotlightItemRecorderClass"), "spotlightItemRecorder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1D15A5630;
    v8[3] = &unk_1E9229870;
    v9 = v4;
    objc_msgSend(v6, "deleteSearchableItemsWithDomainIdentifiers:bundleID:withCompletion:", v7, CFSTR("com.apple.MobileSMS"), v8);

  }
}

- (void)_markChatAsDowngraded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "properties");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, *MEMORY[0x1E0D36C30]);
    v11 = *MEMORY[0x1E0D36C28];
    -[NSObject objectForKey:](v6, "objectForKey:", *MEMORY[0x1E0D36C28]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && (objc_msgSend(v12, "isNull") & 1) == 0)
      v14 = objc_msgSend(v13, "unsignedIntegerValue") + 1;
    else
      v14 = 1;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", v14);
    objc_msgSend(v7, "setObject:forKey:", v15, v11);

    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chatIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "updateProperties:chat:style:", v7, v17, objc_msgSend(v5, "style"));

    if (v18)
    {
      -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "guid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "properties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "chat:propertiesUpdated:", v20, v21);

    }
LABEL_12:

    goto LABEL_13;
  }
  if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "No chat to update downgrade properties for.", v22, 2u);
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_handleRoutingWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Handling routing dictionary: %@", buf, 0xCu);
    }

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D15A5AA4;
  v6[3] = &unk_1E922CDD0;
  v6[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (id)_downgradableServiceNames
{
  void *v2;
  void *v3;
  void *v4;

  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceNamesSupportingCapability:", *MEMORY[0x1E0D38E98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateRoutingForMessageGUID:(id)a3 chatGUID:(id)a4 error:(unsigned int)a5 account:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  id v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (self->_activated)
  {
    v14 = objc_msgSend(v12, "canMakeDowngradeRoutingChecks");
    if (a5 == 22 || v14)
    {
      v15 = v10;
      v16 = v11;
      im_dispatch_after();

    }
  }

}

- (void)_updateRoutingTimerWithInterval:(double)a3
{
  NSObject *v6;
  IMTimer *messageRoutingTimer;
  IMTimer *v8;
  IMTimer *v9;
  IMTimer *v10;
  int v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 > 0.0 && self->_activated)
  {
    if (IMOSLoggingEnabled(self))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v11 = 134217984;
        v12 = a3;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Scheduling a routing check with interval: %f", (uint8_t *)&v11, 0xCu);
      }

    }
    messageRoutingTimer = self->_messageRoutingTimer;
    if (messageRoutingTimer)
    {
      -[IMTimer invalidate](messageRoutingTimer, "invalidate");
      v8 = self->_messageRoutingTimer;
      self->_messageRoutingTimer = 0;

    }
    v9 = (IMTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AE0]), "initWithTimeInterval:name:shouldWake:target:selector:userInfo:", CFSTR("message-routing-timer"), 1, self, sel__routingTimerFired, 0, a3);
    v10 = self->_messageRoutingTimer;
    self->_messageRoutingTimer = v9;

  }
}

- (void)_routingTimerFired
{
  IMTimer *messageRoutingTimer;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[IMTimer invalidate](self->_messageRoutingTimer, "invalidate");
  messageRoutingTimer = self->_messageRoutingTimer;
  self->_messageRoutingTimer = 0;

  if (self->_activated)
  {
    objc_msgSend(MEMORY[0x1E0D35A48], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession _downgradableServiceNames](self, "_downgradableServiceNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1D15A6E7C;
    v6[3] = &unk_1E922E298;
    v6[4] = self;
    objc_msgSend(v4, "requestRoutingWithDowngradableServices:completion:", v5, v6);

  }
}

- (BOOL)canMakeExpireStateChecks
{
  return 0;
}

- (void)_handleExpireStateDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  IMDServiceSession *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Handling expire state dictionary: %@", buf, 0xCu);
    }

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = sub_1D15A7168;
  v18 = &unk_1E922E310;
  v19 = self;
  v7 = v6;
  v20 = v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v15);
  v8 = objc_msgSend(v7, "count", v15, v16, v17, v18, v19);
  if (v8)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "   delete expired messages: %@", buf, 0xCu);
      }

    }
    -[IMDServiceSession _sharedMessageStore](self, "_sharedMessageStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteMessageGUIDs:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v11;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "   deleted expired messages: %@", buf, 0xCu);
      }

    }
    if (objc_msgSend(v11, "count"))
    {
      -[IMDServiceSession broadcasterForChatListeners](self, "broadcasterForChatListeners");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:", v11, 0, 0);

    }
  }

}

- (void)_updateExpireStateForMessageGUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_activated && -[IMDServiceSession canMakeExpireStateChecks](self, "canMakeExpireStateChecks"))
  {
    v5 = v4;
    im_dispatch_after();

  }
}

- (void)_updateExpireStateTimerWithInterval:(double)a3
{
  double v6;
  IMTimer *messageExpireStateTimer;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  IMTimer *v19;
  IMTimer *v20;
  IMTimer *v21;
  IMTimer *v22;
  int v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3 > 0.0 && self->_activated)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    messageExpireStateTimer = self->_messageExpireStateTimer;
    if (messageExpireStateTimer
      && (v8 = v6,
          -[IMTimer fireDate](messageExpireStateTimer, "fireDate"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = v8 + a3,
          objc_msgSend(v9, "timeIntervalSinceReferenceDate"),
          v12 = v11,
          v9,
          v10 > v12))
    {
      if (IMOSLoggingEnabled(messageExpireStateTimer))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          -[IMTimer fireDate](self->_messageExpireStateTimer, "fireDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v16 = v15;
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v23 = 134218240;
          v24 = a3;
          v25 = 2048;
          v26 = v16 - v17;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Don't schedule expire state check with interval: %f, one is already scheduled with interval: %f", (uint8_t *)&v23, 0x16u);

        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled(messageExpireStateTimer))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v23 = 134217984;
          v24 = a3;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Scheduling an expire state check with interval: %f", (uint8_t *)&v23, 0xCu);
        }

      }
      v19 = self->_messageExpireStateTimer;
      if (v19)
      {
        -[IMTimer invalidate](v19, "invalidate");
        v20 = self->_messageExpireStateTimer;
        self->_messageExpireStateTimer = 0;

      }
      v21 = (IMTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AE0]), "initWithTimeInterval:name:shouldWake:target:selector:userInfo:", CFSTR("message-expire-state-timer"), 1, self, sel__expireStateTimerFired, 0, a3);
      v22 = self->_messageExpireStateTimer;
      self->_messageExpireStateTimer = v21;

    }
  }
}

- (void)_expireStateTimerFired
{
  IMTimer *messageExpireStateTimer;
  void *v4;
  _QWORD v5[5];

  -[IMTimer invalidate](self->_messageExpireStateTimer, "invalidate");
  messageExpireStateTimer = self->_messageExpireStateTimer;
  self->_messageExpireStateTimer = 0;

  if (self->_activated)
  {
    objc_msgSend(MEMORY[0x1E0D35A48], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_1D15A7BC4;
    v5[3] = &unk_1E922E298;
    v5[4] = self;
    objc_msgSend(v4, "requestExpireStateWithCompletion:", v5);

  }
}

- (void)_handleWatchdogWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Handling watchdog dictionary: %@", buf, 0xCu);
    }

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D15A7D38;
  v6[3] = &unk_1E922CDD0;
  v6[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (void)_updateWatchdogForMessageGUID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (self->_activated)
  {
    v6 = v4;
    im_dispatch_after();

  }
}

- (void)_updateWatchdogTimerWithInterval:(double)a3
{
  double v6;
  IMTimer *messageWatchdogTimer;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  IMTimer *v19;
  IMTimer *v20;
  IMTimer *v21;
  IMTimer *v22;
  int v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3 > 0.0 && self->_activated)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    messageWatchdogTimer = self->_messageWatchdogTimer;
    if (messageWatchdogTimer
      && (v8 = v6,
          -[IMTimer fireDate](messageWatchdogTimer, "fireDate"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = v8 + a3,
          objc_msgSend(v9, "timeIntervalSinceReferenceDate"),
          v12 = v11,
          v9,
          v10 > v12))
    {
      if (IMOSLoggingEnabled(messageWatchdogTimer))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          -[IMTimer fireDate](self->_messageWatchdogTimer, "fireDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v16 = v15;
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v23 = 134218240;
          v24 = a3;
          v25 = 2048;
          v26 = v16 - v17;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Don't schedule watchdog check with interval: %f, one is already scheduled with interval: %f", (uint8_t *)&v23, 0x16u);

        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled(messageWatchdogTimer))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v23 = 134217984;
          v24 = a3;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Scheduling a watchdog check with interval: %f", (uint8_t *)&v23, 0xCu);
        }

      }
      v19 = self->_messageWatchdogTimer;
      if (v19)
      {
        -[IMTimer invalidate](v19, "invalidate");
        v20 = self->_messageWatchdogTimer;
        self->_messageWatchdogTimer = 0;

      }
      v21 = (IMTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AE0]), "initWithTimeInterval:name:shouldWake:target:selector:userInfo:", CFSTR("message-watchdog-timer"), 1, self, sel__watchdogTimerFired, 0, a3);
      v22 = self->_messageWatchdogTimer;
      self->_messageWatchdogTimer = v21;

    }
  }
}

- (void)_watchdogTimerFired
{
  IMTimer *messageWatchdogTimer;
  void *v4;
  _QWORD v5[5];

  -[IMTimer invalidate](self->_messageWatchdogTimer, "invalidate");
  messageWatchdogTimer = self->_messageWatchdogTimer;
  self->_messageWatchdogTimer = 0;

  if (self->_activated)
  {
    objc_msgSend(MEMORY[0x1E0D35A48], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_1D15A8628;
    v5[3] = &unk_1E922E298;
    v5[4] = self;
    objc_msgSend(v4, "requestWatchdogWithCompletion:", v5);

  }
}

- (id)_autoReplier
{
  IMDAutoReplying *messageAutoReplier;
  IMDAvailabilityAutoReplier *v4;
  IMDAutoReplying *v5;

  messageAutoReplier = self->_messageAutoReplier;
  if (!messageAutoReplier)
  {
    v4 = objc_alloc_init(IMDAvailabilityAutoReplier);
    v5 = self->_messageAutoReplier;
    self->_messageAutoReplier = (IMDAutoReplying *)v4;

    -[IMDAutoReplying setReplyDelegate:](self->_messageAutoReplier, "setReplyDelegate:", self);
    messageAutoReplier = self->_messageAutoReplier;
  }
  return messageAutoReplier;
}

- (void)autoReplier:(id)a3 generatedAutoReplyText:(id)a4 forChat:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  IMDServiceSession *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15A877C;
  block[3] = &unk_1E9229280;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)autoReplier:(id)a3 receivedUrgentRequestForMessages:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  IMDServiceSession *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D15A88BC;
  v7[3] = &unk_1E9228750;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

- (void)autoReplier:(id)a3 sendDeliveredQuietlyReceiptForMessages:(id)a4 forIncomingMessageFromIDSID:(id)a5 inChat:(id)a6 withWillSendToDestinationsHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  IMDServiceSession *v22;
  id v23;
  id v24;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15A8ADC;
  block[3] = &unk_1E9228728;
  v20 = v13;
  v21 = v11;
  v22 = self;
  v23 = v12;
  v24 = v14;
  v15 = v14;
  v16 = v12;
  v17 = v11;
  v18 = v13;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)autoReplier:(id)a3 sendNotifyRecipientCommandForMessages:(id)a4 inChat:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  IMDServiceSession *v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D15A8D80;
  block[3] = &unk_1E9229280;
  v12 = v8;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)otcUtilities
{
  IMOneTimeCodeUtilities *otcUtilities;
  IMOneTimeCodeUtilities *v4;
  IMOneTimeCodeUtilities *v5;

  otcUtilities = self->_otcUtilities;
  if (!otcUtilities)
  {
    v4 = (IMOneTimeCodeUtilities *)objc_alloc_init(MEMORY[0x1E0D399A0]);
    v5 = self->_otcUtilities;
    self->_otcUtilities = v4;

    otcUtilities = self->_otcUtilities;
  }
  return otcUtilities;
}

- (void)_checkMessageForOneTimeCodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[IMDServiceSession otcUtilities](self, "otcUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v5, "createOTCFromMessageBody:sender:guid:", v6, v7, v8);
  if (v11)
  {
    +[IMDOneTimeCodeManager sharedInstance](IMDOneTimeCodeManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startTrackingCode:", v11);

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackEvent:", *MEMORY[0x1E0D388F8]);

  }
}

- (void)_checkMessageForENURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  IMDServiceSession *v9;

  v4 = a3;
  +[IMDExposureNotificationManager sharedInstance](IMDExposureNotificationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D15A915C;
  v7[3] = &unk_1E922C100;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "processMessageItemForENURL:withCompletionHandler:", v6, v7);

}

- (void)didSendBalloonPayload:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 messageGUID:(id)a6 account:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  IMDServiceSession *v27;
  id v28;
  id v29;
  id v30;
  unsigned __int8 v31;
  id v32;
  unsigned __int8 v33;

  v14 = a3;
  v15 = a4;
  v33 = a5;
  v16 = a7;
  v17 = a8;
  if (v14)
  {
    if (a6)
    {
      v18 = a6;
      -[IMDServiceSession _sharedMessageStore](self, "_sharedMessageStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "messageWithGUID:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v32 = v15;
        -[IMDServiceSession _mapRoomChatToGroupChat:style:](self, "_mapRoomChatToGroupChat:style:", &v32, &v33);
        v21 = v32;

        -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v21, v33);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = sub_1D15A962C;
        v24[3] = &unk_1E922E338;
        v25 = v22;
        v26 = v14;
        v27 = self;
        v28 = v16;
        v15 = v21;
        v29 = v15;
        v31 = v33;
        v30 = v17;
        v23 = v22;
        -[IMDServiceSession storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:](self, "storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:", v26, 1, 1, 1, 1, 32780, 0, 0, 0, v24);

      }
    }
  }

}

- (void)didReceiveBalloonPayload:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 messageGUID:(id)a6 account:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  IMDServiceSession *v24;
  id v25;
  id v26;
  unsigned __int8 v27;
  id v28;
  unsigned __int8 v29;

  v12 = a3;
  v13 = a4;
  v29 = a5;
  v14 = a7;
  if (v12)
  {
    if (a6)
    {
      v15 = a6;
      -[IMDServiceSession _sharedMessageStore](self, "_sharedMessageStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messageWithGUID:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v28 = v13;
        -[IMDServiceSession _mapRoomChatToGroupChat:style:](self, "_mapRoomChatToGroupChat:style:", &v28, &v29);
        v18 = v28;

        -[IMDServiceSession chatForChatIdentifier:style:](self, "chatForChatIdentifier:style:", v18, v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = sub_1D15A98F4;
        v21[3] = &unk_1E922E190;
        v22 = v19;
        v23 = v12;
        v24 = self;
        v25 = v14;
        v13 = v18;
        v26 = v13;
        v27 = v29;
        v20 = v19;
        -[IMDServiceSession storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:](self, "storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:", v23, 1, 1, 1, 1, 32780, 0, 0, 0, v21);

      }
    }
  }

}

- (id)storageController
{
  return 0;
}

- (void)noteItemFromStorage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDServiceSession storageController](self, "storageController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteItemFromStorage:", v4);

}

- (void)noteSuppressedMessageUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDServiceSession storageController](self, "storageController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteSuppressedMessageUpdate:", v4);

}

- (void)noteLastItemFromStorage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDServiceSession storageController](self, "storageController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteLastItemFromStorage:", v4);

}

- (void)noteLastItemProcessed
{
  id v2;

  -[IMDServiceSession storageController](self, "storageController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteLastItemProcessed");

}

- (BOOL)isAwaitingStorageTimer
{
  void *v2;
  char v3;

  -[IMDServiceSession storageController](self, "storageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAwaitingStorageTimer");

  return v3;
}

- (void)incrementPendingReadReceiptFromStorageCount
{
  id v2;

  -[IMDServiceSession storageController](self, "storageController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incrementPendingReadReceiptFromStorageCount");

}

- (void)decrementPendingReadReceiptFromStorageCount
{
  id v2;

  -[IMDServiceSession storageController](self, "storageController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decrementPendingReadReceiptFromStorageCount");

}

- (unint64_t)pendingReadReceiptFromStorageCount
{
  void *v2;
  unint64_t v3;

  -[IMDServiceSession storageController](self, "storageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pendingReadReceiptFromStorageCount");

  return v3;
}

- (void)setPendingReadReceiptFromStorageCount:(unint64_t)a3
{
  id v4;

  -[IMDServiceSession storageController](self, "storageController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPendingReadReceiptFromStorageCount:", a3);

}

- (BOOL)_isMessageSWYSpamMessage:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  if (v9
    && objc_msgSend(v6, "containsRichLink")
    && (objc_msgSend(v6, "body"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "string"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "im_matchesSOSMapURL"),
        v11,
        v10,
        (v12 & 1) == 0))
  {
    -[IMDServiceSession _predominantServiceForChat:usingMessageThreshold:](self, "_predominantServiceForChat:usingMessageThreshold:", v7, 50);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = 138412802;
        v18 = v6;
        v19 = 2112;
        v20 = v7;
        v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Predominant service check for incoming message:%@ in chat:%@ was determined to be %@", (uint8_t *)&v17, 0x20u);
      }

    }
    v13 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D38F68]);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldShowSWYQuickActionForMessage:(id)a3 outAppName:(id *)a4 outBundleID:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  uint64_t v25;
  NSObject *v26;
  BOOL v27;
  id *v29;
  id *v30;
  void *v31;
  id obj;
  uint8_t buf[16];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v31 = v7;
  if (objc_msgSend(v7, "containsRichLink"))
  {
    v29 = a5;
    v30 = a4;
    objc_msgSend(v7, "richLinkURLs");
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lsAppRecordForURL:checkInstalledAppsOnly:", v14, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16
            || (objc_msgSend(v16, "localizedName"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "length") == 0,
                v17,
                v18))
          {
            objc_msgSend(v16, "localizedName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "length") == 0;

            if (v24 && IMOSLoggingEnabled(v25))
            {
              OSLogHandleForIMFoundationCategory();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Not showing quick action since we did not get an AppName", buf, 2u);
              }

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D39AE8], "sharedManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "bundleIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v19, "showPinningStatusTextForBundleID:", v20);

            objc_msgSend(v16, "localizedName");
            v21 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "bundleIdentifier");
            v22 = objc_claimAutoreleasedReturnValue();

            v8 = (id)v22;
            v9 = (void *)v21;
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v11);
    }

    if (v30 && v9)
      *v30 = objc_retainAutorelease(v9);
    v27 = v10 & 1;
    if (v29 && v8)
    {
      v8 = objc_retainAutorelease(v8);
      *v29 = v8;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v27 = 0;
  }

  return v27;
}

- (id)_predominantServiceForChat:(id)a3 usingMessageThreshold:(unint64_t)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  id *v10;
  void *v11;
  id *v12;
  void *v13;
  unint64_t v14;
  id *v15;
  id v16;
  NSObject *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = IMOSLoggingEnabled(v6);
  if (v6 && a4)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "guid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v9;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Identifying the predominant service for chat: %@", (uint8_t *)&v19, 0xCu);

      }
    }
    v10 = (id *)MEMORY[0x1E0D38F58];
    -[IMDServiceSession _fetchMessagesFromChat:onService:numberOfMessages:](self, "_fetchMessagesFromChat:onService:numberOfMessages:", v6, *MEMORY[0x1E0D38F58], 50);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id *)MEMORY[0x1E0D38F68];
    -[IMDServiceSession _fetchMessagesFromChat:onService:numberOfMessages:](self, "_fetchMessagesFromChat:onService:numberOfMessages:", v6, *MEMORY[0x1E0D38F68], 50);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "count");
    if (v14 <= objc_msgSend(v13, "count"))
      v15 = v12;
    else
      v15 = v10;
    v16 = *v15;

  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Invalid chat or incorrect number of messages", (uint8_t *)&v19, 2u);
      }

    }
    v16 = 0;
  }

  return v16;
}

- (id)_fetchMessagesFromChat:(id)a3 onService:(id)a4 numberOfMessages:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  unint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  unint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v36 = v7;
  if (v7)
  {
    if (a5)
    {
      v8 = (id)objc_msgSend(v8, "length");
      if (v8)
      {
        v35 = v9;
        if (objc_msgSend(v7, "style") == 45)
        {
          objc_msgSend(v7, "participants");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count") == 1)
          {
            objc_msgSend(v7, "participants");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "firstObject");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "ID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "chatsWithHandle:onService:", v15, v9);
              v16 = objc_claimAutoreleasedReturnValue();
LABEL_16:
              v21 = (void *)v16;

LABEL_18:
              v40 = 0u;
              v41 = 0u;
              v38 = 0u;
              v39 = 0u;
              obj = v21;
              v18 = 0;
              v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
              if (v22)
              {
                v23 = *(_QWORD *)v39;
                do
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v39 != v23)
                      objc_enumerationMutation(obj);
                    v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                    v26 = objc_alloc(MEMORY[0x1E0D36100]);
                    objc_msgSend(v25, "guid");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = (void *)objc_msgSend(v26, "initWithAssociatedChatGUID:", v27);

                    objc_msgSend(v28, "setBatchSize:", a5);
                    objc_msgSend(v28, "nextBatch");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v29 && IMOSLoggingEnabled(0))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v30 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v25, "guid");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 134218242;
                        v44 = a5;
                        v45 = 2112;
                        v46 = v31;
                        _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Failed to fetch %lu number of messages from chat %@", buf, 0x16u);

                      }
                    }
                    if (!v18)
                    {
                      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v29, "count"));
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    objc_msgSend(v18, "addObjectsFromArray:", v29, v35);

                  }
                  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
                }
                while (v22);
              }

              goto LABEL_44;
            }
          }
          else
          {

          }
          if (IMOSLoggingEnabled(v13))
          {
            OSLogHandleForIMFoundationCategory();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v44 = (unint64_t)v36;
              _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Incorrect chat %@, has more than the number of participants we expected!", buf, 0xCu);
            }

          }
        }
        else
        {
          if (objc_msgSend(v7, "style") != 43)
          {
            v21 = 0;
            goto LABEL_18;
          }
          objc_msgSend(v7, "participants");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "__imArrayByApplyingBlock:", &unk_1E922E358);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = objc_msgSend(v12, "count");
          if (v20 > 1)
          {
            +[IMDChatStore sharedInstance](IMDChatStore, "sharedInstance");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "groupID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "chatsWithHandles:onService:displayName:groupID:style:", v12, v9, 0, v15, 43);
            v16 = objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
          if (IMOSLoggingEnabled(v20))
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v44 = (unint64_t)v7;
              _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Chat %@, has the wrong number of participants than what was expected!", buf, 0xCu);
            }

          }
        }
        v18 = 0;
LABEL_44:
        v9 = v35;
        goto LABEL_45;
      }
    }
  }
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v44 = (unint64_t)v7;
      v45 = 2112;
      v46 = v9;
      v47 = 2048;
      v48 = a5;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Invalid parameter. chatGUID: %@ service: %@ number of messages:%lu", buf, 0x20u);
    }

  }
  v18 = 0;
LABEL_45:

  return v18;
}

- (void)_configureSyndicationRangesForMessage:(id)a3 forChat:(id)a4 withSyndicationStatus:(int64_t)a5
{
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v28 = a4;
  v6 = objc_msgSend(v28, "autoDonationBehavior");
  v7 = IMOSLoggingEnabled(v6);
  if (v6 == 2)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Chat opted out of Auto donation. Not configuring syndication ranges", buf, 2u);
      }

    }
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v29, "guid");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "guid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v10;
        v39 = 2112;
        v40 = v11;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Configuring syndication ranges for incoming message:%@ in chat:%@", buf, 0x16u);

      }
    }
    v12 = objc_alloc(MEMORY[0x1E0D398F8]);
    objc_msgSend(v29, "body");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "guid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v12, "initWithMessageBody:messageGUID:", v13, v14);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v27, "messageParts");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v33;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v18);
          v20 = objc_alloc(MEMORY[0x1E0D39948]);
          v21 = objc_msgSend(v19, "messagePartRange");
          v23 = v22;
          objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v20, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", 0, v21, v23, v24, a5, 0);

          if (!v15)
            v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v15, "addObject:", v25);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v16);
    }

    v26 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v29, "setSyndicationRanges:", v26);

  }
}

- (void)deleteExistingMessageAwaitingReplacementWithFallbackHash:(id)a3 chatIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "existingiMessageChatForID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedMessageItemsWithFallbackHash:inChat:limit:", v5, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "expectedServiceForCrossServiceReplacement");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D38F70]);

    if ((v15 & 1) != 0)
    {
      +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deleteMessageGUIDs:inChat:", v18, v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "count"))
      {
        +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "broadcasterForChatListeners");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:", v19, 0, 0);

        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "updateNotificationUnreadCountForChat:", v8);

      }
      else if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v13;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Failed to delete message with GUID %@", buf, 0xCu);
        }

      }
    }
    else if (IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v13;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Message with GUID %@ not awaiting cross service replacement for iMessageLite", buf, 0xCu);
      }

    }
  }
  else if (IMOSLoggingEnabled(v12))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Failed to find message with fallback hash %@ to delete", buf, 0xCu);
    }

  }
}

- (BOOL)_shouldConvergeChatParticipants:(id)a3 withHandleInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isInternalInstall"))
  {
    v8 = IMGetDomainBoolForKeyWithDefaultValue();

    LOBYTE(v9) = 0;
    if ((v8 & 1) != 0)
      goto LABEL_21;
  }
  else
  {

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "__imArrayByApplyingBlock:", &unk_1E922E398);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "participantHandles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "count");
    if (v12 == objc_msgSend(v11, "count"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v13 = v11;
      v9 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v14 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v13);
            if (!objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17))
            {
              LOBYTE(v9) = 1;
              goto LABEL_19;
            }
          }
          v9 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_19:

    }
    else
    {
      LOBYTE(v9) = 1;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }
LABEL_21:

  return v9;
}

- (void)_calculateHandleInfoOverrideIfPermittedForChatIdentifier:(id)a3 style:(unsigned __int8)a4 completion:(id)a5
{
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t isKindOfClass;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void (**v37)(id, id);
  id v38;
  id obj;
  _QWORD v40[5];
  uint8_t v41[8];
  uint8_t *v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _BYTE v53[128];
  uint64_t v54;

  v6 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v37 = (void (**)(id, id))a5;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInternalInstall");

  if (v6 == 43 && v8)
  {
    IMGetCachedDomainValueForKey();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();
    objc_opt_class();
    v9 = v36;
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = v36;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v46;
        v14 = *MEMORY[0x1E0D36D90];
        v15 = *MEMORY[0x1E0D36E10];
        v16 = *MEMORY[0x1E0D36C20];
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v46 != v13)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            v51[0] = v14;
            v51[1] = v15;
            v52[0] = v18;
            v52[1] = v18;
            v51[2] = v16;
            v52[2] = &unk_1E92716C8;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v19);

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v12);
      }

      objc_msgSend(MEMORY[0x1E0D36B08], "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D36B00];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(obj, "componentsJoinedByString:", CFSTR(","));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("I am overriding chat participants for %@ to %@. This was triggered by a regression test."), v38, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", v23, CFSTR("I am doing something sneaky."), v26, CFSTR("I did it!"), CFSTR("I did not do that."), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)v41 = 0;
      v42 = v41;
      v43 = 0x2020000000;
      v44 = 0;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = sub_1D15AB64C;
      v40[3] = &unk_1E922E3C0;
      v40[4] = v41;
      objc_msgSend(v20, "addUserNotification:listener:completionHandler:", v27, 0, v40);
      while (!v42[24])
      {
        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "dateByAddingTimeInterval:", 0.5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "runUntilDate:", v30);

      }
      v31 = objc_msgSend(v27, "response");
      if (v31)
      {
        if (IMOSLoggingEnabled(v31))
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, " => rejected participant override", buf, 2u);
          }

        }
      }
      else
      {
        if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(obj, "componentsJoinedByString:", CFSTR(","));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v35;
            _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, " => !!! Overriding participants to %@ !!!", buf, 0xCu);

          }
        }
        v37[2](v37, v11);
      }
      _Block_object_dispose(v41, 8);

    }
    else
    {
      if (!IMOSLoggingEnabled(isKindOfClass))
      {
LABEL_29:

        goto LABEL_30;
      }
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, " => invalid chat override defaults set, ignoring", v41, 2u);
      }

    }
    v9 = v36;
    goto LABEL_29;
  }
LABEL_30:

}

- (NSDictionary)buddyPictures
{
  return 0;
}

- (id)pictureOfBuddy:(id)a3
{
  return 0;
}

- (id)pictureKeyForBuddy:(id)a3
{
  return 0;
}

- (NSArray)allBuddies
{
  void *v3;
  void *v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSMutableDictionary allKeys](self->_buddies, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSArray *)v4;
}

- (void)markBuddiesAsChanged:(id)a3
{
  NSRecursiveLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[IMDServiceSession beginBuddyChanges](self, "beginBuddyChanges");
  -[NSMutableSet addObjectsFromArray:](self->_changedBuddies, "addObjectsFromArray:", v5);

  -[IMDServiceSession endBuddyChanges](self, "endBuddyChanges");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)beginBuddyChanges
{
  int buddyChangeLevel;
  NSMutableSet *v4;
  NSMutableSet *changedBuddies;

  -[NSRecursiveLock lock](self->_lock, "lock");
  buddyChangeLevel = self->_buddyChangeLevel;
  self->_buddyChangeLevel = buddyChangeLevel + 1;
  if (!buddyChangeLevel)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    changedBuddies = self->_changedBuddies;
    self->_changedBuddies = v4;

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)changeProperty:(id)a3 ofBuddy:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IMDServiceSession canonicalFormOfID:](self, "canonicalFormOfID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    if (objc_msgSend(v8, "length"))
    {
      v12 = *MEMORY[0x1E0D36D90];
      v13 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D36D90]);
      if ((_DWORD)v13)
      {
        if (IMOSLoggingEnabled(v13))
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            v18 = 138412290;
            v19 = v9;
            _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Tried to change IDProperty for buddy ID: %@   bailing", (uint8_t *)&v18, 0xCu);
          }
LABEL_15:

        }
      }
      else
      {
        -[NSRecursiveLock lock](self->_lock, "lock");
        -[NSMutableDictionary objectForKey:](self->_buddies, "objectForKey:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "objectForKey:", v8);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!v10)
          {
            -[NSRecursiveLock unlock](self->_lock, "unlock");
            goto LABEL_28;
          }
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v9, v12);
          -[NSMutableDictionary setObject:forKey:](self->_buddies, "setObject:forKey:", v16, v11);
          v17 = 0;
        }
        if (v17 != v10 && (objc_msgSend(v10, "isEqual:", v17) & 1) == 0)
        {
          if (v10)
            objc_msgSend(v16, "setObject:forKey:", v10, v8);
          else
            objc_msgSend(v16, "removeObjectForKey:", v8);
          -[IMDServiceSession beginBuddyChanges](self, "beginBuddyChanges");
          -[NSMutableSet addObject:](self->_changedBuddies, "addObject:", v11);
          -[IMDServiceSession endBuddyChanges](self, "endBuddyChanges");
        }
        -[NSRecursiveLock unlock](self->_lock, "unlock");

      }
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v9;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Tried to change empty property for buddy ID: %@", (uint8_t *)&v18, 0xCu);
      }
      goto LABEL_15;
    }
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Tried to change property %@ with nil buddy ID", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_28:

}

- (void)clearPropertiesOfBuddy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[IMDServiceSession canonicalFormOfID:](self, "canonicalFormOfID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_buddies, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v16 = 8;
      v17 = v4;
      v11 = 0;
      v12 = *(_QWORD *)v19;
      v13 = (id)*MEMORY[0x1E0D36D90];
      do
      {
        v14 = 0;
        v15 = v11;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v8);
          v11 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * v14);

          if (v11 != v13)
            objc_msgSend(v7, "removeObjectForKey:", v11);
          ++v14;
          v15 = v11;
        }
        while (v10 != v14);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);

      v4 = v17;
    }
    -[IMDServiceSession beginBuddyChanges](self, "beginBuddyChanges", v16, v17);
    -[NSMutableSet addObject:](self->_changedBuddies, "addObject:", v5);
    -[IMDServiceSession endBuddyChanges](self, "endBuddyChanges");

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)endBuddyChanges
{
  int buddyChangeLevel;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSMutableSet *changedBuddies;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  buddyChangeLevel = self->_buddyChangeLevel;
  if (buddyChangeLevel <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMDServiceSession_BuddyList.m"), 169, CFSTR("Too many calls to [IMDService endBuddyChanges]!"));

    buddyChangeLevel = self->_buddyChangeLevel;
  }
  v5 = buddyChangeLevel - 1;
  self->_buddyChangeLevel = v5;
  if (!v5)
  {
    if (-[NSMutableSet count](self->_changedBuddies, "count"))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[NSMutableSet allObjects](self->_changedBuddies, "allObjects", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            -[NSMutableDictionary objectForKey:](self->_buddies, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v6, "addObject:", v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

      -[IMDServiceSession broadcaster](self, "broadcaster");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession accountID](self, "accountID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "account:buddyPropertiesChanged:", v14, v6);

    }
    changedBuddies = self->_changedBuddies;
    self->_changedBuddies = 0;

  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (id)property:(id)a3 ofBuddy:(id)a4
{
  NSRecursiveLock *lock;
  id v7;
  id v8;
  NSMutableDictionary *buddies;
  void *v10;
  void *v11;
  void *v12;

  lock = self->_lock;
  v7 = a4;
  v8 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  buddies = self->_buddies;
  -[IMDServiceSession canonicalFormOfID:](self, "canonicalFormOfID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](buddies, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v12;
}

- (id)localProperty:(id)a3 ofBuddy:(id)a4
{
  NSRecursiveLock *lock;
  id v7;
  id v8;
  NSMutableDictionary *localProperties;
  void *v10;
  void *v11;
  void *v12;

  lock = self->_lock;
  v7 = a4;
  v8 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  localProperties = self->_localProperties;
  -[IMDServiceSession canonicalFormOfID:](self, "canonicalFormOfID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](localProperties, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v12;
}

- (void)clearLocalProperties
{
  NSMutableDictionary *localProperties;

  -[NSRecursiveLock lock](self->_lock, "lock");
  localProperties = self->_localProperties;
  self->_localProperties = 0;

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (id)localPropertiesOfBuddy:(id)a3
{
  NSRecursiveLock *lock;
  id v5;
  void *v6;
  NSMutableDictionary *localProperties;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[IMDServiceSession canonicalFormOfID:](self, "canonicalFormOfID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  localProperties = self->_localProperties;
  if (!localProperties)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_localProperties;
    self->_localProperties = v8;

    localProperties = self->_localProperties;
  }
  -[NSMutableDictionary objectForKey:](localProperties, "objectForKey:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](self->_localProperties, "setObject:forKey:", v10, v6);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v10;
}

- (void)changeLocalProperty:(id)a3 ofBuddy:(id)a4 to:(id)a5
{
  NSRecursiveLock *lock;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a5;
  lock = self->_lock;
  v9 = a4;
  v10 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[IMDServiceSession localPropertiesOfBuddy:](self, "localPropertiesOfBuddy:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v11, "setObject:forKey:", v12, v10);
  else
    objc_msgSend(v11, "removeObjectForKey:", v10);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)hasCapability:(unint64_t)a3
{
  return (a3 & ~-[IMDServiceSession capabilities](self, "capabilities")) == 0;
}

- (int64_t)maxSizePerAttachmentWithCount:(int)a3 forChat:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(v6, "lastAddressedLocalHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastAddressedSIMID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[IMDServiceSession maxSizePerAttachmentWithCount:lastAddressedHandle:lastAddressedSIMID:](self, "maxSizePerAttachmentWithCount:lastAddressedHandle:lastAddressedSIMID:", v4, v7, v8);
  return v9;
}

- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)server
{
  return (id)-[NSString stringByRemovingWhitespace](self->_serverHost, "stringByRemovingWhitespace");
}

- (void)setRegistrationStatus:(int64_t)a3 error:(int)a4 alertInfo:(id)a5
{
  uint64_t v5;
  __CFDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id value;

  v5 = *(_QWORD *)&a4;
  value = a5;
  v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D36F70], v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D36F60], v10);

  if (value)
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D36F58], value);
  -[IMDServiceSession account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E0D36F68]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writeAccountDefaults:", v12);

}

- (int64_t)registrationStatus
{
  void *v2;
  int64_t v3;

  -[IMDServiceSession account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "registrationStatus");

  return v3;
}

- (int)registrationError
{
  void *v2;
  int v3;

  -[IMDServiceSession account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "registrationError");

  return v3;
}

- (NSDictionary)registrationAlertInfo
{
  void *v2;
  void *v3;

  -[IMDServiceSession account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registrationAlertInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)loginID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[IMDServiceSession account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36F00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession canonicalFormOfID:](self, "canonicalFormOfID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)noteBadPassword
{
  NSString *password;

  self->_badPass = 1;
  password = self->_password;
  self->_password = 0;

  -[IMDServiceSession disallowReconnection](self, "disallowReconnection");
}

- (void)_abandonPWFetcher
{
  NSString *pwRequestID;
  int v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  NSString **p_pwRequestID;
  NSString *v9;
  void *v10;
  NSString *v11;
  NSObject *v12;
  int v13;
  IMDServiceSession *v14;
  __int16 v15;
  IMDServiceSession *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  pwRequestID = self->_pwRequestID;
  v4 = IMOSLoggingEnabled(self);
  if (pwRequestID)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = self->_pwRequestID;
        v13 = 138412546;
        v14 = (IMDServiceSession *)v6;
        v15 = 2112;
        v16 = self;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Abandoning password fetcher with request ID: %@  session: %@", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D20C18], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    p_pwRequestID = &self->_pwRequestID;
    v9 = self->_pwRequestID;
    -[IMDServiceSession displayName](self, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelRequestID:serviceIdentifier:", v9, v10);

    v11 = *p_pwRequestID;
    *p_pwRequestID = 0;

  }
  else if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = self;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "No pending password fetch requests for session: %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (void)_abandonSystemProxySettingsFetcher
{
  IMSystemProxySettingsFetcher *systemProxySettingsFetcher;

  -[IMSystemProxySettingsFetcher setDelegate:](self->_systemProxySettingsFetcher, "setDelegate:", 0);
  systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
  self->_systemProxySettingsFetcher = 0;

}

- (void)accountDefaultsChanged:(id)a3
{
  -[IMDServiceSession _updateNetworkMonitorFromAccountDefaultsIgnoringProxy:](self, "_updateNetworkMonitorFromAccountDefaultsIgnoringProxy:", 0);
}

- (unint64_t)capabilities
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  unint64_t v16;
  void *v17;
  int v18;

  -[IMDServiceSession service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCapability:", *MEMORY[0x1E0D38DB8]);

  if (v4)
    v5 = 8;
  else
    v5 = 0;
  -[IMDServiceSession service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsCapability:", *MEMORY[0x1E0D38E30]);

  if (v7)
    v5 |= 0x400uLL;
  -[IMDServiceSession service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsCapability:", *MEMORY[0x1E0D38E50]);

  if (v9)
    v5 |= 0x100uLL;
  -[IMDServiceSession service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportsCapability:", *MEMORY[0x1E0D38D80]);

  if (v11)
    v5 |= 0x30uLL;
  -[IMDServiceSession service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsCapability:", *MEMORY[0x1E0D38DC0]);

  if (v13)
    v5 |= 0x400000000000uLL;
  -[IMDServiceSession service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsCapability:", *MEMORY[0x1E0D38E70]);

  if (v15)
    v16 = v5 | 0x800000000000;
  else
    v16 = v5;
  -[IMDServiceSession service](self, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "supportsCapability:", *MEMORY[0x1E0D38E38]);

  if (v18)
    return v16 | 4;
  else
    return v16;
}

- (unsigned)blockingMode
{
  return 0;
}

- (id)allowList
{
  return 0;
}

- (id)blockList
{
  return 0;
}

- (BOOL)blockIdleStatus
{
  return 0;
}

- (id)defaultChatSuffix
{
  return 0;
}

- (BOOL)shouldImitateGroupChatUsingChatRooms
{
  return 0;
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7
{
  MEMORY[0x1E0DE7D20](self, sel_joinChat_style_groupID_joinProperties_);
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9
{
  MEMORY[0x1E0DE7D20](self, sel_joinChat_style_groupID_joinProperties_);
}

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChat:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  objc_class *v14;
  objc_method *InstanceMethod;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v6 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (objc_class *)objc_opt_class();
  v14 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v14, sel_invitePersonInfo_withMessage_toChat_style_);
  if (class_getInstanceMethod(v13, sel_invitePersonInfo_withMessage_toChat_style_) == InstanceMethod)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v23 = v10;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      v20 = *MEMORY[0x1E0D36D90];
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "objectForKey:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDServiceSession invitePerson:withMessage:toChat:style:](self, "invitePerson:withMessage:toChat:style:", v22, v11, v12, v6);

          ++v21;
        }
        while (v18 != v21);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v18);
    }

    v10 = v23;
  }

}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a7;
  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "/*-------calling into sendGroupPhotoUpdate from legacy service session, please file a radar-------*/", v15, 2u);
    }

  }
}

- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "/*-------calling into _requestGroupPhotoResendForChatGUID from legacy service session, please file a radar-------*/", v11, 2u);
    }

  }
}

- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint8_t v16[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "/*-------calling into retryGroupPhotoUpload from legacy service session, please file a radar-------*/", v16, 2u);
    }

  }
}

- (void)sendChatbotSpamReport:(id)a3 spamType:(unint64_t)a4
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "/*-------calling into sendChatbotSpamReport from legacy service session, please file a radar-------*/", v6, 2u);
    }

  }
}

- (_FZChatRoomValidity)validityOfChatRoomName:(id)a3
{
  return (_FZChatRoomValidity)0x20FFFFFFFFLL;
}

- (void)closeSessionForChat:(id)a3 chatGUID:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6
{
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v7 = a3;
  v8 = a4;
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "/*-------calling into closeSessionForChat from legacy service session, please file a radar-------*/", v10, 2u);
    }

  }
}

- (void)joinChatID:(id)a3 handleInfo:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 joinProperties:(id)a10
{
  -[IMDServiceSession joinChat:handleInfo:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:](self, "joinChat:handleInfo:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:", a5, a4, a6, a7, a8, a9);
}

- (void)removeChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5
{
  MEMORY[0x1E0DE7D20](self, sel_removeChat_style_);
}

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7
{
  MEMORY[0x1E0DE7D20](self, sel_invitePersonInfo_withMessage_toChat_style_);
}

- (void)declineInvitationToChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5
{
  MEMORY[0x1E0DE7D20](self, sel_declineInvitationToChat_style_);
}

- (void)sendMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  -[IMDServiceSession sendMessage:toChat:style:](self, "sendMessage:toChat:style:", a3, a5, a6);
}

- (void)sendJunkReportMessage:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_sendJunkReportMessage_);
}

- (void)setProperties:(id)a3 ofParticipant:(id)a4 inChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7
{
  MEMORY[0x1E0DE7D20](self, sel_setProperties_ofParticipant_inChat_style_);
}

- (void)closeSessionChatID:(id)a3 identifier:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6
{
  MEMORY[0x1E0DE7D20](self, sel_closeSessionForChat_chatGUID_didDeleteConversation_style_);
}

- (BOOL)sendNicknameUpdatesToPeerDevices:(id)a3 toDestinations:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "/*-------calling into sendNicknameUpdatesToPeerDevices: from service that doesn't support it. File a radar-------*/", v9, 2u);
    }

  }
  return 0;
}

- (void)sendNicknameInfoToChatID:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "/*-------calling into sendNicknameInfoToChatID: from service that doesn't support it. File a radar-------*/", v5, 2u);
    }

  }
}

- (BOOL)reflectMarkUnreadToPeerDevicesForMessageGUID:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "/*-------calling into reflectMarkUnreadToPeerDevicesForMessageGUID: from service that doesn't support it. File a radar-------*/", v6, 2u);
    }

  }
  return 0;
}

- (BOOL)reflectRecoverChatToPeerDevicesForMessageGUID:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = a3;
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "/*-------calling into reflectRecoverChatToPeerDevicesForMessageGUID: from service that doesn't support it. File a radar-------*/", v6, 2u);
    }

  }
  return 0;
}

- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint8_t v18[16];

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a9;
  v16 = a10;
  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "/*-------calling into sendEditedMessage: from service that doesn't support it. File a radar-------*/", v18, 2u);
    }

  }
}

- (BOOL)chatCanMergeWithSuperChat:(id)a3
{
  return 1;
}

- (id)groupIDForChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a3;
  if (-[IMDServiceSession isReplicating](self, "isReplicating"))
  {
    -[IMDServiceSession mainSession](self, "mainSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupIDForChat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "groupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setGroupID:forChatAndAllSiblings:", v6, v4);

    }
  }
  else
  {
    objc_msgSend(v4, "groupID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_firewallUserNotificationForService:(id)a3
{
  return 0;
}

- (BOOL)warnIfPortBlocked:(int)a3 forAction:(id)a4
{
  return 0;
}

- (void)userNotificationDidFinish:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", CFSTR("__ksFirewallUserNotificationIdentifier")))
    -[IMDServiceSession _handleFirewallUserNotificationDidFinish:](self, "_handleFirewallUserNotificationDidFinish:", v5);

}

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)qword_1ED936090;
    qword_1ED936090 = (uint64_t)CFSTR("Not Connected");

    v3 = (void *)qword_1ED936098;
    qword_1ED936098 = (uint64_t)CFSTR("Unexpectedly disconnected");

    v4 = (void *)qword_1ED9360A0;
    qword_1ED9360A0 = (uint64_t)CFSTR("Disconnecting...");

    v5 = (void *)qword_1ED9360A8;
    qword_1ED9360A8 = (uint64_t)CFSTR("Connecting...");

    v6 = (void *)qword_1ED9360B0;
    qword_1ED9360B0 = (uint64_t)CFSTR("Connecfted");

  }
}

- (void)disallowReconnection
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMDAccount accountID](self->_account, "accountID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "-[IMDServiceSession disallowReconnection] %@", (uint8_t *)&v5, 0xCu);

    }
  }
  self->_shouldReconnect = 0;
  -[IMDServiceSession _clearAutoReconnectTimer](self, "_clearAutoReconnectTimer");
}

- (void)autoReconnect
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_activated)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[IMDServiceSession accounts](self, "accounts", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[IMDServiceSession autoReconnectWithAccount:](self, "autoReconnectWithAccount:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)autoReconnectWithAccount:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _BOOL8 v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "loginID");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accountID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412546;
        v18 = v7;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEBUG, "Auto-Reconnect Request: %@:%@", (uint8_t *)&v17, 0x16u);

      }
    }
    if (-[IMDServiceSession accountShouldBeAlwaysLoggedIn](self, "accountShouldBeAlwaysLoggedIn"))
    {
      v9 = -[IMDServiceSession networkConditionsAllowLogin](self, "networkConditionsAllowLogin");
      if (v9)
      {
        v10 = objc_msgSend(v5, "loginStatus");
        if (v10 <= 2)
        {
          if (IMOSLoggingEnabled(v10))
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v5, "loginID");
              v12 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "accountID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = 138412546;
              v18 = v12;
              v19 = 2112;
              v20 = v13;
              _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_DEBUG, "Reconnecting account: %@:%@", (uint8_t *)&v17, 0x16u);

            }
          }
          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_loginWithAccount_, 0);
          -[IMDServiceSession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_loginWithAccount_, v5, 1.0);
        }
      }
      else if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "loginID");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accountID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = v15;
          v19 = 2112;
          v20 = v16;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_DEBUG, "Auto-Reconnect failed (Network conditions don't allow it): %@:%@", (uint8_t *)&v17, 0x16u);

        }
      }
    }
  }

}

- (void)_doLoginIgnoringProxy:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[IMDServiceSession accounts](self, "accounts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[IMDServiceSession _doLoginIgnoringProxy:withAccount:](self, "_doLoginIgnoringProxy:withAccount:", v3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_doLoginIgnoringProxy:(BOOL)a3 withAccount:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  unint64_t v10;
  NSString *loginID;
  NSString *serverHost;
  NSString *proxyHost;
  NSString *proxyAccount;
  NSString *proxyPassword;
  NSObject *v16;
  NSString *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  id v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  id v56;
  void *v57;
  IMSystemProxySettingsFetcher *v58;
  IMSystemProxySettingsFetcher *systemProxySettingsFetcher;
  void *v60;
  void *v61;
  NSString *v62;
  NSString *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  BOOL v68;
  void *v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_activated)
  {
    v68 = a3;
    if (IMOSLoggingEnabled(-[NSRecursiveLock lock](self->_lock, "lock")))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "loginID");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accountID");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v71 = v8;
        v72 = 2112;
        v73 = v9;
        v74 = 2048;
        v75 = objc_msgSend(v6, "loginStatus");
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_DEBUG, "Do Login: %@:%@  (serviceLoginStatus: %lu)", buf, 0x20u);

      }
    }
    v10 = objc_msgSend(v6, "loginStatus");
    if (v10 > 1)
    {
      if (!IMOSLoggingEnabled(v10))
      {
LABEL_61:
        -[NSRecursiveLock unlock](self->_lock, "unlock");
        goto LABEL_62;
      }
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[IMDServiceSession loginID](self, "loginID");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        -[IMDAccount accountID](self->_account, "accountID");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = -[IMDAccount loginStatus](self->_account, "loginStatus");
        *(_DWORD *)buf = 138412802;
        v71 = v24;
        v72 = 2112;
        v73 = v25;
        v74 = 2048;
        v75 = v26;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_DEBUG, "Ignoring Login: %@:%@  (serviceLoginStatus: %lu)", buf, 0x20u);

      }
LABEL_60:

      goto LABEL_61;
    }
    -[IMDServiceSession refreshServiceCapabilities](self, "refreshServiceCapabilities");
    loginID = self->_loginID;
    self->_loginID = 0;

    serverHost = self->_serverHost;
    self->_serverHost = 0;

    proxyHost = self->_proxyHost;
    self->_proxyHost = 0;

    proxyAccount = self->_proxyAccount;
    self->_proxyAccount = 0;

    proxyPassword = self->_proxyPassword;
    self->_proxyPassword = 0;

    -[IMDServiceSession accountDefaults](self, "accountDefaults");
    v16 = objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession loginID](self, "loginID");
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v18 = self->_loginID;
    self->_loginID = v17;

    -[NSObject objectForKey:](v16, "objectForKey:", *MEMORY[0x1E0D36FD8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self->_useSSL = objc_msgSend(v19, "BOOLValue");

    if (self->_useSSL)
    {
      v66 = *MEMORY[0x1E0D36F98];
      -[NSObject objectForKey:](v16, "objectForKey:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByRemovingWhitespace");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = *MEMORY[0x1E0D36FA0];
      -[NSObject objectForKey:](v16, "objectForKey:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession service](self, "service");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length"))
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(v69, "defaultAccountSettings");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKey:", v66);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByRemovingWhitespace");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = objc_msgSend(v34, "length") != 0;
        v21 = v34;
      }
      if (objc_msgSend(v21, "length"))
      {
        v35 = v21;
      }
      else
      {
        -[NSObject objectForKey:](v16, "objectForKey:", *MEMORY[0x1E0D36F88]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringByRemovingWhitespace");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v35, "length"))
          v23 = 1;
      }
      if (objc_msgSend(v35, "length"))
      {
        v28 = v35;
      }
      else
      {
        objc_msgSend(v69, "defaultAccountSettings");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKey:", *MEMORY[0x1E0D36F88]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "stringByRemovingWhitespace");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v28, "length"))
          v23 = 1;
      }
      if (objc_msgSend(v22, "intValue"))
      {
        v39 = v22;
      }
      else
      {
        objc_msgSend(v69, "defaultAccountSettings");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKey:", v65);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v39, "intValue"))
          v23 = 1;
      }
      if (objc_msgSend(v39, "intValue"))
      {
        v41 = v39;
      }
      else
      {
        -[NSObject objectForKey:](v16, "objectForKey:", *MEMORY[0x1E0D36F90]);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v41, "intValue"))
          v23 = 1;
      }
      if (objc_msgSend(v41, "intValue"))
      {
        v42 = v41;
      }
      else
      {
        objc_msgSend(v69, "defaultAccountSettings");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKey:", *MEMORY[0x1E0D36F90]);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v42, "intValue"))
          v23 = 1;
      }
      objc_storeStrong((id *)&self->_serverHost, v28);
      self->_serverPort = objc_msgSend(v42, "intValue");
      if (v28)
        v44 = v23;
      else
        v44 = 0;
      if (!v44 || !v42)
        goto LABEL_55;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v28, v66, v42, v65, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession account](self, "account");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "writeAccountDefaults:", v45);
    }
    else
    {
      v67 = *MEMORY[0x1E0D36F88];
      -[NSObject objectForKey:](v16, "objectForKey:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringByRemovingWhitespace");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = *MEMORY[0x1E0D36F90];
      -[NSObject objectForKey:](v16, "objectForKey:", *MEMORY[0x1E0D36F90]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession service](self, "service");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "length"))
      {
        v31 = 0;
      }
      else
      {
        objc_msgSend(v69, "defaultAccountSettings");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKey:", v67);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringByRemovingWhitespace");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v49, "length") != 0;
        v28 = v49;
      }
      if (objc_msgSend(v30, "intValue"))
      {
        v42 = v30;
      }
      else
      {
        objc_msgSend(v69, "defaultAccountSettings");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKey:", v29);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v42, "intValue"))
          v31 = 1;
      }
      objc_storeStrong((id *)&self->_serverHost, v28);
      self->_serverPort = objc_msgSend(v42, "intValue");
      if (v28)
        v51 = v31;
      else
        v51 = 0;
      if (!v51 || !v42)
        goto LABEL_55;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v28, v67, v42, v29, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDServiceSession account](self, "account");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "writeAccountDefaults:", v45);
    }

LABEL_55:
    if (v68
      || (-[NSObject objectForKey:](v16, "objectForKey:", *MEMORY[0x1E0D36FC8]),
          v52 = (void *)objc_claimAutoreleasedReturnValue(),
          v53 = objc_msgSend(v52, "BOOLValue"),
          v52,
          !v53))
    {
      self->_proxyType = 4;
      -[IMDServiceSession _login_serverSettingsReadyWithAccount:](self, "_login_serverSettingsReadyWithAccount:", v6);
    }
    else
    {
      -[NSObject objectForKey:](v16, "objectForKey:", *MEMORY[0x1E0D36FD0]);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "BOOLValue");

      if (v55)
      {
        -[IMDServiceSession _abandonSystemProxySettingsFetcher](self, "_abandonSystemProxySettingsFetcher");
        v56 = objc_alloc(MEMORY[0x1E0D36AD8]);
        -[IMDServiceSession server](self, "server");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (IMSystemProxySettingsFetcher *)objc_msgSend(v56, "initWithHost:port:delegate:", v57, self->_serverPort, self);
        systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
        self->_systemProxySettingsFetcher = v58;

        -[IMSystemProxySettingsFetcher retrieveProxySettings](self->_systemProxySettingsFetcher, "retrieveProxySettings");
      }
      else
      {
        -[NSObject objectForKey:](v16, "objectForKey:", *MEMORY[0x1E0D36F48]);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        self->_proxyType = (int)objc_msgSend(v60, "intValue");

        -[NSObject objectForKey:](v16, "objectForKey:", *MEMORY[0x1E0D36F38]);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "stringByRemovingWhitespace");
        v62 = (NSString *)objc_claimAutoreleasedReturnValue();
        v63 = self->_proxyHost;
        self->_proxyHost = v62;

        -[NSObject objectForKey:](v16, "objectForKey:", *MEMORY[0x1E0D36F40]);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        self->_proxyPort = objc_msgSend(v64, "intValue");

        -[IMDServiceSession _login_serverSettingsReadyWithAccount:](self, "_login_serverSettingsReadyWithAccount:", v6);
      }
    }
    goto LABEL_60;
  }
LABEL_62:

}

- (void)_login_serverSettingsReadyWithAccount:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  IMDServiceSession *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  IMNetworkMonitor *networkMonitor;
  void *v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  IMDServiceSession *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[IMDServiceSession loginID](self, "loginID");
        v7 = (IMDServiceSession *)(id)objc_claimAutoreleasedReturnValue();
        -[IMDAccount accountID](self->_account, "accountID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v7;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEBUG, "_login_serverSettingsReadyWithAccount: %@:%@", (uint8_t *)&v24, 0x16u);

      }
    }
    -[IMDServiceSession server](self, "server");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDServiceSession service](self, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "requiresHost");

    if (objc_msgSend(v9, "length"))
      v12 = 0;
    else
      v12 = v11;
    if (v12 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("The account name or server is not valid."), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_DEBUG, "  setting service status to disconnected, account or server is invalid", (uint8_t *)&v24, 2u);
        }

      }
      objc_msgSend(v5, "_forceSetLoginStatus:message:reason:properties:", 1, v14, 0, 0);
      -[IMDServiceSession disallowReconnection](self, "disallowReconnection");

      goto LABEL_25;
    }
    networkMonitor = self->_networkMonitor;
    if (!networkMonitor)
      goto LABEL_19;
    if ((-[IMNetworkMonitor immediatelyReachable](networkMonitor, "immediatelyReachable") & 1) == 0
      && !-[IMDServiceSession overrideNetworkAvailability](self, "overrideNetworkAvailability"))
    {
      IMDaemonCoreBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("A network error occurred.\n"), &stru_1E92346B0, CFSTR("DaemonCoreLocalizable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "_forceSetLoginStatus:message:reason:properties:", 0, v23, 0, 0);
      goto LABEL_25;
    }
    if (!self->_networkMonitor)
    {
LABEL_19:
      -[IMDServiceSession service](self, "service");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "ignoresNetworkConnectivity");

      if ((v19 & 1) == 0 && IMOSLoggingEnabled(v20))
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v24 = 138412290;
          v25 = self;
          _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "****** No IMNetworkMonitor for login of account: %@", (uint8_t *)&v24, 0xCu);
        }

      }
    }
    -[IMDServiceSession _data_connection_readyWithAccount:](self, "_data_connection_readyWithAccount:", v5);
LABEL_25:

  }
}

- (void)_data_connection_readyWithAccount:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSString *password;
  void *v10;
  NSString *loginID;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[IMDServiceSession loginID](self, "loginID");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[IMDAccount accountID](self->_account, "accountID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v7;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEBUG, "_data_connection_ready: %@:%@", buf, 0x16u);

      }
    }
    if (!self->_shouldReconnect)
    {
      password = self->_password;
      self->_password = 0;

    }
    if (-[IMDServiceSession accountNeedsPassword](self, "accountNeedsPassword") && !self->_password)
    {
      -[IMDServiceSession _abandonPWFetcher](self, "_abandonPWFetcher");
      objc_msgSend(MEMORY[0x1E0D20C18], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      loginID = self->_loginID;
      -[IMDServiceSession service](self, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "internalName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = sub_1D15E4AF0;
      v14[3] = &unk_1E922F2F0;
      v14[4] = self;
      v15 = v5;
      objc_msgSend(v10, "fetchPasswordForProfileID:username:service:outRequestID:completionBlock:", 0, loginID, v13, 0, v14);

    }
    else
    {
      -[IMDServiceSession _login_usernameAndPasswordReadyWithAccount:](self, "_login_usernameAndPasswordReadyWithAccount:", v5);
    }
  }

}

- (void)_login_usernameAndPasswordReadyWithAccount:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  IMSystemProxySettingsFetcher *systemProxySettingsFetcher;
  uint64_t v10;
  IMSystemProxySettingsFetcher **p_systemProxySettingsFetcher;
  IMSystemProxySettingsFetcher *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "loginID");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accountID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v7;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEBUG, "_login_usernameAndPasswordReady: %@:%@", (uint8_t *)&v13, 0x16u);

      }
    }
    if (self->_proxyType == 4)
    {
      -[IMDServiceSession _login_checkUsernameAndPasswordWithAccount:](self, "_login_checkUsernameAndPasswordWithAccount:", v5);
    }
    else
    {
      systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
      if (!systemProxySettingsFetcher)
      {
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D36AD8]), "initWithProxyProtocol:proxyHost:proxyPort:delegate:", self->_proxyType, self->_proxyHost, self->_proxyPort, self);
        p_systemProxySettingsFetcher = &self->_systemProxySettingsFetcher;
        v12 = *p_systemProxySettingsFetcher;
        *p_systemProxySettingsFetcher = (IMSystemProxySettingsFetcher *)v10;

        systemProxySettingsFetcher = *p_systemProxySettingsFetcher;
      }
      -[IMSystemProxySettingsFetcher retrieveProxyAccountSettings](systemProxySettingsFetcher, "retrieveProxyAccountSettings");
    }
  }

}

- (void)_login_checkUsernameAndPasswordWithAccount:(id)a3
{
  id v4;
  NSObject *v5;
  IMDServiceSession *v6;
  __CFString *v7;
  NSUInteger v8;
  const __CFString *v9;
  _BOOL4 badPass;
  const __CFString *v11;
  _BOOL8 v12;
  NSObject *v13;
  NSUInteger v14;
  NSUInteger v15;
  const __CFString *v16;
  _BOOL4 v17;
  const __CFString *v18;
  const __CFString *v19;
  unint64_t v20;
  void *v21;
  NSString **p_pwRequestID;
  NSString *v23;
  void *v24;
  NSString *loginID;
  BOOL *p_badPass;
  _BOOL8 v27;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  _BOOL8 v31;
  unint64_t v32;
  NSObject *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  NSString *v37;
  uint8_t buf[4];
  IMDServiceSession *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34 = v4;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        -[IMDServiceSession loginID](self, "loginID");
        v6 = (IMDServiceSession *)(id)objc_claimAutoreleasedReturnValue();
        -[IMDAccount accountID](self->_account, "accountID");
        v7 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v8 = -[NSString length](self->_password, "length");
        v9 = CFSTR("YES");
        badPass = self->_badPass;
        *(_DWORD *)buf = 138413058;
        if (v8)
          v11 = CFSTR("YES");
        else
          v11 = CFSTR("NO");
        v39 = v6;
        if (!badPass)
          v9 = CFSTR("NO");
        v40 = 2112;
        v41 = v7;
        v42 = 2112;
        v43 = v11;
        v44 = 2112;
        v45 = v9;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEBUG, "_login_checkUsernameAndPassword: %@:%@  has pass: %@   bad pass: %@", buf, 0x2Au);

      }
    }
    if ((-[NSString length](self->_password, "length")
       || !-[IMDServiceSession accountNeedsPassword](self, "accountNeedsPassword"))
      && (-[NSString length](self->_loginID, "length")
       || !-[IMDServiceSession accountNeedsLogin](self, "accountNeedsLogin"))
      && !self->_badPass)
    {
      v31 = -[IMDServiceSession networkConditionsAllowLogin](self, "networkConditionsAllowLogin");
      if (v31)
      {
        v32 = objc_msgSend(v34, "loginStatus");
        if (v32 > 3)
        {
          if (!IMOSLoggingEnabled(v32))
            goto LABEL_30;
          OSLogHandleForIMFoundationCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_DEBUG, "Strange, we're here, but already logged in", buf, 2u);
          }
        }
        else
        {
          if (self->_activated)
          {
            objc_msgSend(v34, "setLoginStatus:message:", 3, 0);
            -[IMDServiceSession loginServiceSessionWithAccount:](self, "loginServiceSessionWithAccount:", v34);
            goto LABEL_30;
          }
          if (!IMOSLoggingEnabled(v32))
            goto LABEL_30;
          OSLogHandleForIMFoundationCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_DEBUG, "Skipping login, we're not activated", buf, 2u);
          }
        }
      }
      else
      {
        if (!IMOSLoggingEnabled(v31))
          goto LABEL_30;
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_DEBUG, "_login_checkUsernameAndPassword: networkMonitor says we're not reachable", buf, 2u);
        }
      }

      goto LABEL_30;
    }
    v12 = -[IMDServiceSession accountNeedsPassword](self, "accountNeedsPassword");
    if (v12)
    {
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = -[NSString length](self->_password, "length");
          v15 = -[NSString length](self->_loginID, "length");
          v16 = CFSTR("YES");
          v17 = self->_badPass;
          if (v14)
            v18 = CFSTR("YES");
          else
            v18 = CFSTR("NO");
          *(_DWORD *)buf = 138413058;
          v39 = self;
          if (v15)
            v19 = CFSTR("YES");
          else
            v19 = CFSTR("NO");
          v40 = 2112;
          if (!v17)
            v16 = CFSTR("NO");
          v41 = v18;
          v42 = 2112;
          v43 = v19;
          v44 = 2112;
          v45 = v16;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_DEBUG, "Building password notification dialog for: %@   (has pass: %@   has login: %@  bad pass: %@)", buf, 0x2Au);
        }

      }
      v20 = -[IMDServiceSession capabilities](self, "capabilities");
      -[IMDServiceSession displayName](self, "displayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      p_pwRequestID = &self->_pwRequestID;
      v23 = self->_pwRequestID;
      -[IMDServiceSession _abandonPWFetcher](self, "_abandonPWFetcher");
      objc_msgSend(MEMORY[0x1E0D20C18], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      loginID = self->_loginID;
      p_badPass = &self->_badPass;
      v27 = self->_badPass;
      v37 = v23;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = sub_1D15E5334;
      v35[3] = &unk_1E922F318;
      v35[4] = self;
      v36 = v34;
      objc_msgSend(v24, "requestPasswordForUsername:service:badPassword:showForgotPassword:shouldRememberPassword:outRequestID:completionBlock:", loginID, v21, v27, (v20 >> 31) & 1, 1, &v37, v35);
      v28 = v37;

      v29 = *p_pwRequestID;
      *p_pwRequestID = v28;
      v30 = v28;

      *p_badPass = 0;
    }
  }
LABEL_30:

}

- (void)systemProxySettingsFetcher:(id)a3 retrievedHost:(id)a4 port:(unsigned __int16)a5 protocol:(int64_t)a6
{
  id v10;
  id v11;
  IMSystemProxySettingsFetcher *systemProxySettingsFetcher;

  v10 = a3;
  v11 = a4;
  if (self->_activated)
  {
    if (a6 == 4)
    {
      systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
      self->_systemProxySettingsFetcher = 0;

      -[IMDServiceSession _updateNetworkMonitorFromAccountDefaultsIgnoringProxy:](self, "_updateNetworkMonitorFromAccountDefaultsIgnoringProxy:", 1);
    }
    else
    {
      -[IMDServiceSession _updateNetworkMonitorWithRemoteHost:](self, "_updateNetworkMonitorWithRemoteHost:", v11);
    }
    self->_proxyType = a6;
    objc_storeStrong((id *)&self->_proxyHost, a4);
    self->_proxyPort = a5;
    im_dispatch_after();
  }

}

- (void)systemProxySettingsFetcher:(id)a3 retrievedAccount:(id)a4 password:(id)a5
{
  id v8;
  IMSystemProxySettingsFetcher *systemProxySettingsFetcher;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  if (self->_activated)
  {
    objc_storeStrong((id *)&self->_proxyAccount, a4);
    objc_storeStrong((id *)&self->_proxyPassword, a5);
    systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
    self->_systemProxySettingsFetcher = 0;

    +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountForAccountID:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      -[IMDServiceSession account](self, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[IMDServiceSession _login_checkUsernameAndPasswordWithAccount:](self, "_login_checkUsernameAndPasswordWithAccount:", v11);

  }
}

- (void)autoLogin
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(self))
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        -[IMDServiceSession loginID](self, "loginID");
        v4 = (id)objc_claimAutoreleasedReturnValue();
        -[IMDAccount accountID](self->_account, "accountID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v4;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_DEBUG, "autoLogin: %@:%@", (uint8_t *)&v10, 0x16u);

      }
    }
    -[IMDServiceSession accountID](self, "accountID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "length"))
    {

      return;
    }
    -[IMDServiceSession accountDefaults](self, "accountDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D36EA0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "BOOLValue"))
    {

    }
    else
    {
      v9 = -[IMDServiceSession accountShouldBeAlwaysLoggedIn](self, "accountShouldBeAlwaysLoggedIn");

      if (!v9)
        return;
    }
    -[IMDServiceSession login](self, "login");
  }
}

- (void)login
{
  id v3;

  -[IMDServiceSession account](self, "account");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession loginWithAccount:](self, "loginWithAccount:", v3);

}

- (void)loginWithAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_loginWithAccount_, 0)))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[IMDServiceSession loginID](self, "loginID");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        -[IMDAccount accountID](self->_account, "accountID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412546;
        v9 = v6;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Login request: %@:%@ (Setting should reconnect flag = YES)", (uint8_t *)&v8, 0x16u);

      }
    }
    self->_shouldReconnect = 1;
    -[IMDServiceSession _setAutoReconnectTimer](self, "_setAutoReconnectTimer");
    -[IMDServiceSession _doLoginIgnoringProxy:withAccount:](self, "_doLoginIgnoringProxy:withAccount:", 0, v4);
  }

}

- (void)logoutServiceSessionWithAccount:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *password;
  NSString *serverHost;
  NSString *loginID;
  NSString *proxyHost;
  NSString *proxyAccount;
  NSString *proxyPassword;
  int v13;
  IMDServiceSession *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v13 = 138412546;
        v14 = self;
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "-[IMDServiceSession logoutServiceSession]: %@, account:%@", (uint8_t *)&v13, 0x16u);
      }

    }
    if (self->_systemProxySettingsFetcher)
    {
      -[IMDServiceSession _abandonSystemProxySettingsFetcher](self, "_abandonSystemProxySettingsFetcher");
      objc_msgSend(v5, "_forceSetLoginStatus:message:reason:properties:", 0, 0, 0, 0);
    }
    -[IMDServiceSession _abandonPWFetcher](self, "_abandonPWFetcher");
    if (objc_msgSend(v5, "loginStatus"))
      objc_msgSend(v5, "_forceSetLoginStatus:message:reason:properties:", 0, 0, 0, 0);
    if (!self->_shouldReconnect)
    {
      password = self->_password;
      self->_password = 0;

      serverHost = self->_serverHost;
      self->_serverHost = 0;

    }
    loginID = self->_loginID;
    self->_loginID = 0;

    proxyHost = self->_proxyHost;
    self->_proxyHost = 0;

    proxyAccount = self->_proxyAccount;
    self->_proxyAccount = 0;

    proxyPassword = self->_proxyPassword;
    self->_proxyPassword = 0;

    self->_saveKeychainPassword = 0;
    if (-[IMDServiceSession accountShouldBeAlwaysLoggedIn](self, "accountShouldBeAlwaysLoggedIn"))
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_login, 0);
      -[IMDServiceSession performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_login, 0, 1.0);
    }
    if (self->_shouldReconnect)
      -[IMDServiceSession _setAutoReconnectTimer](self, "_setAutoReconnectTimer");
    else
      -[IMDServiceSession _clearAutoReconnectTimer](self, "_clearAutoReconnectTimer");
  }

}

- (void)logout
{
  id v3;

  -[IMDServiceSession account](self, "account");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDServiceSession logoutWithAccount:](self, "logoutWithAccount:", v3);

}

- (void)logoutWithAccount:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 activated;
  const __CFString *v7;
  _BOOL8 v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _BYTE v17[12];
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      activated = self->_activated;
      *(_DWORD *)v17 = 138412802;
      if (activated)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      *(_QWORD *)&v17[4] = self;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "-[%@ logoutWithAccount:%@] (activated = %@)", v17, 0x20u);
    }

  }
  if (self->_activated)
  {
    v8 = -[IMDServiceSession accountShouldBeAlwaysLoggedIn](self, "accountShouldBeAlwaysLoggedIn");
    v9 = v8;
    v10 = IMOSLoggingEnabled(v8);
    if (v9)
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          -[IMDServiceSession loginID](self, "loginID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v17 = 138412290;
          *(_QWORD *)&v17[4] = v12;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Tried to logout: %@  but we're not supposed to, reflecting this!", v17, 0xCu);

        }
      }
      if (objc_msgSend(v4, "loginStatus", *(_QWORD *)v17))
      {
        -[IMDServiceSession broadcaster](self, "broadcaster");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accountID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "account:loginStatusChanged:message:reason:properties:", v14, 4, CFSTR("<<Connected>>"), 0xFFFFFFFFLL, 0);

      }
    }
    else
    {
      if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          -[IMDServiceSession loginID](self, "loginID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v17 = 138412290;
          *(_QWORD *)&v17[4] = v16;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "** %@: clearing _shouldReconnectFlag at logout", v17, 0xCu);

        }
      }
      -[IMDServiceSession disallowReconnection](self, "disallowReconnection", *(_QWORD *)v17);
      -[IMDServiceSession logoutServiceSessionWithAccount:](self, "logoutServiceSessionWithAccount:", v4);
    }
  }

}

- (void)serviceSessionDidLoginWithAccount:(id)a3
{
  if (self->_activated)
  {
    objc_msgSend(a3, "_forceSetLoginStatus:message:reason:properties:", 4, 0, 0xFFFFFFFFLL, 0);
    -[IMDServiceSession _clearAutoReconnectTimer](self, "_clearAutoReconnectTimer");
    -[IMDServiceSession _abandonPWFetcher](self, "_abandonPWFetcher");
  }
}

- (void)serviceSessionDidLogoutWithAccount:(id)a3
{
  if (self->_activated)
  {
    objc_msgSend(a3, "_forceSetLoginStatus:message:reason:properties:", 0, 0, 0xFFFFFFFFLL, 0);
    -[IMDServiceSession _clearAutoReconnectTimer](self, "_clearAutoReconnectTimer");
  }
}

- (void)serviceSessionDidLogoutWithMessage:(id)a3 reason:(int)a4 properties:(id)a5 account:(id)a6
{
  if (self->_activated)
  {
    objc_msgSend(a6, "_forceSetLoginStatus:message:reason:properties:", 0, a3, *(_QWORD *)&a4, a5);
    -[IMDServiceSession _clearAutoReconnectTimer](self, "_clearAutoReconnectTimer");
  }
}

- (void)_wentOfflineWithAccount:(id)a3
{
  NSRecursiveLock *lock;
  id v5;

  if (self->_activated)
  {
    lock = self->_lock;
    v5 = a3;
    -[NSRecursiveLock lock](lock, "lock");
    -[NSMutableDictionary removeAllObjects](self->_buddies, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_localProperties, "removeAllObjects");
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    -[IMDServiceSession autoReconnectWithAccount:](self, "autoReconnectWithAccount:", v5);

  }
}

- (void)__forceSetLoginStatus:(unint64_t)a3 oldStatus:(unint64_t)a4 message:(id)a5 reason:(int)a6 properties:(id)a7 account:(id)a8
{
  uint64_t v10;
  __CFString *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  __CFNotificationCenter *DarwinNotifyCenter;
  _BYTE v28[22];
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v10 = *(_QWORD *)&a6;
  v31 = *MEMORY[0x1E0C80C00];
  v14 = (__CFString *)a5;
  v15 = a7;
  v16 = a8;
  v17 = v16;
  if (a3 > 3 || a4 < 4)
  {
    if (a3 == 4)
    {
      -[IMDServiceSession _abandonPWFetcher](self, "_abandonPWFetcher");
      v16 = (id)-[IMDServiceSession _clearAutoReconnectTimer](self, "_clearAutoReconnectTimer");
      if (self->_saveKeychainPassword)
      {
        v16 = -[NSString length](self->_password, "length");
        if (v16)
        {
          -[IMDServiceSession service](self, "service");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "internalName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          IMSetKeychainPassword();

          self->_saveKeychainPassword = 0;
        }
      }
    }
  }
  else
  {
    -[IMDServiceSession _wentOfflineWithAccount:](self, "_wentOfflineWithAccount:", v16);
    v16 = (id)-[IMDServiceSession autoReconnectWithAccount:](self, "autoReconnectWithAccount:", v17);
  }
  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = qword_1ED936090[a3];
      v24 = &stru_1E92346B0;
      *(_DWORD *)v28 = 138412802;
      *(_QWORD *)&v28[4] = v22;
      if (v14)
        v24 = v14;
      *(_WORD *)&v28[12] = 2112;
      *(_QWORD *)&v28[14] = v23;
      v29 = 2112;
      v30 = v24;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "%@: Login status changed to %@ (%@)", v28, 0x20u);

    }
  }
  -[IMDServiceSession broadcaster](self, "broadcaster", *(_OWORD *)v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accountID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "account:loginStatusChanged:message:reason:properties:", v26, a3, v14, v10, v15);

  if (objc_msgSend(v17, "isActive"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("__kIMDBadgeUtilitiesLoginStatusChangedNotification"), 0, 0, 1u);
  }
  if (a3 == 1)
    -[IMDServiceSession _setAutoReconnectTimer](self, "_setAutoReconnectTimer");

}

- (void)_setAutoReconnectTimer
{
  if (!self->_activated)
    -[IMDServiceSession _clearAutoReconnectTimer](self, "_clearAutoReconnectTimer");
}

- (void)_autoReconnectTimer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL8 v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  IMDServiceSession *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = self;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "-[IMDServiceSession _autoReconnectTimer]: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    v7 = -[IMDServiceSession networkConditionsAllowLogin](self, "networkConditionsAllowLogin");
    v8 = v7;
    v9 = IMOSLoggingEnabled(v7);
    if (v8)
    {
      if (v9)
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, " => Network appears to be up, we'll try to auto reconnect", (uint8_t *)&v12, 2u);
        }

      }
      -[IMDServiceSession autoReconnect](self, "autoReconnect");
      -[IMDServiceSession _reconnectIfNecessary](self, "_reconnectIfNecessary");
    }
    else if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, " ** Network does not appear to be up, we'll skip this attempt", (uint8_t *)&v12, 2u);
      }

    }
  }

}

- (void)_clearAutoReconnectTimer
{
  NSObject *v3;
  NSTimer **p_reconnectTimer;
  NSTimer *v5;
  int v6;
  IMDServiceSession *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "-[IMDServiceSession _clearAutoReconnectTimer]: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  p_reconnectTimer = &self->_reconnectTimer;
  -[NSTimer invalidate](*p_reconnectTimer, "invalidate");
  v5 = *p_reconnectTimer;
  *p_reconnectTimer = 0;

}

@end
