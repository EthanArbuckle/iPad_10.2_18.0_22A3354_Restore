@implementation ATDeviceSyncManager

- (ATDeviceSyncManager)init
{
  ATDeviceSyncManager *v2;
  uint64_t v3;
  NSMutableDictionary *activeSessionsForLinkIDAndDataClass;
  objc_class *v5;
  const char *Name;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  ATDeviceSettings *settings;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ATDeviceSyncManager;
  v2 = -[ATDeviceSyncManager init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    activeSessionsForLinkIDAndDataClass = v2->_activeSessionsForLinkIDAndDataClass;
    v2->_activeSessionsForLinkIDAndDataClass = (NSMutableDictionary *)v3;

    v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    v7 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (ATDeviceSettings *)v9;

  }
  return v2;
}

- (id)initiateSyncForDataClass:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1062;
  v21 = __Block_byref_object_dispose__1063;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__ATDeviceSyncManager_initiateSyncForDataClass_onMessageLink___block_invoke;
  v13[3] = &unk_1E927D5B8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)cancelSyncForDataClass:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ATDeviceSyncManager_cancelSyncForDataClass_onMessageLink___block_invoke;
  block[3] = &unk_1E927E198;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)initiateSyncOnMessageLink:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__ATDeviceSyncManager_initiateSyncOnMessageLink___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)cancelSyncOnMessageLink:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ATDeviceSyncManager_cancelSyncOnMessageLink___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)messageLinkWasOpened:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[ATClientController sharedInstance](ATClientController, "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EFC7B610))
        {
          objc_msgSend(v11, "syncDataClass");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addRequestHandler:forDataClass:", self, v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)messageLinkWasInitialized:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__ATDeviceSyncManager_messageLinkWasInitialized___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)messageLinkWasClosed:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ATDeviceSyncManager_messageLinkWasClosed___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATDeviceSyncManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ATDeviceSyncManager_messageLink_didReceiveRequest___block_invoke;
  block[3] = &unk_1E927E198;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)session:(id)a3 willBeginSessionTask:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *queue;
  void *v10;
  _QWORD block[5];

  v6 = a3;
  objc_msgSend(a4, "sessionGroupingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ATDeviceSyncSessionSyncTaskGroupingKey"));

  if (v8)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__ATDeviceSyncManager_session_willBeginSessionTask___block_invoke;
    block[3] = &unk_1E927E120;
    block[4] = self;
    dispatch_async(queue, block);
    objc_msgSend(v6, "messageLink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "endpointType") == 1)
      objc_msgSend(v10, "addKeepAliveException");

  }
}

- (void)session:(id)a3 didFinishSessionTask:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  ATDeviceSyncManager *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ATDeviceSyncManager_session_didFinishSessionTask___block_invoke;
  block[3] = &unk_1E927E198;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)sessionWillBegin:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ATDeviceSyncManager_sessionWillBegin___block_invoke;
  block[3] = &unk_1E927E120;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)sessionDidFinish:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATDeviceSyncManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__ATDeviceSyncManager_sessionDidFinish___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_initiateSyncForDataClass:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  const __CFString *v30;
  void *v31;
  uint8_t buf[4];
  ATDeviceSyncManager *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _ATLogCategoryDeviceSync();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v33 = self;
    v34 = 2114;
    v35 = v6;
    v36 = 2048;
    v37 = v7;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: trying to initiate sync for dataclass %{public}@ on link=%p", buf, 0x20u);
  }

  +[ATDevicePairedSyncManager sharedPairedSyncManager](ATDevicePairedSyncManager, "sharedPairedSyncManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasRestriction");

  if (!v10)
  {
    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientForDataclass:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v14, "isEnabled") & 1) == 0)
    {
      -[ATDeviceSettings setSyncPending:forDataClass:](self->_settings, "setSyncPending:forDataClass:", 0, v6);
      _ATLogCategoryDeviceSync();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v33 = self;
        v34 = 2048;
        v35 = v14;
        v36 = 2114;
        v37 = v6;
        v38 = 2048;
        v39 = v7;
        _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Sync Client=%p is not enabled to sync dataclass %{public}@ on link=%p", buf, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 9, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    -[ATDeviceSettings setSyncPending:forDataClass:](self->_settings, "setSyncPending:forDataClass:", 1, v6);
    if (objc_msgSend(v7, "isInitialized"))
    {
      -[ATDeviceSyncManager _sessionForMessageLink:dataClass:](self, "_sessionForMessageLink:dataClass:", v7, v6);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        _ATLogCategoryDeviceSync();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v33 = self;
          v34 = 2114;
          v35 = v6;
          v36 = 2114;
          v37 = v16;
          _os_log_impl(&dword_1D1868000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: not starting sync for dataclass %{public}@ because we already have an active session %{public}@", buf, 0x20u);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
      if (objc_msgSend(v7, "endpointType") == 1)
      {
        -[ATDeviceSyncManager _startSyncSessionForDataClass:messageLink:identifier:](self, "_startSyncSessionForDataClass:messageLink:identifier:", v6, v7, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v30 = CFSTR("_SessionID");
          objc_msgSend(v19, "sessionIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = 0;
        }
      }
      else
      {
        v22 = 0;
        v20 = 0;
      }
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF76A0]), "initWithCommand:dataClass:parameters:", CFSTR("BeginSyncSession"), v6, v22);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke;
      v26[3] = &unk_1E927CB88;
      v26[4] = self;
      v27 = v6;
      v28 = v7;
      v29 = v20;
      v24 = v20;
      objc_msgSend(v28, "sendRequest:withCompletion:", v23, v26);

    }
    v12 = 0;
LABEL_24:

    goto LABEL_25;
  }
  _ATLogCategoryDeviceSync();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v33 = self;
    v34 = 2114;
    v35 = v7;
    v36 = 2114;
    v37 = v6;
    _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: sync is restricted on %{public}@ for dataclass %{public}@ - ignoring request to begin sync", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v12;
}

- (void)_cancelSyncForDataClass:(id)a3 onMessageLink:(id)a4 setSyncPending:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  ATDeviceSyncManager *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[ATDeviceSyncManager _sessionForMessageLink:dataClass:](self, "_sessionForMessageLink:dataClass:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10
    && objc_msgSend(v10, "isRunning")
    && (!objc_msgSend(v11, "isFinished") || (objc_msgSend(v11, "isCancelled") & 1) == 0))
  {
    _ATLogCategoryDeviceSync();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543874;
      v14 = self;
      v15 = 2114;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling sync session for data class %{public}@ on %{public}@", (uint8_t *)&v13, 0x20u);
    }

    objc_msgSend(v11, "cancel");
  }
  -[ATDeviceSettings setSyncPending:forDataClass:](self->_settings, "setSyncPending:forDataClass:", v5, v8);

}

- (void)_handleBeginSyncSessionRequest:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void **v27;
  const __CFString **v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  uint8_t buf[4];
  ATDeviceSyncManager *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dataClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATClientController sharedInstance](ATClientController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientForDataclass:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && objc_msgSend(v10, "conformsToProtocol:", &unk_1EFC7B610)
    && (objc_msgSend(v10, "isEnabled") & 1) != 0)
  {
    +[ATDevicePairedSyncManager sharedPairedSyncManager](ATDevicePairedSyncManager, "sharedPairedSyncManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasRestriction");

    if (v12)
    {
      _ATLogCategoryDeviceSync();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v43 = self;
        v44 = 2114;
        v45 = v7;
        v46 = 2114;
        v47 = v8;
        v14 = "%{public}@: sync is restricted on %{public}@ for dataclass %{public}@ - ignoring request to begin sync";
        v15 = v13;
        v16 = 32;
LABEL_9:
        _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    objc_msgSend(v6, "parameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", CFSTR("_SessionID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dataClass");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATDeviceSyncManager _sessionForMessageLink:dataClass:](self, "_sessionForMessageLink:dataClass:", v7, v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19 || (objc_msgSend(v19, "isFinished") & 1) != 0 || objc_msgSend(v19, "isCancelled"))
    {
      objc_msgSend(v6, "dataClass");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATDeviceSyncManager _startSyncSessionForDataClass:messageLink:identifier:](self, "_startSyncSessionForDataClass:messageLink:identifier:", v23, v7, v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = CFSTR("_SessionID");
      objc_msgSend(v24, "sessionIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v25;
      v26 = (void *)MEMORY[0x1E0C99D80];
      v27 = &v41;
      v28 = &v40;
    }
    else
    {
      _ATLogCategoryDeviceSync();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (!v17)
      {
        if (v31)
        {
          *(_DWORD *)buf = 138543362;
          v43 = self;
          _os_log_impl(&dword_1D1868000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring request to begin sync session.", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 16, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "responseWithError:parameters:", v25, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      if (v31)
      {
        *(_DWORD *)buf = 138543362;
        v43 = self;
        _os_log_impl(&dword_1D1868000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling active session and adopting remote session.", buf, 0xCu);
      }

      objc_msgSend(v19, "cancel");
      objc_msgSend(v6, "dataClass");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATDeviceSyncManager _removeSessionForMessageLink:dataClass:](self, "_removeSessionForMessageLink:dataClass:", v7, v32);

      objc_msgSend(v6, "dataClass");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parameters");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKey:", CFSTR("_SessionID"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATDeviceSyncManager _startSyncSessionForDataClass:messageLink:identifier:](self, "_startSyncSessionForDataClass:messageLink:identifier:", v34, v7, v33);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = CFSTR("_SessionID");
      objc_msgSend(v24, "sessionIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v25;
      v26 = (void *)MEMORY[0x1E0C99D80];
      v27 = &v39;
      v28 = &v38;
    }
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseWithError:parameters:", 0, v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v24;
LABEL_17:

    goto LABEL_11;
  }
  _ATLogCategoryDeviceSync();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v43 = self;
    v44 = 2114;
    v45 = v8;
    v14 = "%{public}@: sync disabled for data class '%{public}@'.";
    v15 = v13;
    v16 = 22;
    goto LABEL_9;
  }
LABEL_10:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 9, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responseWithError:parameters:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
LABEL_11:

  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __68__ATDeviceSyncManager__handleBeginSyncSessionRequest_onMessageLink___block_invoke;
  v36[3] = &unk_1E927E1C0;
  v36[4] = self;
  v37 = v19;
  v20 = v19;
  objc_msgSend(v7, "sendResponse:withCompletion:", v18, v36);

}

- (void)_handleEndSyncSessionRequest:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  ATDeviceSyncManager *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dataClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATDeviceSyncManager _sessionForMessageLink:dataClass:](self, "_sessionForMessageLink:dataClass:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "parameterForKey:", CFSTR("_SessionID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "sessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v10) && objc_msgSend(v9, "isRunning"))
    {
      if ((objc_msgSend(v9, "isFinished") & 1) == 0)
      {

LABEL_13:
        _ATLogCategoryDeviceSync();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 138543362;
          v18 = self;
          _os_log_impl(&dword_1D1868000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling active session.", (uint8_t *)&v17, 0xCu);
        }

        objc_msgSend(v9, "cancel");
        goto LABEL_11;
      }
      v12 = objc_msgSend(v9, "isCancelled");

      if ((v12 & 1) == 0)
        goto LABEL_13;
    }
    else
    {

    }
  }
  _ATLogCategoryDeviceSync();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "sessionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = self;
    v19 = 2114;
    v20 = v14;
    v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Not cancelling active session with sessionId: %{public}@ - sessionId to cancel: %{public}@", (uint8_t *)&v17, 0x20u);

  }
LABEL_11:
  objc_msgSend(v6, "responseWithError:parameters:", 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendResponse:withCompletion:", v15, 0);

}

- (void)_handleRequest:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  ATDeviceSyncManager *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ATDeviceSyncManager _sessionTaskForRequest:onMessageLink:](self, "_sessionTaskForRequest:onMessageLink:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "messageLink:didReceiveRequest:", v7, v6);
  }
  else
  {
    _ATLogCategoryDeviceSync();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "command");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_ERROR, "%{public}@: No running task for request %{public}@.", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(v6, "command");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("RequestAsset"));

    if (v13)
      v14 = 27;
    else
      v14 = 23;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseWithError:parameters:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendResponse:withCompletion:", v16, 0);

  }
}

- (id)_activeSessionsOnMessageLink:(id)a3
{
  NSMutableDictionary *activeSessionsForLinkIDAndDataClass;
  void *v4;
  void *v5;

  activeSessionsForLinkIDAndDataClass = self->_activeSessionsForLinkIDAndDataClass;
  objc_msgSend(a3, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeSessionsForLinkIDAndDataClass, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_sessionForMessageLink:(id)a3 dataClass:(id)a4
{
  id v6;
  NSMutableDictionary *activeSessionsForLinkIDAndDataClass;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  activeSessionsForLinkIDAndDataClass = self->_activeSessionsForLinkIDAndDataClass;
  objc_msgSend(a3, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeSessionsForLinkIDAndDataClass, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setSession:(id)a3 forMessageLink:(id)a4 dataClass:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSMutableDictionary *activeSessionsForLinkIDAndDataClass;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[ATDeviceSyncManager _activeSessionsOnMessageLink:](self, "_activeSessionsOnMessageLink:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    activeSessionsForLinkIDAndDataClass = self->_activeSessionsForLinkIDAndDataClass;
    objc_msgSend(v8, "guid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](activeSessionsForLinkIDAndDataClass, "setObject:forKey:", v10, v12);

  }
  objc_msgSend(v10, "setObject:forKey:", v13, v9);

}

- (void)_removeSessionForMessageLink:(id)a3 dataClass:(id)a4
{
  id v6;
  NSMutableDictionary *activeSessionsForLinkIDAndDataClass;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  activeSessionsForLinkIDAndDataClass = self->_activeSessionsForLinkIDAndDataClass;
  objc_msgSend(v12, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeSessionsForLinkIDAndDataClass, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "removeObjectForKey:", v6);
  if (!objc_msgSend(v9, "count"))
  {
    v10 = self->_activeSessionsForLinkIDAndDataClass;
    objc_msgSend(v12, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

  }
}

- (id)_startSyncSessionForDataClass:(id)a3 messageLink:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  ATDeviceSyncSessionSyncTask *v15;
  void *v16;
  ATDeviceSyncSessionSyncTask *v18;
  uint8_t buf[4];
  ATDeviceSyncManager *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _ATLogCategoryDeviceSync();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v20 = self;
    v21 = 2114;
    v22 = v8;
    v23 = 2114;
    v24 = v9;
    _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting \"%{public}@\" sync session on %{public}@", buf, 0x20u);
  }

  ATReportEventIncrementingScalarKey();
  v12 = objc_alloc(MEMORY[0x1E0CF76B0]);
  v13 = (void *)objc_msgSend(v12, "initWithSessionIdentifier:sessionTypeIdentifier:", v10, *MEMORY[0x1E0CF7650]);

  objc_msgSend(v13, "setDataClass:", v8);
  objc_msgSend(v13, "setMessageLink:", v9);
  objc_msgSend(MEMORY[0x1E0CF2220], "sharedSessionServer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSession:", v13);

  objc_msgSend(v13, "addObserver:", self);
  v15 = -[ATDeviceSyncSessionSyncTask initWithDataClass:onMessageLink:]([ATDeviceSyncSessionSyncTask alloc], "initWithDataClass:onMessageLink:", v8, v9);
  v18 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSessionTasks:", v16);

  -[ATDeviceSyncManager _setSession:forMessageLink:dataClass:](self, "_setSession:forMessageLink:dataClass:", v13, v9, v8);
  objc_msgSend(v13, "start");

  return v13;
}

- (id)_sessionTaskForRequest:(id)a3 onMessageLink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  __CFString **v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dataClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATDeviceSyncManager _sessionForMessageLink:dataClass:](self, "_sessionForMessageLink:dataClass:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (objc_msgSend(v9, "isCancelled") & 1) != 0 || (objc_msgSend(v9, "isFinished") & 1) != 0)
  {
    v10 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v6, "command");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Sync")) & 1) != 0)
  {
    v13 = &ATDeviceSyncSessionSyncTaskGroupingKey;
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v6, "command");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("SyncTaskFinished")) & 1) != 0)
  {
    v13 = &ATDeviceSyncSessionSyncTaskGroupingKey;
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v6, "command");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("UpdateSyncSessionTask"));

  if ((v18 & 1) != 0)
  {
    v13 = &ATDeviceSyncSessionSyncTaskGroupingKey;
    goto LABEL_12;
  }
  objc_msgSend(v6, "command");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("BeginAssetTask")) & 1) != 0)
  {
    v13 = &ATDeviceSyncSessionAssetTaskGroupingKey;
    goto LABEL_11;
  }
  objc_msgSend(v6, "command");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("EndAssetTask")) & 1) != 0)
  {
LABEL_28:
    v13 = &ATDeviceSyncSessionAssetTaskGroupingKey;
    goto LABEL_10;
  }
  objc_msgSend(v6, "command");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToString:", CFSTR("RequestAsset")) & 1) != 0)
  {
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(v6, "command");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("UpdateAssetSessionTask")) & 1) != 0)
  {
LABEL_26:

    goto LABEL_27;
  }
  objc_msgSend(v6, "command");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isEqualToString:", CFSTR("FileProgress")) & 1) != 0)
  {

    goto LABEL_26;
  }
  objc_msgSend(v6, "command");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("AssetMetrics"));

  if ((v23 & 1) == 0)
  {
    v15 = 0;
    goto LABEL_13;
  }
  v13 = &ATDeviceSyncSessionAssetTaskGroupingKey;
LABEL_12:
  v15 = *v13;
LABEL_13:
  objc_msgSend(v9, "sessionTasksWithGroupingKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

LABEL_5:
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_activeSessionsForLinkIDAndDataClass, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __68__ATDeviceSyncManager__handleBeginSyncSessionRequest_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryDeviceSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to send BeginSyncSession response", (uint8_t *)&v7, 0xCu);
    }

    v6 = *(void **)(a1 + 40);
    if (v6)
      objc_msgSend(v6, "cancel");
  }

}

void __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ATLogCategoryDeviceSync();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v30 = v8;
      v31 = 2114;
      v32 = v6;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ error sending begin sync session for dataclass %{public}@", buf, 0x20u);
    }

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v12 = *(NSObject **)(v10 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke_77;
    block[3] = &unk_1E927E198;
    block[4] = v10;
    v27 = v11;
    v28 = *(id *)(a1 + 48);
    dispatch_async(v12, block);

    v13 = v27;
LABEL_5:

    goto LABEL_13;
  }
  objc_msgSend(v5, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (*(_QWORD *)(a1 + 56))
      goto LABEL_13;
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(a1 + 40);
    v21 = *(NSObject **)(v19 + 8);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke_78;
    v22[3] = &unk_1E927D688;
    v22[4] = v19;
    v23 = v20;
    v24 = *(id *)(a1 + 48);
    v25 = v5;
    dispatch_async(v21, v22);

    v13 = v23;
    goto LABEL_5;
  }
  _ATLogCategoryDeviceSync();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v30 = v16;
    v31 = 2114;
    v32 = v17;
    v33 = 2114;
    v34 = v18;
    _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ error after sending begin sync session for dataclass %{public}@", buf, 0x20u);

  }
  if (*(_QWORD *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "cancelSyncForDataClass:onMessageLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setSyncPending:forDataClass:", 0, *(_QWORD *)(a1 + 40));
LABEL_13:

}

uint64_t __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke_77(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelSyncForDataClass:onMessageLink:setSyncPending:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

void __63__ATDeviceSyncManager__initiateSyncForDataClass_onMessageLink___block_invoke_78(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "parameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("_SessionID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v1, "_startSyncSessionForDataClass:messageLink:identifier:", v2, v3, v4);

}

void __40__ATDeviceSyncManager_sessionDidFinish___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  dispatch_time_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  _ATLogCategoryDeviceSync();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "Sync session complete", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "messageLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTimeoutException");
  objc_msgSend(*(id *)(a1 + 40), "_sessionForMessageLink:dataClass:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "sessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
      objc_msgSend(*(id *)(a1 + 40), "_removeSessionForMessageLink:dataClass:", v5, v4);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v29 = CFSTR("_SessionID");
    v30[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF76A0]), "initWithCommand:dataClass:parameters:", CFSTR("EndSyncSession"), v4, v11);
    objc_msgSend(v5, "sendRequest:withCompletion:", v12, 0);
LABEL_8:

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (objc_msgSend(v5, "endpointType") != 1)
      goto LABEL_11;
    +[ATClientController sharedInstance](ATClientController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientForDataclass:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EFC7B610))
    {
      v14 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
      objc_msgSend(v5, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "syncStateForLibrary:dataClass:", v15, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v11, "currentRevision");
      if (v16 != objc_msgSend(v12, "lastServerRevision"))
      {
        _ATLogCategoryDeviceSync();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v26 = v18;
          v27 = 2114;
          v28 = v4;
          _os_log_impl(&dword_1D1868000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: new changes available for '%{public}@' - syncing again", buf, 0x16u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setSyncPending:forDataClass:", 1, v4);
        v19 = dispatch_time(0, 5000000000);
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(NSObject **)(v20 + 8);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __40__ATDeviceSyncManager_sessionDidFinish___block_invoke_74;
        block[3] = &unk_1E927E198;
        block[4] = v20;
        v23 = v4;
        v24 = v5;
        dispatch_after(v19, v21, block);

      }
      goto LABEL_8;
    }
  }
LABEL_10:

LABEL_11:
}

id __40__ATDeviceSyncManager_sessionDidFinish___block_invoke_74(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_initiateSyncForDataClass:onMessageLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __40__ATDeviceSyncManager_sessionWillBegin___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "messageLink");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addTimeoutException");

}

void __52__ATDeviceSyncManager_session_didFinishSessionTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionGroupingKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ATDeviceSyncSessionSyncTaskGroupingKey"));

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) == 0)
    {
LABEL_9:
      objc_msgSend(*(id *)(a1 + 32), "messageLink");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "endpointType") == 1)
        objc_msgSend(v10, "removeKeepAliveException");

      goto LABEL_14;
    }
    ATReportEventIncrementingScalarKey();
    goto LABEL_9;
  }
  objc_msgSend(v5, "sessionGroupingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ATDeviceSyncSessionAssetTaskGroupingKey"));

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else if ((objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) == 0)
    {
      _ATLogCategoryDeviceSync();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 48);
        v15 = 138543618;
        v16 = v12;
        v17 = 2114;
        v18 = v2;
        _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: session for data class %{public}@ completed successfully - clearing needs-sync flag", (uint8_t *)&v15, 0x16u);
      }

      v13 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
      objc_msgSend(*(id *)(a1 + 32), "dataClass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSyncPending:forDataClass:", 0, v14);

    }
    ATReportEventIncrementingScalarKey();
  }
LABEL_14:

}

uint64_t __52__ATDeviceSyncManager_session_willBeginSessionTask___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "pairingSyncCompletionTime");
  if (v3 != 0.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setPairingSyncCompletionTime:", 0.0);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    return ATReportEventAddDoubleToScalarKey();
  }
  return result;
}

uint64_t __53__ATDeviceSyncManager_messageLink_didReceiveRequest___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("BeginSyncSession"));

  if (v3)
    return objc_msgSend(*(id *)(a1 + 40), "_handleBeginSyncSessionRequest:onMessageLink:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("EndSyncSession"));

  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  if (v6)
    return objc_msgSend(v7, "_handleEndSyncSessionRequest:onMessageLink:", v8, v9);
  else
    return objc_msgSend(v7, "_handleRequest:onMessageLink:", v8, v9);
}

void __44__ATDeviceSyncManager_messageLinkWasClosed___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_activeSessionsOnMessageLink:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _ATLogCategoryDeviceSync();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v18 = v4;
      v19 = 2114;
      v20 = v2;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: message link was closed - cancelling remaining sessions %{public}@", buf, 0x16u);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v2, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 8, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setError:", v11);

          objc_msgSend(v10, "cancel");
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

void __49__ATDeviceSyncManager_messageLinkWasInitialized___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[ATClientController sharedInstance](ATClientController, "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allClients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EFC7B610))
        {
          objc_msgSend(v8, "syncDataClass");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isSyncPendingForDataClass:", v9) & 1) != 0
            || objc_msgSend(*(id *)(a1 + 40), "endpointType") == 1
            && (v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24),
                objc_msgSend(*(id *)(a1 + 40), "identifier"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v10, "syncStateForLibrary:dataClass:", v11, v9),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v12,
                v11,
                v12))
          {
            v13 = (id)objc_msgSend(*(id *)(a1 + 32), "_initiateSyncForDataClass:onMessageLink:", v9, *(_QWORD *)(a1 + 40));
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

void __47__ATDeviceSyncManager_cancelSyncOnMessageLink___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_activeSessionsOnMessageLink:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(v2, "allKeys", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(a1 + 32), "_cancelSyncForDataClass:onMessageLink:setSyncPending:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), *(_QWORD *)(a1 + 40), 0);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

void __49__ATDeviceSyncManager_initiateSyncOnMessageLink___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[ATClientController sharedInstance](ATClientController, "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allClients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EFC7B610))
        {
          v9 = *(void **)(a1 + 32);
          objc_msgSend(v8, "syncDataClass");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (id)objc_msgSend(v9, "_initiateSyncForDataClass:onMessageLink:", v10, *(_QWORD *)(a1 + 40));

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

uint64_t __60__ATDeviceSyncManager_cancelSyncForDataClass_onMessageLink___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelSyncForDataClass:onMessageLink:setSyncPending:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __62__ATDeviceSyncManager_initiateSyncForDataClass_onMessageLink___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_initiateSyncForDataClass:onMessageLink:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)deviceSyncManager
{
  return objc_alloc_init(ATDeviceSyncManager);
}

@end
