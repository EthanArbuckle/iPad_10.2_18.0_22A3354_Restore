@implementation _IDSService

- (NSArray)devices
{
  void *v3;
  int v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  __CFDictionary *v29;
  const void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F714C();

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[_IDSService accounts](self, "accounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v44)
  {
    v43 = *(_QWORD *)v62;
    v46 = v7;
    v47 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v62 != v43)
          objc_enumerationMutation(obj);
        v45 = v8;
        v9 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v8);
        objc_msgSend(v9, "_internal");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastGDRDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v9, "_internal");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "devices");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = v13;
        v51 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
        if (v51)
        {
          v50 = *(_QWORD *)v58;
          v48 = v11;
          do
          {
            for (i = 0; i != v51; ++i)
            {
              if (*(_QWORD *)v58 != v50)
                objc_enumerationMutation(v49);
              v15 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
              objc_msgSend(v15, "_internal");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "uniqueIDOverride");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!objc_msgSend(v17, "length"))
              {
                objc_msgSend(v15, "_internal");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "uniqueID");
                v19 = objc_claimAutoreleasedReturnValue();

                v17 = (void *)v19;
              }
              if (objc_msgSend(v17, "length"))
              {
                objc_msgSend(v6, "objectForKey:", v17);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "objectForKey:", v17);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v20 = 0;
                v21 = 0;
              }
              if (objc_msgSend(v17, "length"))
              {
                v22 = 0;
              }
              else
              {
                objc_msgSend(v15, "_internal");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "pushToken");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v22, "length"))
                {
                  objc_msgSend(v6, "objectForKey:", v22);
                  v24 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v7, "objectForKey:", v22);
                  v25 = objc_claimAutoreleasedReturnValue();
                  v26 = v21;
                  v21 = (void *)v25;

                  v20 = (void *)v24;
                }
              }
              if (!v20)
                goto LABEL_27;
              v52 = v21;
              objc_msgSend(v11, "laterDate:", v21);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "isEqualToDate:", v11);

              if (v28)
              {

                v21 = v52;
LABEL_27:
                if (objc_msgSend(v17, "length"))
                {
                  if (v15)
                    CFDictionarySetValue((CFMutableDictionaryRef)v6, v17, v15);
                  if (v11)
                  {
                    v29 = (__CFDictionary *)v7;
                    v30 = v17;
                    goto LABEL_45;
                  }
                }
                else if (objc_msgSend(v22, "length"))
                {
                  if (v15)
                    CFDictionarySetValue((CFMutableDictionaryRef)v6, v22, v15);
                  if (v11)
                  {
                    v29 = (__CFDictionary *)v7;
                    v30 = v22;
LABEL_45:
                    CFDictionarySetValue(v29, v30, v11);
                  }
                }
                v20 = 0;
                goto LABEL_47;
              }
              v55 = 0u;
              v56 = 0u;
              v53 = 0u;
              v54 = 0u;
              objc_msgSend(v15, "_internal");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "identities");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v54;
                do
                {
                  for (j = 0; j != v34; ++j)
                  {
                    if (*(_QWORD *)v54 != v35)
                      objc_enumerationMutation(v32);
                    v37 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
                    objc_msgSend(v20, "_internal");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "_addIdentity:", v37);

                  }
                  v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
                }
                while (v34);
              }

              v7 = v46;
              v6 = v47;
              v11 = v48;
              v21 = v52;
LABEL_47:

            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
          }
          while (v51);
        }

        v8 = v45 + 1;
      }
      while (v45 + 1 != v44);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v44);
  }

  objc_msgSend(v6, "allValues");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");

  return (NSArray *)v40;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocksByRequestID, 0);
  objc_storeStrong((id *)&self->_pseudonymUpdateTaskQueue, 0);
  objc_storeStrong((id *)&self->_cachedPseudonymURIMap, 0);
  objc_storeStrong(&self->_pendingRegisteredIdentitiesBlock, 0);
  objc_storeStrong((id *)&self->_serviceProperties, 0);
  objc_storeStrong((id *)&self->_acknowledgementTracker, 0);
  objc_storeStrong((id *)&self->_uniqueIDToProgress, 0);
  objc_storeStrong((id *)&self->_groupContextController, 0);
  objc_storeStrong((id *)&self->_subServices, 0);
  objc_storeStrong((id *)&self->_linkedDevices, 0);
  objc_storeStrong((id *)&self->_lastIsActiveSet, 0);
  objc_storeStrong((id *)&self->_protobufSelectors, 0);
  objc_storeStrong(&self->_delegateContext, 0);
  objc_storeStrong((id *)&self->_delegateToInfo, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_uniqueIDToConnection, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
}

- (NSSet)accounts
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
      sub_1907F7034();

  }
  -[IDSAccountController _internal](self->_accountController, "_internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IDSService _filteredAccountsFrom:](self, "_filteredAccountsFrom:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v8;
}

- (id)_filteredAccountsFrom:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  int v27;
  const __CFString *v28;
  __int128 v30;
  id v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assertQueueIsCurrent");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907F6FA8();

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v35;
    v13 = 0x1E2C5D000uLL;
    *(_QWORD *)&v10 = 138413058;
    v30 = v10;
    v31 = v8;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v15, "_internal", v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isTransientAllowlistedAccount");

        if (v17
          || (objc_msgSend(v15, "_internal"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "canSend"),
              v18,
              v19))
        {
          objc_msgSend(v7, "addObject:", v15);
        }
        else
        {
          objc_msgSend(*(id *)(v13 + 3512), "_IDSService");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v15, "_internal");
            v21 = objc_claimAutoreleasedReturnValue();
            v32 = (void *)v21;
            objc_msgSend(v15, "_internal");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "aliases");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_internal");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v7;
            if (objc_msgSend(v23, "isActive"))
              v25 = CFSTR("YES");
            else
              v25 = CFSTR("NO");
            objc_msgSend(v15, "_internal");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "canSend");
            *(_DWORD *)buf = v30;
            v28 = CFSTR("NO");
            if (v27)
              v28 = CFSTR("YES");
            v39 = v21;
            v40 = 2112;
            v41 = v22;
            v42 = 2112;
            v43 = v25;
            v7 = v24;
            v44 = 2112;
            v45 = v28;
            _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_INFO, "Filtering account %@ with aliases %@  isActive? %@  canSend? %@", buf, 0x2Au);

            v8 = v31;
            v13 = 0x1E2C5D000;

          }
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v11);
  }

  return v7;
}

- (_IDSService)initWithService:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5 delegateContext:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _IDSService *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  const __CFString *v19;
  IDSServiceProperties *v20;
  IDSServiceProperties *serviceProperties;
  void *v22;
  void *v23;
  id delegateContext;
  NSSet *v25;
  NSSet *commands;
  IDSAccountController *v27;
  IDSAccountController *accountController;
  void *v29;
  void *v30;
  void *v31;
  NSMutableSet *lastIsActiveSet;
  IDSGroupContextController *v33;
  uint64_t v34;
  void *v35;
  IDSGroupContextController *v36;
  IDSGroupContextController *groupContextController;
  IDSQuickSwitchAcknowledgementTracker *v38;
  IDSQuickSwitchAcknowledgementTracker *acknowledgementTracker;
  void *v40;
  void *v41;
  NSObject *v42;
  char v44;
  objc_super v45;
  os_activity_scope_state_s state;
  NSObject *v47;
  uint8_t buf[4];
  _IDSService *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v7 = a5;
  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!_IDSRunningInDaemon())
  {
    state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    v47 = _os_activity_create(&dword_1906E0000, "Framework init with service, commands", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    os_activity_scope_enter(v47, &state);
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "assertQueueIsCurrent");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        objc_claimAutoreleasedReturnValue();
        sub_1907F5334();
      }

    }
    v45.receiver = self;
    v45.super_class = (Class)_IDSService;
    self = -[_IDSService init](&v45, sel_init);
    if (!self)
      goto LABEL_22;
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = CFSTR("NO");
      *(_DWORD *)buf = 134218754;
      v49 = self;
      if (v7)
        v19 = CFSTR("YES");
      v50 = 2112;
      v51 = v10;
      v52 = 2112;
      v53 = v11;
      v54 = 2112;
      v55 = v19;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "_IDSService - initing {self: %p, service: %@, commands: %@, manualAck: %@}", buf, 0x2Au);
    }

    v20 = (IDSServiceProperties *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34E80]), "initWithServiceIdentifier:", v10);
    serviceProperties = self->_serviceProperties;
    self->_serviceProperties = v20;

    if (!self->_serviceProperties)
    {
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        sub_1907F52D0();

      v14 = 0;
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isInternalInstall") && (_os_feature_enabled_impl() & 1) == 0)
    {
      v44 = objc_msgSend(v10, "containsString:", CFSTR("com.apple.private.alloy.accessibility.local"));

      if ((v44 & 1) == 0)
      {
        getpid();
        self->_clientIsSandboxed = sandbox_check() != 0;
        -[_IDSService _enforceSandboxPolicy](self, "_enforceSandboxPolicy");
        goto LABEL_19;
      }
    }
    else
    {

    }
    self->_clientIsSandboxed = 1;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    delegateContext = self->_delegateContext;
    self->_delegateContext = v23;

    v25 = (NSSet *)objc_msgSend(v11, "copy");
    commands = self->_commands;
    self->_commands = v25;

    v27 = -[IDSAccountController _initWithService:]([IDSAccountController alloc], "_initWithService:", v10);
    accountController = self->_accountController;
    self->_accountController = v27;

    -[IDSAccountController _internal](self->_accountController, "_internal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "queue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addDelegate:queue:", self, v31);

    lastIsActiveSet = self->_lastIsActiveSet;
    self->_lastIsActiveSet = 0;

    v33 = [IDSGroupContextController alloc];
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v34, "queue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[IDSGroupContextController initWithServiceName:queue:delegate:](v33, "initWithServiceName:queue:delegate:", v10, v35, self);
    groupContextController = self->_groupContextController;
    self->_groupContextController = v36;

    v38 = objc_alloc_init(IDSQuickSwitchAcknowledgementTracker);
    acknowledgementTracker = self->_acknowledgementTracker;
    self->_acknowledgementTracker = v38;

    self->_manuallyAckMessages = v7;
    objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v34) = objc_msgSend(v40, "isNonUIInstall");

    if ((v34 & 1) == 0)
      -[_IDSService _processAccountSet:](self, "_processAccountSet:", 0);
    -[_IDSService daemonListener](self, "daemonListener");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addHandler:", self);

LABEL_22:
    v14 = self;
LABEL_26:
    os_activity_scope_leave(&state);
    cut_arc_os_release();

    goto LABEL_27;
  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_1907F5248((uint64_t)self, v13);

  v14 = 0;
LABEL_27:

  return v14;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  os_activity_scope_state_s state;
  NSObject *v8;
  uint8_t buf[4];
  _IDSService *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v8 = _os_activity_create(&dword_1906E0000, "Framework init with service commands", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSServiceProperties serviceName](self->_serviceProperties, "serviceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "_IDSService - deallocing {self: %p, serviceName: %@}", buf, 0x16u);

  }
  -[_IDSService daemonListener](self, "daemonListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeHandler:", self);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

  v6.receiver = self;
  v6.super_class = (Class)_IDSService;
  -[_IDSService dealloc](&v6, sel_dealloc);
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

- (void)_processAccountSet:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  NSMutableDictionary *uniqueIDToConnection;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  NSObject *v42;
  void *context;
  id v44;
  void *v45;
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNonUIInstall");

  if ((v6 & 1) == 0)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "assertQueueIsCurrent");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1907F5948();

    }
    context = (void *)MEMORY[0x19400FC60]();
    if (!v4 || (v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v4)) == 0)
    {
      -[IDSAccountController _internal](self->_accountController, "_internal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accounts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = objc_alloc(MEMORY[0x1E0C99E60]);
        -[IDSAccountController _internal](self->_accountController, "_internal");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "accounts");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v13, "initWithSet:", v15);

      }
      else
      {
        v10 = 0;
      }

    }
    v44 = v4;
    v16 = (void *)MEMORY[0x1E0C99E60];
    -[NSMutableDictionary allKeys](self->_uniqueIDToConnection, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v20 = v10;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v56 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v25, "_internal");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "uniqueID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v19, "addObject:", v27);
            objc_msgSend(v18, "setObject:forKey:", v25, v27);
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v22);
    }

    v28 = (void *)objc_msgSend(v45, "mutableCopy");
    objc_msgSend(v28, "minusSet:", v19);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v52 != v32)
            objc_enumerationMutation(v29);
          -[_IDSService _tearDownConnectionForUniqueID:](self, "_tearDownConnectionForUniqueID:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v31);
    }

    if (!-[NSMutableDictionary count](self->_uniqueIDToConnection, "count"))
    {
      uniqueIDToConnection = self->_uniqueIDToConnection;
      self->_uniqueIDToConnection = 0;

    }
    v35 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v35, "minusSet:", v45);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v36 = v35;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v48;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v48 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(v18, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[_IDSService _setupNewConnectionForAccount:](self, "_setupNewConnectionForAccount:", v41);

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      }
      while (v38);
    }

    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v42, OS_LOG_TYPE_DEFAULT, "Finished processing accounts set.", buf, 2u);
    }

    -[_IDSService _logConnectionMap](self, "_logConnectionMap");
    objc_autoreleasePoolPop(context);
    v4 = v44;
  }

}

- (void)_logConnectionMap
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F57A4();

  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Connection map:", v7, 2u);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_uniqueIDToConnection, "enumerateKeysAndObjectsUsingBlock:", &unk_1E2C5FF90);
}

- (void)_enforceSandboxPolicy
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Enforcing sandbox policy...", (uint8_t *)&v14, 2u);
  }

  getpid();
  CUTProcessNameForPid();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_clientIsSandboxed)
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSServiceProperties serviceName](self->_serviceProperties, "serviceName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "%@ (initializing service %@) is sandboxed", (uint8_t *)&v14, 0x16u);

    }
  }
  else
  {
    v8 = qword_1ECDD65F8;
    v9 = v4;
    if (v8 != -1)
      dispatch_once(&qword_1ECDD65F8, &unk_1E2C64188);
    v10 = objc_msgSend((id)qword_1ECDD6600, "containsObject:", v9);

    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[IDSServiceProperties serviceName](self->_serviceProperties, "serviceName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v9;
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "%@ (initializing service %@) is not sandboxed but is in the sandbox allowlist.  Not enforcing sandbox policy.", (uint8_t *)&v14, 0x16u);

      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1907F89F4((uint64_t)v9, (uint64_t)self);

      if (!isRunningTests())
        abort();
      throwsIDSAbortException();
    }
  }

}

- (void)setWantsPseudonymUpdates:(BOOL)a3
{
  NSDictionary *v4;
  NSDictionary *cachedPseudonymURIMap;
  id v6;
  void *v7;
  CUTDeferredTaskQueue *v8;
  CUTDeferredTaskQueue *pseudonymUpdateTaskQueue;
  NSDictionary *v10;
  CUTDeferredTaskQueue *v11;
  void *v12;

  if (self->_wantsPseudonymUpdates != a3)
  {
    self->_wantsPseudonymUpdates = a3;
    if (a3)
    {
      -[_IDSService pseudonymURIMap](self, "pseudonymURIMap");
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      cachedPseudonymURIMap = self->_cachedPseudonymURIMap;
      self->_cachedPseudonymURIMap = v4;

      v6 = objc_alloc(MEMORY[0x1E0D13200]);
      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "queue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (CUTDeferredTaskQueue *)objc_msgSend(v6, "initWithCapacity:queue:block:", 1, v7, &unk_1E2C63F68);
      pseudonymUpdateTaskQueue = self->_pseudonymUpdateTaskQueue;
      self->_pseudonymUpdateTaskQueue = v8;

    }
    else
    {
      v10 = self->_cachedPseudonymURIMap;
      self->_cachedPseudonymURIMap = 0;

      v11 = self->_pseudonymUpdateTaskQueue;
      self->_pseudonymUpdateTaskQueue = 0;

    }
  }
}

- (id)linkedDevicesWithRelationship:(int64_t)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F7408();

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((a3 & 1) != 0)
  {
    -[_IDSService devices](self, "devices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
  -[_IDSService accounts](self, "accounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[_IDSService _loadCachedLinkedDevices](self, "_loadCachedLinkedDevices");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = self->_linkedDevices;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "relationship", (_QWORD)v20);
          if (a3 != 1 && (v18 & a3) != 0 && objc_msgSend(v17, "relationship") != 1)
            objc_msgSend(v8, "addObject:", v17);
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

  }
  return v8;
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
  uint64_t v15;
  void *v16;
  _QWORD v17[5];

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
      sub_1907F5380();

  }
  if (v6 && v7)
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
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1906E190C;
    v17[3] = &unk_1E2C60550;
    v17[4] = self;
    v15 = MEMORY[0x19400FE1C](v17);
    v16 = (void *)v15;
    if (v15)
      (*(void (**)(uint64_t))(v15 + 16))(v15);

  }
}

- (id)daemonController
{
  return +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
}

- (id)_initWithDelegateContext:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[_IDSService _init](self, "_init");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[5];
    v5[5] = v6;

  }
  return v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_IDSService;
  return -[_IDSService init](&v3, sel_init);
}

+ (_IDSService)serviceWithIdentifier:(id)a3 commands:(id)a4 manuallyAckMessages:(BOOL)a5 delegateContext:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _IDSService *v20;
  void *v21;
  NSObject *v22;
  _IDSService *result;
  int v24;
  _IDSService *v25;
  uint64_t v26;

  v9 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    if (_IDSRunningInDaemon())
    {
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1907F5138((uint64_t)a1, v16);

      (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
    }
    else
    {
      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "assertQueueIsCurrent");

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          sub_1907F51BC();

      }
      v20 = -[_IDSService initWithService:commands:manuallyAckMessages:delegateContext:]([_IDSService alloc], "initWithService:commands:manuallyAckMessages:delegateContext:", v12, v13, v9, v14);
      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "blockUntilConnected");

      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 134217984;
        v25 = v20;
        _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "_IDSService - serviceWithIdentifier finished {serviceObject: %p}", (uint8_t *)&v24, 0xCu);
      }

      (*((void (**)(id, _IDSService *, _QWORD))v15 + 2))(v15, v20, 0);
    }
  }

  return result;
}

- (void)removeDelegate:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *delegateToInfo;
  NSObject *v7;
  void *v8;
  int v9;
  _IDSService *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[IDSQuickSwitchAcknowledgementTracker identifierForServiceDelegate:](self->_acknowledgementTracker, "identifierForServiceDelegate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[_IDSService _stopAwaitingQuickSwitchAcknowledgementFromDelegateWithIdentifier:](self, "_stopAwaitingQuickSwitchAcknowledgementFromDelegateWithIdentifier:", v5);
    -[NSMapTable removeObjectForKey:](self->_delegateToInfo, "removeObjectForKey:", v4);
    if (!-[NSMapTable count](self->_delegateToInfo, "count"))
    {
      delegateToInfo = self->_delegateToInfo;
      self->_delegateToInfo = 0;

    }
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSServiceProperties serviceName](self->_serviceProperties, "serviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 134218498;
      v10 = self;
      v11 = 2112;
      v12 = v8;
      v13 = 2048;
      v14 = v4;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "_IDSService - removed delegate {self: %p, serviceName %@, delegate: %p}", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)_callDelegatesWithBlock:(id)a3
{
  -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", a3, 0);
}

- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4
{
  -[_IDSService _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", 0, 0, a3, 0, a4);
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6
{
  -[_IDSService _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", a3, a4, a5, a6, 0);
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
        sub_1907F540C();

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
          v52[2] = sub_19077EA40;
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

- (void)daemonConnected
{
  void *v3;
  int v4;
  NSObject *v5;
  _QWORD v6[5];
  os_activity_scope_state_s state;
  NSObject *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v8 = _os_activity_create(&dword_1906E0000, "Framework Daemon Connected", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      objc_claimAutoreleasedReturnValue();
      sub_1907F5498();
    }

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19077EC68;
  v6[3] = &unk_1E2C639A8;
  v6[4] = self;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v6);
  if (self->_subServices)
    -[_IDSService resendSubServicesToDaemonForCurrentDevice](self, "resendSubServicesToDaemonForCurrentDevice");
  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)daemonDisconnected
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD);
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
  v3 = self->_completionBlocksByRequestID;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_completionBlocksByRequestID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "second");
        v9 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

        if (v9)
          v9[2](v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_completionBlocksByRequestID, "removeAllObjects");
}

- (void)OTRTestCallback:(id)a3 time:(double)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  double v19;
  uint8_t buf[4];
  _IDSService *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  double v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907F54E4();

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    v24 = 2048;
    v25 = a4;
    v26 = 1024;
    v27 = v9 == 0;
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "%@: OTRTestCallback: token is %@, setupTime is %.6f, error==nil is %d", buf, 0x26u);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_19077EFBC;
  v16[3] = &unk_1E2C639D0;
  v16[4] = self;
  v17 = v8;
  v19 = a4;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v16);

}

- (void)connection:(id)a3 didCancelMessageWithSuccess:(BOOL)a4 error:(id)a5 identifier:(id)a6
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
  _IDSService *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v7 = a4;
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
      sub_1907F5570();

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
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
  v18[2] = sub_19077F1EC;
  v18[3] = &unk_1E2C639F8;
  v21 = v7;
  v18[4] = self;
  v19 = v9;
  v20 = v10;
  v16 = v10;
  v17 = v9;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v18);

}

- (void)didSwitchActivePairedDevice:(id)a3 forService:(id)a4 wasHandled:(BOOL *)a5
{
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void *v51;
  id v52;
  _QWORD block[4];
  id v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  id v56;
  _QWORD *v57;
  _QWORD *v58;
  _BYTE *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD *v63;
  _QWORD v64[4];
  id v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  id v67;
  id v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[3];
  char v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD *v78;
  _QWORD v79[4];
  id v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  id v82;
  id v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[3];
  char v89;
  _QWORD v90[5];
  id v91;
  id v92;
  id v93;
  _QWORD *v94;
  _QWORD v95[4];
  id v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  _IDSService *v98;
  id v99;
  _QWORD *v100;
  _QWORD *v101;
  _QWORD v102[5];
  id v103;
  _QWORD v104[3];
  char v105;
  _QWORD v106[4];
  id v107;
  id v108;
  _IDSService *v109;
  id v110;
  _BYTE *v111;
  _QWORD *v112;
  _QWORD v113[3];
  char v114;
  _BYTE buf[24];
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v50 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v52 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907F55FC();

  }
  -[IDSAccountController _internal](self->_accountController, "_internal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D36AA8], "ACKTracker");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v51;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v52;
    *(_WORD *)&buf[22] = 2112;
    v116 = v50;
    _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "%@ Switched active paired device for service name %@. deviceUniqueID: %@", buf, 0x20u);
  }

  if ((objc_msgSend(v51, "isEqualToIgnoringCase:", v52) & 1) != 0)
  {
    if (a5)
      *a5 = 1;
    -[IDSQuickSwitchAcknowledgementTracker stopAwaitingAcknowledgementFromAllServiceDelegates](self->_acknowledgementTracker, "stopAwaitingAcknowledgementFromAllServiceDelegates");
    objc_msgSend(self->_delegateContext, "object");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = 0;
    v113[1] = v113;
    v113[2] = 0x2020000000;
    v114 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v116 = sub_1906EE2C4;
    v117 = sub_1906EE134;
    v118 = (id)0xAAAAAAAAAAAAAAAALL;
    v118 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v106[0] = MEMORY[0x1E0C809B0];
    v106[1] = 3221225472;
    v106[2] = sub_19077FB58;
    v106[3] = &unk_1E2C63A20;
    v111 = buf;
    v112 = v113;
    v14 = v51;
    v107 = v14;
    v15 = v13;
    v108 = v15;
    v109 = self;
    v110 = v52;
    v16 = (void *)MEMORY[0x19400FE1C](v106);
    v17 = dispatch_group_create();
    dispatch_group_enter(v17);
    v104[0] = 0;
    v104[1] = v104;
    v104[2] = 0x2020000000;
    v105 = 0;
    v102[0] = 0;
    v102[1] = v102;
    v102[2] = 0x3032000000;
    v102[3] = sub_1906EE2C4;
    v102[4] = sub_1906EE134;
    v103 = 0;
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = sub_19077FD64;
    v95[3] = &unk_1E2C63A48;
    v18 = v14;
    v96 = v18;
    v19 = v16;
    v99 = v19;
    v20 = v50;
    v100 = v104;
    v101 = v102;
    v21 = MEMORY[0x1E0C809B0];
    v97 = v20;
    v98 = self;
    v45 = (void *)MEMORY[0x19400FE1C](v95);
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", self);
    v90[0] = v21;
    v90[1] = 3221225472;
    v90[2] = sub_19077FF04;
    v90[3] = &unk_1E2C63A70;
    v90[4] = self;
    v44 = (id)objc_claimAutoreleasedReturnValue();
    v91 = v44;
    v22 = v18;
    v92 = v22;
    v94 = v102;
    v23 = v15;
    v93 = v23;
    v46 = (void *)MEMORY[0x19400FE1C](v90);
    v49 = v17;
    -[_IDSService _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", sel_service_didSwitchActivePairedDevice_acknowledgementBlock_, v45, v46, 0, v17);
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x2020000000;
    v89 = 0;
    v86[0] = 0;
    v86[1] = v86;
    v86[2] = 0x3032000000;
    v86[3] = sub_1906EE2C4;
    v86[4] = sub_1906EE134;
    v87 = 0;
    v24 = MEMORY[0x1E0C809B0];
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = sub_190780054;
    v79[3] = &unk_1E2C63A48;
    v25 = v22;
    v80 = v25;
    v26 = v19;
    v83 = v26;
    v27 = v20;
    v81 = v27;
    v84 = v88;
    v85 = v86;
    v28 = v23;
    v82 = v28;
    v47 = (void *)MEMORY[0x19400FE1C](v79);
    v75[0] = v24;
    v75[1] = 3221225472;
    v75[2] = sub_190780150;
    v75[3] = &unk_1E2C63A98;
    v29 = v25;
    v76 = v29;
    v78 = v86;
    v30 = v28;
    v77 = v30;
    v48 = (void *)MEMORY[0x19400FE1C](v75);
    -[_IDSService _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", sel_service_devicesChanged_, v47, v48, 0, v17);
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x2020000000;
    v74 = 0;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = sub_1906EE2C4;
    v71[4] = sub_1906EE134;
    v72 = 0;
    v31 = MEMORY[0x1E0C809B0];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = sub_190780248;
    v64[3] = &unk_1E2C63A48;
    v32 = v29;
    v65 = v32;
    v33 = v26;
    v68 = v33;
    v34 = v27;
    v66 = v34;
    v69 = v73;
    v70 = v71;
    v35 = v30;
    v67 = v35;
    v36 = (void *)MEMORY[0x19400FE1C](v64);
    v60[0] = v31;
    v60[1] = 3221225472;
    v60[2] = sub_190780348;
    v60[3] = &unk_1E2C63A98;
    v37 = v32;
    v61 = v37;
    v63 = v71;
    v38 = v35;
    v62 = v38;
    v39 = (void *)MEMORY[0x19400FE1C](v60);
    -[_IDSService _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", sel_service_linkedDevicesChanged_, v36, v39, 0, v49);
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "queue");
    v41 = objc_claimAutoreleasedReturnValue();
    block[0] = v31;
    block[1] = 3221225472;
    block[2] = sub_190780440;
    block[3] = &unk_1E2C63AC0;
    v54 = v37;
    v56 = v33;
    v55 = v34;
    v57 = v102;
    v58 = v86;
    v59 = buf;
    v42 = v33;
    dispatch_group_notify(v49, v41, block);

    dispatch_group_leave(v49);
    _Block_object_dispose(v71, 8);

    _Block_object_dispose(v73, 8);
    _Block_object_dispose(v86, 8);

    _Block_object_dispose(v88, 8);
    _Block_object_dispose(v102, 8);

    _Block_object_dispose(v104, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v113, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "ACKTracker");
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v52;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v51;
      _os_log_impl(&dword_1906E0000, v43, OS_LOG_TYPE_DEFAULT, "Ignoring didSwitch callback for %@, mine is %@", buf, 0x16u);
    }

    if (a5)
      *a5 = 0;
  }

}

- (id)_activeDeviceForUniqueID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
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
      sub_1907F568C();

  }
  if (v4)
  {
    -[_IDSService linkedDevicesWithRelationship:](self, "linkedDevicesWithRelationship:", 3);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v13, "uniqueID", (_QWORD)v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToIgnoringCase:", v4))
          {

LABEL_19:
            v17 = v13;
            goto LABEL_20;
          }
          objc_msgSend(v13, "uniqueIDOverride");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToIgnoringCase:", v4);

          if ((v16 & 1) != 0)
            goto LABEL_19;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v17 = 0;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v17 = 0;
    }
LABEL_20:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_acknowledgementBlockWithDelegateIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_1907807CC;
  v14 = &unk_1E2C607A8;
  v15 = v5;
  v16 = v4;
  v6 = v4;
  v7 = v5;
  v8 = (void *)MEMORY[0x19400FE1C](&v11);
  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

- (void)_stopAwaitingQuickSwitchAcknowledgementFromDelegateWithIdentifier:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_acknowledgementTracker, sel_stopAwaitingAcknowledgementFromServiceDelegateWithIdentifier_);
}

- (BOOL)_isDroppingMessages
{
  return MEMORY[0x1E0DE7D20](self->_acknowledgementTracker, sel_isAwaitingAcknowledgement);
}

- (void)_callLinkedDevicesChanged
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
      sub_1907F5718();

  }
  v6 = (void *)-[NSMutableArray copy](self->_linkedDevices, "copy");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_190780960;
  v8[3] = &unk_1E2C63AE8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v8);

}

- (void)service:(id)a3 tinkerDeviceAdded:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_IDSService accounts](self, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "accountEnabled");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_linkedDevices, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Service received %@ tinkerDeviceAdded (linkedDevices count: %@)", (uint8_t *)&v16, 0x16u);

    }
    -[_IDSService daemonListener](self, "daemonListener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "linkedDevicesForService:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSService _updateLinkedDevicesWithDevicesInfo:](self, "_updateLinkedDevicesWithDevicesInfo:", v13);
    -[_IDSService _callLinkedDevicesChanged](self, "_callLinkedDevicesChanged");
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableArray __imArrayByApplyingBlock:](self->_linkedDevices, "__imArrayByApplyingBlock:", &unk_1E2C5FC70);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Linked devices updated %@", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (void)service:(id)a3 tinkerDeviceRemoved:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_IDSService accounts](self, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "accountEnabled");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_linkedDevices, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Service received %@ tinkerDeviceRemoved (linkedDevices count: %@)", (uint8_t *)&v16, 0x16u);

    }
    -[_IDSService daemonListener](self, "daemonListener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "linkedDevicesForService:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSService _updateLinkedDevicesWithDevicesInfo:](self, "_updateLinkedDevicesWithDevicesInfo:", v13);
    -[_IDSService _callLinkedDevicesChanged](self, "_callLinkedDevicesChanged");
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableArray __imArrayByApplyingBlock:](self->_linkedDevices, "__imArrayByApplyingBlock:", &unk_1E2C5F050);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Linked devices updated %@", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (void)service:(id)a3 tinkerDeviceUpdated:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_IDSService accounts](self, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "accountEnabled");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_linkedDevices, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Service received %@ tinkerDeviceUpdated (linkedDevices count: %@)", (uint8_t *)&v16, 0x16u);

    }
    -[_IDSService daemonListener](self, "daemonListener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "linkedDevicesForService:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSService _updateLinkedDevicesWithDevicesInfo:](self, "_updateLinkedDevicesWithDevicesInfo:", v13);
    -[_IDSService _callLinkedDevicesChanged](self, "_callLinkedDevicesChanged");
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableArray __imArrayByApplyingBlock:](self->_linkedDevices, "__imArrayByApplyingBlock:", &unk_1E2C5F470);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Linked devices updated %@", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (void)service:(id)a3 linkedDevicesUpdated:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[_IDSService accounts](self, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "accountEnabled");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_linkedDevices, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Service received %@ linkedDevicesUpdated (linkedDevices count: %@)", (uint8_t *)&v16, 0x16u);

    }
    -[_IDSService daemonListener](self, "daemonListener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "linkedDevicesForService:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSService _updateLinkedDevicesWithDevicesInfo:](self, "_updateLinkedDevicesWithDevicesInfo:", v13);
    -[_IDSService _callLinkedDevicesChanged](self, "_callLinkedDevicesChanged");
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[NSMutableArray __imArrayByApplyingBlock:](self->_linkedDevices, "__imArrayByApplyingBlock:", &unk_1E2C5F070);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Linked devices updated %@", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (void)service:(id)a3 restrictionReasonChanged:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  _QWORD v10[6];

  v6 = a3;
  -[_IDSService serviceProperties](self, "serviceProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_190781250;
    v10[3] = &unk_1E2C63B10;
    v10[4] = self;
    v10[5] = a4;
    -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v10);
  }
}

- (void)_setupNewConnectionForAccount:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSMutableDictionary *uniqueIDToConnection;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v17;
  NSObject *v18;
  NSObject *v19;
  unsigned int listenerCaps;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNonUIInstall");

  if ((v6 & 1) == 0)
  {
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "assertQueueIsCurrent");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1907F5830();

    }
    if (v4)
    {
      objc_msgSend(v4, "_internal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKey:](self->_uniqueIDToConnection, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        +[IDSLogging _IDSService](IDSLogging, "_IDSService");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "_internal");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412290;
          v26 = v14;
          _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_INFO, "We have an existing connection for this unique ID: %@", (uint8_t *)&v25, 0xCu);

        }
      }
      else
      {
        +[IDSConnection _connectionWithAccount:commands:indirectDelegateCallouts:](IDSConnection, "_connectionWithAccount:commands:indirectDelegateCallouts:", v4, self->_commands, 1);
        v13 = objc_claimAutoreleasedReturnValue();
        uniqueIDToConnection = self->_uniqueIDToConnection;
        if (!uniqueIDToConnection)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v17 = self->_uniqueIDToConnection;
          self->_uniqueIDToConnection = Mutable;

          uniqueIDToConnection = self->_uniqueIDToConnection;
        }
        -[NSMutableDictionary setObject:forKey:](uniqueIDToConnection, "setObject:forKey:", v13, v11);
        +[IDSLogging _IDSService](IDSLogging, "_IDSService");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 138412290;
          v26 = v11;
          _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "Setting up new connection for %@", (uint8_t *)&v25, 0xCu);
        }

        -[_IDSService _logConnectionMap](self, "_logConnectionMap");
        if (self->_everHadDelegate)
        {
          +[IDSLogging _IDSService](IDSLogging, "_IDSService");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            listenerCaps = self->_listenerCaps;
            v25 = 67109120;
            LODWORD(v26) = listenerCaps;
            _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_INFO, "Setting up new connection with caps %d", (uint8_t *)&v25, 8u);
          }

          -[NSObject _internal](v13, "_internal");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setDelegateCapabilities:", self->_listenerCaps);

          -[NSObject _internal](v13, "_internal");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "queue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addDelegate:queue:", self, v24);

          -[_IDSService connection:devicesChanged:](self, "connection:devicesChanged:", v13, 0);
        }
      }

    }
  }

}

- (void)_tearDownConnectionForUniqueID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *uniqueIDToConnection;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F58BC();

  }
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_uniqueIDToConnection, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeDelegate:", self);

    -[NSMutableDictionary removeObjectForKey:](self->_uniqueIDToConnection, "removeObjectForKey:", v4);
    if (!-[NSMutableDictionary count](self->_uniqueIDToConnection, "count"))
    {
      uniqueIDToConnection = self->_uniqueIDToConnection;
      self->_uniqueIDToConnection = 0;

    }
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Tearing down connection for %@", (uint8_t *)&v12, 0xCu);
    }

    -[_IDSService _logConnectionMap](self, "_logConnectionMap");
  }

}

- (void)_callIsActiveChanged
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
  NSObject *v15;
  NSMutableSet *lastIsActiveSet;
  NSMutableSet *v17;
  NSMutableSet **p_lastIsActiveSet;
  NSMutableSet *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  _IDSService *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  NSMutableSet *v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F59D4();

  }
  -[_IDSService accounts](self, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "_internal");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uniqueID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    lastIsActiveSet = self->_lastIsActiveSet;
    *(_DWORD *)buf = 138412546;
    v44 = lastIsActiveSet;
    v45 = 2112;
    v46 = v7;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "activeAccountsChanged, oldSet: %@  newSet: %@", buf, 0x16u);
  }

  p_lastIsActiveSet = &self->_lastIsActiveSet;
  v17 = self->_lastIsActiveSet;
  if (v17 && (-[NSMutableSet isEqual:](v17, "isEqual:", v7) & 1) == 0)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_190781D34;
    v35[3] = &unk_1E2C63AE8;
    v36 = v8;
    v37 = self;
    -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v35);

  }
  v19 = *p_lastIsActiveSet;
  objc_storeStrong((id *)&self->_lastIsActiveSet, v7);
  v20 = -[NSMutableSet count](*p_lastIsActiveSet, "count");
  if (v20 != -[NSMutableSet count](v19, "count")
    || *p_lastIsActiveSet && v19 && (-[NSMutableSet isEqualToSet:](*p_lastIsActiveSet, "isEqualToSet:", v19) & 1) == 0)
  {
    -[IDSAccountController _internal](self->_accountController, "_internal");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accounts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "_internal", (_QWORD)v31);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      }
      while (v26);
    }

    if (sub_190781E3C(v23))
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "IDSService");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906E0000, v30, OS_LOG_TYPE_DEFAULT, "*** dropping devicesChanged callback! -- accountsChanged", buf, 2u);
      }

    }
    else
    {
      -[_IDSService _callDelegatesForDevicesChanged](self, "_callDelegatesForDevicesChanged");
    }

  }
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907F5A60();

  }
  if (v5)
  {
    -[_IDSService _setupNewConnectionForAccount:](self, "_setupNewConnectionForAccount:", v5);
    -[_IDSService _callIsActiveChanged](self, "_callIsActiveChanged");
  }

}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907F5AEC();

  }
  if (v5)
  {
    objc_msgSend(v5, "_internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSService _tearDownConnectionForUniqueID:](self, "_tearDownConnectionForUniqueID:", v10);

    -[_IDSService _callIsActiveChanged](self, "_callIsActiveChanged");
  }

}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907F5B78();

  }
  if (v5)
  {
    -[_IDSService _setupNewConnectionForAccount:](self, "_setupNewConnectionForAccount:", v5);
    -[_IDSService _callIsActiveChanged](self, "_callIsActiveChanged");
  }

}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907F5C04();

  }
  if (v5)
  {
    objc_msgSend(v5, "_internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSService _tearDownConnectionForUniqueID:](self, "_tearDownConnectionForUniqueID:", v10);

    -[_IDSService _callIsActiveChanged](self, "_callIsActiveChanged");
  }

}

- (void)connection:(id)a3 incomingOpportunisticData:(id)a4 withIdentifier:(id)a5 fromURI:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  const __CFString *v26;
  NSUInteger v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  char v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD block[4];
  id v47;
  _IDSService *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  char v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  NSUInteger v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "assertQueueIsCurrent");

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1907F5C90();

  }
  v20 = dispatch_group_create();
  dispatch_group_enter(v20);
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v16, "outgoingResponseIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v15;
    v24 = v13;
    v25 = v12;
    if (objc_msgSend(v16, "usedEngram"))
      v26 = CFSTR("YES");
    else
      v26 = CFSTR("NO");
    v27 = -[NSMapTable count](self->_delegateToInfo, "count");
    *(_DWORD *)buf = 138412802;
    v61 = v22;
    v62 = 2112;
    v63 = v26;
    v12 = v25;
    v13 = v24;
    v15 = v23;
    v64 = 2048;
    v65 = v27;
    _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "incomingOpportunisticData on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);

  }
  objc_msgSend(v16, "setWantsManualAck:", self->_manuallyAckMessages);
  objc_msgSend(v15, "prefixedURI");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFromID:", v28);

  objc_msgSend(v12, "_internal");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "account");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = sub_190782698;
  v54[3] = &unk_1E2C63B58;
  v54[4] = self;
  v31 = v30;
  v55 = v31;
  v32 = v13;
  v56 = v32;
  v33 = v14;
  v57 = v33;
  v34 = v15;
  v58 = v34;
  v35 = v16;
  v59 = v35;
  -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v54, v20);
  if (!self->_manuallyAckMessages)
  {
    v45 = v12;
    v36 = objc_msgSend(v35, "wantsAppAck");
    objc_msgSend(v35, "storageGuid");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "outgoingResponseIdentifier");
    v44 = v32;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "queue");
    v39 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19078283C;
    block[3] = &unk_1E2C62B70;
    v53 = v36;
    v12 = v45;
    v47 = v35;
    v48 = self;
    v49 = v38;
    v50 = v34;
    v51 = v45;
    v52 = v37;
    v40 = v37;
    v41 = v38;
    v32 = v44;
    v42 = v41;
    dispatch_group_notify(v20, v39, block);

  }
  dispatch_group_leave(v20);

}

- (void)connection:(id)a3 incomingData:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const __CFString *v20;
  NSUInteger v21;
  NSObject *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  NSObject *v45;
  const __CFString *v46;
  void *v47;
  NSObject *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  char v54;
  id v55;
  _IDSService *v56;
  id v57;
  id v58;
  void *v59;
  _QWORD block[4];
  id v61;
  id v62;
  id v63;
  _IDSService *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  char v69;
  char v70;
  _QWORD v71[5];
  id v72;
  id v73;
  id v74;
  id v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  const __CFString *v79;
  __int16 v80;
  NSUInteger v81;
  __int16 v82;
  id v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v14, "assertQueueIsCurrent");

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1907F5D1C();

  }
  objc_msgSend(v10, "_internal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "outgoingResponseIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "usedEngram"))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v21 = -[NSMapTable count](self->_delegateToInfo, "count");
    *(_DWORD *)buf = 138412802;
    v77 = (uint64_t)v19;
    v78 = 2112;
    v79 = v20;
    v80 = 2048;
    v81 = v21;
    _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "incomingData on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v11, "length");
    objc_msgSend(v10, "_internal");
    v53 = v11;
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_internal");
    v56 = self;
    v58 = v10;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "account");
    v26 = v17;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_internal");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outgoingResponseIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v77 = v23;
    v78 = 2112;
    v79 = v24;
    v80 = 2112;
    v81 = (NSUInteger)v28;
    v82 = 2112;
    v83 = v12;
    v84 = 2112;
    v85 = v29;
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "incomingData of size %lu on connection %@ account %@ from ID %@ sender-side-identifier %@", buf, 0x34u);

    v17 = v26;
    self = v56;
    v10 = v58;

    v11 = v53;
  }

  v30 = dispatch_group_create();
  dispatch_group_enter(v30);
  objc_msgSend(v13, "setWantsManualAck:", self->_manuallyAckMessages);
  objc_msgSend(v12, "prefixedURI");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromID:", v31);

  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = sub_190782FD4;
  v71[3] = &unk_1E2C63B80;
  v71[4] = self;
  v32 = v17;
  v72 = v32;
  v33 = v11;
  v73 = v33;
  v34 = v12;
  v74 = v34;
  v35 = v13;
  v75 = v35;
  -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v71, v30);
  if (!self->_manuallyAckMessages)
  {
    v57 = v32;
    v59 = v10;
    v36 = objc_msgSend(v35, "wantsAppAck");
    v54 = objc_msgSend(v35, "isDirectMessage");
    objc_msgSend(v35, "outgoingResponseIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "storageGuid");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "broadcastTime");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      v40 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v42 = v41;
      objc_msgSend(v35, "broadcastTime");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "doubleValue");
      objc_msgSend(v40, "numberWithDouble:", v42 - v44);
      v51 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v51 = 0;
    }
    +[IDSLogging _IDSService](IDSLogging, "_IDSService", v51);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v77 = (uint64_t)v35;
      if (v36)
        v46 = CFSTR("YES");
      v78 = 2112;
      v79 = v46;
      v80 = 2112;
      v81 = (NSUInteger)v37;
      v82 = 2112;
      v83 = v38;
      _os_log_impl(&dword_1906E0000, v45, OS_LOG_TYPE_DEFAULT, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "queue");
    v48 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190783174;
    block[3] = &unk_1E2C63BA8;
    v61 = v35;
    v69 = v36;
    v70 = v54;
    v62 = v59;
    v63 = v37;
    v64 = self;
    v65 = v34;
    v66 = v38;
    v67 = v52;
    v68 = v33;
    v55 = v52;
    v49 = v38;
    v50 = v37;
    dispatch_group_notify(v30, v48, block);

    v10 = v59;
    v32 = v57;
  }
  dispatch_group_leave(v30);

}

- (void)connection:(id)a3 incomingGroupData:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  NSUInteger v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  _IDSService *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  _IDSService *v45;
  NSObject *v46;
  const __CFString *v47;
  void *v48;
  NSObject *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  int v54;
  id v55;
  id v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  _IDSService *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  char v67;
  _QWORD block[5];
  id v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  NSUInteger v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
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
      sub_1907F5DA8();

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "outgoingResponseIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    if (objc_msgSend(v13, "usedEngram"))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v21 = -[NSMapTable count](self->_delegateToInfo, "count");
    *(_DWORD *)buf = 138412802;
    v71 = (uint64_t)v18;
    v72 = 2112;
    v73 = v20;
    v12 = v19;
    v74 = 2048;
    v75 = v21;
    _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "incomingGroupData on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v12;
    v24 = objc_msgSend(v11, "length");
    objc_msgSend(v10, "_internal");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_internal");
    v56 = v10;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "account");
    v53 = v11;
    v27 = self;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_internal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outgoingResponseIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v71 = v24;
    v12 = v23;
    v72 = 2112;
    v73 = v25;
    v74 = 2112;
    v75 = (NSUInteger)v29;
    v76 = 2112;
    v77 = v23;
    v78 = 2112;
    v79 = v30;
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "incomingGroupData of size %lu on connection %@ account %@ from ID %@ sender-side-identifier %@", buf, 0x34u);

    self = v27;
    v11 = v53;

    v10 = v56;
  }

  v31 = dispatch_group_create();
  dispatch_group_enter(v31);
  objc_msgSend(v13, "setWantsManualAck:", self->_manuallyAckMessages);
  objc_msgSend(v12, "prefixedURI");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromID:", v32);

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "queue");
  v34 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1907839B0;
  block[3] = &unk_1E2C607A8;
  block[4] = self;
  v35 = v11;
  v69 = v35;
  dispatch_group_async(v31, v34, block);

  if (!self->_manuallyAckMessages)
  {
    v52 = v12;
    v57 = v10;
    v54 = objc_msgSend(v13, "wantsAppAck");
    objc_msgSend(v13, "outgoingResponseIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "storageGuid");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "broadcastTime");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v41 = v40;
      objc_msgSend(v13, "broadcastTime");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "doubleValue");
      objc_msgSend(v39, "numberWithDouble:", v41 - v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v44 = 0;
    }
    v45 = self;
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v71 = (uint64_t)v13;
      if (v54)
        v47 = CFSTR("YES");
      v72 = 2112;
      v73 = v47;
      v74 = 2112;
      v75 = (NSUInteger)v36;
      v76 = 2112;
      v77 = v37;
      _os_log_impl(&dword_1906E0000, v46, OS_LOG_TYPE_DEFAULT, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "queue");
    v49 = objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = sub_190783D28;
    v58[3] = &unk_1E2C63C18;
    v67 = v54;
    v59 = v13;
    v60 = v45;
    v61 = v36;
    v62 = v52;
    v63 = v57;
    v64 = v37;
    v65 = v44;
    v66 = v35;
    v55 = v44;
    v50 = v37;
    v51 = v36;
    dispatch_group_notify(v31, v49, v58);

    v10 = v57;
    v12 = v52;
  }
  dispatch_group_leave(v31);

}

- (void)connection:(id)a3 incomingAccessoryData:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  NSObject *v32;
  const __CFString *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  _QWORD block[4];
  id v46;
  _IDSService *v47;
  id v48;
  id v49;
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
  id v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v14, "assertQueueIsCurrent");

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1907F5E34();

  }
  objc_msgSend(v10, "_internal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  objc_msgSend(v13, "setWantsManualAck:", self->_manuallyAckMessages);
  objc_msgSend(v12, "prefixedURI");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromID:", v19);

  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = sub_1907843B4;
  v55[3] = &unk_1E2C63B80;
  v55[4] = self;
  v20 = v17;
  v56 = v20;
  v21 = v11;
  v57 = v21;
  v22 = v12;
  v58 = v22;
  v23 = v13;
  v59 = v23;
  -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v55, v18);
  if (!self->_manuallyAckMessages)
  {
    v40 = v20;
    v42 = v10;
    v43 = objc_msgSend(v23, "wantsAppAck");
    objc_msgSend(v23, "outgoingResponseIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "storageGuid");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "broadcastTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v28 = v27;
      objc_msgSend(v23, "broadcastTime");
      v29 = v24;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      objc_msgSend(v26, "numberWithDouble:", v28 - v31);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v29;
    }
    else
    {
      v41 = 0;
    }
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v61 = v23;
      if (v43)
        v33 = CFSTR("YES");
      v62 = 2112;
      v63 = v33;
      v64 = 2112;
      v65 = v24;
      v66 = 2112;
      v67 = v44;
      _os_log_impl(&dword_1906E0000, v32, OS_LOG_TYPE_INFO, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "queue");
    v35 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190784554;
    block[3] = &unk_1E2C63C18;
    v54 = v43;
    v46 = v23;
    v47 = self;
    v48 = v24;
    v49 = v22;
    v36 = v24;
    v10 = v42;
    v50 = v42;
    v51 = v44;
    v52 = v41;
    v53 = v21;
    v37 = v41;
    v38 = v44;
    v39 = v36;
    dispatch_group_notify(v18, v35, block);

    v20 = v40;
  }
  dispatch_group_leave(v18);

}

- (void)connection:(id)a3 incomingAccessoryReportMessage:(id)a4 accessoryID:(id)a5 controllerID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  NSObject *v36;
  const __CFString *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  int v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  _QWORD block[4];
  id v49;
  _IDSService *v50;
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
  id v61;
  id v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v17, "assertQueueIsCurrent");

  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1907F5EC0();

  }
  objc_msgSend(v12, "_internal");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = sub_190784B5C;
  v57[3] = &unk_1E2C63B58;
  v57[4] = self;
  v22 = v20;
  v58 = v22;
  v23 = v13;
  v59 = v23;
  v24 = v15;
  v60 = v24;
  v25 = v14;
  v61 = v25;
  v26 = v16;
  v62 = v26;
  -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v57, v21);
  objc_msgSend(v26, "setWantsManualAck:", self->_manuallyAckMessages);
  objc_msgSend(v26, "setFromID:", v25);
  if (!self->_manuallyAckMessages)
  {
    v44 = v24;
    v46 = v23;
    v47 = v12;
    v43 = objc_msgSend(v26, "wantsAppAck");
    objc_msgSend(v26, "outgoingResponseIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "storageGuid");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "broadcastTime");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v32 = v31;
      objc_msgSend(v26, "broadcastTime");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "doubleValue");
      objc_msgSend(v30, "numberWithDouble:", v32 - v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = 0;
    }
    v45 = v22;
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v64 = v26;
      if (v43)
        v37 = CFSTR("YES");
      v65 = 2112;
      v66 = v37;
      v67 = 2112;
      v68 = v27;
      v69 = 2112;
      v70 = v28;
      _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_INFO, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "queue");
    v39 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190784CD0;
    block[3] = &unk_1E2C62B48;
    v56 = v43;
    v49 = v26;
    v50 = self;
    v51 = v27;
    v52 = v25;
    v53 = v47;
    v54 = v28;
    v55 = v35;
    v40 = v35;
    v41 = v28;
    v42 = v27;
    dispatch_group_notify(v21, v39, block);

    v12 = v47;
    v22 = v45;
    v23 = v46;
    v24 = v44;
  }
  dispatch_group_leave(v21);

}

- (void)connection:(id)a3 incomingInvitation:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  _IDSService *v31;
  uint64_t v32;
  void *v33;
  IDSDictionaryInvitationContext *v34;
  IDSReceivedInvitation *v35;
  void *v36;
  IDSReceivedInvitation *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  IDSReceivedInvitation *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  IDSReceivedInvitation *v49;
  id v50;
  uint8_t buf[4];
  IDSReceivedInvitation *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v45 = a5;
  v12 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v13, "assertQueueIsCurrent");

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907F5F4C();

  }
  v44 = v10;
  objc_msgSend(v10, "_internal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v18 = objc_opt_class();
  sub_190785304(v18, v11, (void *)*MEMORY[0x1E0D344E0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v17, "initWithUUIDString:", v19);

  v20 = objc_opt_class();
  sub_190785304(v20, v11, (void *)*MEMORY[0x1E0D344A8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)*MEMORY[0x1E0D344C0];
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D344C0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0C99D68]);
    v25 = objc_opt_class();
    sub_190785304(v25, v11, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v27 = (void *)objc_msgSend(v24, "initWithTimeIntervalSince1970:");

  }
  else
  {
    v27 = 0;
  }
  v28 = objc_opt_class();
  sub_190785304(v28, v11, (void *)*MEMORY[0x1E0D344D8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (int)objc_msgSend(v29, "intValue");

  if (v30 <= 5 && ((1 << v30) & 0x3A) != 0)
  {
    v31 = self;
    v32 = objc_opt_class();
    sub_190785304(v32, v21, (void *)*MEMORY[0x1E0D344B8]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "intValue");

    v34 = -[IDSDictionaryInvitationContext initWithPayload:]([IDSDictionaryInvitationContext alloc], "initWithPayload:", v21);
    v35 = [IDSReceivedInvitation alloc];
    objc_msgSend(v45, "prefixedURI");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[IDSReceivedInvitation initWithfromID:state:expirationDate:uniqueID:context:](v35, "initWithfromID:state:expirationDate:uniqueID:context:", v36, v30, v27, v46, v34);

    objc_msgSend(v12, "senderCorrelationIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSReceivedInvitation setSenderMergeID:](v37, "setSenderMergeID:", v38);

    objc_msgSend(v12, "toID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSReceivedInvitation setSelfHandle:](v37, "setSelfHandle:", v39);

    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v37;
      _os_log_impl(&dword_1906E0000, v40, OS_LOG_TYPE_DEFAULT, "incomingInvitation: created invitation object from incoming message : {%@}", buf, 0xCu);
    }

    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = sub_1907853AC;
    v47[3] = &unk_1E2C63C40;
    v47[4] = v31;
    v48 = v16;
    v49 = v37;
    v50 = v12;
    v41 = v37;
    -[_IDSService _callDelegatesWithBlock:](v31, "_callDelegatesWithBlock:", v47);

    v42 = v44;
  }
  else
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v34 = (IDSDictionaryInvitationContext *)objc_claimAutoreleasedReturnValue();
    v42 = v10;
    if (os_log_type_enabled(&v34->super, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v46, "UUIDString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v52 = (IDSReceivedInvitation *)v30;
      v53 = 2112;
      v54 = v43;
      _os_log_impl(&dword_1906E0000, &v34->super, OS_LOG_TYPE_DEFAULT, "Invalid state {%ld} received in incomingInvitation. Dropping invitation %@", buf, 0x16u);

    }
  }

}

- (void)connection:(id)a3 incomingInvitationUpdate:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  IDSDictionaryInvitationContext *v36;
  IDSSentInvitation *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  IDSSentInvitation *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  IDSSentInvitation *v51;
  id v52;
  uint8_t buf[4];
  unint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v13, "assertQueueIsCurrent");

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907F6048();

  }
  objc_msgSend(v9, "_internal", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "account");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v17 = objc_opt_class();
  sub_190785304(v17, v10, (void *)*MEMORY[0x1E0D344E0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithUUIDString:", v18);

  v20 = objc_opt_class();
  sub_190785304(v20, v10, (void *)*MEMORY[0x1E0D344A8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)*MEMORY[0x1E0D344C0];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D344C0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0C99D68]);
    v25 = objc_opt_class();
    sub_190785304(v25, v10, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v27 = (void *)objc_msgSend(v24, "initWithTimeIntervalSince1970:");

  }
  else
  {
    v27 = 0;
  }
  v28 = objc_opt_class();
  sub_190785304(v28, v10, (void *)*MEMORY[0x1E0D344D8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (int)objc_msgSend(v29, "intValue");

  v48 = v11;
  if (v30 <= 5 && ((1 << v30) & 0x3A) != 0)
  {
    v31 = objc_opt_class();
    sub_190785304(v31, v21, (void *)*MEMORY[0x1E0D344B8]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "intValue");

    v33 = (void *)MEMORY[0x1E0D34D18];
    objc_msgSend(v11, "prefixedURI");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "destinationWithURI:", v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v36 = -[IDSDictionaryInvitationContext initWithPayload:]([IDSDictionaryInvitationContext alloc], "initWithPayload:", v21);
    v37 = -[IDSSentInvitation initWithDestination:state:expirationDate:uniqueID:context:]([IDSSentInvitation alloc], "initWithDestination:state:expirationDate:uniqueID:context:", v35, v30, v27, v19, v36);
    objc_msgSend(v12, "senderCorrelationIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSSentInvitation setSenderMergeID:](v37, "setSenderMergeID:", v38);

    objc_msgSend(v12, "toID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSSentInvitation setSelfHandle:](v37, "setSelfHandle:", v39);

    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = (unint64_t)v37;
      _os_log_impl(&dword_1906E0000, v40, OS_LOG_TYPE_DEFAULT, "incomingInvitationUpdate: created invitation object from incoming message : {%@}", buf, 0xCu);
    }

    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = sub_1907859C4;
    v49[3] = &unk_1E2C63C40;
    v41 = v47;
    v49[4] = v46;
    v50 = v47;
    v51 = v37;
    v52 = v12;
    v42 = v37;
    objc_msgSend(v46, "_callDelegatesWithBlock:", v49);

    v43 = v9;
  }
  else
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v19, "UUIDString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v54 = v30;
      v55 = 2112;
      v56 = v44;
      _os_log_impl(&dword_1906E0000, v35, OS_LOG_TYPE_DEFAULT, "Invalid state {%ld} received in incomingInvitationUpdate. Dropping invitation %@", buf, 0x16u);

    }
    v41 = v47;
    v43 = v9;
  }

}

- (void)connection:(id)a3 incomingMessage:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  int v24;
  NSUInteger v25;
  const __CFString *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  char v36;
  id v37;
  void *v38;
  char v39;
  char v40;
  NSObject *v41;
  uint64_t v42;
  int *v43;
  NSObject *v44;
  void *v45;
  IDSAutoCleanup *v46;
  uint64_t v47;
  id v48;
  IDSAutoCleanup *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  IDSAutoCleanup *v54;
  IDSAutoCleanup *v55;
  int v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  NSObject *v66;
  const __CFString *v67;
  void *v68;
  NSObject *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  _QWORD block[4];
  id v82;
  id v83;
  id v84;
  _IDSService *v85;
  id v86;
  id v87;
  id v88;
  char v89;
  char v90;
  _QWORD v91[5];
  id v92;
  id v93;
  id v94;
  id v95;
  _QWORD v96[5];
  id v97;
  id v98;
  id v99;
  _QWORD v100[5];
  id v101;
  NSObject *v102;
  id v103;
  id v104;
  id v105;
  IDSAutoCleanup *v106;
  _QWORD v107[5];
  id v108;
  id v109;
  id v110;
  id v111;
  IDSAutoCleanup *v112;
  _QWORD v113[4];
  id v114;
  id v115;
  uint64_t v116;
  os_activity_scope_state_s state;
  NSObject *v118;
  uint8_t v119[16];
  uint8_t buf[4];
  id v121;
  __int16 v122;
  const __CFString *v123;
  __int16 v124;
  NSUInteger v125;
  __int16 v126;
  id v127;
  __int16 v128;
  void *v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v79 = a3;
  v76 = a4;
  v80 = a5;
  v10 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v11, "assertQueueIsCurrent");

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907F6188();

  }
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v118 = _os_activity_create(&dword_1906E0000, "Service recieved message", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v118, &state);
  objc_msgSend(v79, "_internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "account");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v80, "prefixedURI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSService deviceForFromID:](self, "deviceForFromID:", v14);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v79, "_internal");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "_internal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_internal");
    v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "_internal");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "outgoingResponseIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v121 = v16;
    v122 = 2112;
    v123 = v19;
    v124 = 2112;
    v125 = (NSUInteger)v80;
    v126 = 2112;
    v127 = v20;
    v128 = 2112;
    v129 = v21;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "incomingMessage on connection %@ account %@ from ID %@  from device: %@  sender-side-identifier: %@", buf, 0x34u);

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "outgoingResponseIdentifier");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v10, "usedEngram");
    v25 = -[NSMapTable count](self->_delegateToInfo, "count");
    v26 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v121 = v23;
    if (v24)
      v26 = CFSTR("YES");
    v122 = 2112;
    v123 = v26;
    v124 = 2048;
    v125 = v25;
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "incomingMessage on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);

  }
  v27 = dispatch_group_create();
  dispatch_group_enter(v27);
  objc_msgSend(v10, "setWantsManualAck:", self->_manuallyAckMessages);
  objc_msgSend(v80, "prefixedURI");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFromID:", v28);

  objc_msgSend(v10, "resourceTransferURLString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v29;
  if (v29)
  {
    v30 = objc_msgSend(objc_retainAutorelease(v29), "fileSystemRepresentation");
    if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v10, "resourceTransferMetadata");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resourceTransferSandboxExtension");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v31, "containsString:", CFSTR("/Library/IdentityServices/files/")) & 1) == 0
      && !objc_msgSend(v31, "containsString:", CFSTR("/Library/IdentityServices/incomingfiles/"))
      || ((v39 = objc_msgSend(v31, "containsString:", CFSTR("..")), !v31) ? (v40 = 1) : (v40 = v39), (v40 & 1) != 0))
    {
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        sub_1907F60D4();
LABEL_24:
      v36 = 1;
LABEL_33:

      goto LABEL_34;
    }
    if (v38)
    {
      objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
      v42 = sandbox_extension_consume();
      if (v42 == -1)
      {
        +[IDSLogging _IDSService](IDSLogging, "_IDSService");
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        {
          v43 = __error();
          sub_1907F6140(v43, v119, v41);
        }
        goto LABEL_24;
      }
    }
    else
    {
      +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v121 = v31;
        _os_log_impl(&dword_1906E0000, v44, OS_LOG_TYPE_DEFAULT, "No sandbox extension for received resource [%@]", buf, 0xCu);
      }

      v42 = 0;
    }
    v74 = v38;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v31, v37);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = [IDSAutoCleanup alloc];
    v47 = MEMORY[0x1E0C809B0];
    v113[0] = MEMORY[0x1E0C809B0];
    v113[1] = 3221225472;
    v113[2] = sub_190786630;
    v113[3] = &unk_1E2C63C68;
    v48 = v45;
    v114 = v48;
    v115 = v74;
    v116 = v42;
    v49 = -[IDSAutoCleanup initWithBlock:](v46, "initWithBlock:", v113);
    v107[0] = v47;
    v107[1] = 3221225472;
    v107[2] = sub_190786814;
    v107[3] = &unk_1E2C63B58;
    v107[4] = self;
    v50 = v78;
    v108 = v50;
    v51 = v48;
    v109 = v51;
    v52 = v80;
    v110 = v52;
    v53 = v10;
    v111 = v53;
    v54 = v49;
    v112 = v54;
    -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v107, v27);
    v100[0] = v47;
    v100[1] = 3221225472;
    v100[2] = sub_1907869BC;
    v100[3] = &unk_1E2C63C90;
    v100[4] = self;
    v101 = v50;
    v41 = v51;
    v102 = v41;
    v103 = v73;
    v104 = v52;
    v105 = v53;
    v55 = v54;
    v106 = v55;
    -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v100, v27);

    v37 = v73;
    v38 = v74;

    v36 = 0;
    goto LABEL_33;
  }
  v32 = MEMORY[0x1E0C809B0];
  v96[0] = MEMORY[0x1E0C809B0];
  v96[1] = 3221225472;
  v96[2] = sub_190786B68;
  v96[3] = &unk_1E2C63C40;
  v96[4] = self;
  v33 = v78;
  v97 = v33;
  v34 = v76;
  v98 = v34;
  v35 = v80;
  v99 = v35;
  -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v96, v27);
  v91[0] = v32;
  v91[1] = 3221225472;
  v91[2] = sub_190786CFC;
  v91[3] = &unk_1E2C63B80;
  v91[4] = self;
  v92 = v33;
  v93 = v34;
  v94 = v35;
  v95 = v10;
  -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v91, v27);

  v36 = 0;
LABEL_34:
  if ((v36 & 1) != 0 || !self->_manuallyAckMessages)
  {
    v56 = objc_msgSend(v10, "wantsAppAck");
    v57 = objc_msgSend(v10, "isDirectMessage");
    objc_msgSend(v10, "outgoingResponseIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storageGuid");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "broadcastTime");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      v61 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v63 = v62;
      objc_msgSend(v10, "broadcastTime");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "doubleValue");
      objc_msgSend(v61, "numberWithDouble:", v63 - v65);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      v67 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v121 = v10;
      if (v56)
        v67 = CFSTR("YES");
      v122 = 2112;
      v123 = v67;
      v124 = 2112;
      v125 = (NSUInteger)v58;
      v126 = 2112;
      v127 = v59;
      _os_log_impl(&dword_1906E0000, v66, OS_LOG_TYPE_INFO, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "queue");
    v69 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190786E9C;
    block[3] = &unk_1E2C62B20;
    v89 = v56;
    v90 = v57;
    v82 = v79;
    v83 = v58;
    v84 = v10;
    v85 = self;
    v86 = v80;
    v87 = v59;
    v88 = v60;
    v70 = v60;
    v71 = v59;
    v72 = v58;
    dispatch_group_notify(v27, v69, block);

  }
  dispatch_group_leave(v27);

  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (void)connection:(id)a3 incomingProtobuf:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  NSUInteger v19;
  void *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSString *v24;
  NSString *v25;
  SEL v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  int v30;
  int v31;
  int v32;
  const __CFString *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  NSObject *v44;
  const __CFString *v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  char v51;
  int v52;
  void *context;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  _QWORD block[4];
  id v60;
  id v61;
  id v62;
  _IDSService *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD *v68;
  char v69;
  char v70;
  _QWORD v71[4];
  NSString *v72;
  _IDSService *v73;
  id v74;
  id v75;
  id v76;
  _QWORD *v77;
  _QWORD v78[4];
  id v79;
  id v80;
  id v81;
  _IDSService *v82;
  id v83;
  _QWORD *v84;
  SEL v85;
  const char *v86;
  _QWORD v87[3];
  char v88;
  uint8_t buf[4];
  _BYTE v90[10];
  _BYTE v91[10];
  NSUInteger v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v10 = a4;
  v58 = a5;
  v11 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v12, "assertQueueIsCurrent");

  if ((_DWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907F6218();

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "outgoingResponseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v90 = v10;
    *(_WORD *)&v90[8] = 2112;
    *(_QWORD *)v91 = v15;
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Incoming protobuf %@, routing to selector/delegate. sender-side-identifier %@", buf, 0x16u);

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "outgoingResponseIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "usedEngram"))
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    v19 = -[NSMapTable count](self->_delegateToInfo, "count");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v90 = v17;
    *(_WORD *)&v90[8] = 2112;
    *(_QWORD *)v91 = v18;
    *(_WORD *)&v91[8] = 2048;
    v92 = v19;
    _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Incoming protobuf on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);

  }
  context = (void *)MEMORY[0x19400FC60]();
  objc_msgSend(MEMORY[0x1E0D34E08], "keyRepresentationForType:isResponse:", objc_msgSend(v10, "type"), objc_msgSend(v10, "isResponse"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_protobufSelectors, "objectForKey:", v57);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "_internal");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "account");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  v88 = 0;
  v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  objc_msgSend(v11, "setWantsManualAck:", self->_manuallyAckMessages);
  objc_msgSend(v58, "prefixedURI");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromID:", v22);

  if (v55)
  {
    v23 = (const char *)objc_msgSend(v55, "pointerValue");
    NSStringFromSelector(v23);
    v24 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (!-[NSString hasSuffix:](v24, "hasSuffix:", CFSTR("service:account:fromID:context:")))
    {
      -[NSString stringByAppendingString:](v24, "stringByAppendingString:", CFSTR("service:account:fromID:context:"));
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    v26 = NSSelectorFromString(v25);
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(v57, "unsignedIntValue");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v90 = v24;
      *(_WORD *)&v90[8] = 2112;
      *(_QWORD *)v91 = v25;
      *(_WORD *)&v91[8] = 1024;
      LODWORD(v92) = v28;
      _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, "Found selector %@ fullSelector %@ for key 0x%x", buf, 0x1Cu);
    }

    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = sub_190787980;
    v78[3] = &unk_1E2C63CB8;
    v85 = v26;
    v79 = v10;
    v80 = v58;
    v81 = v54;
    v82 = self;
    v83 = v11;
    v84 = v87;
    v86 = v23;
    -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v78, v21);

  }
  else
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = objc_msgSend(v57, "unsignedIntValue");
      v31 = objc_msgSend(v10, "type");
      v32 = objc_msgSend(v10, "isResponse");
      v33 = CFSTR("NO");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v90 = v30;
      if (v32)
        v33 = CFSTR("YES");
      *(_WORD *)&v90[4] = 1024;
      *(_DWORD *)&v90[6] = v31;
      *(_WORD *)v91 = 2112;
      *(_QWORD *)&v91[2] = v33;
      _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_INFO, "No selector for key 0x%x = type(%u) isResponse(%@), notifying delegates", buf, 0x18u);
    }

    objc_msgSend(v11, "messageSequenceNumber");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "unsignedIntegerValue");
    kdebug_trace();

    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = sub_190787CB8;
    v71[3] = &unk_1E2C63CE0;
    v72 = (NSString *)v10;
    v73 = self;
    v74 = v54;
    v75 = v58;
    v76 = v11;
    v77 = v87;
    -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v71, v21);

    v24 = v72;
  }

  if (!self->_manuallyAckMessages)
  {
    v52 = objc_msgSend(v11, "wantsAppAck");
    v35 = objc_msgSend(v11, "isDirectMessage");
    objc_msgSend(v11, "outgoingResponseIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "storageGuid");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v35;
    objc_msgSend(v11, "broadcastTime");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v41 = v40;
      objc_msgSend(v11, "broadcastTime");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "doubleValue");
      objc_msgSend(v39, "numberWithDouble:", v41 - v43);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)v90 = v11;
      if (v52)
        v45 = CFSTR("YES");
      *(_WORD *)&v90[8] = 2112;
      *(_QWORD *)v91 = v45;
      *(_WORD *)&v91[8] = 2112;
      v92 = (NSUInteger)v36;
      v93 = 2112;
      v94 = v37;
      _os_log_impl(&dword_1906E0000, v44, OS_LOG_TYPE_INFO, "Context %@ WantsAppAck %@ AppAckGuid %@ storageGuid %@", buf, 0x2Au);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "queue");
    v47 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190787E7C;
    block[3] = &unk_1E2C63D08;
    v68 = v87;
    v60 = v36;
    v69 = v52;
    v70 = v51;
    v61 = v56;
    v62 = v11;
    v63 = self;
    v64 = v58;
    v65 = v37;
    v66 = v38;
    v67 = v10;
    v48 = v38;
    v49 = v37;
    v50 = v36;
    dispatch_group_notify(v21, v47, block);

  }
  dispatch_group_leave(v21);

  _Block_object_dispose(v87, 8);
  objc_autoreleasePoolPop(context);

}

- (void)connection:(id)a3 incomingTopLevelMessage:(id)a4 fromURI:(id)a5 messageContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  NSUInteger v20;
  void *v21;
  NSUInteger v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  _QWORD block[4];
  id v47;
  id v48;
  _IDSService *v49;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  NSUInteger v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
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
      sub_1907F6314();

  }
  v45 = dispatch_group_create();
  dispatch_group_enter(v45);
  objc_msgSend(v13, "outgoingResponseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend(v13, "usedEngram"))
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    v20 = -[NSMapTable count](self->_delegateToInfo, "count");
    *(_DWORD *)buf = 138412802;
    v59 = v17;
    v60 = 2112;
    v61 = v19;
    v62 = 2048;
    v63 = v20;
    _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "incomingTopLevelMessage on connection guid %@ using engram %@ delegateCount %ld", buf, 0x20u);
  }

  -[IDSServiceProperties serviceName](self->_serviceProperties, "serviceName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.madrid")))
  {
    v22 = -[NSMapTable count](self->_delegateToInfo, "count");

    if (v22)
      goto LABEL_16;
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v59 = v17;
      _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, "No delegates for incoming madrid message. Sending 115 for guid %@", buf, 0xCu);
    }

    v24 = objc_alloc(MEMORY[0x1E0D34DE0]);
    -[IDSServiceProperties serviceName](self->_serviceProperties, "serviceName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v24, "initWithReason:guid:service:additionalInformation:", 709, v17, v25, 0);

    -[_IDSService _sendMissingMessageMetric:](self, "_sendMissingMessageMetric:", v21);
  }

LABEL_16:
  v26 = v13;
  objc_msgSend(v26, "setWantsManualAck:", self->_manuallyAckMessages);
  objc_msgSend(v12, "prefixedURI");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFromID:", v27);

  objc_msgSend(v10, "_internal");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "account");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = sub_190788554;
  v52[3] = &unk_1E2C63B58;
  v52[4] = self;
  v30 = v29;
  v53 = v30;
  v31 = v11;
  v54 = v31;
  v32 = v12;
  v55 = v32;
  v33 = v26;
  v56 = v33;
  v34 = v17;
  v57 = v34;
  v35 = v45;
  -[_IDSService _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", v52, v45);
  if (!self->_manuallyAckMessages)
  {
    objc_msgSend(v33, "storageGuid");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "outgoingResponseIdentifier");
    v37 = v10;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "queue");
    v44 = v31;
    v40 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_190788700;
    block[3] = &unk_1E2C610F8;
    v47 = v36;
    v48 = v38;
    v49 = self;
    v50 = v37;
    v51 = v33;
    v41 = v38;
    v10 = v37;
    v35 = v45;
    v42 = v41;
    v43 = v36;
    dispatch_group_notify(v45, v40, block);

    v31 = v44;
  }
  dispatch_group_leave(v35);

}

- (void)connection:(id)a3 incomingPendingMessageFromURI:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;

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
      sub_1907F63A0();

  }
  objc_msgSend(v8, "_internal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "originalCommand");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_IDSService _messageTypeForCommand:](self, "_messageTypeForCommand:", v16);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_190788994;
  v21[3] = &unk_1E2C63D30;
  v21[4] = self;
  v22 = v15;
  v24 = v10;
  v25 = v17;
  v23 = v9;
  v18 = v10;
  v19 = v9;
  v20 = v15;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v21);

}

- (void)connection:(id)a3 incomingPendingResourceWithMetadata:(id)a4 guid:(id)a5 fromURI:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a3, "_internal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_190788CB8;
  v31[3] = &unk_1E2C63D58;
  v31[4] = self;
  v32 = v13;
  v19 = v13;
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = sub_190788D08;
  v25[3] = &unk_1E2C63D80;
  v25[4] = self;
  v26 = v17;
  v27 = v12;
  v28 = v14;
  v29 = v15;
  v30 = (id)MEMORY[0x19400FE1C](v31);
  v20 = v15;
  v21 = v30;
  v22 = v14;
  v23 = v12;
  v24 = v17;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v25);

}

- (int64_t)_messageTypeForCommand:(id)a3
{
  uint64_t v3;
  int64_t result;

  v3 = objc_msgSend(a3, "integerValue");
  if (v3 <= 226)
  {
    switch(v3)
    {
      case 206:
      case 210:
      case 211:
        result = 12;
        break;
      case 207:
        result = 8;
        break;
      case 208:
        result = 9;
        break;
      case 209:
        result = 10;
        break;
      default:
        if (v3 == 100)
        {
          result = 0;
        }
        else if (v3 == 121)
        {
          result = 5;
        }
        else
        {
LABEL_11:
          result = 15;
        }
        break;
    }
  }
  else
  {
    switch(v3)
    {
      case 232:
        result = 6;
        break;
      case 233:
      case 234:
      case 236:
      case 237:
      case 238:
      case 240:
      case 241:
      case 244:
      case 246:
      case 247:
      case 248:
      case 249:
        goto LABEL_11;
      case 235:
        result = 7;
        break;
      case 239:
        result = 11;
        break;
      case 242:
        result = 2;
        break;
      case 243:
        result = 3;
        break;
      case 245:
        result = 4;
        break;
      case 250:
        result = 13;
        break;
      case 251:
        result = 14;
        break;
      default:
        if (v3 != 227)
          goto LABEL_11;
        result = 1;
        break;
    }
  }
  return result;
}

- (id)_payloadFromDecryptedData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "_FTOptionallyDecompressData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      JWDecodeDictionary();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v4, "count"))
      {
        JWDecodeDictionary();
        v6 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v6;
      }

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)connection:(id)a3 incomingEngramMessage:(id)a4 fromURI:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _IDSService *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _IDSService *v36;
  id v37;
  id v38;

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
      sub_1907F642C();

  }
  v17 = objc_alloc(MEMORY[0x1E0D1F450]);
  objc_msgSend(v13, "engramGroupID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithDataRepresentation:", v18);

  v20 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_190789250;
  v33[3] = &unk_1E2C63DA8;
  v21 = v11;
  v34 = v21;
  v35 = v13;
  v36 = self;
  v37 = v10;
  v38 = v12;
  v22 = v12;
  v23 = v10;
  v24 = v13;
  v28[0] = v20;
  v28[1] = 3221225472;
  v28[2] = sub_1907895EC;
  v28[3] = &unk_1E2C63E20;
  v29 = v19;
  v30 = v21;
  v31 = self;
  v32 = (id)MEMORY[0x19400FE1C](v33);
  v25 = v32;
  v26 = v21;
  v27 = v19;
  -[_IDSService performGroupTask:](self, "performGroupTask:", v28);

}

- (void)connection:(id)a3 isActiveChanged:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
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
      sub_1907F64B8();

  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "_internal");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("NO");
    if (v4)
      v13 = CFSTR("YES");
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_INFO, "isActiveChanged on connection %@ isActive %@", (uint8_t *)&v14, 0x16u);

  }
  -[_IDSService _callIsActiveChanged](self, "_callIsActiveChanged");

}

- (void)connection:(id)a3 devicesChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSUInteger v17;
  void *v18;
  int v19;
  NSObject *v20;
  dispatch_time_t v21;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  NSObject *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  NSUInteger v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
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
      sub_1907F6544();

  }
  objc_msgSend(v6, "_internal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_internal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IDSService devices](self, "devices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D36AA8], "IDSService_oversized");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "__imArrayByApplyingBlock:", &unk_1E2C63E40);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSMapTable count](self->_delegateToInfo, "count");
    *(_DWORD *)buf = 138413058;
    v27 = v6;
    v28 = 2112;
    v29 = v13;
    v30 = 2112;
    v31 = v16;
    v32 = 2048;
    v33 = v17;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "devicesChanged on connection %@ account %@ all devices %@ num delegates: %lu", buf, 0x2Au);

  }
  if (v13
    && (objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = sub_190781E3C(v18),
        v18,
        v19))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "IDSService");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "*** dropping devicesChanged callback!", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", self);
    v20 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[_IDSService _callDelegatesForDevicesChanged](self, "_callDelegatesForDevicesChanged");
    }
    else
    {
      v21 = dispatch_time(0, 60000000000);
      +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "queue");
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_19078A360;
      block[3] = &unk_1E2C60550;
      v20 = v20;
      v25 = v20;
      dispatch_after(v21, v23, block);

    }
  }

}

- (void)_callDelegatesForDevicesChanged
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
      sub_1907F65D0();

  }
  -[_IDSService devices](self, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19078A46C;
  v8[3] = &unk_1E2C63AE8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v8);

}

- (void)connection:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907F665C();

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19078A5AC;
  v10[3] = &unk_1E2C63AE8;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v10);

}

- (void)connection:(id)a3 connectedDevicesChanged:(id)a4
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
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
      sub_1907F66E8();

  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "IDSService_oversized");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "_internal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v6;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "connectedDevicesChanged on connection %@ account %@ devices %@", buf, 0x20u);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_19078A7D8;
  v16[3] = &unk_1E2C63AE8;
  v16[4] = self;
  v17 = v7;
  v15 = v7;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v16);

}

- (void)connection:(id)a3 messageIdentifier:(id)a4 alternateCallbackID:(id)a5 updatedWithResponseCode:(int64_t)a6 error:(id)a7 lastCall:(BOOL)a8 messageContext:(id)a9
{
  id v9;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  BOOL v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  NSMutableDictionary *uniqueIDToProgress;
  void *v43;
  void *v44;
  id v45;
  char v46;
  uint64_t v47;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  int64_t v56;
  char v57;
  _QWORD v58[5];
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint8_t buf[4];
  _IDSService *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  int64_t v70;
  __int16 v71;
  id v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  LODWORD(v9) = a8;
  v79 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a9;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "assertQueueIsCurrent");

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_1907F6774();

  }
  objc_msgSend(v17, "bytesSent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      v24 = (_DWORD)v9 == 0;
      v46 = (char)v9;
      v9 = v13;
      if (v24)
        v25 = CFSTR("NO");
      else
        v25 = CFSTR("YES");
      objc_msgSend(v17, "bytesSent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "totalBytes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414082;
      v64 = self;
      v65 = 2112;
      v66 = v14;
      v67 = 2112;
      v68 = v15;
      v69 = 2048;
      v70 = a6;
      v71 = 2112;
      v72 = v16;
      v73 = 2112;
      v74 = v25;
      v13 = v9;
      LOBYTE(v9) = v46;
      v75 = 2112;
      v76 = v26;
      v77 = 2112;
      v78 = v27;
      _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "%@ got messageIdentifier %@ callbackID %@ updatedWithResponseCode: %ld error %@ lastCall %@ sentBytes %@ totalBytes %@", buf, 0x52u);

    }
  }
  else if (v23)
  {
    v28 = CFSTR("NO");
    *(_DWORD *)buf = 138413570;
    v64 = self;
    v65 = 2112;
    if ((_DWORD)v9)
      v28 = CFSTR("YES");
    v66 = v14;
    v67 = 2112;
    v68 = v15;
    v69 = 2048;
    v70 = a6;
    v71 = 2112;
    v72 = v16;
    v73 = 2112;
    v74 = v28;
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "%@ got messageIdentifier %@ callbackID %@ updatedWithResponseCode: %ld error %@ lastCall %@", buf, 0x3Eu);
  }

  objc_msgSend(v17, "originalCommand");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToNumber:", &unk_1E2CAE2D0);

  if ((v30 & 1) == 0)
  {
    objc_msgSend(v13, "_internal");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "account");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = MEMORY[0x1E0C809B0];
    if (!a6 && (v9 & 1) == 0)
    {
      objc_msgSend(v17, "bytesSent");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)v34;
        objc_msgSend(v17, "totalBytes");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v17, "bytesSent");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v33;
          v39 = objc_msgSend(v37, "integerValue");

          objc_msgSend(v17, "totalBytes");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v40, "integerValue");

          v58[0] = v38;
          v58[1] = 3221225472;
          v58[2] = sub_19078ACF8;
          v58[3] = &unk_1E2C63E68;
          v58[4] = self;
          v59 = v32;
          v41 = v14;
          v60 = v41;
          v61 = v39;
          v62 = v47;
          -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v58);
          uniqueIDToProgress = self->_uniqueIDToProgress;
          if (uniqueIDToProgress)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](uniqueIDToProgress, "objectForKeyedSubscript:", v41);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43;
            if (v43)
            {
              objc_msgSend(v43, "setTotalUnitCount:", v47);
              objc_msgSend(v44, "setCompletedUnitCount:", v39);
            }

          }
          v33 = MEMORY[0x1E0C809B0];
        }
      }
    }
    v50[0] = v33;
    v50[1] = 3221225472;
    v50[2] = sub_19078AD64;
    v50[3] = &unk_1E2C63E90;
    v50[4] = self;
    v51 = v32;
    v52 = v14;
    v53 = v15;
    v56 = a6;
    v54 = v16;
    v57 = (char)v9;
    v55 = v17;
    v45 = v32;
    -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v50);

  }
}

- (void)connection:(id)a3 identifier:(id)a4 alternateCallbackID:(id)a5 willSendToDestinations:(id)a6 skippedDestinations:(id)a7 registrationPropertyToDestinations:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  _IDSService *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v20, "assertQueueIsCurrent");

  if ((_DWORD)a7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907F6800();

  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[_IDSService serviceProperties](self, "serviceProperties");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    IDSLoggableDescriptionForHandlesOnService();
    v40 = v19;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSService serviceProperties](self, "serviceProperties");
    v24 = v18;
    v25 = v15;
    v26 = v14;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "identifier");
    v43 = v16;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    IDSLoggableDescriptionForHandlesOnService();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v17;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v52 = self;
    v53 = 2112;
    v54 = v26;
    v55 = 2112;
    v56 = v25;
    v57 = 2112;
    v58 = v23;
    v59 = 2112;
    v60 = v29;
    v61 = 2112;
    v62 = v30;
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "%@ got identifier %@ callbackID %@ willSendToDestinations %@ skippedDests %@ regPropsToDests (count) %@", buf, 0x3Eu);

    v17 = v42;
    v16 = v43;

    v14 = v26;
    v15 = v25;
    v18 = v24;

    v19 = v40;
  }

  objc_msgSend(v19, "_internal");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "account");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = sub_19078B180;
  v44[3] = &unk_1E2C63C90;
  v44[4] = self;
  v45 = v32;
  v46 = v14;
  v47 = v15;
  v48 = v16;
  v49 = v17;
  v50 = v18;
  v33 = v18;
  v34 = v17;
  v35 = v16;
  v36 = v15;
  v37 = v14;
  v38 = v32;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v44);

}

- (void)connection:(id)a3 identifier:(id)a4 didSendWithSuccess:(BOOL)a5 error:(id)a6 context:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  NSUInteger v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  NSMutableDictionary *uniqueIDToProgress;
  NSMutableDictionary *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  _IDSService *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  BOOL v42;
  uint8_t buf[4];
  _IDSService *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  NSUInteger v52;
  uint64_t v53;

  v9 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "assertQueueIsCurrent");

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1907F688C();

  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v9)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v21 = -[NSMapTable count](self->_delegateToInfo, "count");
    *(_DWORD *)buf = 138413314;
    v44 = self;
    v45 = 2112;
    v46 = v12;
    v47 = 2112;
    v48 = v20;
    v49 = 2112;
    v50 = v13;
    v51 = 2048;
    v52 = v21;
    _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "%@ got identifier %@ didSendWithSuccess %@  error %@ num delegates: %lu", buf, 0x34u);
  }

  objc_msgSend(v15, "_internal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "account");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = sub_19078B4C0;
  v36 = &unk_1E2C63EB8;
  v37 = self;
  v24 = v23;
  v38 = v24;
  v25 = v12;
  v39 = v25;
  v42 = v9;
  v26 = v13;
  v40 = v26;
  v27 = v14;
  v41 = v27;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", &v33);
  if (v25)
  {
    -[NSMutableDictionary objectForKey:](self->_completionBlocksByRequestID, "objectForKey:", v25, v33, v34, v35, v36, v37, v38, v39, v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "first");
      v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v30)[2](v30, v26);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_completionBlocksByRequestID, "removeObjectForKey:", v25);

  }
  uniqueIDToProgress = self->_uniqueIDToProgress;
  if (uniqueIDToProgress)
  {
    -[NSMutableDictionary removeObjectForKey:](uniqueIDToProgress, "removeObjectForKey:", v25);
    if (!-[NSMutableDictionary count](self->_uniqueIDToProgress, "count"))
    {
      v32 = self->_uniqueIDToProgress;
      self->_uniqueIDToProgress = 0;

    }
  }

}

- (void)connection:(id)a3 identifier:(id)a4 fromURI:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  _IDSService *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "assertQueueIsCurrent");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907F6918();

  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v30 = self;
    v31 = 2112;
    v32 = v10;
    v33 = 2112;
    v34 = v12;
    _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "%@ got identifier %@ hasBeenDeliveredWithContext %@", buf, 0x20u);
  }

  objc_msgSend(v13, "_internal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_19078B788;
  v24[3] = &unk_1E2C63B80;
  v24[4] = self;
  v25 = v19;
  v26 = v10;
  v27 = v12;
  v28 = v11;
  v20 = v11;
  v21 = v12;
  v22 = v10;
  v23 = v19;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v24);

}

- (void)connection:(id)a3 didFlushCacheForRemoteURI:(id)a4 fromURI:(id)a5 guid:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  _IDSService *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assertQueueIsCurrent");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907F69A4();

  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v24 = self;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "%@ didFlushCacheForRemoteURI %@ fromURI %@ guid %@", buf, 0x2Au);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19078BA28;
  v19[3] = &unk_1E2C63C40;
  v19[4] = self;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v16 = v11;
  v17 = v10;
  v18 = v9;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v19);

}

- (void)connection:(id)a3 didFlushCacheForKTPeerURI:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  _IDSService *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907F6A30();

  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "%@ didFlushCacheForKTPeerURI %@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19078BBFC;
  v11[3] = &unk_1E2C63AE8;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v11);

}

- (void)connection:(id)a3 account:(id)a4 sessionInviteReceived:(id)a5 fromID:(id)a6 transportType:(id)a7 options:(id)a8 context:(id)a9 messageContext:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a7;
  v21 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "assertQueueIsCurrent");

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1907F6ABC();

  }
  +[_IDSSessionStore sharedInstance](_IDSSessionStore, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sessionForAccount:fromID:identifier:transportType:", v15, v16, v21, v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "_internal");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBoostContext:", v19);

  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v17;
    _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_INFO, "Sending up options to client: %@", buf, 0xCu);
  }

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_19078BED4;
  v34[3] = &unk_1E2C63B58;
  v34[4] = self;
  v35 = v15;
  v36 = v26;
  v37 = v16;
  v38 = v17;
  v39 = v18;
  v29 = v18;
  v30 = v17;
  v31 = v16;
  v32 = v26;
  v33 = v15;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v34);

}

- (void)connection:(id)a3 account:(id)a4 receivedGroupSessionParticipantUpdate:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  _IDSService *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assertQueueIsCurrent");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907F6B48();

  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v24 = self;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Received group session participant update {service: %@, update: %@, context: %@}", buf, 0x20u);
  }

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19078C180;
  v19[3] = &unk_1E2C63C40;
  v19[4] = self;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v16 = v11;
  v17 = v10;
  v18 = v9;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v19);

}

- (void)connection:(id)a3 account:(id)a4 receivedGroupSessionParticipantDataUpdate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v7 = a4;
  v8 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "assertQueueIsCurrent");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F6BD4();

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19078C32C;
  v14[3] = &unk_1E2C63EE0;
  v14[4] = self;
  v15 = v7;
  v16 = v8;
  v12 = v8;
  v13 = v7;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v14);

}

- (void)connection:(id)a3 didSendOpportunisticDataWithIdentifier:(id)a4 toIDs:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  _IDSService *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "assertQueueIsCurrent");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F6C60();

  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Recieved did send opportunistic data {service: %@, identifier: %@, toIDs: %@}", buf, 0x20u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19078C530;
  v15[3] = &unk_1E2C63EE0;
  v15[4] = self;
  v16 = v7;
  v17 = v8;
  v13 = v8;
  v14 = v7;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v15);

}

- (BOOL)isPretendingToBeFull
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
      sub_1907F6CEC();

  }
  return self->_pretendingToBeFull;
}

- (void)setPretendingToBeFull:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD v8[5];

  v3 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F6D78();

  }
  if (self->_pretendingToBeFull != v3)
  {
    self->_pretendingToBeFull = v3;
    if (!v3)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_19078C6E8;
      v8[3] = &unk_1E2C639A8;
      v8[4] = self;
      -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v8);
    }
  }
}

- (NSString)serviceDomain
{
  void *v2;
  int v3;
  NSObject *v4;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assertQueueIsCurrent");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1907F6E04();

  }
  return 0;
}

- (unint64_t)registrationRestrictionReason
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F6E90();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSService serviceProperties](self, "serviceProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "restrictionReasonForService:", v9);

  return v10;
}

- (IDSAccount)iCloudAccount
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  int v14;
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
      sub_1907F6F1C();

  }
  -[IDSAccountController _internal](self->_accountController, "_internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "_internal", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "accountType");

        if (v14 == 1)
        {
          v9 = v12;
          goto LABEL_15;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_15:

  return (IDSAccount *)v9;
}

- (NSSet)internalAccounts
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
      sub_1907F70C0();

  }
  -[IDSAccountController _internal](self->_accountController, "_internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "internalAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IDSService _filteredAccountsFrom:](self, "_filteredAccountsFrom:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v8;
}

- (IDSServiceProperties)serviceProperties
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
      sub_1907F71D8();

  }
  return self->_serviceProperties;
}

- (BOOL)canSend
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F7264();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IDSAccountController _internal](self->_accountController, "_internal", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_internal");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "canSend");

        if ((v12 & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

  return v8;
}

- (void)_reloadCachedLinkedDevices
{
  NSObject *v3;
  NSMutableArray *linkedDevices;
  void *v5;
  NSObject *v6;
  NSMutableArray *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  NSMutableArray *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AA8], "reloadAccounts");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    linkedDevices = self->_linkedDevices;
    *(_DWORD *)buf = 138412290;
    v10 = linkedDevices;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Linked devices before %@", buf, 0xCu);
  }

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19078CE44;
  v8[3] = &unk_1E2C60550;
  v8[4] = self;
  objc_msgSend(v5, "performBlock:waitUntilDone:", v8, 1);

  objc_msgSend(MEMORY[0x1E0D36AA8], "reloadAccounts");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_linkedDevices;
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "Linked devices after %@", buf, 0xCu);
  }

}

- (void)_loadCachedLinkedDevices
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F72F0();

  }
  if (!self->_linkedDevicesLoaded)
  {
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "blockUntilConnected");

    -[_IDSService accounts](self, "accounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSService daemonListener](self, "daemonListener");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "linkedDevicesForService:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_IDSService _updateLinkedDevicesWithDevicesInfo:](self, "_updateLinkedDevicesWithDevicesInfo:", v11);
    self->_linkedDevicesLoaded = 1;

  }
}

- (void)_updateLinkedDevicesWithDevicesInfo:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSMutableArray *v8;
  NSMutableArray *linkedDevices;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F737C();

  }
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  linkedDevices = self->_linkedDevices;
  self->_linkedDevices = v8;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(obj);
        v14 = -[IDSDevice _initWithDictionary:]([IDSDevice alloc], "_initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        objc_msgSend(self->_delegateContext, "object");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_setService:", v15);

        objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "_internal");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "compactDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v18;
          _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Adding linked IDSDevice %@", buf, 0xCu);

        }
        -[NSMutableArray addObject:](self->_linkedDevices, "addObject:", v14);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[NSMutableArray __imArrayByApplyingBlock:](self->_linkedDevices, "__imArrayByApplyingBlock:", &unk_1E2C63F00);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v21;
    _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Linked devices updated with count %d", buf, 8u);

  }
}

- (NSArray)URIs
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[_IDSService accounts](self, "accounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v28;
    v4 = *MEMORY[0x1E0D35208];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v22 = v5;
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v5);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v6, "handles");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v12, "URI");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "unprefixedURI");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "isEqualToString:", v4);

              if ((v15 & 1) == 0)
              {
                objc_msgSend(v12, "URI");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v16);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v9);
        }

        v5 = v22 + 1;
      }
      while (v22 + 1 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }

  objc_msgSend(v3, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v17;
}

- (int64_t)maxEffectivePayloadSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockUntilConnected");

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSServiceProperties identifier](self->_serviceProperties, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "maxEffectivePayloadSizeForService:", v6);

  return v7;
}

- (NSDictionary)pseudonymURIMap
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[_IDSService accounts](self, "accounts", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "pseudonymURIMap");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addEntriesFromDictionary:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v10;
}

- (id)pseudonymForPseudonymURI:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[_IDSService accounts](self, "accounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v20)
    {
      v6 = *(_QWORD *)v26;
      v19 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          objc_msgSend(v8, "pseudonyms", v19);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v22 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
                objc_msgSend(v14, "URI");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "isEqualToURI:", v4);

                if ((v16 & 1) != 0)
                {
                  v17 = v14;

                  goto LABEL_21;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v11)
                continue;
              break;
            }
          }

          v6 = v19;
        }
        v17 = 0;
        v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v20);
    }
    else
    {
      v17 = 0;
    }
LABEL_21:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)pseudonymsForMaskedURI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_IDSService pseudonymURIMap](self, "pseudonymURIMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  return v8;
}

- (id)pseudonymsForMaskedURI:(id)a3 matchingProperties:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  -[_IDSService pseudonymsForMaskedURI:](self, "pseudonymsForMaskedURI:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19078D920;
  v13[3] = &unk_1E2C63F28;
  v14 = v6;
  v8 = v6;
  objc_msgSend(v7, "__imArrayByFilteringWithBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v9;

  return v11;
}

- (id)_accountWithURI:(id)a3 orPseudonym:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[_IDSService accounts](self, "accounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v30)
    {
      v9 = *(_QWORD *)v41;
      v29 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v41 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v31 = v11;
          if (v6)
          {
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            objc_msgSend(v11, "handles");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v37;
              while (2)
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v37 != v15)
                    objc_enumerationMutation(v12);
                  objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "URI");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v17, "isEqualToURI:", v6);

                  if ((v18 & 1) != 0)
                  {
LABEL_33:
                    v26 = v31;

                    goto LABEL_34;
                  }
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
                if (v14)
                  continue;
                break;
              }
            }

            v11 = v31;
          }
          if (v7)
          {
            v28 = v8;
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            objc_msgSend(v11, "pseudonyms");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v33;
              while (2)
              {
                for (k = 0; k != v20; ++k)
                {
                  if (*(_QWORD *)v33 != v21)
                    objc_enumerationMutation(v12);
                  objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "URI");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v7, "URI");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v23, "isEqualToURI:", v24);

                  if ((v25 & 1) != 0)
                  {
                    v8 = v28;
                    goto LABEL_33;
                  }
                }
                v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                if (v20)
                  continue;
                break;
              }
            }

            v8 = v28;
          }
          v9 = v29;
        }
        v26 = 0;
        v30 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v30);
    }
    else
    {
      v26 = 0;
    }
LABEL_34:

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)account:(id)a3 pseudonymsChanged:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[_IDSService wantsPseudonymUpdates](self, "wantsPseudonymUpdates"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[_IDSService accounts](self, "accounts", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "_internal");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uniqueID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v5);

          if ((v13 & 1) != 0)
          {

            -[CUTDeferredTaskQueue enqueueExecutionWithTarget:afterDelay:](self->_pseudonymUpdateTaskQueue, "enqueueExecutionWithTarget:afterDelay:", self, 1.0);
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

  }
LABEL_12:

}

- (void)_calloutPseudonymsDidUpdate
{
  NSDictionary *v3;
  NSDictionary *v4;
  void *v5;
  id v6;
  NSDictionary *cachedPseudonymURIMap;
  NSDictionary *v8;
  _QWORD v9[5];
  id v10;

  if (-[_IDSService wantsPseudonymUpdates](self, "wantsPseudonymUpdates"))
  {
    v3 = self->_cachedPseudonymURIMap;
    -[_IDSService pseudonymURIMap](self, "pseudonymURIMap");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    IDSServiceCalculatedPseudonymChanges_0(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_19078EA04;
    v9[3] = &unk_1E2C63AE8;
    v9[4] = self;
    v10 = v5;
    v6 = v5;
    -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v9);
    cachedPseudonymURIMap = self->_cachedPseudonymURIMap;
    self->_cachedPseudonymURIMap = v4;
    v8 = v4;

  }
}

- (void)provisionPseudonymWithProperties:(id)a3 requestProperties:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_IDSService.m"), 3013, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[_IDSService _sendingAccountForAccount:](self, "_sendingAccountForAccount:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSService _preferredURIForAccount:](self, "_preferredURIForAccount:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    || (-[_IDSService URIs](self, "URIs"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "firstObject"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13))
  {
    -[_IDSService provisionPseudonymForURI:withProperties:requestProperties:completion:](self, "provisionPseudonymForURI:withProperties:requestProperties:completion:", v13, v9, v10, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[_IDSService accounts](self, "accounts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v16;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "No URI found on any account -- returning nil {accounts: %@}", buf, 0xCu);

    }
    sub_19078EC54(400);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v13);
  }

}

- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 requestProperties:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSMutableDictionary *completionBlocksByRequestID;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  _IDSService *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_IDSService.m"), 3029, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[_IDSService _accountWithURI:orPseudonym:](self, "_accountWithURI:orPseudonym:", v11, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v33 = v13;
    v34 = v12;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_19078F3F4;
    v35[3] = &unk_1E2C604E8;
    v16 = v14;
    v36 = v16;
    v17 = (void *)MEMORY[0x19400FE1C](v35);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    completionBlocksByRequestID = self->_completionBlocksByRequestID;
    if (!completionBlocksByRequestID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v21 = self->_completionBlocksByRequestID;
      self->_completionBlocksByRequestID = Mutable;

      completionBlocksByRequestID = self->_completionBlocksByRequestID;
    }
    v22 = (void *)MEMORY[0x1E0D36A98];
    v23 = (void *)MEMORY[0x19400FE1C](v16);
    v24 = (void *)MEMORY[0x19400FE1C](v17);
    objc_msgSend(v22, "pairWithFirst:second:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](completionBlocksByRequestID, "setObject:forKey:", v25, v18);

    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v26 = objc_claimAutoreleasedReturnValue();
    v12 = v34;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v38 = v11;
      v39 = 2112;
      v40 = v34;
      v41 = 2112;
      v42 = v18;
      v43 = 2112;
      v44 = self;
      _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "provisionPseudonymForURI called {URI: %@, properties: %@, requestUUID: %@, self: %@}", buf, 0x2Au);
    }

    -[_IDSService daemonController](self, "daemonController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v33;
    objc_msgSend(v27, "provisionPseudonymForURI:onAccount:withProperties:requestProperties:requestUUID:", v11, v28, v34, v33, v18);

    v29 = v36;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      -[_IDSService accounts](self, "accounts");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v11;
      v39 = 2112;
      v40 = v31;
      _os_log_impl(&dword_1906E0000, v30, OS_LOG_TYPE_DEFAULT, "No account matched URI -- returning nil {URI: %@, accounts: %@}", buf, 0x16u);

    }
    sub_19078EC54(400);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v29);
  }

}

- (void)renewPseudonym:(id)a3 forUpdatedExpiryEpoch:(double)a4 requestProperties:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSMutableDictionary *completionBlocksByRequestID;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  double v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  _IDSService *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_IDSService.m"), 3050, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[_IDSService _accountWithURI:orPseudonym:](self, "_accountWithURI:orPseudonym:", 0, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v32 = v12;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_19078F7AC;
    v33[3] = &unk_1E2C604E8;
    v15 = v13;
    v34 = v15;
    v16 = (void *)MEMORY[0x19400FE1C](v33);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    completionBlocksByRequestID = self->_completionBlocksByRequestID;
    if (!completionBlocksByRequestID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v20 = self->_completionBlocksByRequestID;
      self->_completionBlocksByRequestID = Mutable;

      completionBlocksByRequestID = self->_completionBlocksByRequestID;
    }
    v21 = (void *)MEMORY[0x1E0D36A98];
    v22 = (void *)MEMORY[0x19400FE1C](v15);
    v23 = (void *)MEMORY[0x19400FE1C](v16);
    objc_msgSend(v21, "pairWithFirst:second:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](completionBlocksByRequestID, "setObject:forKey:", v24, v17);

    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v36 = v11;
      v37 = 2048;
      v38 = a4;
      v39 = 2112;
      v40 = v17;
      v41 = 2112;
      v42 = self;
      _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "renewPseudonym called {pseudonym: %@, expiry: %f, requestUUID: %@, self: %@}", buf, 0x2Au);
    }

    -[_IDSService daemonController](self, "daemonController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v32;
    objc_msgSend(v26, "renewPseudonym:onAccount:forUpdatedExpiryEpoch:requestProperties:requestUUID:", v11, v27, v32, v17, a4);

    v28 = v34;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      -[_IDSService accounts](self, "accounts");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v11;
      v37 = 2112;
      v38 = *(double *)&v30;
      _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_DEFAULT, "No account matched pseudonym -- returning nil {pseudonym: %@, accounts: %@}", buf, 0x16u);

    }
    sub_19078EC54(400);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v28);
  }

}

- (void)revokePseudonym:(id)a3 requestProperties:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSMutableDictionary *completionBlocksByRequestID;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  _IDSService *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_IDSService.m"), 3071, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[_IDSService _accountWithURI:orPseudonym:](self, "_accountWithURI:orPseudonym:", 0, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v30 = v10;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_19078FB48;
    v31[3] = &unk_1E2C604E8;
    v13 = v11;
    v32 = v13;
    v14 = (void *)MEMORY[0x19400FE1C](v31);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    completionBlocksByRequestID = self->_completionBlocksByRequestID;
    if (!completionBlocksByRequestID)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v18 = self->_completionBlocksByRequestID;
      self->_completionBlocksByRequestID = Mutable;

      completionBlocksByRequestID = self->_completionBlocksByRequestID;
    }
    v19 = (void *)MEMORY[0x1E0D36A98];
    v20 = (void *)MEMORY[0x19400FE1C](v13);
    v21 = (void *)MEMORY[0x19400FE1C](v14);
    objc_msgSend(v19, "pairWithFirst:second:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](completionBlocksByRequestID, "setObject:forKey:", v22, v15);

    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      v35 = 2112;
      v36 = v15;
      v37 = 2112;
      v38 = self;
      _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, "revokePseudonym called {pseudonym: %@, requestUUID: %@, self: %@}", buf, 0x20u);
    }

    -[_IDSService daemonController](self, "daemonController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v30;
    objc_msgSend(v24, "revokePseudonym:onAccount:requestProperties:requestUUID:", v9, v25, v30, v15);

    v26 = v32;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[_IDSService accounts](self, "accounts");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v9;
      v35 = 2112;
      v36 = v28;
      _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, "No account matched pseudonym -- returning nil {pseudonym: %@, accounts: %@}", buf, 0x16u);

    }
    sub_19078EC54(400);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v26);
  }

}

- (id)pseudonymPropertiesWithFeatureID:(id)a3 scopeID:(id)a4 expiryDurationInSeconds:(double)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0D34E18];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  v14 = v13 + a5;
  -[IDSServiceProperties identifier](self->_serviceProperties, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v11, "initWithFeatureID:scopeID:expiryEpoch:allowedServices:", v10, v9, v16, v14);

  return v17;
}

- (void)finishedProvisioningPseudonym:(id)a3 success:(BOOL)a4 error:(id)a5 forRequestUUID:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  _IDSService *v35;
  uint64_t v36;

  v8 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  sub_19078FF44(a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_completionBlocksByRequestID, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "first");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_completionBlocksByRequestID, "removeObjectForKey:", v11);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v27 = v10;
      if (v8)
        v16 = CFSTR("YES");
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = self;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "finishedProvisioningPseudonym called {pseudonym: %@, success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x34u);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_190790030;
    v20[3] = &unk_1E2C63F90;
    v21 = v10;
    v25 = v8;
    v22 = v11;
    v23 = v12;
    v24 = v14;
    objc_msgSend(v17, "performBlock:", v20);

    v18 = v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v27 = v10;
      v28 = 2112;
      if (v8)
        v19 = CFSTR("YES");
      v29 = v19;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = self;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_INFO, "finishedProvisioningPseudonym called but no block! {pseudonym: %@, success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x34u);
    }
  }

}

- (void)finishedRenewingPseudonym:(id)a3 success:(BOOL)a4 error:(id)a5 requestUUID:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  _IDSService *v35;
  uint64_t v36;

  v8 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  sub_19078FF44(a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_completionBlocksByRequestID, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "first");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_completionBlocksByRequestID, "removeObjectForKey:", v11);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v27 = v10;
      if (v8)
        v16 = CFSTR("YES");
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = self;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "finishedRenewingPseudonym called {pseudonym: %@, success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x34u);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1907903BC;
    v20[3] = &unk_1E2C63F90;
    v21 = v10;
    v25 = v8;
    v22 = v11;
    v23 = v12;
    v24 = v14;
    objc_msgSend(v17, "performBlock:", v20);

    v18 = v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v27 = v10;
      v28 = 2112;
      if (v8)
        v19 = CFSTR("YES");
      v29 = v19;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      v34 = 2112;
      v35 = self;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_INFO, "finishedRenewingPseudonym called but no block! {pseudonym: %@, success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x34u);
    }
  }

}

- (void)finishedRevokingPseudonymWithSuccess:(BOOL)a3 error:(id)a4 requestUUID:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  id v20;
  BOOL v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  _IDSService *v29;
  uint64_t v30;

  v6 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  sub_19078FF44(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_completionBlocksByRequestID, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "first");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_completionBlocksByRequestID, "removeObjectForKey:", v8);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      if (v6)
        v13 = CFSTR("YES");
      v23 = v13;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = self;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "finishedRevokingPseudonymWithSuccess called {success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x2Au);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_190790710;
    v17[3] = &unk_1E2C63658;
    v21 = v6;
    v18 = v8;
    v19 = v9;
    v20 = v11;
    objc_msgSend(v14, "performBlock:", v17);

    v15 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      if (v6)
        v16 = CFSTR("YES");
      v23 = v16;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = self;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_INFO, "finishedRevokingPseudonymWithSuccess called but no block {success:%@, requestUUID: %@, error:%@, self: %@}", buf, 0x2Au);
    }
  }

}

- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 options:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  void (**v21)(id, _QWORD, void *);
  uint64_t v22;
  void *v23;
  NSMutableDictionary *completionBlocksByRequestID;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _IDSService *v40;
  id v41;
  id v42;
  int64_t v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  int64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  _IDSService *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (v13)
  {
    if (!v11)
    {
LABEL_14:
      sub_190790BD4(1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v35);

      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_IDSService.m"), 3159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (!v11)
      goto LABEL_14;
  }
  if ((IDSIsValidSigningAlgorithm() & 1) == 0)
    goto LABEL_14;
  objc_msgSend(v12, "keyDiversifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "diversifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  objc_msgSend(v12, "keyDiversifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trackingPreventionSecret");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  v20 = objc_msgSend(v12, "keyType") != 1;
  if (v16 == v19 || ((v16 ^ v20) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1907F7494();

    goto LABEL_14;
  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = sub_1907911F0;
  v44[3] = &unk_1E2C604E8;
  v21 = v13;
  v45 = v21;
  v22 = MEMORY[0x19400FE1C](v44);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  completionBlocksByRequestID = self->_completionBlocksByRequestID;
  if (!completionBlocksByRequestID)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v26 = self->_completionBlocksByRequestID;
    self->_completionBlocksByRequestID = Mutable;

    completionBlocksByRequestID = self->_completionBlocksByRequestID;
  }
  v27 = (void *)MEMORY[0x1E0D36A98];
  v28 = (void *)MEMORY[0x19400FE1C](v21);
  v37 = (void *)v22;
  v29 = (void *)MEMORY[0x19400FE1C](v22);
  objc_msgSend(v27, "pairWithFirst:second:", v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](completionBlocksByRequestID, "setObject:forKey:", v30, v23);

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v47 = v23;
    v48 = 2112;
    v49 = v11;
    v50 = 2048;
    v51 = a4;
    v52 = 2112;
    v53 = v12;
    v54 = 2112;
    v55 = self;
    _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "signData called {requestID: %@, data: %@, algo: %ld, options: %@, self: %@}", buf, 0x34u);
  }

  -[_IDSService daemonController](self, "daemonController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_19079123C;
  v38[3] = &unk_1E2C63FB8;
  v43 = a4;
  v39 = v11;
  v40 = self;
  v41 = v12;
  v42 = v23;
  v33 = v23;
  objc_msgSend(v32, "forwardMethodWithReplyIsSync:block:", 0, v38);

LABEL_15:
}

- (void)verifySignedData:(id)a3 matchesExpectedData:(id)a4 withTokenURI:(id)a5 forAlgorithm:(int64_t)a6 options:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD, void *);
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  _BOOL4 v26;
  void (**v27)(id, _QWORD, void *);
  uint64_t v28;
  NSMutableDictionary *completionBlocksByRequestID;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  NSObject *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _IDSService *v48;
  id v49;
  id v50;
  id v51;
  int64_t v52;
  _QWORD v53[4];
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  int64_t v64;
  __int16 v65;
  id v66;
  __int16 v67;
  _IDSService *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = (void (**)(id, _QWORD, void *))a8;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_IDSService.m"), 3194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (v15)
      goto LABEL_3;
LABEL_17:
    v38 = 1;
LABEL_18:
    sub_190790BD4(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, 0, v39);

    goto LABEL_19;
  }
  if (!v15)
    goto LABEL_17;
LABEL_3:
  if (!v16 || !v17 || (IDSIsValidSigningAlgorithm() & 1) == 0)
    goto LABEL_17;
  objc_msgSend(v18, "keyDiversifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "diversifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 != 0;

  objc_msgSend(v18, "keyDiversifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trackingPreventionSecret");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  v26 = objc_msgSend(v18, "keyType") != 1;
  if (v22 == v25 || ((v22 ^ v26) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_1907F7494();

    goto LABEL_17;
  }
  if ((objc_msgSend(v17, "isTokenURI") & 1) == 0)
  {
    v38 = 2;
    goto LABEL_18;
  }
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = sub_190791718;
  v53[3] = &unk_1E2C604E8;
  v27 = v19;
  v54 = v27;
  v28 = MEMORY[0x19400FE1C](v53);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  completionBlocksByRequestID = self->_completionBlocksByRequestID;
  if (!completionBlocksByRequestID)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v31 = self->_completionBlocksByRequestID;
    self->_completionBlocksByRequestID = Mutable;

    completionBlocksByRequestID = self->_completionBlocksByRequestID;
  }
  v41 = (void *)MEMORY[0x1E0D36A98];
  v42 = (void *)MEMORY[0x19400FE1C](v27);
  v44 = (void *)v28;
  v32 = (void *)MEMORY[0x19400FE1C](v28);
  objc_msgSend(v41, "pairWithFirst:second:", v42, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](completionBlocksByRequestID, "setObject:forKey:", v33, v43);

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413826;
    v56 = v43;
    v57 = 2112;
    v58 = v15;
    v59 = 2112;
    v60 = v16;
    v61 = 2112;
    v62 = v17;
    v63 = 2048;
    v64 = a6;
    v65 = 2112;
    v66 = v18;
    v67 = 2112;
    v68 = self;
    _os_log_impl(&dword_1906E0000, v34, OS_LOG_TYPE_DEFAULT, "verifySignedData called {requestID: %@, signedData: %@, data: %@, uri: %@, algo: %ld, options: %@, self: %@}", buf, 0x48u);
  }

  -[_IDSService daemonController](self, "daemonController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = sub_190791764;
  v45[3] = &unk_1E2C63FE0;
  v46 = v15;
  v52 = a6;
  v47 = v16;
  v48 = self;
  v49 = v17;
  v50 = v18;
  v51 = v43;
  v36 = v43;
  objc_msgSend(v35, "forwardMethodWithReplyIsSync:block:", 0, v45);

LABEL_19:
}

- (void)finishedSigningForRequest:(id)a3 signedData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  NSObject *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  _IDSService *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  sub_19078FF44(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_completionBlocksByRequestID, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "first");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_completionBlocksByRequestID, "removeObjectForKey:", v8);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = self;
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "finishedSigningForRequest called {requestUUID: %@, signedData: %@, error: %@, self: %@}", buf, 0x2Au);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_190791A30;
    v16[3] = &unk_1E2C60EC8;
    v19 = v12;
    v17 = v9;
    v18 = v10;
    objc_msgSend(v14, "performBlock:", v16);

    v15 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = self;
      _os_log_error_impl(&dword_1906E0000, v15, OS_LOG_TYPE_ERROR, "finishedSigningForRequest called but no block! {requestUUID: %@, signedData: %@, error: %@, self: %@}", buf, 0x2Au);
    }
  }

}

- (void)finishedVerifyingSignedDataForRequest:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  BOOL v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _IDSService *v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  sub_19078FF44(a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_completionBlocksByRequestID, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "first");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_completionBlocksByRequestID, "removeObjectForKey:", v8);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v22 = v8;
      if (v6)
        v13 = CFSTR("YES");
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = self;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "finishedVerifyingSignedDataForRequest called {requestUUID: %@, sucess: %@, error: %@, self: %@}", buf, 0x2Au);
    }

    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_190791C94;
    v17[3] = &unk_1E2C60E50;
    v19 = v11;
    v20 = v6;
    v18 = v9;
    objc_msgSend(v14, "performBlock:", v17);

    v15 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v22 = v8;
      v23 = 2112;
      if (v6)
        v16 = CFSTR("YES");
      v24 = v16;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = self;
      _os_log_error_impl(&dword_1906E0000, v15, OS_LOG_TYPE_ERROR, "finishedVerifyingSignedDataForRequest called but no block! {requestUUID: %@, sucess: %@, error: %@, self: %@}", buf, 0x2Au);
    }
  }

}

- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSMutableDictionary *completionBlocksByRequestID;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  int64_t v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  _IDSService *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_IDSService.m"), 3266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (objc_msgSend(v11, "FZIDType") == 4)
  {
    -[_IDSService _accountWithURI:orPseudonym:](self, "_accountWithURI:orPseudonym:", v12, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v12)
    {
      if (!v14)
        goto LABEL_15;
    }
    else
    {
      objc_msgSend(0, "prefixedURI");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_IDSService _sendingAccountForAccount:destination:fromID:](self, "_sendingAccountForAccount:destination:fromID:", 0, 0, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      -[_IDSService _preferredURIForAccount:](self, "_preferredURIForAccount:", v17);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void *)v17;
      if (!v17)
        goto LABEL_15;
    }
    if (v12)
    {
      v36 = a3;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = sub_190792328;
      v37[3] = &unk_1E2C604E8;
      v18 = v13;
      v38 = v18;
      v19 = MEMORY[0x19400FE1C](v37);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      completionBlocksByRequestID = self->_completionBlocksByRequestID;
      if (!completionBlocksByRequestID)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v23 = self->_completionBlocksByRequestID;
        self->_completionBlocksByRequestID = Mutable;

        completionBlocksByRequestID = self->_completionBlocksByRequestID;
      }
      v24 = (void *)MEMORY[0x1E0D36A98];
      v25 = (void *)MEMORY[0x19400FE1C](v18);
      v35 = (void *)v19;
      v26 = (void *)MEMORY[0x19400FE1C](v19);
      objc_msgSend(v24, "pairWithFirst:second:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](completionBlocksByRequestID, "setObject:forKey:", v27, v20);

      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v40 = v11;
        v41 = 2112;
        v42 = v12;
        v43 = 2112;
        v44 = v20;
        v45 = 2112;
        v46 = self;
        _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_DEFAULT, "reportApprovalOfURI called {tempURI: %@, fromURI: %@, requestID: %@, self: %@}", buf, 0x2Au);
      }

      -[_IDSService daemonController](self, "daemonController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uniqueID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "reportAction:ofTempURI:fromURI:onAccount:requestUUID:", v36, v11, v12, v30, v20);

      v31 = v38;
      goto LABEL_18;
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      -[_IDSService accounts](self, "accounts");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v12;
      v41 = 2112;
      v42 = v33;
      _os_log_impl(&dword_1906E0000, v32, OS_LOG_TYPE_DEFAULT, "No account matched to report with -- returning nil {fromURI: %@, accounts: %@}", buf, 0x16u);

    }
    sub_190792098(400);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v13 + 2))(v13, v31);
LABEL_18:

    goto LABEL_19;
  }
  sub_190792098(400);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v13 + 2))(v13, v15);
LABEL_19:

}

- (void)finishedReportingRequestUUID:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  _IDSService *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  sub_19078FF44(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_completionBlocksByRequestID, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "first");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_completionBlocksByRequestID, "removeObjectForKey:", v6);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412802;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "finishedReportingRequestUUID called {requestUUID: %@, error:%@, self: %@}", (uint8_t *)&v12, 0x20u);
    }

    ((void (**)(_QWORD, void *))v9)[2](v9, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412802;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "finishedReportingRequestUUID called but no block {requestUUID: %@, error:%@, self: %@}", (uint8_t *)&v12, 0x20u);
    }

  }
}

- (BOOL)updateSubServices:(id)a3 forDevice:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSMutableDictionary *subServices;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
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
      sub_1907F75A8();

  }
  if (v7)
    goto LABEL_17;
  -[_IDSService devices](self, "devices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "_copyForEnumerating");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = v12;
  v7 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v7)
  {
    v14 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v7; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v13);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v16, "_internal", (_QWORD)v33);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isActive");

        if (v18)
        {
          v7 = v16;
          goto LABEL_16;
        }
      }
      v7 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_16:

  if (v7)
  {
LABEL_17:
    -[NSObject _internal](v7, "_internal", (_QWORD)v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uniqueIDOverride");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v20, "length"))
    {
      -[NSObject _internal](v7, "_internal");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "uniqueID");
      v22 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v22;
    }
    if (objc_msgSend(v20, "length"))
    {
      -[NSMutableDictionary objectForKey:](self->_subServices, "objectForKey:", v20);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23 != v6 && (-[NSObject isEqualToArray:](v23, "isEqualToArray:", v6) & 1) == 0)
      {
        subServices = self->_subServices;
        if (!subServices)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v27 = self->_subServices;
          self->_subServices = Mutable;

          subServices = self->_subServices;
        }
        -[NSMutableDictionary setObject:forKey:](subServices, "setObject:forKey:", v6, v20);
        -[_IDSService daemonController](self, "daemonController");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSAccountController _internal](self->_accountController, "_internal");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "serviceName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "updateSubServices:forService:deviceUniqueID:", v6, v30, v20);

        v31 = 1;
        goto LABEL_28;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_1907F7528(v7, v24);
    }
    v31 = 0;
LABEL_28:

    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1907F74FC();
  v31 = 0;
LABEL_29:

  return v31;
}

- (void)resendSubServicesToDaemonForCurrentDevice
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F7660();

  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1907F7634();

  -[_IDSService devices](self, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "_copyForEnumerating");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v8;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "_internal", (_QWORD)v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isActive");

        if (v15)
        {
          v10 = v13;
          goto LABEL_17;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_17:

  if (v10)
  {
    objc_msgSend(v10, "_internal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uniqueIDOverride");
    v17 = objc_claimAutoreleasedReturnValue();

    if (!-[NSObject length](v17, "length"))
    {
      objc_msgSend(v10, "_internal");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uniqueID");
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = v19;
    }
    if (-[NSObject length](v17, "length", (_QWORD)v24))
    {
      -[NSMutableDictionary objectForKey:](self->_subServices, "objectForKey:", v17);
      v20 = objc_claimAutoreleasedReturnValue();
      -[_IDSService daemonController](self, "daemonController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSAccountController _internal](self->_accountController, "_internal");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "serviceName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "updateSubServices:forService:deviceUniqueID:", v20, v23, v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1907F7528(v10, v20);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1907F74FC();
  }

}

- (void)setProtobufAction:(SEL)a3 forProtobufType:(unsigned __int16)a4 isResponse:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  void *v9;
  int v10;
  NSObject *v11;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *protobufSelectors;
  void *v14;
  void *v15;
  void *v16;
  os_activity_scope_state_s state;
  NSObject *v18;
  uint64_t v19;

  v5 = a5;
  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v18 = _os_activity_create(&dword_1906E0000, "Framework Set Protobuf Action", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v18, &state);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "assertQueueIsCurrent");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      objc_claimAutoreleasedReturnValue();
      sub_1907F76EC();
    }

  }
  if (a3)
  {
    if (!self->_protobufSelectors)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      protobufSelectors = self->_protobufSelectors;
      self->_protobufSelectors = Mutable;

    }
    v14 = (void *)MEMORY[0x19400FC60]();
    objc_msgSend(MEMORY[0x1E0D34E08], "keyRepresentationForType:isResponse:", v6, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_protobufSelectors, "setObject:forKey:", v16, v15);

    objc_autoreleasePoolPop(v14);
  }
  os_activity_scope_leave(&state);
  cut_arc_os_release();

}

- (SEL)protobufActionForType:(unsigned __int16)a3 isResponse:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  os_activity_scope_state_s state;
  NSObject *v16;
  uint64_t v17;

  v4 = a4;
  v5 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v16 = _os_activity_create(&dword_1906E0000, "Framework Get Protobuf Action", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v16, &state);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      objc_claimAutoreleasedReturnValue();
      sub_1907F7738();
    }

  }
  v10 = (void *)MEMORY[0x19400FC60]();
  objc_msgSend(MEMORY[0x1E0D34E08], "keyRepresentationForType:isResponse:", v5, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_protobufSelectors, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (const char *)objc_msgSend(v12, "pointerValue");

  objc_autoreleasePoolPop(v10);
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v13;
}

- (BOOL)canSendMessageWithAccount:(id)a3 toDestination:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Attempting To Send message from account %@ to destinations %@", buf, 0x16u);
  }

  -[IDSAccountController _internal](self->_accountController, "_internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.idscredentials")) & 1) != 0
    || (objc_msgSend(v10, "isEqualToIgnoringCase:", CFSTR("com.apple.private.alloy.pbbridge")) & 1) != 0)
  {
    goto LABEL_22;
  }
  if (!self->_clientIsSandboxed)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F7784();

  }
  if (objc_msgSend(v6, "accountType") == 2)
  {
    objc_msgSend(v7, "destinationURIs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 < 2)
    {
      objc_msgSend(v7, "destinationURIs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "__imFirstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_stripFZIDPrefix");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "_appearsToBeEmail") & 1) != 0)
      {

      }
      else
      {
        objc_msgSend(v7, "destinationURIs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allObjects");
        v28 = v17;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "__imFirstObject");
        v27 = v16;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_stripFZIDPrefix");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v22, "_appearsToBePhoneNumber");

        if ((v26 & 1) == 0)
        {
          v23 = !-[_IDSService _isDroppingMessages](self, "_isDroppingMessages");
          goto LABEL_23;
        }
      }
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v15 = "Attempting to send to a remote destination from a local account, this is permited if proxy is permitted and "
            "will fail in the daemon if not";
      goto LABEL_20;
    }
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Attempting to send to more than 1 destination, this message will fail in the daemon if necessary";
LABEL_20:
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
  }
  else
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Attempting to send on a non local account, this message is allowed to progress";
      goto LABEL_20;
    }
  }
LABEL_21:

LABEL_22:
  LOBYTE(v23) = 1;
LABEL_23:

  return v23;
}

- (id)_preferredURIForAccount:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0D34EA8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "aliasStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IDSService serviceProperties](self, "serviceProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _IDSPrefersPhoneNumbersForServiceIdentifier();
  v10 = (void *)_IDSCopyCallerID();
  v11 = (void *)objc_msgSend(v6, "initWithUnprefixedURI:", v10);

  return v11;
}

- (id)_sendingAccountForAccount:(id)a3
{
  return -[_IDSService _sendingAccountForAccount:destination:fromID:](self, "_sendingAccountForAccount:destination:fromID:", a3, 0, 0);
}

- (id)_sendingAccountForAccount:(id)a3 destination:(id)a4 fromID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  id v60;
  id v61;
  char v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(v8, "_internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serviceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.madrid")) & 1) != 0)
    {
LABEL_11:

LABEL_12:
      v21 = v8;
      goto LABEL_59;
    }
    objc_msgSend(v8, "_internal");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serviceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.madrid.lite")) & 1) != 0)
    {
LABEL_10:

      goto LABEL_11;
    }
    v80 = v10;
    objc_msgSend(v8, "_internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.private.alloy.biz")) & 1) != 0)
    {
LABEL_9:

      v10 = v80;
      goto LABEL_10;
    }
    v84 = v15;
    objc_msgSend(v8, "_internal");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "serviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.private.alloy.sms")) & 1) != 0)
    {
LABEL_8:

      v15 = v84;
      goto LABEL_9;
    }
    v82 = v16;
    v77 = v17;
    objc_msgSend(v8, "_internal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serviceName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.private.alloy.facetime.multi")) & 1) != 0)
    {

      v17 = v77;
      v16 = v82;
      goto LABEL_8;
    }
    v75 = v20;
    v76 = v19;
    objc_msgSend(v8, "_internal");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "serviceName");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v73, "isEqualToString:", CFSTR("com.apple.private.alloy.facetime.audio")) & 1) != 0)
    {
      v63 = 1;
    }
    else
    {
      objc_msgSend(v8, "_internal");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "serviceName");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v71, "isEqualToString:", CFSTR("com.apple.private.alloy.facetime.video")) & 1) != 0)
      {
        v64 = 1;
      }
      else
      {
        objc_msgSend(v8, "_internal");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "serviceName");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v70, "isEqualToString:", CFSTR("com.apple.private.alloy.maps.eta")) & 1) != 0)
        {
          v64 = 1;
        }
        else
        {
          objc_msgSend(v8, "_internal");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "serviceName");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v68, "isEqualToString:", CFSTR("com.apple.private.alloy.nearby")) & 1) != 0)
          {
            v64 = 1;
          }
          else
          {
            objc_msgSend(v8, "_internal");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "serviceName");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v66, "isEqualToString:", CFSTR("com.apple.private.alloy.willow"));

          }
        }

      }
      v63 = v64;
    }

    v10 = v80;
    if ((v63 & 1) != 0)
      goto LABEL_12;
    v23 = v8;
  }
  else
  {
    -[_IDSService accounts](self, "accounts");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "anyObject");
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[IDSAccountController _internal](self->_accountController, "_internal");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "accounts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "__imArrayByFilteringWithBlock:", &unk_1E2C64020);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sortedArrayUsingComparator:", &unk_1E2C64060);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[_IDSService iCloudAccount](self, "iCloudAccount");
  v29 = objc_claimAutoreleasedReturnValue();
  v83 = (void *)v29;
  v85 = v28;
  if (v9 && (v30 = (void *)v29, objc_msgSend(v8, "accountType") != 2))
  {
    v78 = v9;
    v81 = v10;
    objc_msgSend(v9, "destinationURIs");
    v32 = v30;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "__imSetByApplyingBlock:", &unk_1E2C64080);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "mutableCopy");

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    objc_msgSend(v32, "handles");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v91 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "URI");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "unprefixedURI");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "removeObject:", v42);

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
      }
      while (v38);
    }

    v31 = objc_msgSend(v35, "count") != 0;
    v9 = v78;
    v10 = v81;
    v28 = v85;
  }
  else
  {
    v31 = 0;
  }
  objc_msgSend(v28, "__imArrayByFilteringWithBlock:", &unk_1E2C640A0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSService serviceProperties](self, "serviceProperties");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "identifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = _IDSPrefersPhoneNumbersForServiceIdentifier();

  if (v46 && objc_msgSend(v43, "count"))
  {
    objc_msgSend(v43, "firstObject");
    v47 = (id)objc_claimAutoreleasedReturnValue();
    v48 = v85;
LABEL_38:
    v49 = v83;
    goto LABEL_39;
  }
  v49 = v83;
  if (!v83 || v31 && (objc_msgSend(v83, "isUsableForOuterMessaging") & 1) == 0 && objc_msgSend(v43, "count"))
  {
    v48 = v85;
    if (!objc_msgSend(v85, "count"))
      goto LABEL_40;
    v50 = v10;
    objc_msgSend(v43, "firstObject");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
    {
      v53 = v51;
    }
    else
    {
      objc_msgSend(v85, "firstObject");
      v53 = (id)objc_claimAutoreleasedReturnValue();
    }
    v47 = v53;

    v23 = v52;
    v10 = v50;
    goto LABEL_38;
  }
  v47 = v83;
  v48 = v85;
LABEL_39:

  v23 = v47;
LABEL_40:
  if (v10 && !-[_IDSService _canAccount:sendWithFromID:](self, "_canAccount:sendWithFromID:", v23, v10))
  {
    if (v23 == v49 || !-[_IDSService _canAccount:sendWithFromID:](self, "_canAccount:sendWithFromID:", v49, v10))
    {
      v55 = v10;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v54 = v48;
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
      if (v56)
      {
        v57 = v56;
        v79 = v9;
        v58 = *(_QWORD *)v87;
        while (2)
        {
          for (j = 0; j != v57; ++j)
          {
            if (*(_QWORD *)v87 != v58)
              objc_enumerationMutation(v54);
            v60 = *(id *)(*((_QWORD *)&v86 + 1) + 8 * j);
            if (v23 != v60
              && -[_IDSService _canAccount:sendWithFromID:](self, "_canAccount:sendWithFromID:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j), v55))
            {
              v61 = v60;

              v23 = v61;
              goto LABEL_56;
            }
          }
          v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
          if (v57)
            continue;
          break;
        }
LABEL_56:
        v9 = v79;
        v10 = v55;
        v49 = v83;
        v48 = v85;
      }
    }
    else
    {
      v54 = v23;
      v23 = v49;
    }

  }
  v21 = v23;

LABEL_59:
  return v21;
}

- (BOOL)_canAccount:(id)a3 sendWithFromID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)IDSCopyRawAddressForDestination(v6);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "aliasStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v12), "_stripFZIDPrefix");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v7, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
        goto LABEL_19;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  if (!objc_msgSend(v6, "_appearsToBePseudonymID"))
  {
    LOBYTE(v15) = 0;
    goto LABEL_21;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v5, "pseudonyms", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v23;
LABEL_12:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v16)
        objc_enumerationMutation(v8);
      objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "URI");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "prefixedURI");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v7, "isEqualToString:", v19);

      if ((v20 & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v15)
          goto LABEL_12;
        goto LABEL_20;
      }
    }
LABEL_19:
    LOBYTE(v15) = 1;
  }
LABEL_20:

LABEL_21:
  return v15;
}

- (BOOL)sendOpportunisticData:(id)a3 options:(id)a4 identifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  __CFString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (__CFString *)a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "assertQueueIsCurrent");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1907F77B0();

  }
  if (!v12)
    v12 = CFSTR("Default");
  if (a6)
    *a6 = 0;
  objc_msgSend(v11, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSService _sendingAccountForAccount:](self, "_sendingAccountForAccount:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uniqueID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D34D40], "opportunistic");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412802;
    v25 = v12;
    v26 = 2112;
    v27 = v11;
    v28 = 2048;
    v29 = objc_msgSend(v10, "length");
    _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Client request to send opportunistic data {identifier: %@, options: %@, dataLength: %llu}", (uint8_t *)&v24, 0x20u);
  }
  if (!v16)
    v16 = (void *)MEMORY[0x1E0C9AA70];

  -[_IDSService daemonController](self, "daemonController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccountController _internal](self->_accountController, "_internal");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "serviceName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendOpportunisticData:onService:usingAccountWithUniqueID:withIdentifier:options:", v10, v22, v18, v12, v16);

  return 1;
}

- (BOOL)cancelOpportunisticDataWithIdentifier:(id)a3 error:(id *)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("Default");
  if (a4)
    *a4 = 0;
  -[IDSAccountController _internal](self->_accountController, "_internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D34D40], "opportunistic");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Client request to cancel opportunistic data {identifier: %@, serviceName: %@}", (uint8_t *)&v13, 0x16u);
  }

  -[_IDSService daemonController](self, "daemonController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancelOpportunisticDataOnService:withIdentifier:", v9, v7);

  return 1;
}

- (void)sendEncryptedOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFDictionary *v31;
  const void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  NSMutableDictionary *completionBlocksByRequestID;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _IDSService *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  __CFDictionary *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  _QWORD v99[4];

  v99[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v70 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v10, "assertQueueIsCurrent");

  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F783C();

  }
  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v8, "recipientURI");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prefixedURI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithObjects:", v14, 0);

  objc_msgSend(v8, "senderURI");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "prefixedURI");
  v17 = (const void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D34D18];
  if (v17)
  {
    objc_msgSend(v15, "setByAddingObject:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "destinationWithDestinations:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v15);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v78 = (void *)v20;
  -[_IDSService _sendingAccountForAccount:destination:fromID:](self, "_sendingAccountForAccount:destination:fromID:", 0, v20, v17);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "_internal");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "uniqueID");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "identifier");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v22, (const void *)*MEMORY[0x1E0D34A60], v23);

  objc_msgSend(v8, "encryptionProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "segmentNumber");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    CFDictionarySetValue(v22, (const void *)*MEMORY[0x1E0D348E8], v25);

  objc_msgSend(v8, "encryptionProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "totalSegments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    CFDictionarySetValue(v22, (const void *)*MEMORY[0x1E0D34C68], v27);
  v72 = v15;

  objc_msgSend(v9, "originalUUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    CFDictionarySetValue(v22, (const void *)*MEMORY[0x1E0D34A40], v28);
  v74 = v22;

  v29 = (void *)MEMORY[0x1E0C99E08];
  v73 = v9;
  objc_msgSend(v9, "dictionaryRepresentation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dictionaryWithDictionary:", v30);
  v31 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();

  CFDictionarySetValue(v31, CFSTR("IDSSendMessageOptionTopLevelDictionary"), MEMORY[0x1E0C9AAB0]);
  if (v17)
    CFDictionarySetValue(v31, CFSTR("IDSSendMessageOptionFromID"), v17);
  v32 = (const void *)MEMORY[0x1E0C9AAB0];
  CFDictionarySetValue(v31, CFSTR("IDSSendMessageOptionWantsResponse"), MEMORY[0x1E0C9AAB0]);
  CFDictionarySetValue(v31, CFSTR("IDSSendMessageOptionWantsDeliveryStatus"), v32);
  v33 = (void *)MEMORY[0x1E0C99E60];
  v99[0] = *MEMORY[0x1E0D34B70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWithArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
    CFDictionarySetValue(v31, CFSTR("IDSSendMessageOptionRequireAllRegistrationProperties"), v35);

  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v36 = objc_claimAutoreleasedReturnValue();
  v71 = (void *)v17;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "payload");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "debugDescription");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encryptionProperties");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "segmentNumber");
    v68 = self;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encryptionProperties");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "totalSegments");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v90 = v76;
    v91 = 2112;
    v92 = v78;
    v93 = 2112;
    v94 = v38;
    v95 = 2112;
    v96 = v40;
    v97 = 2112;
    v98 = v42;
    _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "sendMessageLite with identifier: %@ destination: %@ - Message {pn: %@, tp: %@, p: %@}", buf, 0x34u);

    self = v68;
  }

  if (-[_IDSService canSendMessageWithAccount:toDestination:](self, "canSendMessageWithAccount:toDestination:", v77, v78))
  {
    if (v75)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_uniqueIDToConnection, "objectForKeyedSubscript:");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        v44 = v43;
        -[NSObject _internal](v43, "_internal");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v76;
        v87 = 0;
        objc_msgSend(v45, "sendMessage:toDestinations:priority:options:identifier:error:", v74, v78, 300, v31, &v88, &v87);
        v46 = v88;

        v69 = v87;
        v76 = v46;
        goto LABEL_33;
      }
    }
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v77, "_internal");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v90 = v49;
      _os_log_impl(&dword_1906E0000, v48, OS_LOG_TYPE_DEFAULT, "sendMessageLite - Could not find connection for account %@", buf, 0xCu);

    }
    -[_IDSService _logConnectionMap](self, "_logConnectionMap");
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSAccountController _internal](self->_accountController, "_internal");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "accounts");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v90 = v51;
      _os_log_impl(&dword_1906E0000, v44, OS_LOG_TYPE_DEFAULT, "sendMessageLite - All accounts %@", buf, 0xCu);

    }
  }
  else
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v77, "_internal");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v90 = v47;
      _os_log_impl(&dword_1906E0000, v44, OS_LOG_TYPE_DEFAULT, "sendMessageLite - Unable to send message to this destination from this account %@", buf, 0xCu);

    }
  }
  v69 = 0;
LABEL_33:

  v52 = MEMORY[0x1E0C809B0];
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = sub_19079498C;
  v83[3] = &unk_1E2C60EC8;
  v53 = v70;
  v86 = v53;
  v54 = v8;
  v84 = v54;
  v55 = v76;
  v85 = v55;
  v56 = (void *)MEMORY[0x19400FE1C](v83);
  v79[0] = v52;
  v79[1] = 3221225472;
  v79[2] = sub_190794A00;
  v79[3] = &unk_1E2C640C8;
  v57 = v53;
  v82 = v57;
  v58 = v54;
  v80 = v58;
  v59 = v55;
  v81 = v59;
  v60 = (void *)MEMORY[0x19400FE1C](v79);
  completionBlocksByRequestID = self->_completionBlocksByRequestID;
  if (!completionBlocksByRequestID)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v63 = self->_completionBlocksByRequestID;
    self->_completionBlocksByRequestID = Mutable;

    completionBlocksByRequestID = self->_completionBlocksByRequestID;
  }
  v64 = (void *)MEMORY[0x1E0D36A98];
  v65 = (void *)MEMORY[0x19400FE1C](v60);
  v66 = (void *)MEMORY[0x19400FE1C](v56);
  objc_msgSend(v64, "pairWithFirst:second:", v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](completionBlocksByRequestID, "setObject:forKey:", v67, v59);

}

- (void)sendServiceUpdateMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFDictionary *v25;
  const void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  NSMutableDictionary *completionBlocksByRequestID;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v56 = a5;
  v9 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v10, "assertQueueIsCurrent");

  if ((_DWORD)a4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F78C8();

  }
  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v8, "recipientURI");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prefixedURI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithObjects:", v14, 0);

  objc_msgSend(v8, "senderURI");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "prefixedURI");
  v17 = (const void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D34D18];
  if (v17)
  {
    objc_msgSend(v15, "setByAddingObject:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "destinationWithDestinations:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v15);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v59 = v15;
  -[_IDSService _sendingAccountForAccount:destination:fromID:](self, "_sendingAccountForAccount:destination:fromID:", 0, v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_internal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "uniqueID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v9, "dictionaryRepresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "dictionaryWithDictionary:", v24);
  v25 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();

  CFDictionarySetValue(v25, CFSTR("IDSSendMessageOptionTopLevelDictionary"), MEMORY[0x1E0C9AAB0]);
  if (v17)
    CFDictionarySetValue(v25, CFSTR("IDSSendMessageOptionFromID"), v17);
  v58 = (void *)v17;
  v26 = (const void *)MEMORY[0x1E0C9AAB0];
  CFDictionarySetValue(v25, CFSTR("IDSSendMessageOptionSkipPayloadCheck"), MEMORY[0x1E0C9AAB0]);
  CFDictionarySetValue(v25, CFSTR("IDSSendMessageOptionForceEncryptionOff"), v26);
  CFDictionarySetValue(v25, CFSTR("IDSSendMessageOptionWantsResponse"), v26);
  CFDictionarySetValue(v25, CFSTR("IDSSendMessageOptionWantsCertifiedDelivery"), v26);
  CFDictionarySetValue(v25, CFSTR("IDSSendMessageOptionCommand"), &unk_1E2CAE2E8);
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v27 = objc_claimAutoreleasedReturnValue();
  v61 = v21;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "senderURI");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recipientURI");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v73 = v20;
    v74 = 2112;
    v75 = v28;
    v76 = 2112;
    v77 = v29;
    v78 = 2048;
    v79 = objc_msgSend(v8, "preferredServiceType");
    _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, "sendServiceUpdateMessage with destination: %@ - Message {senderURI: %@, recipientURI: %@, preferredServiceType: %ld}", buf, 0x2Au);

    v21 = v61;
  }

  if (-[_IDSService canSendMessageWithAccount:toDestination:](self, "canSendMessageWithAccount:toDestination:", v21, v20))
  {
    if (v60)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_uniqueIDToConnection, "objectForKeyedSubscript:");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = v30;
        -[NSObject _internal](v30, "_internal");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 0;
        v71 = 0;
        objc_msgSend(v32, "sendMessage:toDestinations:priority:options:identifier:error:", 0, v20, 300, v25, &v71, &v70);
        v33 = v71;
        v55 = v70;

        goto LABEL_23;
      }
    }
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v21, "_internal");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v73 = (uint64_t)v36;
      _os_log_impl(&dword_1906E0000, v35, OS_LOG_TYPE_DEFAULT, "sendServiceUpdateMessage - Could not find connection for account %@", buf, 0xCu);

    }
    -[_IDSService _logConnectionMap](self, "_logConnectionMap");
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSAccountController _internal](self->_accountController, "_internal");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "accounts");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v73 = (uint64_t)v38;
      _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "sendServiceUpdateMessage - All accounts %@", buf, 0xCu);

    }
  }
  else
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v21, "_internal");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v73 = (uint64_t)v34;
      _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "sendServiceUpdateMessage - Unable to send message to this destination from this account %@", buf, 0xCu);

    }
  }
  v55 = 0;
  v33 = 0;
LABEL_23:
  v57 = (void *)v20;

  v39 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = sub_190795128;
  v66[3] = &unk_1E2C60EC8;
  v40 = v56;
  v69 = v40;
  v41 = v8;
  v67 = v41;
  v42 = v33;
  v68 = v42;
  v43 = (void *)MEMORY[0x19400FE1C](v66);
  v62[0] = v39;
  v62[1] = 3221225472;
  v62[2] = sub_19079519C;
  v62[3] = &unk_1E2C640C8;
  v44 = v40;
  v65 = v44;
  v45 = v41;
  v63 = v45;
  v46 = v42;
  v64 = v46;
  v47 = (void *)MEMORY[0x19400FE1C](v62);
  completionBlocksByRequestID = self->_completionBlocksByRequestID;
  if (!completionBlocksByRequestID)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v50 = self->_completionBlocksByRequestID;
    self->_completionBlocksByRequestID = Mutable;

    completionBlocksByRequestID = self->_completionBlocksByRequestID;
  }
  v51 = (void *)MEMORY[0x1E0D36A98];
  v52 = (void *)MEMORY[0x19400FE1C](v47);
  v53 = (void *)MEMORY[0x19400FE1C](v43);
  objc_msgSend(v51, "pairWithFirst:second:", v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](completionBlocksByRequestID, "setObject:forKey:", v54, v46);

}

- (BOOL)sendMessage:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  NSObject *v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  int64_t v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  const __CFString *v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "assertQueueIsCurrent");

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1907F7954();

  }
  if (!self->_pretendingToBeFull)
  {
    v51 = a6;
    v54 = v15;
    v55 = v18;
    v53 = v17;
    objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v17);
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "destinationURIs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v58;
LABEL_9:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v58 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v27);
        if (!objc_msgSend(v28, "_FZIDType"))
        {
          -[_IDSService serviceProperties](self, "serviceProperties");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "wantsPhoneNumberAccount");

          if ((v30 & 1) == 0)
            break;
        }
        if (v25 == ++v27)
        {
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
          if (v25)
            goto LABEL_9;
          goto LABEL_16;
        }
      }
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        -[_IDSService serviceProperties](self, "serviceProperties");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v68 = v28;
        v69 = 2112;
        v70 = v40;
        _os_log_impl(&dword_1906E0000, v38, OS_LOG_TYPE_DEFAULT, "sendMessage - Unable to send message to %@ on service %@ since phone number accounts are disabled", buf, 0x16u);

      }
      v17 = v53;
      v15 = v54;
      v18 = v55;
      v31 = v56;
      if (a9)
      {
        v65 = *MEMORY[0x1E0CB2D50];
        v66 = CFSTR("Sending to a phone number when service does not support phone numbers. File a radar to IDS | New Bugs to request phone number access.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v41 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 44, v41);
        v22 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        v34 = (void *)v41;
        v32 = v16;
        goto LABEL_38;
      }
      v22 = 0;
      goto LABEL_39;
    }
LABEL_16:

    v18 = v55;
    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionFromID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v56;
    -[_IDSService _sendingAccountForAccount:destination:fromID:](self, "_sendingAccountForAccount:destination:fromID:", v16, v56, v23);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "_internal");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "uniqueID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_IDSService canSendMessageWithAccount:toDestination:](self, "canSendMessageWithAccount:toDestination:", v32, v56))
    {
      v15 = v54;
      if (v34
        && (-[NSMutableDictionary objectForKeyedSubscript:](self->_uniqueIDToConnection, "objectForKeyedSubscript:", v34), (v35 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v36 = v35;
        objc_msgSend(v35, "_internal");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v37, "sendMessage:toDestinations:priority:options:identifier:error:", v54, v56, v51, v55, a8, a9);

        v17 = v53;
      }
      else
      {
        +[IDSLogging _IDSService](IDSLogging, "_IDSService", v34);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v32, "_internal");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v68 = v46;
          _os_log_impl(&dword_1906E0000, v45, OS_LOG_TYPE_DEFAULT, "sendMessage - Could not find connection for account %@", buf, 0xCu);

        }
        -[_IDSService _logConnectionMap](self, "_logConnectionMap");
        +[IDSLogging _IDSService](IDSLogging, "_IDSService");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          -[IDSAccountController _internal](self->_accountController, "_internal");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "accounts");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v68 = v49;
          _os_log_impl(&dword_1906E0000, v47, OS_LOG_TYPE_DEFAULT, "sendMessage - All accounts %@", buf, 0xCu);

          v18 = v55;
        }

        v17 = v53;
        v31 = v56;
        if (!a9)
        {
          v22 = 0;
          v34 = v52;
          goto LABEL_38;
        }
        v63 = *MEMORY[0x1E0CB2D50];
        v64 = CFSTR("Could not find valid account");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 7, v36);
        v22 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        v34 = v52;
      }
    }
    else
    {
      v42 = v34;
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v43 = objc_claimAutoreleasedReturnValue();
      v15 = v54;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v32, "_internal");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v68 = v44;
        _os_log_impl(&dword_1906E0000, v43, OS_LOG_TYPE_DEFAULT, "sendMessage - Unable to send message to this destination from this account %@", buf, 0xCu);

      }
      v17 = v53;
      if (!a9)
      {
        v22 = 0;
        v34 = v42;
        goto LABEL_38;
      }
      v61 = *MEMORY[0x1E0CB2D50];
      v62 = CFSTR("Destination device is not active for this account");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 37, v36);
      v22 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
      v34 = v42;
    }

LABEL_38:
    v16 = v32;
LABEL_39:

    goto LABEL_40;
  }
  -[_IDSService _handlePretendingToBeFullWithIdentifier:](self, "_handlePretendingToBeFullWithIdentifier:", a8);
  v22 = 1;
LABEL_40:

  return v22;
}

- (BOOL)cancelMessageWithOptions:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "assertQueueIsCurrent");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907F79E0();

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionFromID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionQueueOneIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4)
      *a4 = objc_retainAutorelease(v14);
    -[IDSServiceProperties pushTopic](self->_serviceProperties, "pushTopic");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSService _sendingAccountForAccount:](self, "_sendingAccountForAccount:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138413314;
      v24 = v16;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "cancelMessageWithOptions { service: %@  fromID: %@  queueOneIdentifier: %@  guid: %@ accountUniqueID: %@ }", (uint8_t *)&v23, 0x34u);
    }

    -[_IDSService daemonController](self, "daemonController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cancelMessageWithQueueOneIdentifier:fromID:service:accountUniqueID:messageIdentifier:", v13, v12, v16, v18, v15);

    goto LABEL_13;
  }
  if (a5)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    v34[0] = CFSTR("Cannot cancel message without a queue one identifier.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 28, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  }
  return v13 != 0;
}

- (BOOL)cancelMessageWithOptions:(id)a3 destination:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = a3;
  objc_msgSend(v10, "setWithObject:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[_IDSService cancelMessageWithOptions:destinations:identifier:error:](self, "cancelMessageWithOptions:destinations:identifier:error:", v11, v12, a5, a6);

  return (char)a6;
}

- (BOOL)cancelMessageWithOptions:(id)a3 destinations:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void *v24;
  void *v25;
  const __CFString **v26;
  uint64_t *v27;
  void *v28;
  NSObject *v29;
  __CFDictionary *v30;
  const void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "assertQueueIsCurrent");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1907F7A6C();

  }
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionFromID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionQueueOneIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (v11 && objc_msgSend(v11, "count"))
      {
        -[IDSServiceProperties pushTopic](self->_serviceProperties, "pushTopic");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionAlwaysIncludeSelfKey"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = (void *)MEMORY[0x1E0D34D18];
          if (v18)
          {
            objc_msgSend(v11, "setByAddingObject:", v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "destinationWithDestinations:", v20);
            v21 = objc_claimAutoreleasedReturnValue();

            v22 = v21;
            goto LABEL_21;
          }
        }
        else
        {
          v19 = (void *)MEMORY[0x1E0D34D18];
        }
        objc_msgSend(v19, "destinationWithDestinations:", v11);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        -[_IDSService _sendingAccountForAccount:destination:fromID:](self, "_sendingAccountForAccount:destination:fromID:", 0, v22, v15);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "_internal");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "uniqueID");
        v41 = objc_claimAutoreleasedReturnValue();

        +[IDSLogging _IDSService](IDSLogging, "_IDSService");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v45 = v17;
          v46 = 2112;
          v47 = v15;
          v48 = 2112;
          v49 = v16;
          v50 = 2112;
          v51 = v22;
          _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_DEFAULT, "cancelMessageWithOptions { service: %@  fromID: %@  queueOneIdentifier: %@  idsDestination: %@ }", buf, 0x2Au);
        }
        v40 = (void *)v22;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
        v30 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
        v31 = (const void *)MEMORY[0x1E0C9AAB0];
        CFDictionarySetValue(v30, CFSTR("IDSSendMessageOptionTopLevelDictionary"), MEMORY[0x1E0C9AAB0]);
        CFDictionarySetValue(v30, CFSTR("IDSSendMessageOptionSkipPayloadCheck"), v31);
        CFDictionarySetValue(v30, CFSTR("IDSSendMessageOptionForceEncryptionOff"), v31);
        CFDictionarySetValue(v30, CFSTR("IDSSendMessageOptionCommand"), &unk_1E2CAE300);
        CFDictionarySetValue(v30, CFSTR("IDSSendMessageOptionWantsResponse"), v31);
        v32 = (void *)v41;
        if (v41
          && (-[NSMutableDictionary objectForKeyedSubscript:](self->_uniqueIDToConnection, "objectForKeyedSubscript:", v41), (v33 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v34 = v33;
          objc_msgSend(v33, "_internal");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v35, "sendMessage:toDestinations:priority:options:identifier:error:", 0, v40, 300, v30, a5, a6);

        }
        else
        {
          if (!a6)
          {
            v23 = 0;
            v37 = v40;
            goto LABEL_30;
          }
          v36 = (void *)MEMORY[0x1E0CB35C8];
          v42 = *MEMORY[0x1E0CB2D50];
          v43 = CFSTR("Could not find valid account to cancel message.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 7, v34);
          v23 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

        v37 = v40;
        v32 = (void *)v41;
LABEL_30:

        goto LABEL_31;
      }
      if (a6)
      {
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v52 = *MEMORY[0x1E0CB2D50];
        v53 = CFSTR("Cannot cancel message without a destination.");
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v53;
        v27 = &v52;
LABEL_17:
        objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 28, v17);
        v23 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

        goto LABEL_32;
      }
    }
    else if (a6)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v54 = *MEMORY[0x1E0CB2D50];
      v55[0] = CFSTR("Cannot cancel message without a queue one identifier.");
      v25 = (void *)MEMORY[0x1E0C99D80];
      v26 = (const __CFString **)v55;
      v27 = &v54;
      goto LABEL_17;
    }
    v23 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v23 = -[_IDSService cancelMessageWithOptions:identifier:error:](self, "cancelMessageWithOptions:identifier:error:", v10, a5, a6);
LABEL_33:

  return v23;
}

- (BOOL)sendProtobuf:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  char v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  id v57;
  id v58;
  void *v59;
  _IDSService *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  os_activity_scope_state_s state;
  NSObject *v72;
  uint64_t v73;
  const __CFString *v74;
  uint8_t v75[4];
  void *v76;
  __int16 v77;
  void *v78;
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v13 = a4;
  v14 = a5;
  v58 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v72 = _os_activity_create(&dword_1906E0000, "Framework Send Protobuf", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v72, &state);
  OSLogHandleForTransportCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  v61 = self;
  v59 = v13;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v81 = v16;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "!setState priority=%@", buf, 0xCu);

  }
  if (a8)
  {
    OSLogHandleForTransportCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *a8;
      *(_DWORD *)buf = 138412290;
      v81 = v18;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "!setState guid=%@", buf, 0xCu);
    }

  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v68 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        OSLogHandleForTransportCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v23;
          _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "!setState destination=%@", buf, 0xCu);
        }

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    }
    while (v20);
  }

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "assertQueueIsCurrent");

  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      objc_claimAutoreleasedReturnValue();
      sub_1907F7AF8();
    }

  }
  if (!self->_pretendingToBeFull)
  {
    objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v19);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "destinationURIs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v64;
LABEL_24:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v64 != v31)
          objc_enumerationMutation(v29);
        v33 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v32);
        if (!objc_msgSend(v33, "_FZIDType"))
        {
          -[_IDSService serviceProperties](v61, "serviceProperties");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "wantsPhoneNumberAccount");

          if ((v35 & 1) == 0)
            break;
        }
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
          if (v30)
            goto LABEL_24;
          goto LABEL_31;
        }
      }
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        -[_IDSService serviceProperties](v61, "serviceProperties");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v75 = 138412546;
        v76 = v33;
        v77 = 2112;
        v78 = v44;
        _os_log_impl(&dword_1906E0000, v42, OS_LOG_TYPE_DEFAULT, "sendProtobuf - Unable to send message to %@ on service %@ since phone number accounts are disabled", v75, 0x16u);

      }
      if (a9)
      {
        v73 = *MEMORY[0x1E0CB2D50];
        v74 = CFSTR("Sending to a phone number when service does not support phone numbers. File a radar to IDS | New Bugs to request phone number access.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 44, v38);
        v28 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_52;
      }
      v28 = 0;
      goto LABEL_53;
    }
LABEL_31:

    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionFromID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSService _sendingAccountForAccount:destination:fromID:](v61, "_sendingAccountForAccount:destination:fromID:", v59, v62, v29);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "_internal");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "uniqueID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_IDSService canSendMessageWithAccount:toDestination:](v61, "canSendMessageWithAccount:toDestination:", v36, v62))
    {
      if (v38)
      {
        -[NSMutableDictionary objectForKey:](v61->_uniqueIDToConnection, "objectForKey:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39)
        {
          objc_msgSend(v39, "_internal");
          v41 = (id)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v41, "sendProtobuf:toDestinations:priority:options:identifier:error:", v57, v62, a6, v58, a8, a9);
          goto LABEL_51;
        }
      }
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v36, "_internal");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v75 = 138412290;
        v76 = v50;
        _os_log_impl(&dword_1906E0000, v49, OS_LOG_TYPE_DEFAULT, "sendProtobuf - Could not find connection for account %@", v75, 0xCu);

      }
      -[_IDSService _logConnectionMap](v61, "_logConnectionMap");
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        -[IDSAccountController _internal](v61->_accountController, "_internal");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "accounts");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v75 = 138412290;
        v76 = v53;
        _os_log_impl(&dword_1906E0000, v51, OS_LOG_TYPE_DEFAULT, "sendProtobuf - All accounts %@", v75, 0xCu);

      }
      v54 = objc_alloc(MEMORY[0x1E0C99D80]);
      v40 = (void *)objc_msgSend(v54, "initWithObjectsAndKeys:", CFSTR("Could not find valid account"), *MEMORY[0x1E0CB2D50], 0);
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 7, v40);
    }
    else
    {
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v36, "_internal");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v75 = 138412290;
        v76 = v46;
        _os_log_impl(&dword_1906E0000, v45, OS_LOG_TYPE_DEFAULT, "sendProtobuf - Unable to send protobuf to this destination from this account %@", v75, 0xCu);

      }
      v47 = objc_alloc(MEMORY[0x1E0C99D80]);
      v40 = (void *)objc_msgSend(v47, "initWithObjectsAndKeys:", CFSTR("Destination device is not active for this account"), *MEMORY[0x1E0CB2D50], 0);
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 37, v40);
    }
    v41 = v48;
    if (a9)
    {
      v41 = objc_retainAutorelease(v48);
      v28 = 0;
      *a9 = v41;
    }
    else
    {
      v28 = 0;
    }
LABEL_51:

    v59 = v36;
LABEL_52:

LABEL_53:
    goto LABEL_54;
  }
  -[_IDSService _handlePretendingToBeFullWithIdentifier:](self, "_handlePretendingToBeFullWithIdentifier:", a8);
  v28 = 1;
LABEL_54:
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v28;
}

- (void)_handlePretendingToBeFullWithIdentifier:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1907969F0;
  v9[3] = &unk_1E2C607A8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  NSObject *v29;
  char v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  id v59;
  id v60;
  void *v61;
  _IDSService *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  os_activity_scope_state_s state;
  NSObject *v74;
  uint64_t v75;
  const __CFString *v76;
  uint8_t v77[4];
  void *v78;
  __int16 v79;
  void *v80;
  uint8_t v81[128];
  uint8_t buf[4];
  id v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v13 = a4;
  v14 = a5;
  v60 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v74 = _os_activity_create(&dword_1906E0000, "Framework Send Data", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v74, &state);
  OSLogHandleForTransportCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  v63 = self;
  v61 = v13;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "serviceName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v83 = v16;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "!setState service=%@", buf, 0xCu);

  }
  OSLogHandleForTransportCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v83 = v18;
    _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "!setState priority=%@", buf, 0xCu);

  }
  if (a8)
  {
    OSLogHandleForTransportCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *a8;
      *(_DWORD *)buf = 138412290;
      v83 = v20;
      _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "!setState guid=%@", buf, 0xCu);
    }

  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v21 = v14;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v70 != v23)
          objc_enumerationMutation(v21);
        v25 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        OSLogHandleForTransportCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v25;
          _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "!setState destination=%@", buf, 0xCu);
        }

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v69, v84, 16);
    }
    while (v22);
  }

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "assertQueueIsCurrent");

  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      objc_claimAutoreleasedReturnValue();
      sub_1907F7B44();
    }

  }
  if (!v63->_pretendingToBeFull)
  {
    objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v21);
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "destinationURIs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v66;
LABEL_26:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v66 != v33)
          objc_enumerationMutation(v31);
        v35 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v34);
        if (!objc_msgSend(v35, "_FZIDType"))
        {
          -[_IDSService serviceProperties](v63, "serviceProperties");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "wantsPhoneNumberAccount");

          if ((v37 & 1) == 0)
            break;
        }
        if (v32 == ++v34)
        {
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
          if (v32)
            goto LABEL_26;
          goto LABEL_33;
        }
      }
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        -[_IDSService serviceProperties](v63, "serviceProperties");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v77 = 138412546;
        v78 = v35;
        v79 = 2112;
        v80 = v46;
        _os_log_impl(&dword_1906E0000, v44, OS_LOG_TYPE_DEFAULT, "sendData - Unable to send message to %@ on service %@ since phone number accounts are disabled", v77, 0x16u);

      }
      if (a9)
      {
        v75 = *MEMORY[0x1E0CB2D50];
        v76 = CFSTR("Sending to a phone number when service does not support phone numbers. File a radar to IDS | New Bugs to request phone number access.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 44, v40);
        v30 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_54;
      }
      v30 = 0;
      goto LABEL_55;
    }
LABEL_33:

    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionFromID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSService _sendingAccountForAccount:destination:fromID:](v63, "_sendingAccountForAccount:destination:fromID:", v61, v64, v31);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "_internal");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "uniqueID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_IDSService canSendMessageWithAccount:toDestination:](v63, "canSendMessageWithAccount:toDestination:", v38, v64))
    {
      if (v40)
      {
        -[NSMutableDictionary objectForKey:](v63->_uniqueIDToConnection, "objectForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v41)
        {
          objc_msgSend(v41, "_internal");
          v43 = (id)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v43, "sendData:toDestinations:priority:options:identifier:error:", v59, v64, a6, v60, a8, a9);
          goto LABEL_53;
        }
      }
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v38, "_internal");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v77 = 138412290;
        v78 = v52;
        _os_log_impl(&dword_1906E0000, v51, OS_LOG_TYPE_DEFAULT, "sendData - Could not find connection for account %@", v77, 0xCu);

      }
      -[_IDSService _logConnectionMap](v63, "_logConnectionMap");
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        -[IDSAccountController _internal](v63->_accountController, "_internal");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "accounts");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v77 = 138412290;
        v78 = v55;
        _os_log_impl(&dword_1906E0000, v53, OS_LOG_TYPE_DEFAULT, "sendData - All accounts %@", v77, 0xCu);

      }
      v56 = objc_alloc(MEMORY[0x1E0C99D80]);
      v42 = (void *)objc_msgSend(v56, "initWithObjectsAndKeys:", CFSTR("Could not find valid account"), *MEMORY[0x1E0CB2D50], 0);
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 7, v42);
    }
    else
    {
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v38, "_internal");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v77 = 138412290;
        v78 = v48;
        _os_log_impl(&dword_1906E0000, v47, OS_LOG_TYPE_DEFAULT, "sendData - Unable to send data to this destination from this account %@", v77, 0xCu);

      }
      v49 = objc_alloc(MEMORY[0x1E0C99D80]);
      v42 = (void *)objc_msgSend(v49, "initWithObjectsAndKeys:", CFSTR("Destination device is not active for this account"), *MEMORY[0x1E0CB2D50], 0);
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 37, v42);
    }
    v43 = v50;
    if (a9)
    {
      v43 = objc_retainAutorelease(v50);
      v30 = 0;
      *a9 = v43;
    }
    else
    {
      v30 = 0;
    }
LABEL_53:

    v61 = v38;
LABEL_54:

LABEL_55:
    goto LABEL_56;
  }
  -[_IDSService _handlePretendingToBeFullWithIdentifier:](v63, "_handlePretendingToBeFullWithIdentifier:", a8);
  v30 = 1;
LABEL_56:
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v30;
}

- (BOOL)sendAccessoryData:(id)a3 toAccessoryID:(id)a4 accessToken:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v43;
  id v45;
  id v46;
  os_activity_scope_state_s state;
  NSObject *v48;
  uint8_t v49[4];
  void *v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v13 = a4;
  v46 = a5;
  v14 = a6;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v48 = _os_activity_create(&dword_1906E0000, "Framework Send Accessory Data", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v48, &state);
  OSLogHandleForTransportCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v13;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "!setState accessoryID=%@", buf, 0xCu);
  }

  if (a7)
  {
    OSLogHandleForTransportCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *a7;
      *(_DWORD *)buf = 138412290;
      v52 = v17;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "!setState guid=%@", buf, 0xCu);
    }

  }
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "assertQueueIsCurrent");

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      objc_claimAutoreleasedReturnValue();
      sub_1907F7B90();
    }

  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v49 = 0;
    _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "Sending AccessoryData Now", v49, 2u);
  }

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionFromID"));
  v22 = objc_claimAutoreleasedReturnValue();
  -[_IDSService _sendingAccountForAccount:destination:fromID:](self, "_sendingAccountForAccount:destination:fromID:", 0, 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v22;
  objc_msgSend(v23, "_internal");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "uniqueID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[NSMutableDictionary objectForKey:](self->_uniqueIDToConnection, "objectForKey:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  v27 = (void *)IDSCopyIDForAccessory();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", v46, CFSTR("IDSSendMessageOptionAccessToken"));
  objc_msgSend(v28, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IDSSendMessageOptionHomeKitMessage"));
  objc_msgSend(v28, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IDSSendMessageOptionDisableAliasValidation"));
  v29 = v28;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v26, "_internal");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "sendData:toDestinations:priority:options:identifier:error:", v45, v31, 300, v29, a7, a8);
  }
  else
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v23, "_internal");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v49 = 138412290;
      v50 = v35;
      _os_log_impl(&dword_1906E0000, v34, OS_LOG_TYPE_DEFAULT, "sendAccessoryData - Could not find connection for account %@", v49, 0xCu);

    }
    -[_IDSService _logConnectionMap](self, "_logConnectionMap");
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSAccountController _internal](self->_accountController, "_internal");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "accounts");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v49 = 138412290;
      v50 = v38;
      _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "sendAccessoryData - All accounts %@", v49, 0xCu);

    }
    v39 = objc_alloc(MEMORY[0x1E0C99D80]);
    v32 = (void *)objc_msgSend(v39, "initWithObjectsAndKeys:", CFSTR("Could not find valid account"), *MEMORY[0x1E0CB2D50], 0);
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 7, v32);
    v41 = v40;
    if (a8)
      *a8 = objc_retainAutorelease(v40);

    v33 = 0;
  }

  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v33;
}

- (BOOL)sendInvitation:(id)a3 fromAccount:(id)a4 toDestination:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  char v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (void *)MEMORY[0x1E0D34D18];
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = a6;
  v17 = a4;
  objc_msgSend(v15, "setWithObject:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "destinationWithDestinations:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v16, "mutableCopy");
  if (objc_msgSend(v13, "state") != 1)
  {
    objc_msgSend(v13, "selfHandle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v13, "selfHandle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_stripFZIDPrefix");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_bestGuessURI");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setObject:forKey:", v24, CFSTR("IDSSendMessageOptionFromID"));
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v24;
        _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - overriding fromID to %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionFromID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSService _sendingAccountForAccount:destination:fromID:](self, "_sendingAccountForAccount:destination:fromID:", v17, v19, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "_internal");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "uniqueID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    if ((-[IDSServiceProperties isInvitationService](self->_serviceProperties, "isInvitationService") & 1) != 0)
    {
LABEL_13:
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v27, "_internal");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v35;
        _os_log_impl(&dword_1906E0000, v34, OS_LOG_TYPE_DEFAULT, "sendInvitation - Could not find connection for account %@", buf, 0xCu);

      }
      -[_IDSService _logConnectionMap](self, "_logConnectionMap");
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        -[IDSAccountController _internal](self->_accountController, "_internal");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "accounts");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v38;
        _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "sendInvitation - All accounts %@", buf, 0xCu);

      }
      v39 = objc_alloc(MEMORY[0x1E0C99D80]);
      v30 = (void *)objc_msgSend(v39, "initWithObjectsAndKeys:", CFSTR("Could not find valid account"), *MEMORY[0x1E0CB2D50], 0);
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 7, v30);
      v32 = v40;
      if (a8)
      {
        v32 = objc_retainAutorelease(v40);
        v33 = 0;
        *a8 = v32;
        goto LABEL_26;
      }
LABEL_25:
      v33 = 0;
      goto LABEL_26;
    }
    v30 = 0;
LABEL_20:
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v41, OS_LOG_TYPE_DEFAULT, "sendInvitation - Service is not enabled for Invitations", buf, 2u);
    }

    v42 = objc_alloc(MEMORY[0x1E0C99D80]);
    v32 = (id)objc_msgSend(v42, "initWithObjectsAndKeys:", CFSTR("Service is not enabled for Invitations"), *MEMORY[0x1E0CB2D50], 0);
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 53, v32);
    v44 = v43;
    if (a8)
      *a8 = objc_retainAutorelease(v43);

    goto LABEL_25;
  }
  -[NSMutableDictionary objectForKey:](self->_uniqueIDToConnection, "objectForKey:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[IDSServiceProperties isInvitationService](self->_serviceProperties, "isInvitationService") & 1) == 0)
    goto LABEL_20;
  if (!v30)
    goto LABEL_13;
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v13;
    v49 = 2112;
    v50 = v20;
    _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "sendInvitation - Attempting to send invitation: %@ with options %@", buf, 0x16u);
  }

  objc_msgSend(v30, "_internal");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "sendInvitation:toDestination:priority:options:identifier:error:", v13, v19, 300, v20, a7, a8);
LABEL_26:

  return v33;
}

- (BOOL)sendInvitationUpdate:(id)a3 fromAccount:(id)a4 toDestination:(id)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  char v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = (void *)MEMORY[0x1E0D34D18];
  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = a6;
  v17 = a4;
  objc_msgSend(v15, "setWithObject:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "destinationWithDestinations:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v16, "mutableCopy");
  if (objc_msgSend(v13, "state") != 1)
  {
    objc_msgSend(v13, "selfHandle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v13, "selfHandle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_stripFZIDPrefix");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_bestGuessURI");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setObject:forKey:", v24, CFSTR("IDSSendMessageOptionFromID"));
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v24;
        _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - overriding fromID to %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionFromID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSService _sendingAccountForAccount:destination:fromID:](self, "_sendingAccountForAccount:destination:fromID:", v17, v19, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "_internal");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "uniqueID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    if ((-[IDSServiceProperties isInvitationService](self->_serviceProperties, "isInvitationService") & 1) != 0)
    {
LABEL_13:
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v27, "_internal");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v35;
        _os_log_impl(&dword_1906E0000, v34, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - Could not find connection for account %@", buf, 0xCu);

      }
      -[_IDSService _logConnectionMap](self, "_logConnectionMap");
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        -[IDSAccountController _internal](self->_accountController, "_internal");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "accounts");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v38;
        _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - All accounts %@", buf, 0xCu);

      }
      v39 = objc_alloc(MEMORY[0x1E0C99D80]);
      v30 = (void *)objc_msgSend(v39, "initWithObjectsAndKeys:", CFSTR("Could not find valid account"), *MEMORY[0x1E0CB2D50], 0);
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 7, v30);
      v32 = v40;
      if (a8)
      {
        v32 = objc_retainAutorelease(v40);
        v33 = 0;
        *a8 = v32;
        goto LABEL_26;
      }
LABEL_25:
      v33 = 0;
      goto LABEL_26;
    }
    v30 = 0;
LABEL_20:
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v41, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - Service is not enabled for Invitations", buf, 2u);
    }

    v42 = objc_alloc(MEMORY[0x1E0C99D80]);
    v32 = (id)objc_msgSend(v42, "initWithObjectsAndKeys:", CFSTR("Service is not enabled for Invitations"), *MEMORY[0x1E0CB2D50], 0);
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 53, v32);
    v44 = v43;
    if (a8)
      *a8 = objc_retainAutorelease(v43);

    goto LABEL_25;
  }
  -[NSMutableDictionary objectForKey:](self->_uniqueIDToConnection, "objectForKey:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[IDSServiceProperties isInvitationService](self->_serviceProperties, "isInvitationService") & 1) == 0)
    goto LABEL_20;
  if (!v30)
    goto LABEL_13;
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v13;
    v49 = 2112;
    v50 = v20;
    _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "sendInvitationUpdate - Attempting to send invitation: %@ with options %@", buf, 0x16u);
  }

  objc_msgSend(v30, "_internal");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "sendInvitationUpdate:toDestination:priority:options:identifier:error:", v13, v19, 300, v20, a7, a8);
LABEL_26:

  return v33;
}

- (BOOL)setWakingPushPriority:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  char valid;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[4];
  int64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSServiceProperties pushTopic](self->_serviceProperties, "pushTopic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v18 = a3;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "Setting waking priority %ld on topic %@", buf, 0x16u);

  }
  valid = _IDSIsValidWakingPushPriority();
  if ((valid & 1) != 0)
  {
    -[_IDSService daemonController](self, "daemonController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSServiceProperties pushTopic](self->_serviceProperties, "pushTopic");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWakingPushPriority:forTopic:", a3, v11);
  }
  else
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907F7BDC();

    v15 = *MEMORY[0x1E0CB2D50];
    v16 = CFSTR("Invalid priority");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 56, v10);
    v11 = v13;
    if (a4)
    {
      v11 = objc_retainAutorelease(v13);
      *a4 = v11;
    }
  }

  return valid;
}

- (BOOL)sendData:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 error:(id *)a7
{
  void *v7;
  int v8;
  NSObject *v9;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance", a3, a4, a5, a6, a7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F7C08();

  }
  return 0;
}

- (BOOL)sendServerMessage:(id)a3 command:(id)a4 fromAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
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
      sub_1907F7C94();

  }
  -[_IDSService _sendingAccountForAccount:](self, "_sendingAccountForAccount:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_internal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16
    && (-[NSMutableDictionary objectForKey:](self->_uniqueIDToConnection, "objectForKey:", v16),
        (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = v17;
    -[NSObject _internal](v17, "_internal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "sendServerMessage:command:", v8, v9);

  }
  else
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "_internal");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v22;
      _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "sendServerMessage - Could not find connection for account %@", (uint8_t *)&v26, 0xCu);

    }
    -[_IDSService _logConnectionMap](self, "_logConnectionMap");
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSAccountController _internal](self->_accountController, "_internal");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "accounts");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v24;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "sendServerMessage - All accounts %@", (uint8_t *)&v26, 0xCu);

    }
    v20 = 0;
  }

  return v20;
}

- (BOOL)cancelIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F7D20();

  }
  v10 = objc_msgSend(v6, "length");
  if (v10)
  {
    if (a4)
      *a4 = 0;
    -[_IDSService daemonController](self, "daemonController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSAccountController _internal](self->_accountController, "_internal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelItemWithIdentifier:service:", v6, v13);

  }
  return v10 != 0;
}

- (BOOL)getProgressUpdateForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *uniqueIDToProgress;
  void *v17;

  v6 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F7DAC();

  }
  v10 = objc_msgSend(v6, "length");
  if (v10)
  {
    if (a4)
      *a4 = 0;
    -[_IDSService daemonController](self, "daemonController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSAccountController _internal](self->_accountController, "_internal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getProgressUpdateForIdentifier:service:", v6, v13);

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        if (!self->_uniqueIDToProgress)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          uniqueIDToProgress = self->_uniqueIDToProgress;
          self->_uniqueIDToProgress = Mutable;

        }
        objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uniqueIDToProgress, "setObject:forKeyedSubscript:", v17, v6);

      }
    }
  }

  return v10 != 0;
}

- (id)uriForFromID:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;

  v3 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assertQueueIsCurrent");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907F7E38();

  }
  if (v3 && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D345D0]) & 1) == 0)
  {
    objc_msgSend(v3, "_stripPotentialTokenURIWithToken:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)deviceForFromID:(id)a3 fromDevices:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F7EC4();

  }
  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D345D0]))
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v53;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v53 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(v15, "_internal");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isDefaultPairedDevice");

            if ((v17 & 1) != 0)
            {
              v29 = v15;
              goto LABEL_49;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          if (v12)
            continue;
          break;
        }
      }

    }
    if (objc_msgSend(v5, "containsString:", CFSTR("device:")))
    {
      v18 = v5;
      objc_msgSend(v5, "_stripFZIDPrefix");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v19 = v6;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v49;
        while (2)
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v49 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
            objc_msgSend(v24, "uniqueIDOverride");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToIgnoringCase:", v10);

            if ((v26 & 1) != 0)
            {
              v29 = v24;

              v5 = v18;
              goto LABEL_49;
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
          if (v21)
            continue;
          break;
        }
      }

      v5 = v18;
    }
    v47 = 0;
    objc_msgSend(v5, "_stripPotentialTokenURIWithToken:", &v47);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v47;
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v58 = v5;
      v59 = 2112;
      v60 = v27;
      v61 = 2112;
      v62 = v10;
      _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_INFO, "FromID %@, strippedURI %@, token %@", buf, 0x20u);
    }

    v29 = 0;
    if (v10 && v27)
    {
      v40 = v5;
      v41 = v27;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v42 = v6;
      v30 = v6;
      v31 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v44;
        while (2)
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v44 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
            objc_msgSend(v35, "_internal");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "pushToken");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v58 = v37;
              v59 = 2112;
              v60 = v10;
              _os_log_impl(&dword_1906E0000, v38, OS_LOG_TYPE_INFO, "Comparing device token %@ to token %@", buf, 0x16u);
            }

            if ((objc_msgSend(v37, "isEqualToData:", v10) & 1) != 0)
            {
              v29 = v35;

              goto LABEL_47;
            }

          }
          v32 = -[NSObject countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          if (v32)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v10;
        _os_log_impl(&dword_1906E0000, v30, OS_LOG_TYPE_DEFAULT, "Did not find a device matching the token %@", buf, 0xCu);
      }
      v29 = 0;
LABEL_47:
      v27 = v41;
      v6 = v42;
      v5 = v40;

    }
LABEL_49:

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)deviceForFromID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F7F50();

  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[_IDSService accounts](self, "accounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v14, "_internal", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "devices");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v24;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v24 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20++));
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v18);
        }

        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  +[_IDSService deviceForFromID:fromDevices:](_IDSService, "deviceForFromID:fromDevices:", v4, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)linkedDeviceForFromID:(id)a3 withRelationship:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v6 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907F7FDC();

  }
  -[_IDSService linkedDevicesWithRelationship:](self, "linkedDevicesWithRelationship:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_IDSService deviceForFromID:fromDevices:](_IDSService, "deviceForFromID:fromDevices:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)firstRoutableInternetDestinationForSelf
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_IDSService accounts](self, "accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v7, "accountType") == 1 || !objc_msgSend(v7, "accountType"))
        {
          objc_msgSend(v7, "pushToken");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(v7, "loginID");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "_appearsToBeEmail");
            objc_msgSend(v7, "loginID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v11 & 1) != 0)
              v13 = IDSCopyIDForEmailAddress();
            else
              v13 = IDSCopyIDForPhoneNumber();
            v14 = (void *)v13;

            objc_msgSend(v7, "pushToken");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)IDSCopyIDForTokenWithID(v15, v14);

            goto LABEL_16;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (id)devicesForBTUUID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F8068();

  }
  if (v4)
  {
    -[_IDSService linkedDevicesWithRelationship:](self, "linkedDevicesWithRelationship:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "nsuuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", v4);

          if (v16)
          {
            if (!v11)
              v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v11, "addObject:", v14);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)deviceForUniqueID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
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
      sub_1907F80F4();

  }
  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[_IDSService devices](self, "devices", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v13, "uniqueID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToIgnoringCase:", v4))
          {

LABEL_19:
            v17 = v13;
            goto LABEL_20;
          }
          objc_msgSend(v13, "uniqueIDOverride");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToIgnoringCase:", v4);

          if ((v16 & 1) != 0)
            goto LABEL_19;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v17 = 0;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v17 = 0;
    }
LABEL_20:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setPreferInfraWiFi:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F8180();

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v3)
      v9 = CFSTR("YES");
    v13 = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "setPreferInfraWiFi: %@", (uint8_t *)&v13, 0xCu);
  }

  -[_IDSService daemonController](self, "daemonController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccountController _internal](self->_accountController, "_internal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferInfraWiFi:service:", v3, v12);

}

- (void)setNeedsLaunchOnNearbyDevicesChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F8280();

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v3)
      v9 = CFSTR("YES");
    v15 = 136315394;
    v16 = "-[_IDSService setNeedsLaunchOnNearbyDevicesChanged:]";
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v15, 0x16u);
  }

  -[_IDSService serviceProperties](self, "serviceProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowLaunchOnNearbyDevicesChanged");

  if ((v11 & 1) != 0)
  {
    -[_IDSService serviceProperties](self, "serviceProperties");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject setNeedsLaunchOnNearbyDevicesChanged:](v12, "setNeedsLaunchOnNearbyDevicesChanged:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36A40], "daemon");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907F820C(v12, v13, v14);
  }

}

- (BOOL)needsLaunchOnNearbyDevicesChanged
{
  void *v2;
  char v3;

  -[_IDSService serviceProperties](self, "serviceProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsLaunchOnNearbyDevicesChanged");

  return v3;
}

- (void)setLinkPreferences:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F830C();

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v4;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "setLinkPreferences: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("LinkType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PacketsPerSecond"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("InputBytesPerSecond"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("OutputBytesPerSecond"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Received invalid link preferences", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    -[_IDSService daemonController](self, "daemonController");
    v13 = objc_claimAutoreleasedReturnValue();
    -[IDSAccountController _internal](self->_accountController, "_internal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serviceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLinkPreferences:service:](v13, "setLinkPreferences:service:", v4, v15);

  }
}

- (void)startOTRTest:(int64_t)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F8398();

  }
  +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "forceOTRNegotiation", v12, 2u);
  }

  -[_IDSService daemonController](self, "daemonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccountController _internal](self->_accountController, "_internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startOTRTest:priority:", v11, a3);

}

- (void)testCloudQRConnection
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
      sub_1907F8424();

  }
  -[_IDSService daemonController](self, "daemonController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSAccountController _internal](self->_accountController, "_internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "testCloudQRConnection:", v8);

}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 fromAccount:(id)a5 toDestinations:(id)a6 priority:(int64_t)a7 options:(id)a8 identifier:(id *)a9 error:(id *)a10
{
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  size_t MaximumSizeOfFileSystemRepresentation;
  char *v35;
  void *v36;
  const char *v37;
  __CFString *v38;
  int *v39;
  int v40;
  NSObject *v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  __CFString *v55;
  uint64_t v56;
  NSObject *v57;
  int v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  __CFDictionary *v62;
  __CFString *v63;
  NSObject *v64;
  id v65;
  _BOOL8 v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  __CFString *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  id v75;
  void *v76;
  void *v77;
  NSObject *v78;
  char v79;
  void *v80;
  BOOL v81;
  void *v82;
  void *v83;
  BOOL v84;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *uniqueIDToProgress;
  void *v87;
  id v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  __CFString *v94;
  void *v95;
  id v97;
  id v98;
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  os_activity_scope_state_s state;
  NSObject *v106;
  id v107;
  id v108;
  id v109;
  uint8_t buf[4];
  size_t v111;
  __int16 v112;
  const __CFString *v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  __CFString *v117;
  uint64_t v118;
  const __CFString *v119;
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v97 = a4;
  v100 = a5;
  v99 = a6;
  v98 = a8;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v106 = _os_activity_create(&dword_1906E0000, "Framework Send Resource At URL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v106, &state);
  OSLogHandleForTransportCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v111 = (size_t)v15;
    _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "!setState ResourceURL=%@", buf, 0xCu);
  }

  OSLogHandleForTransportCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v100, "serviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v111 = (size_t)v18;
    _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "!setState serviceName=%@", buf, 0xCu);

  }
  if (a9)
  {
    OSLogHandleForTransportCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *a9;
      *(_DWORD *)buf = 138412290;
      v111 = (size_t)v20;
      _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "!setState guid=%@", buf, 0xCu);
    }

  }
  if (!self->_pretendingToBeFull)
  {
    objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithDestinations:", v99);
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "destinationURIs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v102;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v102 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
          if (!objc_msgSend(v26, "_FZIDType"))
          {
            -[_IDSService serviceProperties](self, "serviceProperties");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "wantsPhoneNumberAccount");

            if ((v28 & 1) == 0)
            {
              +[IDSLogging _IDSService](IDSLogging, "_IDSService");
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                -[_IDSService serviceProperties](self, "serviceProperties");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "identifier");
                v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v111 = (size_t)v26;
                v112 = 2112;
                v113 = v49;
                _os_log_impl(&dword_1906E0000, v47, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - Unable to send message to %@ on service %@ since phone number accounts are disabled", buf, 0x16u);

              }
              if (a10)
              {
                v118 = *MEMORY[0x1E0CB2D50];
                v119 = CFSTR("Sending to a phone number when service does not support phone numbers. File a radar to IDS | New Bugs to request phone number access.");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 44, v50);
                *a10 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_37;
            }
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v101, v120, 16);
        if (v23)
          continue;
        break;
      }
    }

    if ((objc_msgSend(v15, "isFileURL") & 1) == 0)
    {
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v111 = (size_t)v15;
        _os_log_impl(&dword_1906E0000, v51, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - resourceURL not a file %@", buf, 0xCu);
      }

      v52 = objc_alloc(MEMORY[0x1E0C99D80]);
      v22 = (void *)objc_msgSend(v52, "initWithObjectsAndKeys:", CFSTR("Sending non-file resource unsupported"), *MEMORY[0x1E0CB2D50], 0);
      if (a10)
      {
        v21 = 0;
        *a10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 28, v22);
      }
      else
      {
LABEL_37:
        v21 = 0;
      }
      goto LABEL_89;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v98);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v92 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v15;
    objc_msgSend(v29, "path");
    v89 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lastPathComponent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v92, "stringByAppendingString:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 0;
    objc_msgSend(v32, "attributesOfItemAtPath:error:", v31, &v109);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v109;

    if (v91)
    {
      objc_msgSend(v31, "stringByAppendingString:", CFSTR(".XXXX"));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

      MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v33);
      v35 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x6F111D7FuLL);
      if (!v35)
      {
        +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v111 = MaximumSizeOfFileSystemRepresentation;
          _os_log_impl(&dword_1906E0000, v53, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - can't allocate %ld bytes for new file path", buf, 0xCu);
        }

        v94 = 0;
        goto LABEL_45;
      }
      -[__CFString getFileSystemRepresentation:maxLength:](v33, "getFileSystemRepresentation:maxLength:", v35, MaximumSizeOfFileSystemRepresentation);
      mktemp(v35);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFileSystemRepresentation:length:", v35, strlen(v35));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      free(v35);
    }
    v93 = objc_retainAutorelease(v89);
    v37 = (const char *)objc_msgSend(v93, "cStringUsingEncoding:", 4);
    v38 = objc_retainAutorelease(v31);
    LODWORD(v37) = clonefile(v37, (const char *)-[__CFString cStringUsingEncoding:](v38, "cStringUsingEncoding:", 4), 0);
    v39 = __error();
    if ((v37 & 0x80000000) != 0)
    {
      v40 = *v39;
      +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v111 = (size_t)v93;
        v112 = 2112;
        v113 = v38;
        v114 = 1024;
        LODWORD(v115) = v40;
        _os_log_impl(&dword_1906E0000, v41, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - failed to clone file %@ => %@ (error %d). Will try hard link.", buf, 0x1Cu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = 0;
      v43 = objc_msgSend(v42, "linkItemAtPath:toPath:error:", v93, v38, &v108);
      v90 = v108;

      if ((v43 & 1) == 0)
      {

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = 0;
        v45 = objc_msgSend(v44, "copyItemAtPath:toPath:error:", v93, v38, &v107);
        v90 = v107;

        if ((v45 & 1) == 0)
        {
          +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v111 = (size_t)v93;
            v112 = 2112;
            v113 = v38;
            v114 = 2112;
            v115 = (uint64_t)v90;
            _os_log_impl(&dword_1906E0000, v46, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - failed to link and failed to copy file %@ => %@ (error %@)", buf, 0x20u);
          }

          v38 = 0;
        }
      }
    }
    v33 = v38;
    v94 = v33;
LABEL_45:

    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      NSTemporaryDirectory();
      v55 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(objc_retainAutorelease(v29), "fileSystemRepresentation");
      *(_DWORD *)buf = 138413058;
      v111 = (size_t)v29;
      v112 = 2112;
      v113 = v55;
      v114 = 2080;
      v115 = v56;
      v116 = 2112;
      v117 = v94;
      _os_log_impl(&dword_1906E0000, v54, OS_LOG_TYPE_DEFAULT, "Attempted to link or copy file %@ destination %@ (%s to %@)", buf, 0x2Au);

    }
    if (-[__CFString length](v94, "length"))
    {
      +[IDSLogging _IDSService](IDSLogging, "_IDSService");
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        v58 = objc_msgSend(v29, "isFileURL");
        objc_msgSend(v22, "objectForKey:", CFSTR("IDSSendMessageOptionLocalDelivery"));
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = (void *)v59;
        v61 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v111 = (size_t)v29;
        v112 = 2112;
        if (v58)
          v61 = CFSTR("YES");
        v113 = v61;
        v114 = 2112;
        v115 = v59;
        _os_log_impl(&dword_1906E0000, v57, OS_LOG_TYPE_INFO, "sendResourceAtURL - resourceURL %@  isFileURL %@  localDelivery %@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v62 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
      v63 = v94;
      if (v63)
      {
        CFDictionarySetValue(v62, (const void *)*MEMORY[0x1E0D34980], v63);
      }
      else
      {
        v66 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v66)
          sub_1907F84B0(v66, v67, v68);
      }

      v69 = v97;
      if (v69)
        CFDictionarySetValue(v62, (const void *)*MEMORY[0x1E0D34960], v69);

      objc_msgSend(v29, "absoluteString");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
        CFDictionarySetValue(v62, (const void *)*MEMORY[0x1E0D34970], v70);

      v71 = objc_retainAutorelease(v63);
      -[__CFString UTF8String](v71, "UTF8String");
      v72 = (void *)sandbox_extension_issue_file();
      if (v72)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        if (v73)
          CFDictionarySetValue(v62, (const void *)*MEMORY[0x1E0D34978], v73);

        free(v72);
      }
      else
      {
        +[IDSLogging _IDSService](IDSLogging, "_IDSService");
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v111 = (size_t)v71;
          _os_log_impl(&dword_1906E0000, v74, OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension for linked/copied file [%@]", buf, 0xCu);
        }

      }
      objc_msgSend(v29, "path");
      v75 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v75, "UTF8String");
      v76 = (void *)sandbox_extension_issue_file();

      if (v76)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (v77)
          CFDictionarySetValue(v62, (const void *)*MEMORY[0x1E0D34968], v77);

        free(v76);
      }
      else
      {
        +[IDSLogging _IDSService](IDSLogging, "_IDSService");
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v111 = (size_t)v29;
          _os_log_impl(&dword_1906E0000, v78, OS_LOG_TYPE_DEFAULT, "Failed to issue sandbox extension for original file [%@]", buf, 0xCu);
        }

      }
      v21 = -[_IDSService sendMessage:fromAccount:toDestinations:priority:options:identifier:error:](self, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v62, v100, v99, a7, v22, a9, a10);
      v79 = !v21;
      if (!a9)
        v79 = 1;
      if ((v79 & 1) == 0)
      {
        if (*a9)
        {
          objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v80 == 0;

          if (!v81)
          {
            objc_msgSend(v98, "objectForKey:", CFSTR("IDSSendMessageOptionWantsProgress"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            if (v82)
            {
              objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionWantsProgress"));
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = v83 == 0;

              if (!v84)
              {
                if (!self->_uniqueIDToProgress)
                {
                  Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                  uniqueIDToProgress = self->_uniqueIDToProgress;
                  self->_uniqueIDToProgress = Mutable;

                }
                objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uniqueIDToProgress, "setObject:forKeyedSubscript:", v87, *a9);

              }
            }
          }
        }
      }
    }
    else
    {
      +[IDSTransportLog IDSService](IDSTransportLog, "IDSService");
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v111 = (size_t)v29;
        _os_log_impl(&dword_1906E0000, v64, OS_LOG_TYPE_DEFAULT, "sendResourceAtURL - unable to link or copy file %@", buf, 0xCu);
      }

      v65 = objc_alloc(MEMORY[0x1E0C99D80]);
      v62 = (__CFDictionary *)objc_msgSend(v65, "initWithObjectsAndKeys:", CFSTR("Unable to link or copy file"), *MEMORY[0x1E0CB2D50], 0);
      v21 = 0;
      if (a10)
        *a10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 20, v62);
    }

LABEL_89:
    goto LABEL_90;
  }
  -[_IDSService _handlePretendingToBeFullWithIdentifier:](self, "_handlePretendingToBeFullWithIdentifier:", a9);
  v21 = 1;
LABEL_90:
  os_activity_scope_leave(&state);
  cut_arc_os_release();

  return v21;
}

- (BOOL)sendAheadGroup:(id)a3 priority:(int64_t)a4 options:(id)a5 identifier:(id *)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _IDSService *v26;
  id v27;
  id v28;
  int64_t v29;
  id *v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "assertQueueIsCurrent");

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1907F8540();

  }
  objc_msgSend(MEMORY[0x1E0D34D40], "groupCrypto");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "groupID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v32 = v19;
    _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "Sending Ahead group {groupID: %{public}@}", buf, 0xCu);

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = sub_19079B210;
  v24[3] = &unk_1E2C64118;
  v25 = v13;
  v26 = self;
  v27 = v12;
  v28 = v14;
  v29 = a4;
  v30 = a6;
  v20 = v12;
  v21 = v13;
  v22 = v14;
  -[_IDSService performGroupTask:](self, "performGroupTask:", v24);

  return 1;
}

- (BOOL)reportSpamMessage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  void *v15;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F86DC();

  }
  -[_IDSService serviceProperties](self, "serviceProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35040]);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NSObject unsignedIntegerValue](v10, "unsignedIntegerValue");
      if (v11 == 1)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D35038]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          goto LABEL_10;
        +[IDSLogging _IDSService](IDSLogging, "_IDSService");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1907F86B0();
        goto LABEL_19;
      }
      if (v11)
      {
LABEL_10:
        -[_IDSService daemonController](self, "daemonController");
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject reportSpamMessage:serviceIdentifier:](v13, "reportSpamMessage:serviceIdentifier:", v4, v9);
        v14 = 1;
LABEL_20:

        goto LABEL_21;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D35060]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_10;
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907F8684();
LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_1907F8658();
  v14 = 0;
LABEL_21:

  return v14;
}

- (void)sendAckForMessageWithContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F8794();

  }
  if (self->_manuallyAckMessages)
  {
    -[_IDSService _sendingAccountForAccount:](self, "_sendingAccountForAccount:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject _internal](v8, "_internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSMutableDictionary objectForKey:](self->_uniqueIDToConnection, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = objc_msgSend(v4, "wantsAppAck");
    objc_msgSend(v4, "outgoingResponseIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storageGuid");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fromID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "broadcastTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v17 = v16;
      objc_msgSend(v4, "broadcastTime");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      objc_msgSend(v15, "numberWithDouble:", v17 - v19);
      v20 = objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
LABEL_14:
        if (v13 | v20)
        {
          -[_IDSService daemonController](self, "daemonController");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_internal");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "account");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "_internal");
          v39 = v10;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "uniqueID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "priority");
          v32 = v11;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "acknowledgeMessageWithStorageGUID:realGUID:forAccountWithUniqueID:broadcastTime:messageSize:priority:broadcastID:connectionType:", v13, v41, v31, v20, 0, v33, objc_msgSend(v4, "broadcastID"), objc_msgSend(v4, "connectionType"));

          v11 = v32;
          v10 = v39;

        }
        goto LABEL_17;
      }
    }
    else
    {
      v20 = 0;
      if (!v12)
        goto LABEL_14;
    }
    v34 = objc_msgSend(v4, "connectionType");
    -[_IDSService daemonController](self, "daemonController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_internal");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "account");
    v38 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_internal");
    v36 = v8;
    v24 = v10;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "uniqueID");
    v26 = v20;
    v27 = v13;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sendAppAckWithGUID:toDestination:forAccountWithUniqueID:connectionType:", v41, v40, v28, v34);

    v13 = v27;
    v20 = v26;

    v10 = v24;
    v8 = v36;

    v11 = v38;
    goto LABEL_14;
  }
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1907F8768();
LABEL_17:

}

- (BOOL)sendCertifiedDeliveryReceipt:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[_IDSService _sendingAccountForAccount:](self, "_sendingAccountForAccount:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject _internal](v5, "_internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushTopic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "sendCertifiedDeliveryReceipt passing context to daemon { context: %@ }", (uint8_t *)&v14, 0xCu);
      }

      -[_IDSService daemonController](self, "daemonController");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sendCertifiedDeliveryReceipt:serviceName:](v11, "sendCertifiedDeliveryReceipt:serviceName:", v12, v7);

    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sub_1907F884C(v4);
    }

  }
  else
  {
    +[IDSLogging _IDSService](IDSLogging, "_IDSService");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907F8820();
    LOBYTE(v9) = 0;
  }

  return v9;
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
    -[_IDSService sendServerMessage:command:fromAccount:](self, "sendServerMessage:command:fromAccount:", v4, v5, 0);

  }
}

- (id)datagramConnectionForSessionDestination:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[_IDSService datagramConnectionForSessionDestination:uid:error:](self, "datagramConnectionForSessionDestination:uid:error:", v6, getuid(), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)datagramConnectionForSessionDestination:(id)a3 uid:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  v6 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0CCEC80], "endpointWithHostname:port:", a3, CFSTR("0"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
  objc_msgSend(v8, "setDataMode:", 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), *MEMORY[0x1E0D34990], v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requireNetworkAgentWithDomain:type:", v9, *MEMORY[0x1E0D34988]);

  objc_msgSend(MEMORY[0x1E0CCEC70], "connectionWithEndpoint:parameters:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0C99D80]);
    v14 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", CFSTR("Unable to create datagram connection with destination"), *MEMORY[0x1E0CB2D50], 0);
    if (a5)
      *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 20, v14);

  }
  return v11;
}

- (id)datagramConnectionForSocketDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v5 = dup(a3);
  if ((_DWORD)v5 == -1
    || (objc_msgSend(MEMORY[0x1E0CCEC70], "connectionWithConnectedSocket:", v5),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D80]);
    v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", CFSTR("Unable to create datagram connection with destination"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 20, v8);

    v6 = 0;
  }
  return v6;
}

- (id)streamConnectionForSessionDestination:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = objc_alloc(MEMORY[0x1E0C99D80]);
  v6 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", CFSTR("Unable to create stream connection with destination"), *MEMORY[0x1E0CB2D50], 0);
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 20, v6);

  return 0;
}

- (id)streamConnectionForSocketDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v5 = dup(a3);
  if ((_DWORD)v5 == -1
    || (objc_msgSend(MEMORY[0x1E0CCECC0], "connectionWithConnectedSocket:", v5),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D80]);
    v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", CFSTR("Unable to create datagram connection with destination"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 20, v8);

    v6 = 0;
  }
  return v6;
}

- (id)datagramChannelForSessionDestination:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  IDSDatagramChannel *v9;
  NSObject *v10;
  IDSDatagramChannel *v11;
  id v12;
  void *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  IDSDatagramChannel *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[IDSDatagramChannel initWithDestination:options:]([IDSDatagramChannel alloc], "initWithDestination:options:", v7, v8);

  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Creating datagram channel with destination %@ => %@", buf, 0x16u);
  }

  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0C99D80]);
    v13 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", CFSTR("Unable to create datagram channel with destination"), *MEMORY[0x1E0CB2D50], 0);
    if (a5)
      *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 20, v13);

  }
  return v9;
}

- (id)datagramChannelForSocketDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v6;
  IDSDatagramChannel *v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  IDSDatagramChannel *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = dup(a3);
  if ((_DWORD)v6 == -1)
    goto LABEL_5;
  v7 = -[IDSDatagramChannel initWithSocketDescriptor:]([IDSDatagramChannel alloc], "initWithSocketDescriptor:", v6);
  +[IDSLogging _IDSService](IDSLogging, "_IDSService");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13 = a3;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Creating datagram channel with socket %d => %@", buf, 0x12u);
  }

  if (!v7)
  {
LABEL_5:
    v9 = objc_alloc(MEMORY[0x1E0C99D80]);
    v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", CFSTR("Unable to create datagram channel with socket descriptor"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 20, v10);

    v7 = 0;
  }
  return v7;
}

- (void)_enableAccount:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_accountController, sel__enableAccount_);
}

- (void)_disableAccount:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_accountController, sel__disableAccount_);
}

- (void)performGroupTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[_IDSService groupContextController](self, "groupContextController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19079C698;
  v7[3] = &unk_1E2C64140;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "groupContextWithCompletion:", v7);

}

- (void)scheduleTransactionLogTask:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_IDSService groupContextController](self, "groupContextController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleTransactionLogTask:", v4);

}

- (void)connection:(id)a3 didHintCheckingTransportLogWithReason:(int64_t)a4
{
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[IDSLogging _IDSService](IDSLogging, "_IDSService", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a4;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "checkTransportLog {reason: %ld}", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19079C7E0;
  v7[3] = &unk_1E2C63B10;
  v7[4] = self;
  v7[5] = a4;
  -[_IDSService _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v7);
}

- (void)groupContextController:(id)a3 didCreateGroup:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907F88DC();

  }
  v14 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19079C950;
  v11[3] = &unk_1E2C64168;
  v12 = v5;
  v13 = 0;
  v9 = v5;
  -[_IDSService sendAheadGroup:priority:options:identifier:completion:](self, "sendAheadGroup:priority:options:identifier:completion:", v9, 300, MEMORY[0x1E0C9AA70], &v14, v11);
  v10 = v14;

}

- (id)groupContextController:(id)a3 accountsForAlises:(id)a4
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  int v18;
  id obj;
  uint64_t v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F8968();

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        -[_IDSService accounts](self, "accounts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              objc_msgSend(v16, "aliasStrings");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "containsObject:", v10);

              if (v18)
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v10);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v13);
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  return v8;
}

- (BOOL)manuallyAckMessages
{
  return self->_manuallyAckMessages;
}

- (void)setManuallyAckMessages:(BOOL)a3
{
  self->_manuallyAckMessages = a3;
}

- (IDSGroupContextController)groupContextController
{
  return self->_groupContextController;
}

- (BOOL)wantsPseudonymUpdates
{
  return self->_wantsPseudonymUpdates;
}

- (NSDictionary)cachedPseudonymURIMap
{
  return self->_cachedPseudonymURIMap;
}

- (void)setCachedPseudonymURIMap:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPseudonymURIMap, a3);
}

- (CUTDeferredTaskQueue)pseudonymUpdateTaskQueue
{
  return self->_pseudonymUpdateTaskQueue;
}

- (void)setPseudonymUpdateTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pseudonymUpdateTaskQueue, a3);
}

- (NSMutableDictionary)completionBlocksByRequestID
{
  return self->_completionBlocksByRequestID;
}

- (void)setCompletionBlocksByRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocksByRequestID, a3);
}

@end
