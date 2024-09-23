@implementation _IDSAccount

- (_IDSAccount)initWithDictionary:(id)a3 uniqueID:(id)a4 serviceName:(id)a5 delegateContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  _IDSAccount *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _IDSAccount *v31;
  NSObject *v32;
  void **p_uniqueID;
  uint64_t v34;
  void *v35;
  NSDictionary *v36;
  NSDictionary *accountConfig;
  NSDictionary *v38;
  uint64_t v39;
  id delegateContext;
  uint64_t v41;
  NSString *serviceToken;
  void *v43;
  void *v44;
  __int16 v46[8];

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
      sub_1907F2288();

  }
  v17 = -[_IDSAccount init](self, "init");
  if (!v17)
    goto LABEL_23;
  if (!objc_msgSend(v12, "length"))
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D35218]);
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v18;
  }
  if (!objc_msgSend(v12, "length"))
  {
    +[IDSLogging Accounts](IDSLogging, "Accounts");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907F21E8(v21, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_16;
  }
  v19 = *MEMORY[0x1E0D35138];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D35138]);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v46[0] = 0;
      _os_log_impl(&dword_1906E0000, v32, OS_LOG_TYPE_INFO, "No account type specified, setting to Apple ID", (uint8_t *)v46, 2u);
    }

    goto LABEL_20;
  }
  v21 = v20;
  v22 = -[NSObject intValue](v20, "intValue");
  if ((IDSIsValidAccountType() & 1) != 0)
  {
LABEL_20:
    p_uniqueID = (void **)&v17->_uniqueID;
    objc_storeStrong((id *)&v17->_uniqueID, a4);
    objc_storeStrong((id *)&v17->_service, v12);
    if (!v17->_uniqueID)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = *p_uniqueID;
      *p_uniqueID = (void *)v34;

    }
    v36 = (NSDictionary *)objc_msgSend(v10, "mutableCopy");
    -[NSDictionary setObject:forKey:](v36, "setObject:forKey:", v21, v19);
    -[NSDictionary setObject:forKey:](v36, "setObject:forKey:", v17->_service, *MEMORY[0x1E0D35218]);
    accountConfig = v17->_accountConfig;
    v17->_accountConfig = v36;
    v38 = v36;

    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v13);
    v39 = objc_claimAutoreleasedReturnValue();
    delegateContext = v17->_delegateContext;
    v17->_delegateContext = (id)v39;

    v41 = objc_msgSend(MEMORY[0x1E0CB3940], "copyStringGUIDForObject:", v17);
    serviceToken = v17->_serviceToken;
    v17->_serviceToken = (NSString *)v41;

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "listener");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addHandler:", v17);

    -[_IDSAccount _connect](v17, "_connect");
    -[_IDSAccount _loadCachedDevices](v17, "_loadCachedDevices");

LABEL_23:
    v31 = v17;
    goto LABEL_24;
  }
  +[IDSLogging Accounts](IDSLogging, "Accounts");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    sub_1907F2218(v22, v23);

  IMLogBacktrace();
LABEL_16:

  v31 = 0;
LABEL_24:

  return v31;
}

- (_IDSAccount)initWithLoginID:(id)a3 uniqueID:(id)a4 serviceName:(id)a5 delegateContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  _IDSAccount *v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSDictionary *accountConfig;
  uint64_t v22;
  NSString *serviceToken;
  uint64_t v24;
  id delegateContext;
  void *v26;
  void *v27;
  _IDSAccount *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

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
      sub_1907F2314();

  }
  v17 = -[_IDSAccount init](self, "init");
  if (!v17)
    goto LABEL_8;
  if (objc_msgSend(v12, "length"))
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v18, "setObject:forKey:", v10, *MEMORY[0x1E0D35190]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v19, *MEMORY[0x1E0D35138]);

    objc_storeStrong((id *)&v17->_uniqueID, a4);
    objc_storeStrong((id *)&v17->_service, a5);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v18);
    accountConfig = v17->_accountConfig;
    v17->_accountConfig = (NSDictionary *)v20;

    v22 = objc_msgSend(MEMORY[0x1E0CB3940], "copyStringGUIDForObject:", v17);
    serviceToken = v17->_serviceToken;
    v17->_serviceToken = (NSString *)v22;

    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v13);
    v24 = objc_claimAutoreleasedReturnValue();
    delegateContext = v17->_delegateContext;
    v17->_delegateContext = (id)v24;

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "listener");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addHandler:", v17);

    -[_IDSAccount _connect](v17, "_connect");
LABEL_8:
    v28 = v17;
    goto LABEL_12;
  }
  +[IDSLogging Accounts](IDSLogging, "Accounts");
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    sub_1907F21E8(v29, v30, v31, v32, v33, v34, v35, v36);

  v28 = 0;
LABEL_12:

  return v28;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListenerID:", self->_serviceToken);

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeHandler:", self);

  v6.receiver = self;
  v6.super_class = (Class)_IDSAccount;
  -[_IDSAccount dealloc](&v6, sel_dealloc);
}

- (BOOL)_isiCloudPairingService
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
      sub_1907F23A0();

  }
  return -[NSString isEqualToIgnoringCase:](self->_service, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.icloudpairing"));
}

- (BOOL)_isThumperService
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
      sub_1907F242C();

  }
  return -[NSString isEqualToIgnoringCase:](self->_service, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.thumper.keys"));
}

- (BOOL)_isMagnoliaService
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
      sub_1907F24B8();

  }
  return -[NSString isEqualToIgnoringCase:](self->_service, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.ct.commcenter.sim.cloud"));
}

- (BOOL)_isRemoteWidgetService
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
      sub_1907F2544();

  }
  return -[NSString isEqualToIgnoringCase:](self->_service, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.widgets"));
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSMapTable *v12;
  NSMapTable *delegateToInfo;
  id v14;

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
      sub_1907F25D0();

  }
  if (v6)
  {
    if (v7)
    {
      -[NSMapTable objectForKey:](self->_delegateToInfo, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        if (!self->_delegateToInfo)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
          v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          delegateToInfo = self->_delegateToInfo;
          self->_delegateToInfo = v12;

        }
        v14 = objc_alloc_init(MEMORY[0x1E0D34D00]);
        objc_msgSend(v14, "setQueue:", v7);
        -[NSMapTable setObject:forKey:](self->_delegateToInfo, "setObject:forKey:", v14, v6);

      }
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
  -[_IDSAccount _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", a3, 0);
}

- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4
{
  -[_IDSAccount _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", 0, 0, a3, 0, a4);
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6
{
  -[_IDSAccount _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", a3, a4, a5, a6, 0);
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
        sub_1907F265C();

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
          v52[2] = sub_19076F3B4;
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

- (void)addRegistrationDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSMapTable *v12;
  NSMapTable *registrationDelegateToInfo;
  id v14;

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
      sub_1907F26E8();

  }
  if (v6)
  {
    if (v7)
    {
      -[NSMapTable objectForKey:](self->_registrationDelegateToInfo, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        if (!self->_registrationDelegateToInfo)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
          v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          registrationDelegateToInfo = self->_registrationDelegateToInfo;
          self->_registrationDelegateToInfo = v12;

        }
        v14 = objc_alloc_init(MEMORY[0x1E0D34D00]);
        objc_msgSend(v14, "setQueue:", v7);
        -[NSMapTable setObject:forKey:](self->_registrationDelegateToInfo, "setObject:forKey:", v14, v6);

      }
    }
  }

}

- (void)removeRegistrationDelegate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSMapTable *registrationDelegateToInfo;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F2774();

  }
  if (v4)
  {
    -[NSMapTable removeObjectForKey:](self->_registrationDelegateToInfo, "removeObjectForKey:", v4);
    if (!-[NSMapTable count](self->_registrationDelegateToInfo, "count"))
    {
      registrationDelegateToInfo = self->_registrationDelegateToInfo;
      self->_registrationDelegateToInfo = 0;

    }
  }

}

- (void)_callRegistrationDelegatesWithBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSMapTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F2800();

  }
  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_registrationDelegateToInfo;
    v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_registrationDelegateToInfo, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "queue");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = sub_19076F7E8;
            v17[3] = &unk_1E2C60E00;
            v16 = v4;
            v17[4] = v13;
            v18 = v16;
            dispatch_async(v15, v17);

          }
        }
        v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

  }
}

- (id)_objectForKey:(id)a3
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
      sub_1907F288C();

  }
  -[NSDictionary objectForKey:](self->_accountConfig, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *accountConfig;

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
      sub_1907F2918();

  }
  if (v6 && v7)
  {
    v11 = (void *)-[NSDictionary mutableCopy](self->_accountConfig, "mutableCopy");
    objc_msgSend(v11, "setObject:forKey:", v6, v7);
    v12 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v11);
    accountConfig = self->_accountConfig;
    self->_accountConfig = v12;

  }
}

- (BOOL)isInTransientRegistrationState
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
      sub_1907F29A4();

  }
  return self->_isEnabled
      && -[_IDSAccount accountType](self, "accountType") != 2
      && -[_IDSAccount registrationStatus](self, "registrationStatus") - 2 < 3;
}

- (BOOL)isTransientAllowlistedAccount
{
  _BOOL4 v3;

  if (-[_IDSAccount _isiCloudPairingService](self, "_isiCloudPairingService")
    || -[_IDSAccount _isThumperService](self, "_isThumperService")
    || -[_IDSAccount _isMagnoliaService](self, "_isMagnoliaService")
    || (v3 = -[_IDSAccount _isRemoteWidgetService](self, "_isRemoteWidgetService")))
  {
    LOBYTE(v3) = -[_IDSAccount isInTransientRegistrationState](self, "isInTransientRegistrationState");
  }
  return v3;
}

- (BOOL)isFirstGDRAllowlistedAccount
{
  void *v3;
  BOOL v4;

  if (!-[_IDSAccount _isMagnoliaService](self, "_isMagnoliaService"))
    return 0;
  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35188]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)isActive
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
      sub_1907F2A30();

  }
  if (!self->_isEnabled)
    return 0;
  if (-[_IDSAccount accountType](self, "accountType") == 2)
    return 1;
  return -[_IDSAccount registrationStatus](self, "registrationStatus") == 5;
}

- (void)setAccountInfo:(id)a3
{
  NSDictionary *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  NSDictionary *v11;
  __int16 v12;
  _IDSAccount *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (NSDictionary *)a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907F2ABC();

  }
  if (self->_accountConfig != v5)
  {
    objc_storeStrong((id *)&self->_accountConfig, a3);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_INFO, "New account info %@ for %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (NSDictionary)accountInfo
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
      sub_1907F2B48();

  }
  return self->_accountConfig;
}

- (void)updateAccountWithAccountInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateAccount:withAccountInfo:", v5, v4);

}

- (NSDictionary)profileInfo
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
      sub_1907F2BD4();

  }
  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D351A8]);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)regionServerContext
{
  void *v2;
  void *v3;

  -[_IDSAccount profileInfo](self, "profileInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D351B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)canSend
{
  void *v3;
  int v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F2C60();

  }
  if (!-[_IDSAccount isActive](self, "isActive"))
    return 0;
  if (-[_IDSAccount accountType](self, "accountType") == 2)
    return 1;
  -[_IDSAccount handles](self, "handles");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = *MEMORY[0x1E0D35208];
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "URI", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unprefixedURI");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 && !objc_msgSend(v14, "isEqualToIgnoringCase:", v11))
        {

          v6 = 1;
          goto LABEL_20;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_20:

  return v6;
}

- (BOOL)isUsableForOuterMessaging
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[_IDSAccount registrationStatus](self, "registrationStatus") != 5)
    return 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_IDSAccount handles](self, "handles", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = *MEMORY[0x1E0D35208];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[_IDSAccount accountType](self, "accountType") == 2)
        {
          v10 = 0;
        }
        else
        {
          objc_msgSend(v9, "URI");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "unprefixedURI");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v12, "isEqualToIgnoringCase:", v7);

        }
        if (objc_msgSend(v9, "isUserVisible"))
          v13 = v10 == 0;
        else
          v13 = 0;
        if (v13)
        {
          v14 = 1;
          goto LABEL_19;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_19:

  return v14;
}

- (NSArray)aliasStrings
{
  void *v2;
  void *v3;

  -[_IDSAccount aliases](self, "aliases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imArrayByApplyingBlock:", &unk_1E2C5FBF0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)aliases
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F2CEC();

  }
  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35158]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19077035C;
  v9[3] = &unk_1E2C63500;
  v9[4] = self;
  objc_msgSend(v6, "__imArrayByApplyingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)vettedAliases
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[_IDSAccount aliasesToRegister](self, "aliasesToRegister");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19077046C;
  v6[3] = &unk_1E2C63528;
  v6[4] = self;
  objc_msgSend(v3, "__imArrayByFilteringWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)aliasesToRegister
{
  return (NSArray *)-[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35240]);
}

- (BOOL)_isInvisibleAlias:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR("inbox.appleid.apple.com")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35178]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  return v5;
}

- (NSArray)handles
{
  void *v2;
  void *v3;

  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35158]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imArrayByApplyingBlock:", &unk_1E2C5F4D0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSDictionary)pseudonymURIMap
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D351D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v3;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v40;
    v4 = *MEMORY[0x1E0D351D0];
    v34 = *MEMORY[0x1E0D35220];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(obj);
        v31 = v5;
        v6 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v5);
        objc_msgSend(obj, "objectForKeyedSubscript:", v6, v27);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v6);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v36 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              v14 = objc_alloc(MEMORY[0x1E0D34E18]);
              objc_msgSend(v13, "objectForKeyedSubscript:", v4);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (void *)objc_msgSend(v14, "initWithDictionaryRepresentation:", v15);

              objc_msgSend(v16, "allowedServices");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "containsObject:", self->_service);

              if (v18)
              {
                v19 = (void *)MEMORY[0x1E0D34EA8];
                objc_msgSend(v13, "objectForKeyedSubscript:", v34);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "URIWithPrefixedURI:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21)
                  v22 = v16 == 0;
                else
                  v22 = 1;
                if (!v22)
                {
                  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34E10]), "initWithURI:maskedURI:properties:", v21, v33, v16);
                  objc_msgSend(v32, "addObject:", v23);

                }
              }

            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v10);
        }

        if (objc_msgSend(v32, "count"))
        {
          v24 = (void *)objc_msgSend(v32, "copy");
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, v33);

        }
        v5 = v31 + 1;
      }
      while (v31 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v29);
  }

  v25 = (void *)objc_msgSend(v27, "copy");
  return (NSDictionary *)v25;
}

- (NSArray)pseudonyms
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_IDSAccount accountInfo](self, "accountInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D351D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v39;
    v5 = *MEMORY[0x1E0D351D0];
    v33 = *MEMORY[0x1E0D35220];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(obj);
        v30 = v6;
        v7 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v6);
        objc_msgSend(obj, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D34EA8], "URIWithPrefixedURI:", v7);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v35 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              v15 = objc_alloc(MEMORY[0x1E0D34E18]);
              objc_msgSend(v14, "objectForKeyedSubscript:", v5);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (void *)objc_msgSend(v15, "initWithDictionaryRepresentation:", v16);

              objc_msgSend(v17, "allowedServices");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "containsObject:", self->_service);

              if (v19)
              {
                v20 = (void *)MEMORY[0x1E0D34EA8];
                objc_msgSend(v14, "objectForKeyedSubscript:", v33);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "URIWithPrefixedURI:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22)
                  v23 = v17 == 0;
                else
                  v23 = 1;
                if (!v23)
                {
                  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34E10]), "initWithURI:maskedURI:properties:", v22, v32, v17);
                  objc_msgSend(v31, "addObject:", v24);

                }
              }

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v11);
        }

        v6 = v30 + 1;
      }
      while (v30 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v28);
  }

  v25 = (void *)objc_msgSend(v31, "copy");
  return (NSArray *)v25;
}

- (NSString)loginID
{
  return (NSString *)-[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35190]);
}

- (NSString)serviceName
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
      sub_1907F2D78();

  }
  return self->_service;
}

- (NSString)primaryServiceName
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
      sub_1907F2E04();

  }
  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35198]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[_IDSAccount serviceName](self, "serviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (NSString)pushTopic
{
  return (NSString *)-[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D351E0]);
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
      sub_1907F2E90();

  }
  return self->_uniqueID;
}

- (BOOL)_isEnabled
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
      sub_1907F2F1C();

  }
  return self->_isEnabled;
}

- (void)_setIsEnabled:(BOOL)a3
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
      sub_1907F2FA8();

  }
  self->_isEnabled = a3;
}

- (int)accountType
{
  void *v2;
  int v3;

  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35138]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (BOOL)isTemporary
{
  void *v2;
  char v3;

  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35180]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isUserDisabled
{
  void *v2;
  char v3;

  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35230]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setPassword:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passwordChanged:forAccount:", v4, v5);

}

- (void)setAuthToken:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authTokenChanged:forAccount:", v4, v5);

}

- (id)registrationInfo
{
  return -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D351F0]);
}

- (int)registrationStatus
{
  void *v2;
  void *v3;
  int v4;

  -[_IDSAccount registrationInfo](self, "registrationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D351F8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (NSString)profileID
{
  return (NSString *)-[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35168]);
}

- (int)registrationError
{
  void *v2;
  void *v3;
  int v4;

  -[_IDSAccount registrationInfo](self, "registrationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36F60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (NSDictionary)registrationAlertInfo
{
  void *v2;
  void *v3;

  -[_IDSAccount registrationInfo](self, "registrationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36F58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (int64_t)profileValidationStatus
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_IDSAccount profileInfo](self, "profileInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D351C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int)profileValidationErrorReason
{
  void *v2;
  void *v3;
  int v4;

  -[_IDSAccount profileInfo](self, "profileInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D351C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (NSString)userUniqueIdentifier
{
  return (NSString *)-[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35238]);
}

- (NSString)regionID
{
  void *v2;
  void *v3;

  -[_IDSAccount profileInfo](self, "profileInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D351B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setRegionID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  _IDSAccount *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F3034();

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = self;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Account setting regionID {regionID: %@, account: %@}", buf, 0x16u);
    }

    -[_IDSAccount profileInfo](self, "profileInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v13, "setObject:forKey:", v4, *MEMORY[0x1E0D351B0]);
    v14 = (void *)objc_msgSend(v13, "copy", *MEMORY[0x1E0D351A8]);
    v17 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSAccount updateAccountWithAccountInfo:](self, "updateAccountWithAccountInfo:", v15);
  }

}

- (NSString)regionBasePhoneNumber
{
  void *v2;
  void *v3;

  -[_IDSAccount profileInfo](self, "profileInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D351A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setRegionBasePhoneNumber:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  _IDSAccount *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F30C0();

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = self;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Account setting regionBasePhoneNumber {regionBasePhoneNumber: %@, account: %@}", buf, 0x16u);
    }

    -[_IDSAccount profileInfo](self, "profileInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v13, "setObject:forKey:", v4, *MEMORY[0x1E0D351A0]);
    v14 = (void *)objc_msgSend(v13, "copy", *MEMORY[0x1E0D351A8]);
    v17 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSAccount updateAccountWithAccountInfo:](self, "updateAccountWithAccountInfo:", v15);
  }

}

- (NSString)displayName
{
  return (NSString *)-[NSDictionary objectForKey:](self->_accountConfig, "objectForKey:", *MEMORY[0x1E0D35170]);
}

- (void)setDisplayName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F314C();

  }
  if (v4)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v11 = *MEMORY[0x1E0D35170];
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount updateAccountWithAccountInfo:](self, "updateAccountWithAccountInfo:", v10);

}

- (void)_updateDependentDevicesWithDevicesInfo:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSMutableArray *v8;
  NSMutableArray *devices;
  NSMutableArray *v10;
  NSMutableArray *suppressedDevices;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSMutableArray **p_suppressedDevices;
  void *v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  int *v26;
  NSMutableArray **p_devices;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[4];
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F32EC();

  }
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  devices = self->_devices;
  p_devices = &self->_devices;
  self->_devices = v8;

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  suppressedDevices = self->_suppressedDevices;
  self->_suppressedDevices = v10;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    v26 = &v33;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = -[IDSDevice _initWithDictionary:]([IDSDevice alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16));
        objc_msgSend(self->_delegateContext, "object");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_setAccount:", v18);

        objc_msgSend(v17, "_internal");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "isLocallyPaired"))
        {
          v20 = -[_IDSAccount _isiCloudPairingService](self, "_isiCloudPairingService");

          p_suppressedDevices = &self->_suppressedDevices;
          if (v20)
            goto LABEL_20;
        }
        else
        {

        }
        objc_msgSend(v17, "_internal", v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "supportsiCloudPairing") & 1) != 0)
        {

        }
        else
        {
          v23 = -[_IDSAccount _isiCloudPairingService](self, "_isiCloudPairingService");

          p_suppressedDevices = &self->_suppressedDevices;
          if (v23)
            goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          sub_1907F3278(v32, v17, v26, v24);

        p_suppressedDevices = &self->_devices;
LABEL_20:
        -[NSMutableArray addObject:](*p_suppressedDevices, "addObject:", v17, v26);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    sub_1907F31D8((id *)p_devices, v25);

}

- (void)_loadCachedDevices
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3378();

  }
  if (!self->_devicesLoaded)
  {
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "blockUntilConnected");

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "listener");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSAccount uniqueID](self, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dependentDevicesForAccount:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSAccount _updateDependentDevicesWithDevicesInfo:](self, "_updateDependentDevicesWithDevicesInfo:", v10);
    self->_devicesLoaded = 1;

  }
}

- (void)_reloadCachedDevices
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3404();

  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "reloadAccounts");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[_IDSAccount devices](self, "devices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Devices before %@", (uint8_t *)&v10, 0xCu);

  }
  self->_devicesLoaded = 0;
  -[_IDSAccount _loadCachedDevices](self, "_loadCachedDevices");
  objc_msgSend(MEMORY[0x1E0D36AA8], "reloadAccounts");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[_IDSAccount devices](self, "devices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Devices after %@", (uint8_t *)&v10, 0xCu);

  }
}

- (NSArray)suppressedDevices
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
      sub_1907F3490();

  }
  -[_IDSAccount _loadCachedDevices](self, "_loadCachedDevices");
  return (NSArray *)(id)-[NSMutableArray copy](self->_suppressedDevices, "copy");
}

- (NSArray)devices
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
      sub_1907F351C();

  }
  -[_IDSAccount _loadCachedDevices](self, "_loadCachedDevices");
  return (NSArray *)(id)-[NSMutableArray copy](self->_devices, "copy");
}

- (NSArray)nearbyDevices
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F35A8();

  }
  -[_IDSAccount _loadCachedDevices](self, "_loadCachedDevices");
  v6 = (void *)-[NSMutableArray _copyForEnumerating](self->_devices, "_copyForEnumerating");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "_internal", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isNearby");

        if (v15)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (NSArray)connectedDevices
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3634();

  }
  -[_IDSAccount _loadCachedDevices](self, "_loadCachedDevices");
  v6 = (void *)-[NSMutableArray _copyForEnumerating](self->_devices, "_copyForEnumerating");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "_internal", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isConnected");

        if (v15)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (void)_callDevicesChanged
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F36C0();

  }
  v6 = (void *)-[NSMutableArray copy](self->_devices, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907722FC;
  v8[3] = &unk_1E2C63570;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[_IDSAccount _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v8);

}

- (void)_callNearbyDevicesChanged
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  _IDSAccount *v13;
  id v14;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F374C();

  }
  -[_IDSAccount nearbyDevices](self, "nearbyDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = sub_190772458;
  v12 = &unk_1E2C63570;
  v13 = self;
  v14 = v7;
  v8 = v7;
  -[_IDSAccount _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", &v9);
  -[_IDSAccount _callDevicesChanged](self, "_callDevicesChanged", v9, v10, v11, v12, v13);

}

- (void)_callConnectedDevicesChanged
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F37D8();

  }
  -[_IDSAccount connectedDevices](self, "connectedDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1907725AC;
  v9[3] = &unk_1E2C63570;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  -[_IDSAccount _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v9);

}

- (void)_callCloudConnectedDevicesChanged
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3864();

  }
  v6 = (void *)-[NSMutableArray copy](self->_devices, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1907726EC;
  v8[3] = &unk_1E2C63570;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[_IDSAccount _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v8);

}

- (id)_keychainRegistration
{
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F392C();

  }
  v6 = -[_IDSAccount accountType](self, "accountType");
  v7 = v6;
  switch((_DWORD)v6)
  {
    case 0:
      -[_IDSAccount userUniqueIdentifier](self, "userUniqueIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v8 = v10;
      goto LABEL_15;
    case 1:
      -[_IDSAccount loginID](self, "loginID");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_1907F38F0(v8);
      v9 = 0;
      goto LABEL_18;
  }
  v8 = 0;
LABEL_15:
  -[_IDSAccount primaryServiceName](self, "primaryServiceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    -[_IDSAccount serviceName](self, "serviceName");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x1E0D34E48], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _IDSRegistrationServiceTypeForString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registrationWithServiceType:accountType:isTemporary:value:", v14, v7, -[_IDSAccount isTemporary](self, "isTemporary"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v9;
}

- (NSDate)nextRegistrationDate
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F39B8();

  }
  -[_IDSAccount _keychainRegistration](self, "_keychainRegistration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("next-registration-date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return (NSDate *)v8;
}

- (NSDate)lastGDRDate
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
      sub_1907F3A44();

  }
  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D35188]);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)dateRegistered
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3AD0();

  }
  -[_IDSAccount _keychainRegistration](self, "_keychainRegistration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("registration-date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return (NSDate *)v8;
}

- (id)_registeredURIs
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3B5C();

  }
  if (-[_IDSAccount accountType](self, "accountType") == 2
    && (-[_IDSAccount loginID](self, "loginID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = (void *)_IDSCopyIDForPhoneNumberWithOptions(),
        v6,
        v7))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_IDSAccount _keychainRegistration](self, "_keychainRegistration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!v9)
    {
      v10 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v9, "objectForKey:", CFSTR("uris"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;
LABEL_12:

  return v10;
}

- (NSArray)registeredURIs
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3C68();

  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1907F3BE8(self);

  -[_IDSAccount _registeredURIs](self, "_registeredURIs");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)accountRegisteredURIs
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3CF4();

  }
  -[_IDSAccount _objectForKey:](self, "_objectForKey:", *MEMORY[0x1E0D351E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[_IDSAccount registeredURIs](self, "registeredURIs");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "__imArrayByApplyingBlock:", &unk_1E2C5F270);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (NSData)registrationCertificate
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3E00();

  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1907F3D80(self);

  -[_IDSAccount _keychainRegistration](self, "_keychainRegistration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("ids-registration-cert"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return (NSData *)v9;
}

- (NSData)pushToken
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3F0C();

  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1907F3E8C(self);

  -[_IDSAccount _keychainRegistration](self, "_keychainRegistration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("push-token"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return (NSData *)v9;
}

- (NSString)description
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F3F98();

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[_IDSAccount serviceName](self, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount loginID](self, "loginID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount accountType](self, "accountType");
  _StringForIDSAccountType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_IDSAccount canSend](self, "canSend"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[_IDSAccount isActive](self, "isActive"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%p:%@:%@:%@:%@:%@:%@>"), self, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (void)_connect
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSString *serviceToken;
  void *v11;
  NSObject *v12;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F4090();

  }
  -[NSDictionary objectForKey:](self->_accountConfig, "objectForKey:", *MEMORY[0x1E0D35218]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[IDSLogging Accounts](IDSLogging, "Accounts");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907F4024();
    goto LABEL_12;
  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasListenerForID:", self->_serviceToken);

  if ((v8 & 1) == 0)
  {
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    serviceToken = self->_serviceToken;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(serviceToken) = objc_msgSend(v9, "addListenerID:services:", serviceToken, v11);

    if ((serviceToken & 1) == 0)
    {
      +[IDSLogging Accounts](IDSLogging, "Accounts");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1907EDA3C();
LABEL_12:

    }
  }

}

- (void)account:(id)a3 registrationStatusInfoChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  int v21;
  int v22;
  _QWORD v23[5];
  char v24;
  _QWORD v25[4];
  id v26;
  id v27;

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
      sub_1907F417C();

  }
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    v11 = -[_IDSAccount accountType](self, "accountType") != 2
       && -[_IDSAccount registrationStatus](self, "registrationStatus") == 5;
    v12 = -[_IDSAccount canSend](self, "canSend");
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_1907F411C();

    v14 = (void *)-[NSDictionary mutableCopy](self->_accountConfig, "mutableCopy");
    v15 = v14;
    if (v7)
      objc_msgSend(v14, "setObject:forKey:", v7, *MEMORY[0x1E0D351F0]);
    else
      objc_msgSend(v14, "removeObjectForKey:", *MEMORY[0x1E0D351F0]);
    objc_storeStrong((id *)&self->_accountConfig, v15);
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "listener");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateAccount:withAccountInfo:", v6, self->_accountConfig);

    -[_IDSAccount uniqueID](self, "uniqueID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = sub_1907734E4;
    v25[3] = &unk_1E2C635B8;
    v20 = v18;
    v26 = v20;
    v27 = v7;
    -[_IDSAccount _callRegistrationDelegatesWithBlock:](self, "_callRegistrationDelegatesWithBlock:", v25);
    v21 = -[_IDSAccount accountType](self, "accountType") != 2
       && -[_IDSAccount registrationStatus](self, "registrationStatus") == 5;
    v22 = -[_IDSAccount canSend](self, "canSend");
    if (v12 != v22 || v11 != v21)
    {
      v23[0] = v19;
      v23[1] = 3221225472;
      v23[2] = sub_190773530;
      v23[3] = &unk_1E2C635E0;
      v23[4] = self;
      v24 = v22;
      -[_IDSAccount _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v23);
    }

  }
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  int v18;
  _QWORD v19[5];
  char v20;
  _QWORD v21[4];
  id v22;
  id v23;

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
      sub_1907F4268();

  }
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    v11 = -[_IDSAccount canSend](self, "canSend");
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1907F4208();

    v13 = (void *)-[NSDictionary mutableCopy](self->_accountConfig, "mutableCopy");
    v14 = v13;
    if (v7)
      objc_msgSend(v13, "setObject:forKey:", v7, *MEMORY[0x1E0D35158]);
    else
      objc_msgSend(v13, "removeObjectForKey:", *MEMORY[0x1E0D35158]);
    objc_storeStrong((id *)&self->_accountConfig, v14);
    -[_IDSAccount uniqueID](self, "uniqueID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_190773790;
    v21[3] = &unk_1E2C635B8;
    v17 = v15;
    v22 = v17;
    v23 = v7;
    -[_IDSAccount _callRegistrationDelegatesWithBlock:](self, "_callRegistrationDelegatesWithBlock:", v21);
    v18 = -[_IDSAccount canSend](self, "canSend");
    if (v11 != v18)
    {
      v19[0] = v16;
      v19[1] = 3221225472;
      v19[2] = sub_1907737DC;
      v19[3] = &unk_1E2C635E0;
      v19[4] = self;
      v20 = v18;
      -[_IDSAccount _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v19);
    }

  }
}

- (void)account:(id)a3 vettedAliasesChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *v18;
  NSDictionary *v19;
  NSDictionary *accountConfig;
  NSDictionary *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

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
      sub_1907F4358();

  }
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1907F42F4((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);

    v18 = (NSDictionary *)-[NSDictionary mutableCopy](self->_accountConfig, "mutableCopy");
    v19 = v18;
    if (v7)
      -[NSDictionary setObject:forKey:](v18, "setObject:forKey:", v7, *MEMORY[0x1E0D35240]);
    else
      -[NSDictionary removeObjectForKey:](v18, "removeObjectForKey:", *MEMORY[0x1E0D35240]);
    accountConfig = self->_accountConfig;
    self->_accountConfig = v19;
    v21 = v19;

    -[_IDSAccount uniqueID](self, "uniqueID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1907739E4;
    v24[3] = &unk_1E2C635B8;
    v25 = v22;
    v26 = v7;
    v23 = v22;
    -[_IDSAccount _callRegistrationDelegatesWithBlock:](self, "_callRegistrationDelegatesWithBlock:", v24);

  }
}

- (void)account:(id)a3 profileChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSDictionary *accountConfig;
  NSDictionary *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

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
      sub_1907F4444();

  }
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1907F43E4();

    v12 = (NSDictionary *)-[NSDictionary mutableCopy](self->_accountConfig, "mutableCopy");
    v13 = v12;
    if (v7)
      -[NSDictionary setObject:forKey:](v12, "setObject:forKey:", v7, *MEMORY[0x1E0D351A8]);
    else
      -[NSDictionary removeObjectForKey:](v12, "removeObjectForKey:", *MEMORY[0x1E0D351A8]);
    accountConfig = self->_accountConfig;
    self->_accountConfig = v13;
    v15 = v13;

    -[_IDSAccount uniqueID](self, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_190773BD4;
    v18[3] = &unk_1E2C635B8;
    v19 = v16;
    v20 = v7;
    v17 = v16;
    -[_IDSAccount _callRegistrationDelegatesWithBlock:](self, "_callRegistrationDelegatesWithBlock:", v18);

  }
}

- (void)account:(id)a3 loginChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSDictionary *accountConfig;
  NSDictionary *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

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
      sub_1907F4530();

  }
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1907F44D0();

    v12 = (NSDictionary *)-[NSDictionary mutableCopy](self->_accountConfig, "mutableCopy");
    v13 = v12;
    if (v7)
      -[NSDictionary setObject:forKey:](v12, "setObject:forKey:", v7, *MEMORY[0x1E0D35190]);
    else
      -[NSDictionary removeObjectForKey:](v12, "removeObjectForKey:", *MEMORY[0x1E0D35190]);
    accountConfig = self->_accountConfig;
    self->_accountConfig = v13;
    v15 = v13;

    -[_IDSAccount uniqueID](self, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_190773DC4;
    v18[3] = &unk_1E2C635B8;
    v19 = v16;
    v20 = v7;
    v17 = v16;
    -[_IDSAccount _callRegistrationDelegatesWithBlock:](self, "_callRegistrationDelegatesWithBlock:", v18);

  }
}

- (void)account:(id)a3 displayNameChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSDictionary *accountConfig;
  NSDictionary *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

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
      sub_1907F461C();

  }
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1907F45BC();

    v12 = (NSDictionary *)-[NSDictionary mutableCopy](self->_accountConfig, "mutableCopy");
    v13 = v12;
    if (v7)
      -[NSDictionary setObject:forKey:](v12, "setObject:forKey:", v7, *MEMORY[0x1E0D35170]);
    else
      -[NSDictionary removeObjectForKey:](v12, "removeObjectForKey:", *MEMORY[0x1E0D35170]);
    accountConfig = self->_accountConfig;
    self->_accountConfig = v13;
    v15 = v13;

    -[_IDSAccount uniqueID](self, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_190773FB4;
    v18[3] = &unk_1E2C635B8;
    v19 = v16;
    v20 = v7;
    v17 = v16;
    -[_IDSAccount _callRegistrationDelegatesWithBlock:](self, "_callRegistrationDelegatesWithBlock:", v18);

  }
}

- (void)account:(id)a3 pseudonymsChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSDictionary *accountConfig;
  NSDictionary *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      sub_1907F46A8();

  }
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Account %@ received pseudonyms changed: %@", buf, 0x16u);
    }

    v12 = (NSDictionary *)-[NSDictionary mutableCopy](self->_accountConfig, "mutableCopy");
    v13 = v12;
    if (v7)
      -[NSDictionary setObject:forKey:](v12, "setObject:forKey:", v7, *MEMORY[0x1E0D351D8]);
    else
      -[NSDictionary removeObjectForKey:](v12, "removeObjectForKey:", *MEMORY[0x1E0D351D8]);
    accountConfig = self->_accountConfig;
    self->_accountConfig = v13;
    v15 = v13;

    -[_IDSAccount uniqueID](self, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1907741FC;
    v18[3] = &unk_1E2C635B8;
    v19 = v16;
    v20 = v7;
    v17 = v16;
    -[_IDSAccount _callRegistrationDelegatesWithBlock:](self, "_callRegistrationDelegatesWithBlock:", v18);

  }
}

- (void)account:(id)a3 dependentDevicesUpdated:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;

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
      sub_1907F4794();

  }
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1907F4734();

    self->_devicesLoaded = 1;
    -[_IDSAccount _updateDependentDevicesWithDevicesInfo:](self, "_updateDependentDevicesWithDevicesInfo:", v7);
    -[_IDSAccount _callDevicesChanged](self, "_callDevicesChanged");
  }

}

- (void)account:(id)a3 dependentDevicesUpdatedUponReconnect:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
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
      sub_1907F4820();

  }
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "accountEnabled");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Account received %@ dependentDevicesUpdatedUponReconnect (devices count: %@)", (uint8_t *)&v13, 0x16u);

    }
    self->_devicesLoaded = 1;
    -[_IDSAccount _updateDependentDevicesWithDevicesInfo:](self, "_updateDependentDevicesWithDevicesInfo:", v7);
    -[_IDSAccount _callDevicesChanged](self, "_callDevicesChanged");
  }

}

- (void)account:(id)a3 localDeviceAdded:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
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
      sub_1907F48AC();

  }
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Account received %@ localDeviceAdded %@", (uint8_t *)&v18, 0x16u);
    }

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "listener");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSAccount uniqueID](self, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dependentDevicesForAccount:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSAccount _updateDependentDevicesWithDevicesInfo:](self, "_updateDependentDevicesWithDevicesInfo:", v15);
    -[_IDSAccount _callNearbyDevicesChanged](self, "_callNearbyDevicesChanged");
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableArray __imArrayByApplyingBlock:](self->_devices, "__imArrayByApplyingBlock:", &unk_1E2C5F370);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v17;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Devices updated %@", (uint8_t *)&v18, 0xCu);

    }
  }

}

- (void)account:(id)a3 localDeviceRemoved:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", self->_uniqueID))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Account received %@ localDeviceRemoved %@", (uint8_t *)&v15, 0x16u);
    }

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "listener");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSAccount uniqueID](self, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dependentDevicesForAccount:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSAccount _updateDependentDevicesWithDevicesInfo:](self, "_updateDependentDevicesWithDevicesInfo:", v12);
    -[_IDSAccount _callNearbyDevicesChanged](self, "_callNearbyDevicesChanged");
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableArray __imArrayByApplyingBlock:](self->_devices, "__imArrayByApplyingBlock:", &unk_1E2C60250);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v14;
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Devices updated %@", (uint8_t *)&v15, 0xCu);

    }
  }

}

- (void)refreshRegistrationForAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F499C();

  }
  if (objc_msgSend(v4, "isEqualToString:", self->_uniqueID))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1907F4938((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    -[_IDSAccount uniqueID](self, "uniqueID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_190774A00;
    v17[3] = &unk_1E2C63608;
    v18 = v15;
    v16 = v15;
    -[_IDSAccount _callRegistrationDelegatesWithBlock:](self, "_callRegistrationDelegatesWithBlock:", v17);

  }
}

- (void)authenticateAccount
{
  void *v3;
  id v4;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticateAccount:", v3);

}

- (void)passwordUpdated
{
  void *v3;
  id v4;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passwordUpdatedForAccount:", v3);

}

- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateAuthorizationCredentials:token:forAccount:", v7, v6, v8);

}

- (void)validateProfile
{
  void *v3;
  id v4;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "validateProfileForAccount:", v3);

}

- (void)addAliases:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAliases:toAccount:", v4, v5);

}

- (void)removeAliases:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAliases:fromAccount:", v4, v5);

}

- (void)validateAliases:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "validateAliases:forAccount:", v4, v5);

}

- (void)unvalidateAliases:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unvalidateAliases:forAccount:", v4, v5);

}

- (void)registerAccount
{
  void *v3;
  id v4;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerAccount:", v3);

}

- (void)unregisterAccount
{
  void *v3;
  id v4;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterAccount:", v3);

}

- (void)forceRemoveAccount
{
  NSObject *v3;
  void *v4;
  id v5;

  if (-[_IDSAccount isTemporary](self, "isTemporary") && !-[_IDSAccount accountType](self, "accountType"))
  {
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_IDSAccount uniqueID](self, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forceRemoveAccount:", v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1907F4A28((uint64_t)self, v3);

  }
}

- (void)_reregisterAndReidentify:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_reregisterAndReidentify:account:", v5, v6);

}

- (void)deactivateAndPurgeIdentify
{
  void *v3;
  id v4;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_IDSAccount uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateAndPurgeIdentifyForAccount:", v3);

}

- (void)setLoginID:(id)a3
{
  objc_storeStrong((id *)&self->_loginID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginID, 0);
  objc_storeStrong((id *)&self->_registrationDelegateToInfo, 0);
  objc_storeStrong((id *)&self->_delegateToInfo, 0);
  objc_storeStrong(&self->_delegateContext, 0);
  objc_storeStrong((id *)&self->_suppressedDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_accountConfig, 0);
}

@end
