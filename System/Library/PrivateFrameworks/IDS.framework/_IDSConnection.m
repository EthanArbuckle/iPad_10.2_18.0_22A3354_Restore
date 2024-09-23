@implementation _IDSConnection

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_IDSConnection;
  return -[_IDSConnection init](&v3, sel_init);
}

- (_IDSConnection)initWithAccount:(id)a3 commands:(id)a4 indirectDelegateCallouts:(BOOL)a5 delegateContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _IDSConnection *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _IDSConnection *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *serviceToken;
  uint64_t v25;
  NSSet *commands;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id delegateContext;
  void *v32;
  IDSDirectMessageConnection *directMessageConnection;
  NSDictionary *directMessagingMetadata;
  objc_super v36;
  uint8_t buf[4];
  _IDSConnection *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907ECE80((uint64_t)self, v14);

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
        sub_1907ECF0C();

    }
    v36.receiver = self;
    v36.super_class = (Class)_IDSConnection;
    v19 = -[_IDSConnection init](&v36, sel_init);
    if (v19)
    {
      +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "_internal");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "serviceName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v38 = v19;
        v39 = 2112;
        v40 = v22;
        _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "_IDSConnection - initing {self: %p, account.serviceName: %@}", buf, 0x16u);

      }
      v19->_indirectDelegateCallouts = a5;
      v23 = objc_msgSend(MEMORY[0x1E0CB3940], "copyStringGUIDForObject:", v19);
      serviceToken = v19->_serviceToken;
      v19->_serviceToken = (NSString *)v23;

      *(_WORD *)&v19->_incomingMessageLoggingSequence = 0;
      v25 = objc_msgSend(v12, "copy");
      commands = v19->_commands;
      v19->_commands = (NSSet *)v25;

      objc_storeStrong((id *)&v19->_account, a3);
      -[IDSAccount _internal](v19->_account, "_internal");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "queue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addDelegate:queue:", v19, v29);

      objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v13);
      v30 = objc_claimAutoreleasedReturnValue();
      delegateContext = v19->_delegateContext;
      v19->_delegateContext = (id)v30;

      v19->_wakingDowngradeCount = 0;
      -[_IDSConnection daemonListener](v19, "daemonListener");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addHandler:", v19);

      -[_IDSConnection _connect](v19, "_connect");
      directMessageConnection = v19->_directMessageConnection;
      v19->_directMessageConnection = 0;

      directMessagingMetadata = v19->_directMessagingMetadata;
      v19->_directMessagingMetadata = 0;

    }
    self = v19;
    v15 = self;
  }

  return v15;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  _IDSConnection *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_INFO, "Account delegate has been cleaned up via weak references %p", buf, 0xCu);
  }

  -[_IDSConnection daemonController](self, "daemonController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeListenerID:", self->_serviceToken);

  -[_IDSConnection daemonListener](self, "daemonListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeHandler:", self);

  v6.receiver = self;
  v6.super_class = (Class)_IDSConnection;
  -[_IDSConnection dealloc](&v6, sel_dealloc);
}

- (void)createDirectMessageConnectionIfNeeded
{
  void *v3;
  int v4;
  NSObject *v5;
  IDSDirectMessageConnection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IDSDirectMessageConnection *v11;
  IDSDirectMessageConnection *directMessageConnection;
  NSDictionary *directMessagingMetadata;
  void *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  IDSDirectMessageConnection *v17;
  void *v18;
  void *v19;

  if (_IDSSupportsDirectMessaging())
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "assertQueueIsCurrent");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1907ECF98();

    }
    if (!self->_directMessageConnection)
    {
      v6 = [IDSDirectMessageConnection alloc];
      -[IDSAccount _internal](self->_account, "_internal");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "queue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[IDSDirectMessageConnection initWithServiceName:queue:delegate:](v6, "initWithServiceName:queue:delegate:", v8, v10, self);
      directMessageConnection = self->_directMessageConnection;
      self->_directMessageConnection = v11;

      directMessagingMetadata = self->_directMessagingMetadata;
      if (!directMessagingMetadata || !-[NSDictionary count](directMessagingMetadata, "count"))
      {
        -[_IDSConnection daemonListener](self, "daemonListener");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "getDirectMessagingMetadataDictionary");
        v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        v16 = self->_directMessagingMetadata;
        self->_directMessagingMetadata = v15;

      }
      if (-[NSDictionary count](self->_directMessagingMetadata, "count"))
        -[_IDSConnection receivedMetadataForDirectMessaging:](self, "receivedMetadataForDirectMessaging:", self->_directMessagingMetadata);
      v17 = self->_directMessageConnection;
      -[IDSAccount _internal](self->_account, "_internal");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "connectedDevices");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSDirectMessageConnection updateConnectedDevices:](v17, "updateConnectedDevices:", v19);

    }
  }
}

- (id)daemonController
{
  return +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
}

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

- (IDSAccount)account
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
      sub_1907ED024();

  }
  return self->_account;
}

- (BOOL)isActive
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  char v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907ED0B0();

  }
  -[IDSAccount _internal](self->_account, "_internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActive");

  return v7;
}

- (id)_activeDevice
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_IDSConnection account](self, "account", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isActive") & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_defaultPairedDevice
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_IDSConnection account](self, "account", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isDefaultPairedDevice") & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  -[_IDSConnection addDelegate:queue:completion:](self, "addDelegate:queue:completion:", a3, a4, 0);
}

- (void)addDelegate:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSMapTable *v15;
  NSMapTable *delegateToInfo;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907ED13C();

  }
  if (v8 && v9)
  {
    -[NSMapTable objectForKey:](self->_delegateToInfo, "objectForKey:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      if (!self->_delegateToInfo)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v15 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
        delegateToInfo = self->_delegateToInfo;
        self->_delegateToInfo = v15;

      }
      v17 = objc_alloc_init(MEMORY[0x1E0D34D00]);
      objc_msgSend(v17, "setQueue:", v9);
      -[NSMapTable setObject:forKey:](self->_delegateToInfo, "setObject:forKey:", v17, v8);

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_190742D30;
    v20[3] = &unk_1E2C62920;
    v20[4] = self;
    v18 = MEMORY[0x19400FE1C](v20);
    v19 = (void *)v18;
    if (v18)
    {
      (*(void (**)(uint64_t, void (**)(_QWORD)))(v18 + 16))(v18, v10);
    }
    else if (v10)
    {
      v10[2](v10);
    }

  }
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSUInteger v5;
  NSMapTable *delegateToInfo;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSMapTable removeObjectForKey:](self->_delegateToInfo, "removeObjectForKey:", v4);
    v5 = -[NSMapTable count](self->_delegateToInfo, "count");
    v4 = v7;
    if (!v5)
    {
      delegateToInfo = self->_delegateToInfo;
      self->_delegateToInfo = 0;

      v4 = v7;
    }
  }

}

- (void)_callDelegatesWithBlock:(id)a3
{
  -[_IDSConnection _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", a3, 0);
}

- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4
{
  -[_IDSConnection _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", 0, 0, a3, 0, a4);
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6
{
  -[_IDSConnection _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", a3, a4, a5, a6, 0);
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6 group:(id)a7
{
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  id v19;
  NSMapTable *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  dispatch_block_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *context;
  void (**v48)(id, uint64_t);
  void (**v49)(id, uint64_t);
  void (**v50)(_QWORD, _QWORD);
  NSObject *group;
  _QWORD v52[4];
  id v53;
  id v54;
  void (**v55)(id, uint64_t);
  void (**v56)(_QWORD, _QWORD);
  void (**v57)(id, uint64_t);
  SEL v58;
  char v59;
  BOOL v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v49 = (void (**)(id, uint64_t))a4;
  v12 = a5;
  v48 = (void (**)(id, uint64_t))a6;
  v13 = a7;
  v14 = v13;
  v50 = (void (**)(_QWORD, _QWORD))v12;
  if (v12)
  {
    group = v13;
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "assertQueueIsCurrent");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1907ED1C8();

    }
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    context = (void *)MEMORY[0x19400FC60]();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v20 = self->_delegateToInfo;
    v21 = -[NSMapTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v62 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_delegateToInfo, "objectForKey:", v25, context);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v25)
            v28 = v26 == 0;
          else
            v28 = 1;
          if (!v28 && (!a3 || (objc_opt_respondsToSelector() & 1) != 0))
          {
            objc_msgSend(v18, "addObject:", v25);
            objc_msgSend(v19, "addObject:", v27);
          }

        }
        v22 = -[NSMapTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v22);
    }

    objc_autoreleasePoolPop(context);
    v14 = group;
    if (objc_msgSend(v18, "count"))
    {
      v29 = 1;
      do
      {
        v30 = (void *)MEMORY[0x19400FC60]();
        objc_msgSend(v18, "objectAtIndex:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndex:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectAtIndex:", 0);
        objc_msgSend(v19, "removeObjectAtIndex:", 0);
        objc_autoreleasePoolPop(v30);
        v33 = objc_msgSend(v18, "count");
        objc_msgSend(v32, "queue");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v14)
          dispatch_group_enter(v14);
        +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance", context);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "queue");
        v36 = objc_claimAutoreleasedReturnValue();

        if (v34 == v36)
        {
          if (a3)
          {
            v14 = group;
            if (v49 != 0 && (v29 & 1) != 0)
              v49[2](v49, 1);
            ((void (**)(_QWORD, void *))v50)[2](v50, v31);
            if (v48 && !v33)
              v48[2](v48, 1);
          }
          else
          {
            ((void (**)(_QWORD, void *))v50)[2](v50, v31);
            v14 = group;
          }
          v43 = (id)objc_opt_self();
          v44 = (id)objc_opt_self();
          if (!v14)
            goto LABEL_42;
        }
        else if (v34)
        {
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = sub_190743470;
          v52[3] = &unk_1E2C62948;
          v58 = a3;
          v59 = v29 & 1;
          v55 = v49;
          v56 = v50;
          v53 = v31;
          v60 = v33 == 0;
          v57 = v48;
          v54 = v32;
          v37 = (void *)MEMORY[0x19400FE1C](v52);
          v38 = v37;
          if (v34 == MEMORY[0x1E0C80D38])
            v39 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v37);
          else
            v39 = (dispatch_block_t)objc_msgSend(v37, "copy");
          v42 = v39;

          v14 = group;
          if (group)
            dispatch_group_async(group, v34, v42);
          else
            dispatch_async(v34, v42);

          if (!group)
            goto LABEL_42;
        }
        else
        {
          v40 = (id)objc_opt_self();
          v41 = (id)objc_opt_self();
          v14 = group;
          if (!group)
            goto LABEL_42;
        }
        dispatch_group_leave(v14);
LABEL_42:

        v29 = 0;
      }
      while (objc_msgSend(v18, "count"));
    }
    v45 = (id)objc_opt_self();
    v46 = (id)objc_opt_self();

  }
}

- (void)setDelegateCapabilities:(unsigned int)a3
{
  void *v5;
  int v6;
  NSObject *v7;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907ED254();

  }
  self->_delegateCapabilities = a3;
}

- (void)sendAppAckForDirectMessage:(id)a3
{
  -[IDSDirectMessageConnection sendAppAckWithGUID:](self->_directMessageConnection, "sendAppAckWithGUID:", a3);
}

- (id)_sendWithParameters:(id)a3 options:(id)a4 loggingType:(id)a5 loggingDataSize:(unint64_t)a6
{
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  IDSDirectMessageConnection *directMessageConnection;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  unsigned int v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  NSObject *v106;
  uint64_t v107;
  void *v108;
  double v109;
  NSObject *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  id *p_isa;
  void *v118;
  unint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  int v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  NSObject *v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  int v144;
  __CFString *v145;
  NSObject *v146;
  void *v147;
  int v148;
  void *v149;
  int v150;
  void *v151;
  int v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  int v168;
  id v169;
  id v170;
  void *v171;
  void *v172;
  id v173;
  NSObject *v174;
  void *v175;
  id v176;
  void *v177;
  NSObject *v178;
  const __CFString *v179;
  void *v180;
  id v181;
  void *v182;
  const __CFString *v183;
  uint64_t v184;
  void *v185;
  NSObject *v186;
  void *v187;
  id v188;
  int outgoingMessageLoggingSequence;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  id v194;
  id v195;
  id v197;
  id v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  __CFString *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  int v220;
  void *v221;
  const __CFString *v222;
  void *v223;
  void *v224;
  _IDSConnection *v225;
  _QWORD v226[4];
  id v227;
  _QWORD v228[2];
  uint8_t buf[4];
  _BYTE v230[10];
  _BYTE v231[10];
  uint64_t v232;
  _BYTE v233[10];
  _BYTE v234[10];
  __int16 v235;
  void *v236;
  __int16 v237;
  int v238;
  __int16 v239;
  uint64_t v240;
  uint64_t v241;

  v220 = a6;
  v241 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (__CFString *)a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  OSLogHandleForTransportCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v230 = v12;
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "!setState guid=%@", buf, 0xCu);
  }

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionUUID"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    JWUUIDPushObjectToString();
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v16;
  }
  else
  {
    IDSGetUUIDData();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (_IDSSupportsDirectMessaging()
    && +[IDSDirectMessageConnection isDirectMessagingRequested:](IDSDirectMessageConnection, "isDirectMessagingRequested:", v10)&& !self->_directMessageConnection)
  {
    -[_IDSConnection createDirectMessageConnectionIfNeeded](self, "createDirectMessageConnectionIfNeeded");
  }
  directMessageConnection = self->_directMessageConnection;
  if (directMessageConnection)
  {
    -[_IDSConnection _activeDevice](self, "_activeDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[IDSDirectMessageConnection isMessageEligible:options:destinationDevice:](directMessageConnection, "isMessageEligible:options:destinationDevice:", v9, v10, v18);

    if (v19)
    {
      -[IDSAccount _internal](self->_account, "_internal");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uniqueID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setAccountUUID:", v21);
      objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionWantsClientAcknowledgement"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWantsAppAck:", objc_msgSend(v22, "BOOLValue"));

      objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionExpectsPeerResponse"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setExpectsPeerResponse:", objc_msgSend(v23, "BOOLValue"));

      objc_msgSend(v9, "setMessageUUID:", v15);
      objc_msgSend(v9, "setIdentifier:", v12);
      objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionPeerResponseIdentifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPeerResponseIdentifier:", v24);

      objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionQueueOneIdentifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setQueueOneIdentifier:", v25);

      objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionTopLevelDictionary"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUseDictAsTopLevel:", objc_msgSend(v26, "BOOLValue"));

      objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionRequireBluetooth"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRequireBluetooth:", objc_msgSend(v27, "BOOLValue"));

      -[IDSDirectMessageConnection sendMessageWithParameters:options:](self->_directMessageConnection, "sendMessageWithParameters:options:", v9, v10);
      v28 = v12;
      goto LABEL_159;
    }
  }
  v222 = v11;
  v223 = v15;
  v29 = objc_alloc(MEMORY[0x1E0D34E80]);
  v225 = self;
  -[_IDSConnection account](self, "account");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_internal");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "serviceName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v29, "initWithServiceIdentifier:", v32);

  v34 = 0x1E2C5D000uLL;
  if (CUTIsInternalInstall())
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v230 = v12;
      _os_log_impl(&dword_1906E0000, v35, OS_LOG_TYPE_DEFAULT, "sendMessage - Inspecting message {%@} payload for security issues", buf, 0xCu);
    }

    v36 = (void *)MEMORY[0x1E0D34DF0];
    objc_msgSend(v9, "message");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "inspectPayload:messageGuid:", v37, v12);

  }
  v214 = CFSTR("IDSSendMessageOptionDataToEncrypt");
  objc_msgSend(v10, "objectForKey:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDataToEncrypt:", v38);

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionWantsResponse"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWantsResponse:", objc_msgSend(v39, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionWantsProgress"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWantsProgress:", objc_msgSend(v40, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionFromID"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFromID:", v41);

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionTimeout"));
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionTimeout"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  v224 = v12;
  if (v42)
    objc_msgSend(v42, "doubleValue");
  else
    v44 = 180.0;
  objc_msgSend(v9, "setTimeout:", v44);
  MEMORY[0x19400F144](CFSTR("allowlistedidsservices"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v219 = v33;
  v215 = v45;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_IDSConnection account](self, "account");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "_internal");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "pushTopic");
    v48 = v33;
    v49 = v43;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v45, "containsObject:", v50);

    v43 = v49;
    v33 = v48;
    v34 = 0x1E2C5D000uLL;

    objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionNonWaking"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNonWaking:", objc_msgSend(v52, "BOOLValue"));

    if ((v51 & 1) != 0)
      goto LABEL_34;
  }
  else
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionNonWaking"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNonWaking:", objc_msgSend(v53, "BOOLValue"));

  }
  objc_msgSend(v9, "destinations");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[_IDSConnection _isDestinationSingleLocalAddress:](self, "_isDestinationSingleLocalAddress:", v54);

  if (v55)
  {
    if (objc_msgSend(v9, "priority") == 300 && (objc_msgSend(v33, "allowUrgentMessages") & 1) == 0)
    {
      objc_msgSend(v9, "setPriority:", 200);
      +[IDSTransportLog IDSConnection](IDSTransportLog, "IDSConnection");
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        -[_IDSConnection account](self, "account");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "_internal");
        v58 = v33;
        v59 = v43;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "pushTopic");
        v61 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v230 = v12;
        *(_WORD *)&v230[8] = 2112;
        *(_QWORD *)v231 = v61;
        _os_log_impl(&dword_1906E0000, v56, OS_LOG_TYPE_DEFAULT, "Downgrading priority of message with GUID %@ to Default from Urgent, The client %@ is not configured to send urgent messages", buf, 0x16u);

        v43 = v59;
        v33 = v58;
        v34 = 0x1E2C5D000;

      }
    }
    if ((objc_msgSend(v33, "allowWakingMessages") & 1) == 0)
    {
      -[_IDSConnection setWakingDowngradeCount:](self, "setWakingDowngradeCount:", -[_IDSConnection wakingDowngradeCount](self, "wakingDowngradeCount") + 1);
      +[IDSTransportLog IDSConnection](IDSTransportLog, "IDSConnection");
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        -[_IDSConnection account](self, "account");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "_internal");
        v64 = v43;
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "pushTopic");
        v66 = (id)objc_claimAutoreleasedReturnValue();
        v67 = -[_IDSConnection wakingDowngradeCount](self, "wakingDowngradeCount");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v230 = v12;
        *(_WORD *)&v230[8] = 2112;
        *(_QWORD *)v231 = v66;
        *(_WORD *)&v231[8] = 1024;
        LODWORD(v232) = v67;
        _os_log_impl(&dword_1906E0000, v62, OS_LOG_TYPE_DEFAULT, "Downgrading waking status of message with GUID %@ to non-waking, the client %@ is not configured to send waking messages.  Total messages downgraded: %u", buf, 0x1Cu);

        v43 = v64;
        v33 = v219;
        v34 = 0x1E2C5D000;

      }
      objc_msgSend(v9, "setNonWaking:", 1);
    }
  }
LABEL_34:
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionEnforceRemoteTimeouts"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionEnforceRemoteTimeouts"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "BOOLValue");

    LODWORD(v68) = v69;
  }
  else
  {
    LOBYTE(v69) = 1;
  }
  v216 = v43;
  if (((v43 != 0) & ~objc_msgSend(v33, "blockRemoteTimeouts") & v69) != 0
    || (_DWORD)v68)
  {
    objc_msgSend(v9, "setEnforceRemoteTimeouts:", 1);
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionAccessToken"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionAccessToken"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessToken:", v71);

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionHomeKitMessage"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "BOOLValue");

  if (v73)
    objc_msgSend(v9, "setHomeKitPayload:", 1);
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionSubServiceKey"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v74, "length"))
    objc_msgSend(v9, "setSubService:", v74);
  v213 = v74;
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionFakeMessage"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFakeMessage:", objc_msgSend(v75, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionDisableAliasValidation"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisableAliasValidation:", objc_msgSend(v76, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionCommand"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCommand:", v77);

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionWantsClientAcknowledgement"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWantsAppAck:", objc_msgSend(v78, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionWantsDeliveryStatus"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWantsDeliveryStatus:", objc_msgSend(v79, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionWantsCertifiedDelivery"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWantsCertifiedDelivery:", objc_msgSend(v80, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionDeliveryStatusContext"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDeliveryStatusContext:", v81);

  objc_msgSend(v9, "setMessageUUID:", v223);
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionAlternateCallbackIdentifier"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlternateCallbackID:", v82);

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionOriginalTimestampKey"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOriginalTimestamp:", v83);

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionEncryptPayload"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEncryptPayload:", objc_msgSend(v84, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionCompressPayload"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = v85;
  if (v85)
    v86 = objc_msgSend(v85, "BOOLValue");
  else
    v86 = 1;
  objc_msgSend(v9, "setCompressPayload:", v86);
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionForceLocalDelivery"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v87, "BOOLValue") & 1) != 0)
  {
    v88 = 1;
  }
  else
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionLocalDelivery"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v89, "BOOLValue") & 1) != 0)
    {
      v88 = 1;
    }
    else
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionRequireBluetooth"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v90, "BOOLValue");

    }
  }

  objc_msgSend(v9, "setLocalDelivery:", v88);
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionAllowCloudDeliveryKey"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowCloudDelivery:", objc_msgSend(v91, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionRequireBluetooth"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequireBluetooth:", objc_msgSend(v92, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionRequireLocalWiFi"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequireLocalWiFi:", objc_msgSend(v93, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionTopLevelDictionary"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUseDictAsTopLevel:", objc_msgSend(v94, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionExpectsPeerResponse"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExpectsPeerResponse:", objc_msgSend(v95, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionPeerResponseIdentifier"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPeerResponseIdentifier:", v96);

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionAlwaysSkipSelfKey"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlwaysSkipSelf:", objc_msgSend(v97, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionForceQuery"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setForceQuery:", objc_msgSend(v98, "integerValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionAlwaysIncludeSelfKey"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlwaysIncludeSelf:", objc_msgSend(v99, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionWantsFirewallDonation"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWantsFirewallDonation:", objc_msgSend(v100, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionPushPriority"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v101)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v101, "integerValue"), (_IDSIsValidPushPriority() & 1) != 0))
    {
      objc_msgSend(v9, "setPushPriority:", v101);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v102 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_FAULT))
        sub_1907ED38C();

    }
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionDeliveryMinimumTimeDelayKey"));
  v103 = objc_claimAutoreleasedReturnValue();
  v218 = (void *)v103;
  if (v103)
  {
    v104 = (void *)v103;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v104, "longLongValue") < 0)
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
        sub_1907ED38C();
    }
    else
    {
      v105 = objc_msgSend(v104, "unsignedLongLongValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v105);
      v106 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeliveryMinimumTimeDelay:", v106);
    }

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionDeliveryMinimumTimeKey"));
  v107 = objc_claimAutoreleasedReturnValue();
  v217 = (void *)v107;
  if (v107)
  {
    v108 = (void *)v107;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v108, "longLongValue") < 0)
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT))
        sub_1907ED38C();
    }
    else
    {
      objc_msgSend(v108, "doubleValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(v109 * 1000.0));
      v110 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDeliveryMinimumTime:", v110);
    }

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionSendModeKey"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v111, "integerValue"), (_IDSIsValidSendMode() & 1) != 0))
    {
      objc_msgSend(v9, "setSendMode:", v111);
    }
    else
    {
      v112 = v111;
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_FAULT))
        sub_1907ED38C();

      v111 = v112;
    }
  }
  v210 = v111;
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionPublicMessageIntent"));
  v114 = objc_claimAutoreleasedReturnValue();
  if (v114)
    objc_msgSend(v9, "setCommandContext:", v114);
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionDuet"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = v101;
  v209 = (void *)v114;
  if ((objc_msgSend(v115, "BOOLValue") & 1) != 0)
  {
    v116 = 1;
    p_isa = (id *)&v225->super.isa;
  }
  else
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionNSURLSession"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v118, "BOOLValue") & 1) != 0)
    {
      v116 = 1;
    }
    else
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionBypassDuet"));
      v119 = v34;
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v120, "BOOLValue");

      v34 = v119;
    }
    p_isa = (id *)&v225->super.isa;

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionSockPuppet"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v121, "BOOLValue"))
  {
    v122 = objc_msgSend(v9, "priority");

    if (v122 == 200)
      v116 = 1;
    else
      v116 = v116;
  }
  else
  {

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionAllowCloudDeliveryKey"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v123, "BOOLValue"))
  {
    v124 = objc_msgSend(v9, "priority");

    if (v124 == 200)
      v116 = 1;
    else
      v116 = v116;
  }
  else
  {

  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionAllowCloudDeliveryKey"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = objc_msgSend(v125, "BOOLValue");

  if (v126)
  {
    objc_msgSend(p_isa, "_activeDevice");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v127;
    if (v127 && (objc_msgSend(v127, "isConnected") & 1) == 0 && (objc_msgSend(v128, "isCloudConnected") & 1) == 0)
    {
      v129 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(p_isa, "account");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "_internal");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "pushTopic");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = (void *)objc_msgSend(v129, "initWithObjectsAndKeys:", v132, CFSTR("IDSClientBringsUpCloudMessaging"), 0);

      IDSPowerLogDictionary();
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v134 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(p_isa, "account");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "_internal");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "pushTopic");
        v137 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v230 = v137;
        *(_WORD *)&v230[8] = 2112;
        *(_QWORD *)v231 = v224;
        _os_log_impl(&dword_1906E0000, v134, OS_LOG_TYPE_DEFAULT, "Client %@ is forcing QR for Cloud Message with GUID %@", buf, 0x16u);

      }
      v12 = v224;
      v34 = 0x1E2C5D000uLL;
    }

  }
  objc_msgSend(v9, "setBypassDuet:", v116);
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionNonCloudWakingKey"));
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNonCloudWaking:", objc_msgSend(v138, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionLiveMessageDelivery"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLiveMessageDelivery:", objc_msgSend(v139, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionDropMessageIndicator"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDropMessageIndicatorCommand:", v140);

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionFireAndForget"));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = objc_msgSend(v141, "BOOLValue");

  objc_msgSend(v9, "setFireAndForget:", v142);
  if ((v142 & 1) != 0
    || (objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionMapTile")),
        v143 = (void *)objc_claimAutoreleasedReturnValue(),
        v144 = objc_msgSend(v143, "BOOLValue"),
        v143,
        v144))
  {
    objc_msgSend(v9, "setBypassStorage:", 1);
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionQueueOneIdentifier"));
  v145 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v145)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(*(id *)(v34 + 3512), "IDSConnection");
      v146 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
        sub_1907ED2E0();

      v145 = 0;
    }
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionActivityContinuation"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = objc_msgSend(v147, "BOOLValue");

  if (v148)
  {
    objc_msgSend(v9, "setActivityContinuation:", 1);
    if (!v145)
      v145 = CFSTR("IDSActivityContinuationIdentifier");
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionTethering"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = objc_msgSend(v149, "BOOLValue");

  if (v150)
    objc_msgSend(v9, "setLocalDelivery:", 1);
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionOpportunisticDuet"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = objc_msgSend(v151, "BOOLValue");

  if (v152)
  {
    objc_msgSend(v9, "setNonWaking:", 1);
    objc_msgSend(v9, "setLocalDelivery:", 1);
    if (!v145)
      v145 = CFSTR("IDSOpportunisticDuetIdentifier");
    goto LABEL_127;
  }
  if (v145)
LABEL_127:
    objc_msgSend(v9, "setQueueOneIdentifier:", v145);
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionForceEncryptionOff"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setForceEncryptionOff:", objc_msgSend(v153, "BOOLValue"));

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionKTVerificationUUIDKey"));
  v154 = objc_claimAutoreleasedReturnValue();
  if (v154)
    objc_msgSend(v9, "setKeyTransparencyURIVerificationMap:", v154);
  v208 = (void *)v154;
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionDuetIdentifiersOverride"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "allObjects");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDuetIdentifiersOverride:", v156);

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionMetricReportIdentifier"));
  v157 = objc_claimAutoreleasedReturnValue();
  if (!v157)
  {
    objc_msgSend(v155, "allObjects");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "sortedArrayUsingComparator:", &unk_1E2C5F9F0);
    v159 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v159, "firstObject");
    v157 = objc_claimAutoreleasedReturnValue();

  }
  v206 = (void *)v157;
  v207 = v155;
  objc_msgSend(v9, "setMetricReportIdentifier:", v157);
  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionInterestingRegistrationProperties"));
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v205, "allObjects");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInterestingRegistrationProperties:", v160);

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionRequireAllRegistrationProperties"));
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v204, "allObjects");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequireAllRegistrationProperties:", v161);

  objc_msgSend(v10, "objectForKey:", CFSTR("IDSSendMessageOptionRequireLackOfRegistrationProperties"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v203, "allObjects");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRequireLackOfRegistrationProperties:", v162);

  objc_msgSend(v9, "setIdentifier:", v12);
  objc_msgSend(p_isa[5], "_internal");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "uniqueID");
  v164 = objc_claimAutoreleasedReturnValue();

  v202 = (void *)v164;
  objc_msgSend(v9, "setAccountUUID:", v164);
  objc_msgSend(p_isa, "_activeDevice");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destinations");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "destinationURIs");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = objc_msgSend(v167, "containsObject:", *MEMORY[0x1E0D345D0]);

  if (v168 && v165 && (objc_msgSend(v165, "relationship") & 2) == 0)
    objc_msgSend(p_isa, "_replaceSentinelInSendParameters:withCurrentActiveDevice:", v9, v165);
  objc_msgSend(v9, "destinations");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGroupData:");
  objc_msgSend(v9, "setDestinations:", 0);
  if (!p_isa[8])
  {
    v169 = objc_alloc_init(MEMORY[0x1E0D36A90]);
    v170 = p_isa[8];
    p_isa[8] = v169;

  }
  objc_msgSend(v9, "alternateCallbackID");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = v171;
  if (v171)
  {
    v173 = v171;
  }
  else
  {
    objc_msgSend(v9, "identifier");
    v173 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
  {
    objc_msgSend(p_isa[8], "setOrderedObject:forKey:", v9, v173);
  }
  else
  {
    v197 = v173;
    v198 = p_isa[8];
    _IMWarn();
  }
  v199 = v173;
  objc_msgSend(*(id *)(v34 + 3512), "GUIDTRACE", v197, v198);
  v174 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(p_isa[5], "_internal");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "serviceName");
    v176 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v230 = v12;
    *(_WORD *)&v230[8] = 2112;
    *(_QWORD *)v231 = v176;
    _os_log_impl(&dword_1906E0000, v174, OS_LOG_TYPE_DEFAULT, "OUTGOING-CLIENT_REQUEST:%@ SERVICE:%@", buf, 0x16u);

  }
  v201 = v165;

  v177 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v177, "removeObjectForKey:", CFSTR("IDSSendMessageOptionDataToEncrypt"));
  +[IDSTransportLog IDSConnection](IDSTransportLog, "IDSConnection");
  v178 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
  {
    if (v222)
      v179 = v222;
    else
      v179 = CFSTR("unknown type");
    -[IDSAccount _internal](v225->_account, "_internal");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "serviceName");
    v181 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deliveryMinimumTime");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = CFSTR("YES");
    if (!v182)
    {
      objc_msgSend(v9, "deliveryMinimumTimeDelay");
      v214 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v214)
        v183 = CFSTR("NO");
    }
    v184 = -[IMOrderedMutableDictionary count](v225->_pendingSends, "count");
    *(_DWORD *)buf = 138414082;
    *(_QWORD *)v230 = v179;
    *(_WORD *)&v230[8] = 2114;
    *(_QWORD *)v231 = v181;
    *(_WORD *)&v231[8] = 2114;
    v232 = (uint64_t)v224;
    *(_WORD *)v233 = 2112;
    *(_QWORD *)&v233[2] = v221;
    *(_WORD *)v234 = 2112;
    *(_QWORD *)&v234[2] = v183;
    v235 = 2112;
    v236 = v177;
    v237 = 1024;
    v238 = v220;
    v239 = 2048;
    v240 = v184;
    _os_log_impl(&dword_1906E0000, v178, OS_LOG_TYPE_DEFAULT, "Client request to send %@ on service: %{public}@   guid: %{public}@   to destinations: %@  isScheduled? : %@  options: %@    size: %d] (%lu pending)", buf, 0x4Eu);
    if (!v182)

    v12 = v224;
  }

  v228[0] = 0xAAAAAAAAAAAAAAAALL;
  v228[1] = 0xAAAAAAAAAAAAAAAALL;
  v185 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
  objc_msgSend(v185, "getUUIDBytes:", v228);

  objc_msgSend(MEMORY[0x1E0D34D40], "CrossLayerLogging");
  v186 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSAccount _internal](v225->_account, "_internal");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "serviceName");
    v188 = (id)objc_claimAutoreleasedReturnValue();
    outgoingMessageLoggingSequence = v225->_outgoingMessageLoggingSequence;
    v225->_outgoingMessageLoggingSequence = outgoingMessageLoggingSequence + 1;
    *(_DWORD *)buf = 67110658;
    *(_DWORD *)v230 = 120;
    *(_WORD *)&v230[4] = 1024;
    *(_DWORD *)&v230[6] = 255;
    *(_WORD *)v231 = 2112;
    *(_QWORD *)&v231[2] = v188;
    v232 = 0x832000000100412;
    *(_QWORD *)v233 = v228;
    *(_WORD *)&v233[8] = 1024;
    *(_DWORD *)v234 = (unsigned __int16)v220;
    *(_WORD *)&v234[4] = 1024;
    *(_DWORD *)&v234[6] = outgoingMessageLoggingSequence;
    _os_log_impl(&dword_1906E0000, v186, OS_LOG_TYPE_DEFAULT, "5 {curProtocol: %hhu, prevProtocol: %hhu, prevBundleID: %@, curUUID: %{public,uuid_t}.16P, curPktLen: %u, logSeqn: %hhu}", buf, 0x34u);

    v12 = v224;
  }

  objc_msgSend(v9, "dictionaryRepresentation");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v191 = (void *)objc_msgSend(v190, "copy");

  -[_IDSConnection daemonController](v225, "daemonController");
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v192, "setCurXPCMessagePriority:", objc_msgSend(v9, "priority"));

  -[_IDSConnection daemonController](v225, "daemonController");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v226[0] = MEMORY[0x1E0C809B0];
  v226[1] = 3221225472;
  v226[2] = sub_1907452FC;
  v226[3] = &unk_1E2C62990;
  v194 = v191;
  v227 = v194;
  objc_msgSend(v193, "forwardMethodWithBoostedPriority:", v226);

  v195 = v12;
  v11 = (__CFString *)v222;
  v15 = v223;
  v21 = v219;
LABEL_159:

  return v12;
}

- (BOOL)_isDestinationSingleLocalAddress:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[_IDSConnection account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accountType");

  if (v6 == 2
    && (objc_msgSend(v4, "destinationURIs"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 == 1))
  {
    objc_msgSend(v4, "destinationURIs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0D345D0]) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v4, "destinationURIs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_IDSConnection _activeDevice](self, "_activeDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)IDSCopyIDForDevice(v12);
      v10 = objc_msgSend(v11, "containsObject:", v13);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_replaceSentinelInSendParameters:(id)a3 withCurrentActiveDevice:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = (objc_class *)MEMORY[0x1E0C99E20];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(v7, "destinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destinationURIs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v8, "initWithSet:", v10);

  v11 = (void *)IDSCopyIDForDevice(v6);
  objc_msgSend(v13, "removeObject:", *MEMORY[0x1E0D345D0]);
  objc_msgSend(v13, "addObject:", v11);
  objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithStrings:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDestinations:", v12);

}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  id *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  IDSAccount *account;
  _IDSConnection *v50;
  id *v51;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  _IDSConnection *v60;
  __int16 v61;
  IDSAccount *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "assertQueueIsCurrent");

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1907ED3EC();

  }
  v51 = a8;
  objc_msgSend(v14, "objectForKey:", CFSTR("IDSSendMessageOptionSkipPayloadCheck"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v13, "destinationURIs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  v54 = v14;
  v50 = self;
  if (v21)
  {
    -[IDSAccount _internal](self->_account, "_internal");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isActive");

    if (v23)
      v24 = 0;
    else
      v24 = CFSTR("Cannot send with an inactive account");
    if (v23)
      v25 = 0;
    else
      v25 = 8;
    if (((v23 ^ 1 | v19) & 1) == 0)
    {
      objc_msgSend(v12, "data");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");

      if (v27 <= 0x500000)
        v24 = 0;
      else
        v24 = CFSTR("Cannot send payload of this size");
      if (v27 <= 0x500000)
        v25 = 0;
      else
        v25 = 18;
    }
  }
  else
  {
    v24 = CFSTR("Cannot send to empty destination set");
    v25 = 1;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = v13;
  objc_msgSend(v13, "destinationURIs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v56 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        if ((_IDSDestinationHasValidPrefix() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid address: %@"), v33);
          v34 = objc_claimAutoreleasedReturnValue();

          v24 = (__CFString *)v34;
          v25 = 21;
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v30);
  }

  if (v24)
  {
    v35 = 0;
    v37 = a7;
    v36 = v53;
    if (!a7)
      goto LABEL_32;
    goto LABEL_31;
  }
  -[IDSAccount _internal](v50->_account, "_internal");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "uniqueID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = a7;
  v36 = v53;
  if (v44)
  {
    v45 = objc_alloc_init(MEMORY[0x1E0D34E70]);
    -[NSObject setPriority:](v45, "setPriority:", a5);
    -[NSObject setDestinations:](v45, "setDestinations:", v53);
    objc_msgSend(v12, "dictionaryRepresentation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setProtobuf:](v45, "setProtobuf:", v46);

    objc_msgSend(v12, "data");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSConnection _sendWithParameters:options:loggingType:loggingDataSize:](v50, "_sendWithParameters:options:loggingType:loggingDataSize:", v45, v54, CFSTR("protobuf"), objc_msgSend(v47, "length"));
    v35 = (id)objc_claimAutoreleasedReturnValue();

    v24 = 0;
  }
  else
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      account = v50->_account;
      *(_DWORD *)buf = 138412546;
      v60 = v50;
      v61 = 2112;
      v62 = account;
      _os_log_impl(&dword_1906E0000, v45, OS_LOG_TYPE_DEFAULT, "sendPayload - could not find account uniqueID! self: %@ account: %@", buf, 0x16u);
    }
    v35 = 0;
    v24 = CFSTR("Could not find account uniqueID!");
    v25 = 7;
  }

  if (a7)
LABEL_31:
    *v37 = objc_retainAutorelease(v35);
LABEL_32:
  if (v24)
  {
    v38 = objc_alloc(MEMORY[0x1E0C99D80]);
    v39 = (void *)objc_msgSend(v38, "initWithObjectsAndKeys:", v24, *MEMORY[0x1E0CB2D50], 0);
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), v25, v39);
    v41 = v40;
    if (v51)
      *v51 = objc_retainAutorelease(v40);

  }
  return v24 == 0;
}

- (BOOL)sendMessage:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  NSObject *v33;
  IDSAccount *account;
  void *v35;
  NSObject *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  IDSAccount *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  _IDSConnection *v59;
  __int16 v60;
  IDSAccount *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v10 = a4;
  v53 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907ED4E0();

  }
  objc_msgSend(v53, "objectForKey:", CFSTR("IDSSendMessageOptionTopLevelDictionary"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destinationURIs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count") == 0;

  if (v15)
  {
    v20 = CFSTR("Cannot send to empty destination set");
    v19 = 1;
  }
  else if ((objc_msgSend(v51, "BOOLValue") & 1) != 0 || objc_msgSend(v52, "count"))
  {
    -[_IDSConnection account](self, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_internal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isActive");

    if (v18)
      v19 = 0;
    else
      v19 = 8;
    if (v18)
      v20 = 0;
    else
      v20 = CFSTR("Cannot send with an inactive account");
  }
  else
  {
    v20 = CFSTR("Cannot send empty message");
    v19 = 5;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v10, "destinationURIs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v55 != v23)
          objc_enumerationMutation(v21);
        v25 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        if ((_IDSDestinationHasValidPrefix() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid address: %@"), v25);
          v26 = objc_claimAutoreleasedReturnValue();

          v19 = 21;
          v20 = (__CFString *)v26;
        }
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v22);
  }

  if (v20)
  {
    v27 = 0;
    goto LABEL_48;
  }
  -[_IDSConnection account](self, "account");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_internal");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "uniqueID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      account = self->_account;
      *(_DWORD *)buf = 138412546;
      v59 = self;
      v60 = 2112;
      v61 = account;
      _os_log_impl(&dword_1906E0000, v33, OS_LOG_TYPE_DEFAULT, "sendPayload - could not find account uniqueID! self: %@ account: %@", buf, 0x16u);
    }
    v27 = 0;
    v20 = CFSTR("Could not find account uniqueID!");
    v19 = 7;
    goto LABEL_47;
  }
  objc_msgSend(v53, "objectForKey:", CFSTR("IDSSendMessageOptionSkipPayloadCheck"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "BOOLValue");

  if ((v32 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v52, 200, 0, 0);
    v33 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSObject length](v33, "length") <= 0x500000)
    {
      if (v33)
        goto LABEL_36;
    }
    else
    {

    }
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v33, OS_LOG_TYPE_DEFAULT, "sendPayload - could not plist serialize dictionary.", buf, 2u);
    }
    v27 = 0;
    v20 = CFSTR("Could not plist serialize dictionary or otherwise empty payload");
    v19 = 6;
    goto LABEL_47;
  }
  v33 = 0;
LABEL_36:
  v35 = (void *)objc_msgSend(v53, "mutableCopy");
  objc_msgSend(v35, "removeObjectForKey:", CFSTR("IDSSendMessageOptionDataToEncrypt"));
  +[IDSTransportLog IDSConnection](IDSTransportLog, "IDSConnection");
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = CFSTR("Sync");
    if (a5 == 200)
      v37 = CFSTR("Default");
    if (a5 == 300)
      v38 = CFSTR("URGENT");
    else
      v38 = v37;
    -[IDSAccount _internal](self->_account, "_internal");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "serviceName");
    v40 = (IDSAccount *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v59 = (_IDSConnection *)v38;
    v60 = 2114;
    v61 = v40;
    v62 = 2112;
    v63 = v10;
    v64 = 2112;
    v65 = v35;
    _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "Client request to send %{public}@ message (dictionary) service: %{public}@  to destinations: %@   options: %@]", buf, 0x2Au);

  }
  v41 = objc_alloc_init(MEMORY[0x1E0D34E70]);
  objc_msgSend(v41, "setPriority:", a5);
  objc_msgSend(v41, "setDestinations:", v10);
  objc_msgSend(v41, "setMessage:", v52);
  -[_IDSConnection _sendWithParameters:options:loggingType:loggingDataSize:](self, "_sendWithParameters:options:loggingType:loggingDataSize:", v41, v53, CFSTR("message (dictionary)"), objc_msgSend(v52, "count"));
  v27 = (id)objc_claimAutoreleasedReturnValue();

  v20 = 0;
LABEL_47:

LABEL_48:
  if (a7)
    *a7 = objc_retainAutorelease(v27);
  if (v20)
  {
    v42 = objc_alloc(MEMORY[0x1E0C99D80]);
    v43 = (void *)objc_msgSend(v42, "initWithObjectsAndKeys:", v20, *MEMORY[0x1E0CB2D50], 0);
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), v19, v43);
    v45 = v44;
    if (a8)
      *a8 = objc_retainAutorelease(v44);

  }
  return v20 == 0;
}

- (BOOL)sendData:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  __CFString *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  NSObject *v45;
  IDSAccount *account;
  _IDSConnection *v48;
  id *v49;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  _IDSConnection *v58;
  __int16 v59;
  IDSAccount *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "assertQueueIsCurrent");

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1907ED570();

  }
  v49 = a8;
  v52 = v14;
  objc_msgSend(v14, "objectForKey:", CFSTR("IDSSendMessageOptionSkipPayloadCheck"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v13, "destinationURIs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  v48 = self;
  if (v21)
  {
    -[IDSAccount _internal](self->_account, "_internal");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isActive");

    if (v23)
      v24 = 0;
    else
      v24 = CFSTR("Cannot send with an inactive account");
    if (v23)
      v25 = 0;
    else
      v25 = 8;
    if (((v23 ^ 1 | v19) & 1) == 0)
    {
      v26 = objc_msgSend(v12, "length");
      if (v26 <= 0x500000)
        v24 = 0;
      else
        v24 = CFSTR("Cannot send payload of this size");
      if (v26 <= 0x500000)
        v25 = 0;
      else
        v25 = 18;
    }
  }
  else
  {
    v24 = CFSTR("Cannot send to empty destination set");
    v25 = 1;
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = v13;
  objc_msgSend(v13, "destinationURIs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v54 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        if ((_IDSDestinationHasValidPrefix() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid address: %@"), v32);
          v33 = objc_claimAutoreleasedReturnValue();

          v24 = (__CFString *)v33;
          v25 = 21;
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v29);
  }

  if (v24)
  {
    v34 = 0;
    v35 = v51;
    v36 = v14;
    v37 = a7;
    if (!a7)
      goto LABEL_32;
    goto LABEL_31;
  }
  -[IDSAccount _internal](v48->_account, "_internal");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "uniqueID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = a7;
  v35 = v51;
  if (v44)
  {
    v45 = objc_alloc_init(MEMORY[0x1E0D34E70]);
    -[NSObject setPriority:](v45, "setPriority:", a5);
    -[NSObject setDestinations:](v45, "setDestinations:", v51);
    -[NSObject setData:](v45, "setData:", v12);
    -[_IDSConnection _sendWithParameters:options:loggingType:loggingDataSize:](v48, "_sendWithParameters:options:loggingType:loggingDataSize:", v45, v52, CFSTR("data"), objc_msgSend(v12, "length"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0;
  }
  else
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      account = v48->_account;
      *(_DWORD *)buf = 138412546;
      v58 = v48;
      v59 = 2112;
      v60 = account;
      _os_log_impl(&dword_1906E0000, v45, OS_LOG_TYPE_DEFAULT, "sendPayload - could not find account uniqueID! self: %@ account: %@", buf, 0x16u);
    }
    v34 = 0;
    v24 = CFSTR("Could not find account uniqueID!");
    v25 = 7;
  }

  v36 = v52;
  if (a7)
LABEL_31:
    *v37 = objc_retainAutorelease(v34);
LABEL_32:
  if (v24)
  {
    v38 = objc_alloc(MEMORY[0x1E0C99D80]);
    v39 = (void *)objc_msgSend(v38, "initWithObjectsAndKeys:", v24, *MEMORY[0x1E0CB2D50], 0);
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), v25, v39);
    v41 = v40;
    if (v49)
      *v49 = objc_retainAutorelease(v40);

  }
  return v24 == 0;
}

- (BOOL)sendInvitation:(id)a3 toDestination:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  _IDSConnection *v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  IDSAccount *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  _IDSConnection *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  IDSAccount *account;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id *v58;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  _IDSConnection *v67;
  __int16 v68;
  IDSAccount *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v12 = (_IDSConnection *)a3;
  v13 = a4;
  v61 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "assertQueueIsCurrent");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907ED5FC();

  }
  objc_msgSend(v13, "destinationURIs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[IDSAccount _internal](self->_account, "_internal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isActive");

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_IDSConnection expirationDate](v12, "expirationDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "compare:", v22);

      if (v23 == 1)
        v24 = 54;
      else
        v24 = 0;
      if (v23 == 1)
        v25 = CFSTR("Invitation has expired");
      else
        v25 = 0;
    }
    else
    {
      v25 = CFSTR("Cannot send with an inactive account");
      v24 = 8;
    }
  }
  else
  {
    v25 = CFSTR("Cannot send to empty destination set");
    v24 = 1;
  }
  v58 = a8;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = v13;
  objc_msgSend(v13, "destinationURIs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v63 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
        if ((_IDSDestinationHasValidPrefix() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid address: %@"), v31);
          v32 = objc_claimAutoreleasedReturnValue();

          v24 = 21;
          v25 = (__CFString *)v32;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v28);
  }

  +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v12;
    _os_log_impl(&dword_1906E0000, v33, OS_LOG_TYPE_DEFAULT, "sendInvitation - preparing to send invitation : %@", buf, 0xCu);
  }

  v34 = (IDSAccount *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_IDSConnection uniqueID](v12, "uniqueID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "UUIDString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccount setValue:forKey:](v34, "setValue:forKey:", v36, *MEMORY[0x1E0D344E0]);

  -[_IDSConnection context](v12, "context");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "payload");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccount setValue:forKey:](v34, "setValue:forKey:", v38, *MEMORY[0x1E0D344A8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_IDSConnection state](v12, "state"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccount setValue:forKey:](v34, "setValue:forKey:", v39, *MEMORY[0x1E0D344D8]);

  -[_IDSConnection expirationDate](v12, "expirationDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = (void *)MEMORY[0x1E0CB37E8];
    -[_IDSConnection expirationDate](v12, "expirationDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timeIntervalSince1970");
    objc_msgSend(v41, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSAccount setValue:forKey:](v34, "setValue:forKey:", v43, *MEMORY[0x1E0D344C0]);

  }
  +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    -[_IDSConnection uniqueID](v12, "uniqueID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "UUIDString");
    v46 = (_IDSConnection *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v67 = v46;
    v68 = 2112;
    v69 = v34;
    _os_log_impl(&dword_1906E0000, v44, OS_LOG_TYPE_DEFAULT, "sendInvitation - invitation payload for id {%@}: %@", buf, 0x16u);

  }
  if (v25)
  {
    v47 = 0;
  }
  else
  {
    -[IDSAccount _internal](self->_account, "_internal");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "uniqueID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      v50 = objc_alloc_init(MEMORY[0x1E0D34E70]);
      -[NSObject setPriority:](v50, "setPriority:", a5);
      -[NSObject setDestinations:](v50, "setDestinations:", v60);
      -[NSObject setMessage:](v50, "setMessage:", v34);
      -[_IDSConnection _sendWithParameters:options:loggingType:loggingDataSize:](self, "_sendWithParameters:options:loggingType:loggingDataSize:", v50, v61, CFSTR("invitation (send)"), -[IDSAccount count](v34, "count"));
      v47 = (id)objc_claimAutoreleasedReturnValue();
      v25 = 0;
    }
    else
    {
      +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        account = self->_account;
        *(_DWORD *)buf = 138412546;
        v67 = self;
        v68 = 2112;
        v69 = account;
        _os_log_impl(&dword_1906E0000, v50, OS_LOG_TYPE_DEFAULT, "sendInvitation - could not find account uniqueID! self: %@ account: %@", buf, 0x16u);
      }
      v47 = 0;
      v25 = CFSTR("Could not find account uniqueID!");
      v24 = 7;
    }

  }
  if (a7)
    *a7 = objc_retainAutorelease(v47);
  if (v25)
  {
    v52 = objc_alloc(MEMORY[0x1E0C99D80]);
    v53 = (void *)objc_msgSend(v52, "initWithObjectsAndKeys:", v25, *MEMORY[0x1E0CB2D50], 0);
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), v24, v53);
    v55 = v54;
    if (v58)
      *v58 = objc_retainAutorelease(v54);

  }
  return v25 == 0;
}

- (BOOL)sendInvitationUpdate:(id)a3 toDestination:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  _IDSConnection *v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  IDSAccount *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  _IDSConnection *v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  IDSAccount *account;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id *v58;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  _IDSConnection *v67;
  __int16 v68;
  IDSAccount *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v12 = (_IDSConnection *)a3;
  v13 = a4;
  v61 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "assertQueueIsCurrent");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907ED688();

  }
  objc_msgSend(v13, "destinationURIs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    -[IDSAccount _internal](self->_account, "_internal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isActive");

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_IDSConnection expirationDate](v12, "expirationDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "compare:", v22);

      if (v23 == 1)
        v24 = 54;
      else
        v24 = 0;
      if (v23 == 1)
        v25 = CFSTR("Invitation has expired");
      else
        v25 = 0;
    }
    else
    {
      v25 = CFSTR("Cannot send with an inactive account");
      v24 = 8;
    }
  }
  else
  {
    v25 = CFSTR("Cannot send to empty destination set");
    v24 = 1;
  }
  v58 = a8;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = v13;
  objc_msgSend(v13, "destinationURIs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v63 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
        if ((_IDSDestinationHasValidPrefix() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid address: %@"), v31);
          v32 = objc_claimAutoreleasedReturnValue();

          v24 = 21;
          v25 = (__CFString *)v32;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v28);
  }

  +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v12;
    _os_log_impl(&dword_1906E0000, v33, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - preparing to send invitation : %@", buf, 0xCu);
  }

  v34 = (IDSAccount *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[_IDSConnection uniqueID](v12, "uniqueID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "UUIDString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccount setValue:forKey:](v34, "setValue:forKey:", v36, *MEMORY[0x1E0D344E0]);

  -[_IDSConnection context](v12, "context");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "payload");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccount setValue:forKey:](v34, "setValue:forKey:", v38, *MEMORY[0x1E0D344A8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_IDSConnection state](v12, "state"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccount setValue:forKey:](v34, "setValue:forKey:", v39, *MEMORY[0x1E0D344D8]);

  -[_IDSConnection expirationDate](v12, "expirationDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = (void *)MEMORY[0x1E0CB37E8];
    -[_IDSConnection expirationDate](v12, "expirationDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "timeIntervalSince1970");
    objc_msgSend(v41, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSAccount setValue:forKey:](v34, "setValue:forKey:", v43, *MEMORY[0x1E0D344C0]);

  }
  +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    -[_IDSConnection uniqueID](v12, "uniqueID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "UUIDString");
    v46 = (_IDSConnection *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v67 = v46;
    v68 = 2112;
    v69 = v34;
    _os_log_impl(&dword_1906E0000, v44, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - invitation payload for id {%@}: %@", buf, 0x16u);

  }
  if (v25)
  {
    v47 = 0;
  }
  else
  {
    -[IDSAccount _internal](self->_account, "_internal");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "uniqueID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      v50 = objc_alloc_init(MEMORY[0x1E0D34E70]);
      -[NSObject setPriority:](v50, "setPriority:", a5);
      -[NSObject setDestinations:](v50, "setDestinations:", v60);
      -[NSObject setMessage:](v50, "setMessage:", v34);
      -[_IDSConnection _sendWithParameters:options:loggingType:loggingDataSize:](self, "_sendWithParameters:options:loggingType:loggingDataSize:", v50, v61, CFSTR("invitation (update)"), -[IDSAccount count](v34, "count"));
      v47 = (id)objc_claimAutoreleasedReturnValue();
      v25 = 0;
    }
    else
    {
      +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        account = self->_account;
        *(_DWORD *)buf = 138412546;
        v67 = self;
        v68 = 2112;
        v69 = account;
        _os_log_impl(&dword_1906E0000, v50, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - could not find account uniqueID! self: %@ account: %@", buf, 0x16u);
      }
      v47 = 0;
      v25 = CFSTR("Could not find account uniqueID!");
      v24 = 7;
    }

  }
  if (a7)
    *a7 = objc_retainAutorelease(v47);
  if (v25)
  {
    v52 = objc_alloc(MEMORY[0x1E0C99D80]);
    v53 = (void *)objc_msgSend(v52, "initWithObjectsAndKeys:", v25, *MEMORY[0x1E0CB2D50], 0);
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), v24, v53);
    v55 = v54;
    if (v58)
      *v58 = objc_retainAutorelease(v54);

  }
  return v25 == 0;
}

- (BOOL)sendServerMessage:(id)a3 command:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  int v16;
  _IDSConnection *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
      sub_1907ED714();

  }
  if (v7 && objc_msgSend(v6, "count"))
  {
    -[IDSAccount _internal](self->_account, "_internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueID");
    v12 = objc_claimAutoreleasedReturnValue();

    -[_IDSConnection daemonController](self, "daemonController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendServerMessage:command:usingAccountWithUniqueID:", v6, v7, v12);

    v14 = 1;
  }
  else
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_error_impl(&dword_1906E0000, v12, OS_LOG_TYPE_ERROR, "%@ asked to send server message %@ with command %@ - invalid value!", (uint8_t *)&v16, 0x20u);
    }
    v14 = 0;
  }

  return v14;
}

- (void)connection:(id)a3 incomingAckWithIdentifier:(id)a4 forTopic:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 hasBeenDeliveredWithContext:(id)a8 isAppAck:(BOOL)a9
{
  IDSDirectMessageConnection *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  IDSDirectMessageConnection *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v15 = (IDSDirectMessageConnection *)a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (self->_directMessageConnection == v15)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (a9)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412546;
        v27 = v15;
        v28 = 2112;
        v29 = v16;
        _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "incomingAppLevelAckFromDirectConnection: %@ guid %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_IDSConnection messageIdentifier:forTopic:toURI:fromURI:hasBeenDeliveredWithContext:](self, "messageIdentifier:forTopic:toURI:fromURI:hasBeenDeliveredWithContext:", v16, v17, v23, v24, v20);
    }
    else
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412546;
        v27 = v15;
        v28 = 2112;
        v29 = v16;
        _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "incomingAckFromDirectConnection: %@ guid %@", buf, 0x16u);
      }

      -[IDSAccount _internal](self->_account, "_internal");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uniqueID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = 1;
      -[_IDSConnection messageIdentifierInner:alternateCallbackID:forAccount:updatedWithResponseCode:error:lastCall:context:isDirectMessage:](self, "messageIdentifierInner:alternateCallbackID:forAccount:updatedWithResponseCode:error:lastCall:context:isDirectMessage:", v16, 0, v24, 0, 0, 1, v20, v25);
    }

  }
}

- (void)connection:(id)a3 incomingDataFromDirectConnection:(id)a4 withGUID:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9
{
  IDSDirectMessageConnection *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  IDSDirectMessageConnection *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v15 = (IDSDirectMessageConnection *)a3;
  v16 = a5;
  if (self->_directMessageConnection == v15)
  {
    v17 = a9;
    v18 = a8;
    v19 = a7;
    v20 = a6;
    v21 = a4;
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412546;
      v26 = v15;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "incomingDataFromDirectConnection: %@ guid %@", (uint8_t *)&v25, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSConnection dataReceived:withGUID:forTopic:toURI:fromURI:context:](self, "dataReceived:withGUID:forTopic:toURI:fromURI:context:", v21, v16, v20, v23, v24, v17);
  }

}

- (void)connection:(id)a3 incomingMessageFromDirectConnection:(id)a4 withGUID:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9
{
  IDSDirectMessageConnection *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  IDSDirectMessageConnection *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v15 = (IDSDirectMessageConnection *)a3;
  if (self->_directMessageConnection == v15)
  {
    v16 = a9;
    v17 = a8;
    v18 = a7;
    v19 = a6;
    v20 = a5;
    v21 = a4;
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "incomingMessageFromDirectConnection: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSConnection messageReceived:withGUID:withPayload:forTopic:toURI:fromURI:context:](self, "messageReceived:withGUID:withPayload:forTopic:toURI:fromURI:context:", 0, v20, v21, v19, v23, v24, v16);
  }

}

- (void)connection:(id)a3 incomingProtobufFromDirectConnection:(id)a4 withGUID:(id)a5 forTopic:(id)a6 toIdentifier:(id)a7 fromID:(id)a8 context:(id)a9
{
  IDSDirectMessageConnection *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  IDSDirectMessageConnection *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v15 = (IDSDirectMessageConnection *)a3;
  if (self->_directMessageConnection == v15)
  {
    v16 = a9;
    v17 = a8;
    v18 = a7;
    v19 = a6;
    v20 = a5;
    v21 = a4;
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v15;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "incomingProtobufFromDirectConnection: %@", (uint8_t *)&v25, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSConnection protobufReceived:withGUID:forTopic:toURI:fromURI:context:](self, "protobufReceived:withGUID:forTopic:toURI:fromURI:context:", v21, v20, v19, v23, v24, v16);
  }

}

- (void)connection:(id)a3 incomingGUIDAckFromDirectConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "incomingGUIDAckFromDirectConnection: %@/%@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)connection:(id)a3 messageSendFailed:(id)a4 responseCode:(int64_t)a5
{
  IDSAccount *account;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;

  if (self->_directMessageConnection == a3)
  {
    account = self->_account;
    v8 = a4;
    -[IDSAccount _internal](account, "_internal");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34B90], a5, 0);
    LOBYTE(v12) = 1;
    -[_IDSConnection messageIdentifierInner:alternateCallbackID:forAccount:updatedWithResponseCode:error:lastCall:context:isDirectMessage:](self, "messageIdentifierInner:alternateCallbackID:forAccount:updatedWithResponseCode:error:lastCall:context:isDirectMessage:", v8, 0, v9, a5, v11, 1, 0, v12);

  }
}

- (void)account:(id)a3 isActiveChanged:(BOOL)a4
{
  void *v6;
  int v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907ED7A0();

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_190747BE8;
  v9[3] = &unk_1E2C629B8;
  v9[4] = self;
  v10 = a4;
  -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v9);
}

- (void)account:(id)a3 devicesChanged:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  IDSDirectMessageConnection *directMessageConnection;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  _IDSConnection *v15;
  id v16;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907ED82C();

  }
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_190747D3C;
  v14 = &unk_1E2C629E0;
  v15 = self;
  v9 = v5;
  v16 = v9;
  -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", &v11);
  directMessageConnection = self->_directMessageConnection;
  if (directMessageConnection)
    -[IDSDirectMessageConnection updateConnectedDevices:](directMessageConnection, "updateConnectedDevices:", v9, v11, v12, v13, v14, v15);

}

- (void)account:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  IDSDirectMessageConnection *directMessageConnection;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  _IDSConnection *v15;
  id v16;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907ED8B8();

  }
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_190747E90;
  v14 = &unk_1E2C629E0;
  v15 = self;
  v9 = v5;
  v16 = v9;
  -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", &v11);
  directMessageConnection = self->_directMessageConnection;
  if (directMessageConnection)
    -[IDSDirectMessageConnection updateConnectedDevices:](directMessageConnection, "updateConnectedDevices:", v9, v11, v12, v13, v14, v15);

}

- (void)account:(id)a3 connectedDevicesChanged:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  IDSDirectMessageConnection *directMessageConnection;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  _IDSConnection *v15;
  id v16;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907ED944();

  }
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_190747FE4;
  v14 = &unk_1E2C629E0;
  v15 = self;
  v9 = v5;
  v16 = v9;
  -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", &v11);
  directMessageConnection = self->_directMessageConnection;
  if (directMessageConnection)
    -[IDSDirectMessageConnection updateConnectedDevices:](directMessageConnection, "updateConnectedDevices:", v9, v11, v12, v13, v14, v15);

}

- (void)_connect
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSString *serviceToken;
  void *v12;
  NSObject *v13;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EDAA8();

  }
  -[IDSAccount _internal](self->_account, "_internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907ED9D0();
    goto LABEL_12;
  }
  -[_IDSConnection daemonController](self, "daemonController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasListenerForID:", self->_serviceToken);

  if ((v9 & 1) == 0)
  {
    -[_IDSConnection daemonController](self, "daemonController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    serviceToken = self->_serviceToken;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(serviceToken) = objc_msgSend(v10, "addListenerID:services:commands:", serviceToken, v12, self->_commands);

    if ((serviceToken & 1) == 0)
    {
      +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1907EDA3C();
LABEL_12:

    }
  }

}

- (void)_handleLastCallForPendingIdentifier:(id)a3 callbackID:(id)a4
{
  id v6;
  IMOrderedMutableDictionary *pendingSends;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
    -[IMOrderedMutableDictionary removeOrderedObjectForKey:](self->_pendingSends, "removeOrderedObjectForKey:", v8);
  if (v6)
    -[IMOrderedMutableDictionary removeOrderedObjectForKey:](self->_pendingSends, "removeOrderedObjectForKey:", v6);
  if (!-[IMOrderedMutableDictionary count](self->_pendingSends, "count"))
  {
    pendingSends = self->_pendingSends;
    self->_pendingSends = 0;

  }
}

- (void)_resendPendingSends
{
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  IMOrderedMutableDictionary *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  _IDSConnection *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EDB34();

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_pendingSends;
  v6 = -[IMOrderedMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 138412802;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "setDaemonDeathResend:", 1, v19);
        +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "alternateCallbackID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v19;
          v26 = self;
          v27 = 2112;
          v28 = v13;
          v29 = 2112;
          v30 = v14;
          _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "%@ resending %@ alternate %@ due to daemon disconnection.", buf, 0x20u);

        }
        objc_msgSend(v11, "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "copy");

        -[_IDSConnection daemonController](self, "daemonController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setCurXPCMessagePriority:", objc_msgSend(v11, "priority"));

        -[_IDSConnection daemonController](self, "daemonController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sendMessageWithSendParameters:", v16);

      }
      v8 = -[IMOrderedMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v8);
  }

}

- (void)daemonConnected
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
      sub_1907EDBC0();

  }
  -[_IDSConnection _resendPendingSends](self, "_resendPendingSends");
}

- (void)messageIdentifier:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 context:(id)a9
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  -[_IDSConnection messageIdentifierInner:alternateCallbackID:forAccount:updatedWithResponseCode:error:lastCall:context:isDirectMessage:](self, "messageIdentifierInner:alternateCallbackID:forAccount:updatedWithResponseCode:error:lastCall:context:isDirectMessage:", a3, a4, a5, a6, a7, a8, a9, v9);
}

- (void)messageIdentifierInner:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 context:(id)a9 isDirectMessage:(BOOL)a10
{
  _IDSConnection *v15;
  __CFString *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  const __CFString *v26;
  id v27;
  unint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  int v41;
  NSObject *v42;
  _IDSConnection *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  int v47;
  NSObject *v48;
  id v49;
  void *v50;
  _IDSConnection *v51;
  __CFString *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  id v58;
  id v59;
  __CFString *v60;
  void *v61;
  _BOOL4 v62;
  unint64_t v63;
  _QWORD v64[5];
  _IDSConnection *v65;
  __CFString *v66;
  id v67;
  id v68;
  int64_t v69;
  BOOL v70;
  BOOL v71;
  uint8_t buf[4];
  _IDSConnection *v73;
  __int16 v74;
  int64_t v75;
  __int16 v76;
  const __CFString *v77;
  __int16 v78;
  int64_t v79;
  __int16 v80;
  unint64_t v81;
  __int16 v82;
  const __CFString *v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  const __CFString *v89;
  uint64_t v90;

  v62 = a8;
  v90 = *MEMORY[0x1E0C80C00];
  v15 = (_IDSConnection *)a3;
  v16 = (__CFString *)a4;
  v17 = a5;
  v63 = (unint64_t)a7;
  v18 = a9;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "assertQueueIsCurrent");

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907EDC8C();

  }
  -[IDSAccount _internal](self->_account, "_internal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uniqueID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = IMAreObjectsLogicallySame();

  if (v24)
  {
    +[IDSLogging GUIDTRACE](IDSLogging, "GUIDTRACE");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v73 = v15;
      if (v62)
        v26 = CFSTR("YES");
      v74 = 2048;
      v75 = a6;
      v76 = 2112;
      v77 = v26;
      _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "OUTGOING-UPDATE:%@ CODE:%ld LASTCALL:%@", buf, 0x20u);
    }

    v27 = self->_messageContext;
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34DD0]), "initWithDictionary:boostContext:", v18, v27);
    v28 = 0x1E2C5D000uLL;
    +[IDSTransportLog IDSConnection](IDSTransportLog, "IDSConnection");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (a6 == 29)
    {
      if (v30)
      {
        objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D34948]);
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D34940]);
        v58 = v27;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D34950]);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v33;
        *(_DWORD *)buf = 138414338;
        v35 = CFSTR("NO");
        v73 = self;
        v74 = 2114;
        if (v62)
          v35 = CFSTR("YES");
        v75 = (int64_t)v15;
        v76 = 2112;
        v77 = v16;
        v78 = 2048;
        v79 = 29;
        v80 = 2114;
        v81 = v63;
        v82 = 2114;
        v83 = v31;
        v84 = 2114;
        v85 = (uint64_t)v32;
        v86 = 2114;
        v87 = v33;
        v88 = 2112;
        v89 = v35;
        _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_DEFAULT, "%@ outgoing message guid response: %{public}@  callbackID: %@  response code: %ld   error: %{public}@  WiProx error: Error Domain=%{public}@ Code=%{public}@ %{public}@  lastCall: %@", buf, 0x5Cu);

        v28 = 0x1E2C5D000;
        v27 = v58;

      }
    }
    else if (v30)
    {
      v36 = v16;
      if (v62)
        v37 = CFSTR("YES");
      else
        v37 = CFSTR("NO");
      v38 = objc_msgSend(v61, "endpointState");
      *(_DWORD *)buf = 138413826;
      v73 = self;
      v74 = 2114;
      v75 = (int64_t)v15;
      v76 = 2112;
      v77 = v36;
      v78 = 2048;
      v79 = a6;
      v80 = 2114;
      v81 = v63;
      v82 = 2112;
      v83 = v37;
      v16 = (__CFString *)v36;
      v28 = 0x1E2C5D000uLL;
      v84 = 2048;
      v85 = v38;
      _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_DEFAULT, "%@ outgoing message guid response: %{public}@  callbackID: %@  response code: %ld   error: %{public}@   lastCall: %@  endpointState: %ld", buf, 0x48u);
    }

    if (a6 == 11 || v62)
    {
      -[_IDSConnection _handleLastCallForPendingIdentifier:callbackID:](self, "_handleLastCallForPendingIdentifier:callbackID:", v15, v16);
      if (a6 == 11)
      {
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend(v61, "originalCommand");
      v39 = v28;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isEqualToNumber:", &unk_1E2CAE228);

      v28 = v39;
      if (v41)
      {
        -[_IDSConnection didCancelMessageWithSuccess:onAccount:error:identifier:](self, "didCancelMessageWithSuccess:onAccount:error:identifier:", (a6 | v63) == 0, v17);
        goto LABEL_36;
      }
    }
    v59 = v27;
    v60 = v16;
    objc_msgSend(*(id *)(v28 + 3944), "IDSConnection");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v61, "serverReceivedTime");
      v43 = (_IDSConnection *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "serverTimestamp");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v73 = v43;
      v74 = 2112;
      v75 = (int64_t)v44;
      _os_log_impl(&dword_1906E0000, v42, OS_LOG_TYPE_DEFAULT, "Server Timestamp for UpdatedWithResponseCode? { serverReceivedTime: %@, serverTimestamp: %@}", buf, 0x16u);

    }
    sub_1907A6374((void *)v63);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v45;
    v47 = !v62;
    v57 = a6 == 0;
    if (a6 && (v47 & 1) == 0 && !v45)
    {
      +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        sub_1907EDC4C(v48);

      v49 = objc_alloc(MEMORY[0x1E0C99D80]);
      v50 = (void *)objc_msgSend(v49, "initWithObjectsAndKeys:", CFSTR("Unknown error"), *MEMORY[0x1E0CB2D50], 0);
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 200, v50);

    }
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = sub_190748C30;
    v64[3] = &unk_1E2C62A08;
    v64[4] = self;
    v51 = v15;
    v65 = v51;
    v52 = v60;
    v66 = v52;
    v69 = a6;
    v53 = v46;
    v67 = v53;
    v70 = v62;
    v68 = v61;
    v71 = v57;
    -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v64);
    if (((v47 | a10) & 1) == 0)
    {
      -[_IDSConnection daemonController](self, "daemonController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSAccount _internal](self->_account, "_internal");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "uniqueID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "acknowledgeOutgoingMessageWithGUID:alternateCallbackID:forAccountWithUniqueID:", v51, v52, v56);

    }
    v27 = v59;
    v16 = v60;
    goto LABEL_36;
  }
LABEL_37:

}

- (void)messageIdentifier:(id)a3 alternateCallbackID:(id)a4 forAccount:(id)a5 willSendToDestinations:(id)a6 skippedDestinations:(id)a7 registrationPropertyToDestinations:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  _IDSConnection *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "assertQueueIsCurrent");

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1907EDD18();

  }
  -[IDSAccount _internal](self->_account, "_internal");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uniqueID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = IMAreObjectsLogicallySame();

  if (v25)
  {
    +[IDSTransportLog IDSConnection](IDSTransportLog, "IDSConnection");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v37 = self;
      v38 = 2112;
      v39 = v14;
      v40 = 2112;
      v41 = v15;
      v42 = 2112;
      v43 = v27;
      v44 = 2112;
      v45 = v28;
      v46 = 2112;
      v47 = v29;
      _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "%@ identifier %@ callbackID %@ willSendToDests count %@ skipped count %@  map count %@", buf, 0x3Eu);

    }
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_190749118;
    v30[3] = &unk_1E2C62A30;
    v30[4] = self;
    v31 = v14;
    v32 = v15;
    v33 = v16;
    v34 = v17;
    v35 = v18;
    -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v30);

  }
}

- (void)messageIdentifier:(id)a3 forTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  _IDSConnection *v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  _IDSConnection *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v12 = a6;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v16, "assertQueueIsCurrent");

  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1907EDDA4();

  }
  v18 = self->_messageContext;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34DD0]), "initWithDictionary:boostContext:", v13, v18);
  objc_msgSend(v19, "outgoingResponseIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("app-level ack"), v15, v14, 0, 1, v20);

  if (v21)
  {
    +[IDSTransportLog IDSConnection](IDSTransportLog, "IDSConnection");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v48 = self;
      v49 = 2112;
      v50 = v36;
      v51 = 2112;
      v52 = v13;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "%@ received app-level ack with identifier %@ context %@", buf, 0x20u);
    }

    v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = sub_1907495F0;
    v43[3] = &unk_1E2C62A58;
    v43[4] = self;
    v44 = v36;
    v35 = v12;
    v45 = v12;
    v46 = v13;
    -[_IDSConnection _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v43, v23);
    objc_msgSend(v19, "storageGuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "broadcastTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v28 = v27;
      objc_msgSend(v19, "broadcastTime");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      objc_msgSend(v26, "numberWithDouble:", v28 - v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "queue");
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19074965C;
    block[3] = &unk_1E2C610F8;
    v38 = v24;
    v39 = v25;
    v40 = self;
    v41 = v20;
    v42 = v19;
    v33 = v25;
    v34 = v24;
    dispatch_group_notify(v23, v32, block);

    dispatch_group_leave(v23);
    v12 = v35;
  }

}

- (void)didSendOpportunisticDataWithIdentifier:(id)a3 onAccount:(id)a4 toIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  _IDSConnection *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907EDE30();

  }
  -[IDSAccount _internal](self->_account, "_internal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = IMAreObjectsLogicallySame();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "opportunistic");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v22 = self;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "Recieved did send opportunistic data {connection: %@, identifier: %@, accountID: %@, toIDs: %@}", buf, 0x2Au);
    }

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_19074993C;
    v18[3] = &unk_1E2C62A80;
    v18[4] = self;
    v19 = v8;
    v20 = v10;
    -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v18);

  }
}

- (void)didCancelMessageWithSuccess:(BOOL)a3 onAccount:(id)a4 error:(id)a5 identifier:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  _IDSConnection *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v7 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907EDEBC();

  }
  +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v23 = self;
    if (v7)
      v15 = CFSTR("YES");
    v24 = 2112;
    v25 = v15;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "%@: didCancelMessageWithSuccess: %@ error: %@ identifier %@", buf, 0x2Au);
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_190749B68;
  v18[3] = &unk_1E2C62AA8;
  v21 = v7;
  v18[4] = self;
  v19 = v9;
  v20 = v10;
  v16 = v10;
  v17 = v9;
  -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v18);

}

- (void)_setTemporaryMessageContext:(id)a3
{
  id v5;
  id *p_messageContext;
  id messageContext;
  id v8;

  v5 = a3;
  messageContext = self->_messageContext;
  p_messageContext = &self->_messageContext;
  if (messageContext != v5)
  {
    v8 = v5;
    objc_storeStrong(p_messageContext, a3);
    v5 = v8;
  }

}

- (BOOL)_shouldAcceptIncomingType:(id)a3 forTopic:(id)a4 localURI:(id)a5 remoteURI:(id)a6 validateAliases:(BOOL)a7 guid:(id)a8
{
  _BOOL4 v9;
  _IDSConnection *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  char v48;
  NSObject *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  void *v61;
  BOOL v62;
  NSObject *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  void *v67;
  uint64_t v68;
  __CFString *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  NSObject *v74;
  __CFString *v75;
  __CFString *v76;
  void *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  _IDSConnection *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  __CFString *v87;
  __CFString *v88;
  __CFString *v89;
  __CFString *v90;
  const __CFString *v91;
  void *v92;
  _IDSConnection *v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  _IDSConnection *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t v112[128];
  uint8_t buf[4];
  _IDSConnection *v114;
  __int16 v115;
  _IDSConnection *v116;
  __int16 v117;
  const __CFString *v118;
  __int16 v119;
  const __CFString *v120;
  __int16 v121;
  const __CFString *v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  const __CFString *v128;
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v9 = a7;
  v131 = *MEMORY[0x1E0C80C00];
  v14 = (_IDSConnection *)a3;
  v15 = (__CFString *)a4;
  v16 = (__CFString *)a5;
  v17 = (__CFString *)a6;
  v18 = a8;
  v98 = self;
  -[_IDSConnection account](self, "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_internal");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pushTopic");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[__CFString isEqualToIgnoringCase:](v15, "isEqualToIgnoringCase:", v21);

  if ((v22 & 1) == 0)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSAccount _internal](v98->_account, "_internal");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "pushTopic");
      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v114 = v98;
      v115 = 2112;
      v116 = v14;
      v117 = 2112;
      v118 = v15;
      v119 = 2112;
      v120 = v51;
      _os_log_impl(&dword_1906E0000, v49, OS_LOG_TYPE_DEFAULT, "_IDSConnection incoming topic for another connection {self: %p, type: %@, topic: %@, self.topic: %@}", buf, 0x2Au);

    }
    goto LABEL_53;
  }
  if (v9)
  {
    v93 = v14;
    v94 = v18;
    v90 = v17;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    -[_IDSConnection account](v98, "account");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_internal");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handles");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v109;
      while (2)
      {
        v29 = v15;
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v109 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * i), "URI");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "unprefixedURI");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString unprefixedURI](v16, "unprefixedURI");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v32, "isEqualToString:", v33);

          if ((v34 & 1) != 0)
          {

            v17 = v90;
            v14 = v93;
            v15 = v29;
            v18 = v94;
            goto LABEL_24;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v108, v130, 16);
        v15 = v29;
        if (v27)
          continue;
        break;
      }
    }

    -[__CFString prefixedURI](v16, "prefixedURI");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "_appearsToBePseudonymID");

    if (v36)
    {
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      -[_IDSConnection account](v98, "account");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_internal");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pseudonyms");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v104, v129, 16);
      if (v40)
      {
        v41 = v40;
        v87 = v15;
        v42 = *(_QWORD *)v105;
        v18 = v94;
        while (2)
        {
          for (j = 0; j != v41; ++j)
          {
            if (*(_QWORD *)v105 != v42)
              objc_enumerationMutation(v39);
            objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * j), "URI");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "prefixedURI");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString unprefixedURI](v16, "unprefixedURI");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v45, "isEqualToString:", v46);

            if ((v47 & 1) != 0)
            {
              v48 = 1;
              goto LABEL_62;
            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v104, v129, 16);
          if (v41)
            continue;
          break;
        }
        v48 = 0;
LABEL_62:
        v15 = v87;
      }
      else
      {
        v48 = 0;
        v18 = v94;
      }

      v17 = v90;
      v14 = v93;
    }
    else
    {
      v48 = 0;
      v17 = v90;
      v14 = v93;
      v18 = v94;
    }
    if (v16 && (v48 & 1) == 0)
    {
      +[IDSLogging IDSConnection_oversize](IDSLogging, "IDSConnection_oversize");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        -[IDSAccount _internal](v98->_account, "_internal");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "handles");
        v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[IDSAccount uniqueID](v98->_account, "uniqueID");
        v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[IDSAccount _internal](v98->_account, "_internal");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "pseudonyms");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219266;
        v114 = v98;
        v115 = 2112;
        v116 = v93;
        v117 = 2112;
        v118 = v16;
        v119 = 2112;
        v120 = v75;
        v121 = 2112;
        v122 = v76;
        v123 = 2112;
        v124 = v78;
        _os_log_impl(&dword_1906E0000, v49, OS_LOG_TYPE_DEFAULT, "_IDSConnection incoming handle for another connection {self: %p, type: %@, localURI: %@, self.aliases: %@, account.uuid: %@, self.pseudonyms: %@}", buf, 0x3Eu);

        v14 = v93;
      }
LABEL_53:
      v62 = 0;
      goto LABEL_54;
    }
  }
LABEL_24:
  if (!-[_IDSConnection _isAccountInValidRegistrationStateToAcceptMessages](v98, "_isAccountInValidRegistrationStateToAcceptMessages"))
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSAccount _internal](v98->_account, "_internal");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "uniqueID");
      v81 = (_IDSConnection *)objc_claimAutoreleasedReturnValue();
      -[IDSAccount _internal](v98->_account, "_internal");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v86, "isActive"))
        v64 = CFSTR("YES");
      else
        v64 = CFSTR("NO");
      v82 = v64;
      -[IDSAccount _internal](v98->_account, "_internal");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v85, "registrationStatus") == 5)
        v65 = CFSTR("YES");
      else
        v65 = CFSTR("NO");
      v79 = v65;
      -[IDSAccount _internal](v98->_account, "_internal");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v15;
      if (objc_msgSend(v84, "accountType") == 2)
        v66 = CFSTR("YES");
      else
        v66 = CFSTR("NO");
      -[IDSAccount _internal](v98->_account, "_internal");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "primaryServiceName");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSAccount _internal](v98->_account, "_internal");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = (int)objc_msgSend(v80, "registrationStatus");
      -[IDSAccount _internal](v98->_account, "_internal");
      v96 = v18;
      v69 = v17;
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "registrationCertificate");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414082;
      if (v71)
        v72 = CFSTR("YES");
      else
        v72 = CFSTR("NO");
      v114 = v14;
      v115 = 2112;
      v116 = v81;
      v117 = 2112;
      v118 = v82;
      v119 = 2112;
      v120 = v79;
      v121 = 2112;
      v122 = v66;
      v15 = v89;
      v123 = 2112;
      v124 = v67;
      v125 = 2048;
      v126 = v68;
      v127 = 2112;
      v128 = v72;
      _os_log_impl(&dword_1906E0000, v63, OS_LOG_TYPE_DEFAULT, "Ignoring %@, account is not configured: %@    isActive: %@  isRegistered: %@  isLocal: %@  serviceIdentifier: %@  registrationStatus: %ld  registrationCert: %@", buf, 0x52u);

      v17 = v69;
      v18 = v96;

    }
    v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34DE0]), "initWithReason:guid:service:additionalInformation:", 703, v18, v15, 0);
    -[_IDSConnection _sendMissingMessageMetric:](v98, "_sendMissingMessageMetric:", v49);
    goto LABEL_53;
  }
  if (!v17)
  {
    v62 = 1;
    goto LABEL_55;
  }
  -[__CFString unprefixedURI](v17, "unprefixedURI");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  objc_msgSend(v52, "_stripPotentialTokenURIWithToken:", &v103);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v103;

  if (v49 && v53)
  {
    v95 = v18;
    v88 = v15;
    v91 = v17;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    -[IDSAccount _internal](v98->_account, "_internal");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "suppressedDevices");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v100;
      while (2)
      {
        for (k = 0; k != v57; ++k)
        {
          if (*(_QWORD *)v100 != v58)
            objc_enumerationMutation(v55);
          objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * k), "_internal");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "pushToken");
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v61, "isEqualToData:", v49))
          {
            +[IDSTransportLog IDSConnection](IDSTransportLog, "IDSConnection");
            v74 = objc_claimAutoreleasedReturnValue();
            v15 = v88;
            v17 = (__CFString *)v91;
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v114 = v14;
              v115 = 2112;
              v116 = (_IDSConnection *)v88;
              v117 = 2112;
              v118 = v91;
              _os_log_impl(&dword_1906E0000, v74, OS_LOG_TYPE_DEFAULT, "Ignoring %@ for topic %@ because fromID %@ is a suppressed IDSDevice.", buf, 0x20u);
            }

            v62 = 0;
            v18 = v95;
            goto LABEL_54;
          }

        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
        if (v57)
          continue;
        break;
      }
    }

    v15 = v88;
    v17 = (__CFString *)v91;
    v18 = v95;
  }

  v62 = 1;
LABEL_54:

LABEL_55:
  return v62;
}

- (BOOL)_isAccountInValidRegistrationStateToAcceptMessages
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[_IDSConnection account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isActive");
  if (objc_msgSend(v4, "isInTransientRegistrationState"))
  {
    objc_msgSend(v4, "registrationCertificate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "primaryServiceName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[_IDSConnection _canServiceNameAcceptMessagesInTransientRegistrationState:](self, "_canServiceNameAcceptMessagesInTransientRegistrationState:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8 | v5;
}

- (BOOL)_canServiceNameAcceptMessagesInTransientRegistrationState:(id)a3
{
  return objc_msgSend(a3, "isEqualToIgnoringCase:", CFSTR("com.apple.madrid"));
}

- (void)opportunisticDataReceived:(id)a3 withIdentifier:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (objc_class *)MEMORY[0x1E0D34DD0];
  v14 = self->_messageContext;
  v15 = a6;
  v16 = (void *)objc_msgSend([v13 alloc], "initWithDictionary:boostContext:", v15, v14);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_19074A720;
  v21[3] = &unk_1E2C62AD0;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v16;
  v17 = v16;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v21);

}

- (void)messageReceived:(id)a3 withGUID:(id)a4 withPayload:(id)a5 forTopic:(id)a6 toURI:(id)a7 fromURI:(id)a8 context:(id)a9
{
  void *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  int v20;
  id v21;
  NSObject *v22;
  unint64_t v23;
  int v24;
  void *v25;
  NSObject *v26;
  int incomingMessageLoggingSequence;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  char v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  _QWORD block[5];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  char v67;
  char v68;
  _QWORD v69[5];
  id v70;
  id v71;
  id v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  _QWORD v77[5];
  id v78;
  id v79;
  os_activity_scope_state_s state;
  NSObject *v81;
  _QWORD v82[2];
  uint8_t buf[4];
  _BYTE v84[10];
  uint64_t v85;
  _BYTE v86[10];
  _BYTE v87[10];
  __int16 v88;
  id v89;
  __int16 v90;
  int v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v53 = a4;
  v56 = a5;
  v58 = a6;
  v57 = a7;
  v59 = a8;
  v54 = a9;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v15, "assertQueueIsCurrent");

  if ((_DWORD)a7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907EDF48();

  }
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v81 = _os_activity_create(&dword_1906E0000, "Connection recieved message", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v81, &state);
  v55 = self->_messageContext;
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34DD0]), "initWithDictionary:boostContext:", v54, v55);
  objc_msgSend(v60, "outgoingResponseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("message"), v58, v57, v59, 1, v17);

  if (v18)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v56, "count");
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)v84 = self;
      *(_WORD *)&v84[8] = 2112;
      v85 = (uint64_t)v53;
      *(_WORD *)v86 = 2112;
      *(_QWORD *)&v86[2] = v58;
      *(_WORD *)v87 = 2112;
      *(_QWORD *)&v87[2] = v59;
      v88 = 2112;
      v89 = v57;
      v90 = 1024;
      v91 = v20;
      _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "%@ received message: %@  topic %@  from: %@  to: %@  payload items: %d", buf, 0x3Au);
    }

    v21 = v53;
    if (objc_msgSend(v21, "length"))
    {
      v51 = v21;
      if (objc_msgSend(v21, "length"))
      {
LABEL_13:
        +[IDSLogging GUIDTRACE](IDSLogging, "GUIDTRACE");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v84 = v51;
          *(_WORD *)&v84[8] = 2112;
          v85 = (uint64_t)v58;
          _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "INCOMING-CLIENT_MESSAGE:%@ SERVICE:%@", buf, 0x16u);
        }

        v23 = objc_msgSend(v56, "count");
        v24 = v23;
        if (v23 > 0x7FFE)
        {
          +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v84 = v21;
            _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_DEFAULT, "Warning! Message with guid %@ exceeds size limitations of MPKL_UUID_NEXT macro.", buf, 0xCu);
          }

        }
        else
        {
          v82[0] = 0xAAAAAAAAAAAAAAAALL;
          v82[1] = 0xAAAAAAAAAAAAAAAALL;
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v21);
          objc_msgSend(v25, "getUUIDBytes:", v82);

          objc_msgSend(MEMORY[0x1E0D34D40], "CrossLayerLogging");
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            incomingMessageLoggingSequence = self->_incomingMessageLoggingSequence;
            self->_incomingMessageLoggingSequence = incomingMessageLoggingSequence + 1;
            *(_DWORD *)buf = 67110402;
            *(_DWORD *)v84 = 120;
            *(_WORD *)&v84[4] = 1024;
            *(_DWORD *)&v84[6] = 255;
            v85 = 0x832000000100412;
            *(_QWORD *)v86 = v82;
            *(_WORD *)&v86[8] = 1024;
            *(_DWORD *)v87 = v24;
            *(_WORD *)&v87[4] = 1024;
            *(_DWORD *)&v87[6] = incomingMessageLoggingSequence;
            _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "9 {curProtocol: %hhu, nextProtocol: %hhu, curUUID: %{public,uuid_t}.16P, curPktLen: %u, logSeqn: %hhu}", buf, 0x2Au);
          }

        }
        if (self->_indirectDelegateCallouts)
        {
          v29 = 0;
        }
        else
        {
          v29 = dispatch_group_create();
          dispatch_group_enter(v29);
        }
        v30 = MEMORY[0x1E0C809B0];
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = sub_19074AF74;
        v77[3] = &unk_1E2C62A80;
        v77[4] = self;
        v31 = v56;
        v78 = v31;
        v32 = v59;
        v79 = v32;
        -[_IDSConnection _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v77, v29);
        v73[0] = v30;
        v73[1] = 3221225472;
        v73[2] = sub_19074AFDC;
        v73[3] = &unk_1E2C62A58;
        v73[4] = self;
        v74 = v31;
        v33 = v32;
        v75 = v33;
        v34 = v60;
        v76 = v34;
        -[_IDSConnection _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v73, v29);
        v69[0] = v30;
        v69[1] = 3221225472;
        v69[2] = sub_19074B048;
        v69[3] = &unk_1E2C62A58;
        v69[4] = self;
        v70 = v52;
        v35 = v33;
        v71 = v35;
        v36 = v34;
        v72 = v36;
        -[_IDSConnection _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v69, v29);
        if (v29)
        {
          v37 = objc_msgSend(v36, "wantsAppAck");
          v50 = objc_msgSend(v36, "isDirectMessage");
          objc_msgSend(v36, "outgoingResponseIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "broadcastTime");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            v40 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v42 = v41;
            objc_msgSend(v36, "broadcastTime");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "doubleValue");
            objc_msgSend(v40, "numberWithDouble:", v42 - v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v45 = 0;
          }
          +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "queue");
          v47 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_19074B0B4;
          block[3] = &unk_1E2C62AF8;
          v67 = v37;
          v68 = v50;
          block[4] = self;
          v62 = v38;
          v63 = v36;
          v64 = v35;
          v65 = v21;
          v66 = v45;
          v48 = v45;
          v49 = v38;
          dispatch_group_notify(v29, v47, block);

          dispatch_group_leave(v29);
        }

        goto LABEL_31;
      }
      objc_msgSend(v60, "incomingResponseIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v60, "outgoingResponseIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_13;
  }
LABEL_31:

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)dataReceived:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  unint64_t v29;
  int v30;
  void *v31;
  NSObject *v32;
  int incomingMessageLoggingSequence;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  char v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  char v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  _QWORD block[5];
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  char v66;
  char v67;
  _QWORD v68[5];
  id v69;
  id v70;
  id v71;
  _QWORD v72[2];
  uint8_t buf[4];
  _BYTE v74[10];
  uint64_t v75;
  _BYTE v76[10];
  _BYTE v77[10];
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v20, "assertQueueIsCurrent");

  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907EDFD8();

  }
  v22 = self->_messageContext;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34DD0]), "initWithDictionary:boostContext:", v19, v22);

  objc_msgSend(v23, "outgoingResponseIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("data"), v16, v17, v18, 1, v24))
  {
    v57 = v24;
    v54 = v22;
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)v74 = self;
      *(_WORD *)&v74[8] = 2112;
      v75 = (uint64_t)v15;
      *(_WORD *)v76 = 2112;
      *(_QWORD *)&v76[2] = v16;
      *(_WORD *)v77 = 2112;
      *(_QWORD *)&v77[2] = v18;
      v78 = 2112;
      v79 = v17;
      _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "%@ received data: %@ topic %@  from: %@  to: %@", buf, 0x34u);
    }

    v26 = v15;
    if (objc_msgSend(v26, "length"))
    {
      v58 = v26;
      if (objc_msgSend(v26, "length"))
      {
LABEL_13:
        v53 = v26;
        +[IDSLogging GUIDTRACE](IDSLogging, "GUIDTRACE");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v74 = v58;
          *(_WORD *)&v74[8] = 2112;
          v75 = (uint64_t)v16;
          _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_DEFAULT, "INCOMING-CLIENT_DATA:%@ SERVICE:%@", buf, 0x16u);
        }

        v29 = objc_msgSend(v14, "length");
        if (v29 <= 0x7FFE)
        {
          v30 = v29;
          v72[0] = 0xAAAAAAAAAAAAAAAALL;
          v72[1] = 0xAAAAAAAAAAAAAAAALL;
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v58);
          objc_msgSend(v31, "getUUIDBytes:", v72);

          objc_msgSend(MEMORY[0x1E0D34D40], "CrossLayerLogging");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            incomingMessageLoggingSequence = self->_incomingMessageLoggingSequence;
            self->_incomingMessageLoggingSequence = incomingMessageLoggingSequence + 1;
            *(_DWORD *)buf = 67110402;
            *(_DWORD *)v74 = 120;
            *(_WORD *)&v74[4] = 1024;
            *(_DWORD *)&v74[6] = 255;
            v75 = 0x832000000100412;
            *(_QWORD *)v76 = v72;
            *(_WORD *)&v76[8] = 1024;
            *(_DWORD *)v77 = v30;
            *(_WORD *)&v77[4] = 1024;
            *(_DWORD *)&v77[6] = incomingMessageLoggingSequence;
            _os_log_impl(&dword_1906E0000, v32, OS_LOG_TYPE_DEFAULT, "9 {curProtocol: %hhu, nextProtocol: %hhu, curUUID: %{public,uuid_t}.16P, curPktLen: %u, logSeqn: %hhu}", buf, 0x2Au);
          }

        }
        v56 = v17;
        if (self->_indirectDelegateCallouts)
        {
          v34 = 0;
        }
        else
        {
          v34 = dispatch_group_create();
          dispatch_group_enter(v34);
        }
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = sub_19074B85C;
        v68[3] = &unk_1E2C62A58;
        v68[4] = self;
        v35 = v14;
        v69 = v35;
        v55 = v18;
        v36 = v18;
        v70 = v36;
        v37 = v23;
        v71 = v37;
        -[_IDSConnection _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v68, v34);
        if (v34)
        {
          v50 = v16;
          v51 = v15;
          v52 = v14;
          v49 = objc_msgSend(v37, "wantsAppAck");
          v38 = objc_msgSend(v37, "isDirectMessage");
          objc_msgSend(v37, "broadcastTime");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            v40 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v42 = v41;
            objc_msgSend(v37, "broadcastTime");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "doubleValue");
            objc_msgSend(v40, "numberWithDouble:", v42 - v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v45 = 0;
          }
          +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "queue");
          v47 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_19074B8C8;
          block[3] = &unk_1E2C62B20;
          v66 = v49;
          v67 = v38;
          block[4] = self;
          v60 = v57;
          v61 = v37;
          v62 = v36;
          v63 = v53;
          v64 = v45;
          v65 = v35;
          v48 = v45;
          dispatch_group_notify(v34, v47, block);

          dispatch_group_leave(v34);
          v15 = v51;
          v14 = v52;
          v16 = v50;
        }

        v18 = v55;
        v17 = v56;
        v22 = v54;
        v24 = v57;
        goto LABEL_28;
      }
      objc_msgSend(v23, "incomingResponseIdentifier");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v23, "outgoingResponseIdentifier");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v58 = (void *)v27;

    goto LABEL_13;
  }
LABEL_28:

}

- (void)accessoryDataReceived:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  NSObject *v38;
  id v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD block[4];
  id v49;
  _IDSConnection *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  char v56;
  _QWORD v57[5];
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  _IDSConnection *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v47 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "assertQueueIsCurrent");

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907EE064();

  }
  v22 = self->_messageContext;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34DD0]), "initWithDictionary:boostContext:", v18, v22);

  objc_msgSend(v23, "outgoingResponseIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("data"), v15, v16, v17, 0, v24))
  {
    v44 = v15;
    v46 = v14;
    -[_IDSConnection account](self, "account");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_internal");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "accountType");

    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v27 == 1)
    {
      v15 = v44;
      if (v29)
      {
        *(_DWORD *)buf = 138413314;
        v62 = self;
        v63 = 2112;
        v64 = v47;
        v65 = 2112;
        v66 = v44;
        v67 = 2112;
        v68 = v17;
        v69 = 2112;
        v70 = v16;
        _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_DEFAULT, "%@ received Accessory data: %@ topic %@  from: %@  to: %@", buf, 0x34u);
      }

      if (self->_indirectDelegateCallouts)
      {
        v28 = 0;
      }
      else
      {
        v28 = dispatch_group_create();
        dispatch_group_enter(v28);
      }
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = sub_19074BF54;
      v57[3] = &unk_1E2C62A58;
      v57[4] = self;
      v30 = v46;
      v58 = v30;
      v43 = v17;
      v59 = v43;
      v31 = v23;
      v60 = v31;
      -[_IDSConnection _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v57, v28);
      if (v28)
      {
        v42 = v30;
        v41 = objc_msgSend(v31, "wantsAppAck");
        objc_msgSend(v31, "broadcastTime");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v33 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v35 = v34;
          objc_msgSend(v31, "broadcastTime");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "doubleValue");
          objc_msgSend(v33, "numberWithDouble:", v35 - v37);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v44;
        }
        else
        {
          v40 = 0;
        }
        +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "queue");
        v38 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_19074BFC0;
        block[3] = &unk_1E2C62B48;
        v56 = v41;
        v49 = v31;
        v50 = self;
        v51 = v24;
        v52 = v43;
        v53 = v47;
        v54 = v40;
        v55 = v42;
        v39 = v40;
        dispatch_group_notify(v28, v38, block);

        dispatch_group_leave(v28);
      }

    }
    else
    {
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_DEFAULT, "Accessory data commands are only supported on AppleID accounts, This one is not for me.", buf, 2u);
      }
      v15 = v44;
    }

    v14 = v46;
  }

}

- (void)accessoryReportMessageReceived:(id)a3 accessoryID:(id)a4 controllerID:(id)a5 withGUID:(id)a6 forTopic:(id)a7 toURI:(id)a8 fromURI:(id)a9 context:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  char v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD block[4];
  id v48;
  _IDSConnection *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  char v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  _IDSConnection *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v16 = a4;
  v17 = a5;
  v46 = a6;
  v43 = a7;
  v44 = a8;
  v18 = a9;
  v19 = a10;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v20, "assertQueueIsCurrent");

  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907EE0F0();

  }
  v22 = self->_messageContext;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34DD0]), "initWithDictionary:boostContext:", v19, v22);

  objc_msgSend(v23, "outgoingResponseIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v43;
  v25 = v44;
  if (-[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("accessoryReportMessage"), v43, v44, v18, 0, v24))
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v61 = self;
      v62 = 2112;
      v63 = v46;
      v64 = 2112;
      v65 = v43;
      v66 = 2112;
      v67 = v18;
      v68 = 2112;
      v69 = v44;
      _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, "%@ received Accessory Report Message: %@ topic %@  from: %@  to: %@", buf, 0x34u);
    }

    if (self->_indirectDelegateCallouts)
    {
      v28 = 0;
    }
    else
    {
      v28 = dispatch_group_create();
      dispatch_group_enter(v28);
    }
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = sub_19074C5BC;
    v55[3] = &unk_1E2C62AD0;
    v55[4] = self;
    v56 = v45;
    v57 = v16;
    v58 = v17;
    v29 = v23;
    v59 = v29;
    -[_IDSConnection _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v55, v28);
    if (v28)
    {
      v41 = v17;
      v42 = v16;
      v40 = objc_msgSend(v29, "wantsAppAck");
      objc_msgSend(v29, "broadcastTime");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v33 = v32;
        objc_msgSend(v29, "broadcastTime");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        objc_msgSend(v31, "numberWithDouble:", v33 - v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v36 = 0;
      }
      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "queue");
      v38 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_19074C628;
      block[3] = &unk_1E2C62B70;
      v54 = v40;
      v48 = v29;
      v49 = self;
      v50 = v24;
      v51 = v18;
      v52 = v46;
      v53 = v36;
      v39 = v36;
      dispatch_group_notify(v28, v38, block);

      dispatch_group_leave(v28);
      v17 = v41;
      v16 = v42;
      v26 = v43;
    }

    v25 = v44;
  }

}

- (void)incomingInvitation:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  v15 = self->_messageContext;
  v16 = (objc_class *)MEMORY[0x1E0D34DD0];
  v17 = a8;
  v18 = a6;
  v19 = a5;
  v20 = (void *)objc_msgSend([v16 alloc], "initWithDictionary:boostContext:", v17, v15);

  objc_msgSend(v20, "outgoingResponseIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("message"), v19, v18, v14, 1, v21);

  if ((_DWORD)v17)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "incomingInvitation - received incoming invitation message : %@", buf, 0xCu);
    }

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_19074C9B4;
    v23[3] = &unk_1E2C62A58;
    v23[4] = self;
    v24 = v13;
    v25 = v14;
    v26 = v20;
    -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v23);

  }
}

- (void)incomingInvitationUpdate:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  v15 = self->_messageContext;
  v16 = (objc_class *)MEMORY[0x1E0D34DD0];
  v17 = a8;
  v18 = a6;
  v19 = a5;
  v20 = (void *)objc_msgSend([v16 alloc], "initWithDictionary:boostContext:", v17, v15);

  objc_msgSend(v20, "outgoingResponseIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("message"), v19, v18, v14, 1, v21);

  if ((_DWORD)v17)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "incomingInvitationUpdate - received incoming invitation message : %@", buf, 0xCu);
    }

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_19074CC14;
    v23[3] = &unk_1E2C62A58;
    v23[4] = self;
    v24 = v13;
    v25 = v14;
    v26 = v20;
    -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v23);

  }
}

- (void)protobufReceived:(id)a3 withGUID:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  NSObject *v35;
  int incomingMessageLoggingSequence;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  char v43;
  char v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  NSObject *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD block[5];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  char v73;
  char v74;
  _QWORD v75[5];
  id v76;
  id v77;
  id v78;
  uint8_t buf[4];
  _BYTE v80[10];
  uint64_t v81;
  _BYTE v82[10];
  _BYTE v83[10];
  _QWORD v84[5];

  v84[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v20, "assertQueueIsCurrent");

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907EE17C();

  }
  v22 = self->_messageContext;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34DD0]), "initWithDictionary:boostContext:", v18, v22);
  objc_msgSend(v18, "objectForKey:", CFSTR("IDSMessageContextSequenceNumberKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "unsignedIntegerValue");
  kdebug_trace();

  objc_msgSend(v23, "outgoingResponseIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("protobuf"), v16, v19, v17, 1, v25);

  if (v14 && v26)
  {
    v65 = v17;
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34E08]), "initWithDictionary:", v14);
    objc_msgSend(v27, "setContext:", v23);
    v28 = v15;
    if (objc_msgSend(v28, "length"))
    {
      v29 = v28;
      if (objc_msgSend(v28, "length"))
      {
LABEL_12:
        v63 = v28;
        v60 = v22;
        +[IDSLogging GUIDTRACE](IDSLogging, "GUIDTRACE");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v80 = v29;
          *(_WORD *)&v80[8] = 2112;
          v81 = (uint64_t)v16;
          _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "INCOMING-CLIENT_PROTOBUF:%@ SERVICE:%@", buf, 0x16u);
        }
        v64 = v29;

        objc_msgSend(v23, "totalBytes");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "longValue");

        if (v33 <= 0x7FFE)
        {
          v84[0] = 0xAAAAAAAAAAAAAAAALL;
          v84[1] = 0xAAAAAAAAAAAAAAAALL;
          v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v64);
          objc_msgSend(v34, "getUUIDBytes:", v84);

          objc_msgSend(MEMORY[0x1E0D34D40], "CrossLayerLogging");
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            incomingMessageLoggingSequence = self->_incomingMessageLoggingSequence;
            self->_incomingMessageLoggingSequence = incomingMessageLoggingSequence + 1;
            *(_DWORD *)buf = 67110402;
            *(_DWORD *)v80 = 120;
            *(_WORD *)&v80[4] = 1024;
            *(_DWORD *)&v80[6] = 255;
            v81 = 0x832000000100412;
            *(_QWORD *)v82 = v84;
            *(_WORD *)&v82[8] = 1024;
            *(_DWORD *)v83 = v33;
            *(_WORD *)&v83[4] = 1024;
            *(_DWORD *)&v83[6] = incomingMessageLoggingSequence;
            _os_log_impl(&dword_1906E0000, v35, OS_LOG_TYPE_DEFAULT, "9 {curProtocol: %hhu, nextProtocol: %hhu, curUUID: %{public,uuid_t}.16P, curPktLen: %u, logSeqn: %hhu}", buf, 0x2Au);
          }

        }
        +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)v80 = v63;
          *(_WORD *)&v80[8] = 2112;
          v81 = (uint64_t)v16;
          *(_WORD *)v82 = 2112;
          *(_QWORD *)&v82[2] = CFSTR("(unknown)");
          *(_WORD *)v83 = 2112;
          *(_QWORD *)&v83[2] = v65;
          _os_log_impl(&dword_1906E0000, v37, OS_LOG_TYPE_DEFAULT, "Client received protobuf from daemon %@ for topic: %@  messageID: %@  fromID: %@", buf, 0x2Au);
        }
        v62 = v15;

        v61 = v16;
        if (self->_indirectDelegateCallouts)
        {
          v38 = 0;
        }
        else
        {
          v38 = dispatch_group_create();
          dispatch_group_enter(v38);
        }
        v75[0] = MEMORY[0x1E0C809B0];
        v75[1] = 3221225472;
        v75[2] = sub_19074D35C;
        v75[3] = &unk_1E2C62A58;
        v75[4] = self;
        v39 = v27;
        v76 = v39;
        v17 = v65;
        v40 = v65;
        v77 = v40;
        v41 = v23;
        v78 = v41;
        -[_IDSConnection _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v75, v38);
        if (v38)
        {
          v58 = v39;
          +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v80 = v63;
            _os_log_impl(&dword_1906E0000, v42, OS_LOG_TYPE_DEFAULT, "Ack'ing message %@ to daemon that client got it", buf, 0xCu);
          }
          v57 = v23;
          v59 = v14;

          v43 = objc_msgSend(v41, "wantsAppAck");
          v44 = objc_msgSend(v41, "isDirectMessage");
          objc_msgSend(v41, "outgoingResponseIdentifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "broadcastTime");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = v43;
          if (v46)
          {
            v48 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v50 = v49;
            objc_msgSend(v41, "broadcastTime");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "doubleValue");
            objc_msgSend(v48, "numberWithDouble:", v50 - v52);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

          }
          +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "queue");
          v54 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_19074D484;
          block[3] = &unk_1E2C62B20;
          v73 = v47;
          v74 = v44;
          block[4] = self;
          v67 = v45;
          v68 = v41;
          v69 = v40;
          v70 = v63;
          v71 = v46;
          v72 = v58;
          v55 = v46;
          v56 = v45;
          dispatch_group_notify(v38, v54, block);

          dispatch_group_leave(v38);
          v39 = v58;
          v14 = v59;
          v17 = v65;
          v23 = v57;
        }

        v16 = v61;
        v15 = v62;
        v22 = v60;
        goto LABEL_30;
      }
      objc_msgSend(v23, "incomingResponseIdentifier");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v23, "outgoingResponseIdentifier");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v29 = (id)v30;

    goto LABEL_12;
  }
LABEL_30:

}

- (void)receivedMetadataForDirectMessaging:(id)a3
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  IDSDirectMessageConnection *directMessageConnection;

  v5 = a3;
  if (_IDSSupportsDirectMessaging())
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "assertQueueIsCurrent");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1907EE208();

    }
    directMessageConnection = self->_directMessageConnection;
    if (directMessageConnection)
      -[IDSDirectMessageConnection updateMetadata:](directMessageConnection, "updateMetadata:", v5);
    objc_storeStrong((id *)&self->_directMessagingMetadata, a3);
  }

}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  id v6;
  const __CFDictionary *v7;
  NSObject *v8;
  void *Value;
  const char *string_ptr;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  char v17;
  NSObject *v18;

  v6 = a3;
  v7 = (const __CFDictionary *)a4;
  if (v6)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1907EE37C();

    if (v7)
      Value = (void *)CFDictionaryGetValue(v7, CFSTR("object-type"));
    else
      Value = 0;
    if (objc_msgSend(Value, "isEqualToIgnoringCase:", CFSTR("direct-messaging-socket-received")))
    {
      if (self->_directMessageConnection
        || (-[_IDSConnection createDirectMessageConnectionIfNeeded](self, "createDirectMessageConnectionIfNeeded"),
            self->_directMessageConnection))
      {
        string_ptr = xpc_string_get_string_ptr(v6);
        if (string_ptr)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7)
          {
            v12 = (id)CFDictionaryGetValue(v7, CFSTR("object-flags"));
            v13 = (void *)CFDictionaryGetValue(v7, CFSTR("object-recipient"));
          }
          else
          {
            v12 = 0;
            v13 = 0;
          }
          v14 = v13;
          +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            sub_1907EE318();

          if (v14
            && (-[IDSAccount serviceName](self->_account, "serviceName"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v14, "isEqualToString:", v16),
                v16,
                (v17 & 1) != 0))
          {
            v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v11, CFSTR("streamName"));
            if (v12)
              -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v12, CFSTR("streamFlags"));
            -[IDSDirectMessageConnection receivedDirectMessagingSocketWithContext:](self->_directMessageConnection, "receivedDirectMessagingSocketWithContext:", v18);
          }
          else
          {
            +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              sub_1907EE294((uint64_t)self, v18);
          }

        }
      }
    }
  }

}

- (void)didFlushCacheForService:(id)a3 remoteURI:(id)a4 fromURI:(id)a5 guid:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "assertQueueIsCurrent");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907EE3E0();

  }
  objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("flush cache notification"), v10, v17, 0, 1, v13);

  if (v18)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v25 = v10;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Client received notification that cache was flushed { service: %@, remoteURI: %@, fromURI: %@, guid: %@ }", buf, 0x2Au);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_19074DB7C;
    v20[3] = &unk_1E2C62A58;
    v20[4] = self;
    v21 = v11;
    v22 = v12;
    v23 = v13;
    -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v20);

  }
}

- (void)didFlushCacheFromKTPeerUpdateForService:(id)a3 peerURI:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
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
      sub_1907EE46C();

  }
  +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Client received notification that cache was flushed from KT peer update { service: %@, peerURI: %@ }", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19074DD68;
  v13[3] = &unk_1E2C629E0;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v13);

}

- (void)pendingIncomingMessageWithGUID:(id)a3 forTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v17, "assertQueueIsCurrent");

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1907EE4F8();

  }
  v19 = self->_messageContext;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34DD0]), "initWithDictionary:boostContext:", v15, v19);

  v21 = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("pending"), v13, v16, v14, 1, v12);
  if (v21)
  {
    objc_msgSend(v20, "setOriginalGUID:", v12);
    v22 = v12;
    if (objc_msgSend(v22, "length"))
    {
      v23 = v22;
      if (objc_msgSend(v22, "length"))
      {
LABEL_11:
        +[IDSLogging GUIDTRACE](IDSLogging, "GUIDTRACE");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v31 = v23;
          v32 = 2112;
          v33 = v13;
          _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "INCOMING-CLIENT_PENDING:%@ SERVICE:%@", buf, 0x16u);
        }

        +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v31 = v22;
          v32 = 2112;
          v33 = v13;
          v34 = 2112;
          v35 = CFSTR("(unknown)");
          v36 = 2112;
          v37 = v14;
          _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "Client received pending incoming message from daemon %@ for topic: %@  messageID: %@  fromID: %@", buf, 0x2Au);
        }

        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = sub_19074E0CC;
        v27[3] = &unk_1E2C62A80;
        v27[4] = self;
        v28 = v14;
        v29 = v20;
        -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v27);

        goto LABEL_16;
      }
      objc_msgSend(v20, "incomingResponseIdentifier");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v20, "outgoingResponseIdentifier");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v24;

    goto LABEL_11;
  }
LABEL_16:

}

- (void)pendingResourceWithMetadata:(id)a3 guid:(id)a4 forTopic:(id)a5 toURI:(id)a6 fromURI:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v20, "assertQueueIsCurrent");

  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907EE584();

  }
  v22 = self->_messageContext;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34DD0]), "initWithDictionary:boostContext:", v18, v22);

  v24 = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("pending"), v16, v19, v17, 1, v15);
  if (v24)
  {
    objc_msgSend(v23, "setOriginalGUID:", v15);
    v25 = v15;
    if (objc_msgSend(v25, "length"))
    {
      v29 = v25;
      if (objc_msgSend(v25, "length"))
      {
LABEL_11:
        +[IDSLogging GUIDTRACE](IDSLogging, "GUIDTRACE", v29);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v37 = v30;
          v38 = 2112;
          v39 = v16;
          _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, "INCOMING-CLIENT_RESOURCE_PENDING:%@ SERVICE:%@", buf, 0x16u);
        }

        +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v37 = v25;
          v38 = 2112;
          v39 = v16;
          v40 = 2112;
          v41 = CFSTR("(unknown)");
          v42 = 2112;
          v43 = v17;
          _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_DEFAULT, "Client received pending resource message from daemon %@ for topic: %@  messageID: %@  fromID: %@", buf, 0x2Au);
        }

        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = sub_19074E470;
        v31[3] = &unk_1E2C62AD0;
        v31[4] = self;
        v32 = v14;
        v33 = v25;
        v34 = v17;
        v35 = v23;
        -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v31);

        goto LABEL_16;
      }
      objc_msgSend(v23, "incomingResponseIdentifier");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v23, "outgoingResponseIdentifier");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v29 = (id)v26;

    goto LABEL_11;
  }
LABEL_16:

}

- (void)sessionInvitationReceivedWithPayload:(id)a3 forTopic:(id)a4 sessionID:(id)a5 toIdentifier:(id)a6 fromID:(id)a7 transportType:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v47 = a8;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v19, "assertQueueIsCurrent");

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1907EE670();

  }
  objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("session invitation"), v15, v21, v22, 1, 0);

  if (v23)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      v56 = v14;
      v57 = 2112;
      v58 = v15;
      v59 = 2112;
      v60 = v16;
      v61 = 2112;
      v62 = v17;
      v63 = 2112;
      v64 = v18;
      v65 = 2112;
      v66 = v47;
      _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "Received incoming invitation %@ forTopic %@ sessionID %@ toIdentifier %@ fromID %@ transportType %@", buf, 0x3Eu);
    }
    v25 = v16;
    v46 = v15;

    v26 = *MEMORY[0x1E0D34500];
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D34500]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v14, "objectForKey:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_IDSDataFromBase64String:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v14, "objectForKey:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v31 = 0;
        goto LABEL_14;
      }
      objc_msgSend(v14, "objectForKey:", v26);
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v31 = (void *)v30;
LABEL_14:

    objc_opt_class();
    v32 = (id)*MEMORY[0x1E0D34508];
    objc_msgSend(v14, "objectForKey:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v17;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v33;
    }
    else
    {
      if (v33)
      {
        objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          sub_1907EE610();

      }
      v34 = 0;
    }

    v36 = self->_messageContext;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = sub_19074E964;
    v48[3] = &unk_1E2C62B98;
    v48[4] = self;
    v37 = v25;
    v38 = v25;
    v49 = v38;
    v50 = v18;
    v51 = v47;
    v52 = v34;
    v53 = v31;
    v54 = v36;
    v39 = v36;
    v40 = v31;
    v41 = v34;
    -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v48);
    -[_IDSConnection daemonController](self, "daemonController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSConnection daemonController](self, "daemonController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "listenerID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "acknowledgeSessionID:clientID:", v38, v44);

    v16 = v37;
    v17 = v45;
    v15 = v46;
  }

}

- (void)receivedGroupSessionParticipantUpdate:(id)a3 forTopic:(id)a4 toIdentifier:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "assertQueueIsCurrent");

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1907EE6FC();

  }
  objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("group session participant update"), v13, v20, v21, 1, 0);
  if (v22)
  {
    v23 = self->_messageContext;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34DD0]), "initWithDictionary:boostContext:", v15, v23);
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v13;
      _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "Received incoming group session participant update forTopic %@", buf, 0xCu);
    }

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D70]), "initWithDictionaryRepresentation:", v12);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_19074EC50;
    v29[3] = &unk_1E2C62A80;
    v29[4] = self;
    v30 = v26;
    v31 = v24;
    v27 = v24;
    v28 = v26;
    -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v29);

  }
}

- (void)receivedGroupSessionParticipantDataUpdate:(id)a3 forTopic:(id)a4 toIdentifier:(id)a5 fromID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "assertQueueIsCurrent");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907EE788();

  }
  objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[_IDSConnection _shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:](self, "_shouldAcceptIncomingType:forTopic:localURI:remoteURI:validateAliases:guid:", CFSTR("group session participant data update"), v11, v17, v18, 1, 0);
  if (v19)
  {
    +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "Received incoming group session participant data update forTopic %@", buf, 0xCu);
    }

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34D70]), "initWithDictionaryRepresentation:", v10);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_19074EED8;
    v23[3] = &unk_1E2C629E0;
    v23[4] = self;
    v24 = v21;
    v22 = v21;
    -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v23);

  }
}

- (void)checkTransportLogWithReason:(int64_t)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EE814();

  }
  +[IDSLogging IDSConnection](IDSLogging, "IDSConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "checkTransportLog {reason: %ld}", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19074F088;
  v9[3] = &unk_1E2C62BC0;
  v9[4] = self;
  v9[5] = a3;
  -[_IDSConnection _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v9);
}

- (void)_sendMissingMessageMetric:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "shouldReportMetric"))
  {
    objc_msgSend(v6, "payload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "command");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSConnection sendServerMessage:command:](self, "sendServerMessage:command:", v4, v5);

  }
}

- (unsigned)wakingDowngradeCount
{
  return self->_wakingDowngradeCount;
}

- (void)setWakingDowngradeCount:(unsigned int)a3
{
  self->_wakingDowngradeCount = a3;
}

- (IDSDirectMessageConnection)directMessageConnection
{
  return self->_directMessageConnection;
}

- (void)setDirectMessageConnection:(id)a3
{
  objc_storeStrong((id *)&self->_directMessageConnection, a3);
}

- (NSDictionary)directMessagingMetadata
{
  return self->_directMessagingMetadata;
}

- (void)setDirectMessagingMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_directMessagingMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directMessagingMetadata, 0);
  objc_storeStrong((id *)&self->_directMessageConnection, 0);
  objc_storeStrong((id *)&self->_pendingSends, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_delegateToInfo, 0);
  objc_storeStrong(&self->_delegateContext, 0);
  objc_storeStrong(&self->_messageContext, 0);
}

@end
