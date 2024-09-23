@implementation IMAVDaemonController

+ (id)sharedInstance
{
  if (qword_253DE94C8 != -1)
    dispatch_once(&qword_253DE94C8, &unk_24DA57B78);
  return (id)qword_253DE94F8;
}

- (IMAVDaemonController)init
{
  IMAVDaemonController *v2;
  __CFRunLoop *Main;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSLock *v11;
  NSLock *connectionLock;
  dispatch_queue_t v13;
  OS_dispatch_queue *remoteMessageQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *listenerLockQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *remoteDaemonLockQueue;
  dispatch_queue_t v19;
  OS_dispatch_queue *localObjectLockQueue;
  IMAVDaemonListener *v21;
  IMAVDaemonListener *daemonListener;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CFRunLoopSourceContext context;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)IMAVDaemonController;
  v2 = -[IMAVDaemonController init](&v29, sel_init);
  if (v2)
  {
    Main = CFRunLoopGetMain();
    memset(&context, 0, 72);
    context.perform = (void (__cdecl *)(void *))nullsub_1;
    v2->_runLoopSource = CFRunLoopSourceCreate(0, 0, &context);
    objc_opt_class();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v4 = (id)*MEMORY[0x24BE501E0];
    v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v24, (uint64_t)v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v4);
          CFRunLoopAddSource(Main, v2->_runLoopSource, *(CFRunLoopMode *)(*((_QWORD *)&v24 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v10, (uint64_t)&v24, (uint64_t)v30, 16);
      }
      while (v7);
    }

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = v11;

    v13 = dispatch_queue_create("com.apple.IMAVDaemonControllerQueue", 0);
    remoteMessageQueue = v2->_remoteMessageQueue;
    v2->_remoteMessageQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_create("com.apple.IMAVDaemonControllerListenerLockQueue", 0);
    listenerLockQueue = v2->_listenerLockQueue;
    v2->_listenerLockQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_create("com.apple.IMAVDaemonControllerAgentLockQueue", 0);
    remoteDaemonLockQueue = v2->_remoteDaemonLockQueue;
    v2->_remoteDaemonLockQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_create("com.apple.IMAVDaemonControllerLocalLockQueue", 0);
    localObjectLockQueue = v2->_localObjectLockQueue;
    v2->_localObjectLockQueue = (OS_dispatch_queue *)v19;

    v21 = objc_alloc_init(IMAVDaemonListener);
    daemonListener = v2->_daemonListener;
    v2->_daemonListener = v21;

  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  NSLock *connectionLock;
  objc_super v9;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, 0, 0);

  connectionLock = self->_connectionLock;
  self->_connectionLock = 0;

  v9.receiver = self;
  v9.super_class = (Class)IMAVDaemonController;
  -[IMAVDaemonController dealloc](&v9, sel_dealloc);
}

- (IMAVDaemonListener)listener
{
  return self->_daemonListener;
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
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2190200C0;
  v9[3] = &unk_24DA57BA0;
  v9[4] = self;
  v9[5] = &v10;
  v5 = (void (**)(_QWORD))MEMORY[0x219A2864C](v9);
  v6 = v5;
  if (v4)
    dispatch_sync(v4, v5);
  else
    v5[2](v5);
  v7 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)__isRemoteObjectValidOnQueue:(id)a3
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
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_2190201D4;
  v9[3] = &unk_24DA57BA0;
  v9[4] = self;
  v9[5] = &v10;
  v5 = (void (**)(_QWORD))MEMORY[0x219A2864C](v9);
  v6 = v5;
  if (v4)
    dispatch_sync(v4, v5);
  else
    v5[2](v5);
  v7 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)isConnecting
{
  uint64_t v2;
  uint64_t v3;
  int isLocalObjectValidOnQueue;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isSetupComplete;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  if (self->_acquiringDaemonConnection)
  {
    LOBYTE(isLocalObjectValidOnQueue) = 1;
  }
  else
  {
    isLocalObjectValidOnQueue = objc_msgSend___isLocalObjectValidOnQueue_(self, a2, (uint64_t)self->_localObjectLockQueue, v2, v3);
    if (isLocalObjectValidOnQueue)
    {
      objc_msgSend_listener(self, v6, v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      isSetupComplete = objc_msgSend_isSetupComplete(v10, v11, v12, v13, v14);

      if ((isSetupComplete & 1) != 0)
        LOBYTE(isLocalObjectValidOnQueue) = 0;
      else
        LOBYTE(isLocalObjectValidOnQueue) = objc_msgSend___isRemoteObjectValidOnQueue_(self, v16, (uint64_t)self->_remoteDaemonLockQueue, v17, v18);
    }
  }
  return isLocalObjectValidOnQueue;
}

- (BOOL)isConnected
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int isSetupComplete;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  if (objc_msgSend___isLocalObjectValidOnQueue_(self, a2, (uint64_t)self->_localObjectLockQueue, v2, v3)
    && (objc_msgSend_listener(self, v5, v6, v7, v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        isSetupComplete = objc_msgSend_isSetupComplete(v9, v10, v11, v12, v13),
        v9,
        isSetupComplete))
  {
    return objc_msgSend___isRemoteObjectValidOnQueue_(self, v15, (uint64_t)self->_remoteDaemonLockQueue, v16, v17);
  }
  else
  {
    return 0;
  }
}

- (void)_noteSetupComplete
{
  __CFRunLoop *Main;

  CFRunLoopSourceSignal(self->_runLoopSource);
  Main = CFRunLoopGetMain();
  CFRunLoopWakeUp(Main);
}

- (BOOL)remoteObjectExists
{
  NSObject *remoteDaemonLockQueue;
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
  remoteDaemonLockQueue = self->_remoteDaemonLockQueue;
  if (remoteDaemonLockQueue)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_2190203B0;
    v5[3] = &unk_24DA57BA0;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(remoteDaemonLockQueue, v5);
    v3 = *((_BYTE *)v7 + 24) != 0;
  }
  else
  {
    v3 = 0;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
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
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = sub_219020470;
    v5[3] = &unk_24DA57BA0;
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2190204E4;
  block[3] = &unk_24DA57828;
  block[4] = self;
  dispatch_sync(localObjectLockQueue, block);
}

- (void)_remoteObjectCleanup
{
  NSObject *remoteDaemonLockQueue;
  _QWORD block[5];

  remoteDaemonLockQueue = self->_remoteDaemonLockQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2190205D0;
  block[3] = &unk_24DA57828;
  block[4] = self;
  dispatch_sync(remoteDaemonLockQueue, block);
}

- (void)_listenerSetUpdated
{
  NSObject *listenerLockQueue;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  listenerLockQueue = self->_listenerLockQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2190207A0;
  block[3] = &unk_24DA57BA0;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(listenerLockQueue, block);
  if (*((_BYTE *)v17 + 24))
  {
    sub_2190076D0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "We have some listeners, make sure we're connected to daemon", v14, 2u);
    }

    objc_msgSend__connectToDaemon(self, v5, v6, v7, v8);
  }
  else
  {
    sub_2190076D0();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_218FEA000, v9, OS_LOG_TYPE_DEFAULT, "No more listeners disconnecting from daemon", v14, 2u);
    }

    objc_msgSend__disconnectFromDaemon(self, v10, v11, v12, v13);
  }
  _Block_object_dispose(&v16, 8);
}

- (BOOL)addListenerID:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *listenerLockQueue;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  IMAVDaemonController *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Request to add listener with ID: %@", buf, 0xCu);
  }

  v13 = objc_msgSend_length(v4, v6, v7, v8, v9);
  if (v13 && (objc_msgSend_hasListenerForID_(self, v10, (uint64_t)v4, v11, v12) & 1) == 0)
  {
    listenerLockQueue = self->_listenerLockQueue;
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = sub_219020914;
    v23 = &unk_24DA572E0;
    v24 = self;
    v25 = v4;
    dispatch_sync(listenerLockQueue, &v20);
    objc_msgSend__listenerSetUpdated(self, v15, v16, v17, v18, v20, v21, v22, v23, v24);

  }
  return v13 != 0;
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_219020A9C;
  block[3] = &unk_24DA57BC8;
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
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *listenerLockQueue;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  _QWORD block[5];
  id v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Request to remove listener with ID: %@", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend_length(v4, v6, v7, v8, v9))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x2020000000;
    v22 = 0;
    listenerLockQueue = self->_listenerLockQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_219020C48;
    block[3] = &unk_24DA57BF0;
    block[4] = self;
    v18 = v4;
    p_buf = &buf;
    dispatch_sync(listenerLockQueue, block);
    objc_msgSend__listenerSetUpdated(self, v11, v12, v13, v14);
    v15 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_makeConnectionWithCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char IsShuttingDown;
  NSObject *v15;
  const __CFString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  NSString *listenerID;
  char v35;
  NSObject *v36;
  _BOOL4 v37;
  NSString *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __CFDictionary *v48;
  NSString *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *localObjectLockQueue;
  _QWORD block[5];
  NSObject *v57;
  void (**v58)(_QWORD);
  uint8_t buf[4];
  const __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsShuttingDown = objc_msgSend_systemIsShuttingDown(v9, v10, v11, v12, v13);

  if ((IsShuttingDown & 1) != 0)
    goto LABEL_8;
  sub_2190076D0();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_hasCheckedForDaemon)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v60 = v16;
    _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "  Ensuring connection to daemon (has checked: %@)", buf, 0xCu);
  }

  if (self->_hasCheckedForDaemon)
  {
LABEL_8:
    v21 = 0;
  }
  else
  {
    self->_hasCheckedForDaemon = 1;
    if (!self->_listenerID)
    {
      IMGetMainBundleIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_length(v23, v24, v25, v26, v27))
      {
        objc_msgSend_stringGUID(MEMORY[0x24BDD17C8], v28, v29, v30, v31);
        v32 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v32;
      }
      v33 = (NSString *)objc_msgSend_copy(v23, v28, v29, v30, v31);
      listenerID = self->_listenerID;
      self->_listenerID = v33;

    }
    v35 = objc_msgSend_remoteObjectExists(self, v17, v18, v19, v20);
    sub_2190076D0();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    if ((v35 & 1) != 0)
    {
      if (v37)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218FEA000, v36, OS_LOG_TYPE_DEFAULT, "Remote Object exists, not creating new remote object", buf, 2u);
      }
    }
    else
    {
      if (v37)
      {
        v38 = self->_listenerID;
        *(_DWORD *)buf = 138412290;
        v60 = (const __CFString *)v38;
        _os_log_impl(&dword_218FEA000, v36, OS_LOG_TYPE_DEFAULT, "  Grabbing remote daemon port (listener ID: %@)", buf, 0xCu);
      }

      objc_msgSend_listener(self, v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__noteDisconnected(v43, v44, v45, v46, v47);

      v48 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v36 = v48;
      v49 = self->_listenerID;
      if (v49)
        CFDictionarySetValue(v48, CFSTR("listenerID"), v49);
      if (_IMWillLog())
      {
        objc_msgSend_date(MEMORY[0x24BDBCE60], v50, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
          CFDictionarySetValue((CFMutableDictionaryRef)v36, CFSTR("agentRequested"), v54);

      }
      if (objc_msgSend_remoteObjectExists(self, v50, v51, v52, v53))
      {
        if (v4)
          v4[2](v4);
      }
      else
      {
        localObjectLockQueue = self->_localObjectLockQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_2190210A0;
        block[3] = &unk_24DA57C40;
        block[4] = self;
        v36 = v36;
        v57 = v36;
        v58 = v4;
        dispatch_sync(localObjectLockQueue, block);

        if (qword_25503B960 != -1)
          dispatch_once(&qword_25503B960, &unk_24DA57C60);
      }
    }

    v21 = 1;
  }

  return v21;
}

- (void)_connectToDaemon
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int IsShuttingDown;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const __CFString *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[5];
  uint8_t buf[4];
  const __CFString *v62;
  __int16 v63;
  const __CFString *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  IsShuttingDown = objc_msgSend_systemIsShuttingDown(v6, v7, v8, v9, v10);

  if (IsShuttingDown)
  {
    sub_2190076D0();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v17, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_systemIsShuttingDown(v21, v22, v23, v24, v25);
      v27 = CFSTR("NO");
      if (v26)
        v27 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v62 = v27;
      _os_log_impl(&dword_218FEA000, v16, OS_LOG_TYPE_DEFAULT, "  Connecting to avdaemon (system is shutting down: %@", buf, 0xCu);

    }
  }
  else if ((objc_msgSend_isConnected(self, v12, v13, v14, v15) & 1) != 0
         || objc_msgSend_isConnecting(self, v28, v29, v30, v31))
  {
    sub_2190076D0();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend_isConnected(self, v33, v34, v35, v36))
        v41 = CFSTR("YES");
      else
        v41 = CFSTR("NO");
      if (objc_msgSend_isConnecting(self, v37, v38, v39, v40))
        v42 = CFSTR("YES");
      else
        v42 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v62 = v41;
      v63 = 2112;
      v64 = v42;
      _os_log_impl(&dword_218FEA000, v32, OS_LOG_TYPE_DEFAULT, "  Daemon is connected %@ is connecting %@", buf, 0x16u);
    }

  }
  else
  {
    sub_2190076D0();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v43, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21902BCC7, buf, 2u);
    }

    objc_msgSend_lock(self->_connectionLock, v44, v45, v46, v47);
    if ((!objc_msgSend_remoteObjectExists(self, v48, v49, v50, v51)
       || (objc_msgSend___isLocalObjectValidOnQueue_(self, v52, (uint64_t)self->_localObjectLockQueue, v54, v55) & 1) == 0)
      && !self->_acquiringDaemonConnection)
    {
      objc_msgSend__cleanUpConnection(self, v52, v53, v54, v55);
      self->_acquiringDaemonConnection = 1;
      dispatch_suspend((dispatch_object_t)self->_remoteMessageQueue);
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = sub_2190218E8;
      v60[3] = &unk_24DA57828;
      v60[4] = self;
      v56 = (void *)MEMORY[0x219A2864C](v60);
      if ((objc_msgSend__makeConnectionWithCompletionBlock_(self, v57, (uint64_t)v56, v58, v59) & 1) == 0)
        self->_acquiringDaemonConnection = 0;

    }
    objc_msgSend_unlock(self->_connectionLock, v52, v53, v54, v55);
  }
}

- (void)_cleanUpConnection
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t v33[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21902BCC7, v33, 2u);
  }

  *(_WORD *)&self->_hasCheckedForDaemon = 0;
  if ((objc_msgSend_localObjectExists(self, v4, v5, v6, v7) & 1) != 0
    || objc_msgSend_remoteObjectExists(self, v8, v9, v10, v11))
  {
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObserver_name_object_(v12, v13, (uint64_t)self, *MEMORY[0x24BE501D0], 0);

    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObserver_name_object_(v18, v19, (uint64_t)self, *MEMORY[0x24BE50168], 0);

    objc_msgSend__remoteObjectCleanup(self, v20, v21, v22, v23);
    objc_msgSend__localObjectCleanup(self, v24, v25, v26, v27);
  }
  objc_msgSend_listener(self, v8, v9, v10, v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__noteDisconnected(v28, v29, v30, v31, v32);

}

- (void)_disconnectFromDaemon
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21902BCC7, v8, 2u);
  }

  objc_msgSend__cleanUpConnection(self, v4, v5, v6, v7);
}

- (void)_localObjectDiedNotification:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, " ... disconnection from agent (local) being handled by main thread", v13, 2u);
  }

  objc_msgSend__disconnectFromDaemon(self, v5, v6, v7, v8);
  objc_msgSend__listenerSetUpdated(self, v9, v10, v11, v12);
  byte_25503B968 = 0;
}

- (void)_remoteObjectDiedNotification:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char IsShuttingDown;
  NSObject *v19;
  uint8_t buf[16];

  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, " ... disconnection from agent (remote) being handled by main thread", buf, 2u);
  }

  objc_msgSend__disconnectFromDaemon(self, v5, v6, v7, v8);
  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  IsShuttingDown = objc_msgSend_systemIsShuttingDown(v13, v14, v15, v16, v17);

  if ((IsShuttingDown & 1) == 0)
  {
    sub_2190076D0();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218FEA000, v19, OS_LOG_TYPE_DEFAULT, "Will auto reconnect...", buf, 2u);
    }

    im_dispatch_after();
  }
}

- (void)localObjectDiedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint8_t v16[16];

  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Disconnected from agent (local)...", v16, 2u);
  }

  objc_msgSend_listener(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__noteDisconnected(v10, v11, v12, v13, v14);

  byte_25503B968 = 1;
  objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v15, (uint64_t)sel__localObjectDiedNotification_, (uint64_t)v4, 0);

}

- (void)remoteObjectDiedNotification:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint8_t v16[16];

  v4 = a3;
  objc_msgSend_listener(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__noteDisconnected(v9, v10, v11, v12, v13);

  if ((byte_25503B968 & 1) == 0)
  {
    sub_2190076D0();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_218FEA000, v14, OS_LOG_TYPE_DEFAULT, "Disconnected from agent (remote)...", v16, 2u);
    }

    objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(self, v15, (uint64_t)sel__remoteObjectDiedNotification_, (uint64_t)v4, 0);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription;
  uint64_t v4;
  uint64_t v5;

  MethodDescription = protocol_getMethodDescription((Protocol *)&unk_25504A4C8, a3, 1, 1);
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDBCEB0], sel_signatureWithObjCTypes_, MethodDescription.types, v4, v5);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *remoteDaemonLockQueue;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v20;
  IMAVDaemonController *v21;
  id v22;
  _QWORD block[4];
  id v24;
  IMAVDaemonController *v25;

  v4 = a3;
  if ((objc_msgSend_isConnected(self, v5, v6, v7, v8) & 1) != 0)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = sub_219022070;
    v20 = &unk_24DA572E0;
    v21 = self;
    v9 = v4;
    v22 = v9;
    v10 = (void *)MEMORY[0x219A2864C](&v17);
    objc_msgSend_retainArguments(v9, v11, v12, v13, v14, v17, v18, v19, v20, v21);
    dispatch_async((dispatch_queue_t)self->_remoteMessageQueue, v10);

    v15 = v22;
LABEL_5:

    goto LABEL_6;
  }
  remoteDaemonLockQueue = self->_remoteDaemonLockQueue;
  if (remoteDaemonLockQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_219021F90;
    block[3] = &unk_24DA572E0;
    v24 = v4;
    v25 = self;
    dispatch_sync(remoteDaemonLockQueue, block);
    v15 = v24;
    goto LABEL_5;
  }
LABEL_6:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localObjectLockQueue, 0);
  objc_storeStrong((id *)&self->_remoteMessageQueue, 0);
  objc_storeStrong((id *)&self->_remoteDaemonLockQueue, 0);
  objc_storeStrong((id *)&self->_listenerLockQueue, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_daemonListener, 0);
  objc_storeStrong((id *)&self->_localObject, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
}

@end
