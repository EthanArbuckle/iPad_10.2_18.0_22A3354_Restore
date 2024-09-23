@implementation BiometricKitXPCClient

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_connection);
}

+ (void)initialize
{
  id v3;
  id v4;
  void *v5;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = (void *)_clientIDs;
    _clientIDs = (uint64_t)v4;

  }
}

- (id)getProtectedConfigurationForUser:(unsigned int)a3
{
  uint64_t v3;
  int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v3 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "[self initializeConnection] == 0 ";
      v22 = 2048;
      v23 = v5;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v28 = 1024;
      v29 = 1143;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_300);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BiometricKitXPCClient clientID](self, "clientID");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__BiometricKitXPCClient_getProtectedConfigurationForUser___block_invoke_2;
    v13[3] = &unk_1E5F83F88;
    v13[4] = &v14;
    objc_msgSend(v8, "getProtectedConfigurationForUser:client:replyBlock:", v3, v9, v13);

  }
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

- (void)dealloc
{
  id v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[BiometricKitXPCClient invalidateConnection](self, "invalidateConnection");
  v3 = (id)_clientIDs;
  objc_sync_enter(v3);
  if (self->_clientID)
  {
    v4 = (void *)_clientIDs;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

  }
  objc_sync_exit(v3);

  v6.receiver = self;
  v6.super_class = (Class)BiometricKitXPCClient;
  -[BiometricKitXPCClient dealloc](&v6, sel_dealloc);
}

- (void)invalidateConnection
{
  id WeakRetained;
  _BOOL4 connectionInvalidated;
  id v4;
  BiometricKitXPCClient *obj;

  obj = self;
  objc_sync_enter(obj);
  WeakRetained = objc_loadWeakRetained((id *)&obj->_connection);
  if (WeakRetained)
  {
    connectionInvalidated = obj->_connectionInvalidated;

    if (!connectionInvalidated)
    {
      if (obj->_connectionInitialized)
      {
        if (!obj->_connectionInterrupted)
          -[BiometricKitXPCClient disconnect](obj, "disconnect");
        obj->_connectionInitialized = 0;
      }
      v4 = objc_loadWeakRetained((id *)&obj->_connection);
      objc_msgSend(v4, "removeClient:", obj);

      obj->_connectionInvalidated = 1;
    }
  }
  objc_sync_exit(obj);

}

- (BiometricKitXPCClient)initWithDeviceType:(int64_t)a3 clientType:(int64_t)a4
{
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BiometricKitXPCClient *v14;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  +[BiometricKitXPCClientConnection connectionWithDeviceType:](BiometricKitXPCClientConnection, "connectionWithDeviceType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136316162;
    v21 = "0";
    v22 = 2048;
    v23 = 0;
    v24 = 2080;
    v25 = &unk_1AF575226;
    v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    v28 = 1024;
    v29 = 526;
LABEL_13:
    _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_26;
  }
  if ((unint64_t)(a4 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x1E0C81028];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136316162;
    v21 = "0";
    v22 = 2048;
    v23 = 0;
    v24 = 2080;
    v25 = &unk_1AF575226;
    v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    v28 = 1024;
    v29 = 531;
    goto LABEL_13;
  }
  v19.receiver = self;
  v19.super_class = (Class)BiometricKitXPCClient;
  self = -[BiometricKitXPCClient init](&v19, sel_init);
  if (!self)
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "self";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v28 = 1024;
      v29 = 536;
      _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
LABEL_30:
    self = self;
    v14 = self;
    goto LABEL_27;
  }
  v8 = (id)_clientIDs;
  objc_sync_enter(v8);
  v9 = _clientIDIndex;
  v10 = _clientIDIndex;
  while (!v10)
  {
LABEL_19:
    if (++v10 == v9)
    {
      if (__osLog)
        v13 = __osLog;
      else
        v13 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = "0";
        v22 = 2048;
        v23 = 0;
        v24 = 2080;
        v25 = &unk_1AF575226;
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        v28 = 1024;
        v29 = 544;
        _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      objc_sync_exit(v8);

      goto LABEL_26;
    }
  }
  v11 = (void *)_clientIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "containsObject:", v12);

  if ((_DWORD)v11)
  {
    v9 = _clientIDIndex;
    goto LABEL_19;
  }
  v16 = (void *)_clientIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

  self->_clientID = v10;
  _clientIDIndex = v10 + 1;
  objc_sync_exit(v8);

  self->_connectionID = arc4random();
  if ((objc_msgSend(v6, "addClient:", self) & 1) != 0)
  {
    objc_storeWeak((id *)&self->_connection, v6);
    self->_clientType = a4;
    goto LABEL_30;
  }
  if (__osLog)
    v7 = __osLog;
  else
    v7 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v21 = "0";
    v22 = 2048;
    v23 = 0;
    v24 = 2080;
    v25 = &unk_1AF575226;
    v26 = 2080;
    v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
    v28 = 1024;
    v29 = 557;
    goto LABEL_13;
  }
LABEL_26:
  v14 = 0;
LABEL_27:

  return v14;
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (unint64_t)connectionId
{
  return self->_connectionID;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)initializeConnection
{
  BiometricKitXPCClient *v2;
  int v3;
  id WeakRetained;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_connectionInterrupted)
  {
    v2->_connectionInterrupted = 0;
    v2->_connectionInitialized = 0;
  }
  else if (v2->_connectionInitialized)
  {
    goto LABEL_7;
  }
  if (v2->_connectionInvalidated)
  {
LABEL_7:
    v3 = 0;
    goto LABEL_8;
  }
  v3 = -[BiometricKitXPCClient connect](v2, "connect");
  if (v3)
  {
    if (__osLog)
      v6 = __osLog;
    else
      v6 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136316162;
      v8 = "err == 0 ";
      v9 = 2048;
      v10 = v3;
      v11 = 2080;
      v12 = &unk_1AF575226;
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v15 = 1024;
      v16 = 659;
      _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
    -[BiometricKitXPCClient registerDelegateCall:](v2, "registerDelegateCall:", objc_msgSend(WeakRetained, "isDelegate"));

    v3 = 0;
    v2->_connectionInitialized = 1;
  }
LABEL_8:
  objc_sync_exit(v2);

  return v3;
}

void __58__BiometricKitXPCClient_getProtectedConfigurationForUser___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BiometricKitXPCClient)init
{
  uint64_t v3;

  if ((isTouchIDPlatform() & 1) != 0)
  {
    v3 = 1;
  }
  else if (isFaceIDPlatform())
  {
    v3 = 2;
  }
  else
  {
    v3 = 0;
  }
  return -[BiometricKitXPCClient initWithDeviceType:clientType:](self, "initWithDeviceType:clientType:", v3, 1);
}

- (void)interruptConnection
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 134217984;
    v9 = -[BiometricKitXPCClient connectionId](self, "connectionId");
    _os_log_impl(&dword_1AF533000, v4, OS_LOG_TYPE_DEFAULT, "BiometricKitXPCClient::interruptConnection (_cid %lu)\n", buf, 0xCu);

  }
  self->_connectionInterrupted = 1;
  objc_initWeak((id *)buf, self);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__BiometricKitXPCClient_interruptConnection__block_invoke;
  block[3] = &unk_1E5F83AF8;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __44__BiometricKitXPCClient_interruptConnection__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 6);
    objc_msgSend(v2, "connectionInterrupted");

    WeakRetained = v3;
  }

}

- (int)connect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("BKClientBundleIdentifier"));
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("BKClientProcessId"));

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("BKClientProcessName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_clientType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("BKClientType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BiometricKitXPCClient connectionId](self, "connectionId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("BKClientConnectionId"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __32__BiometricKitXPCClient_connect__block_invoke;
    v21[3] = &unk_1E5F83C60;
    v21[4] = &v22;
    objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __32__BiometricKitXPCClient_connect__block_invoke_2;
    v20[3] = &unk_1E5F83C88;
    v20[4] = &v22;
    objc_msgSend(v16, "connect:client:replyBlock:", v3, -[BiometricKitXPCClient clientID](self, "clientID"), v20);

    v17 = *((_DWORD *)v23 + 6);
  }
  else
  {
    if (__osLog)
      v19 = __osLog;
    else
      v19 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "xcpConnection";
      v28 = 2048;
      v29 = 0;
      v30 = 2080;
      v31 = &unk_1AF575226;
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v34 = 1024;
      v35 = 688;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v17 = 1;
    *((_DWORD *)v23 + 6) = 1;
  }

  _Block_object_dispose(&v22, 8);
  return v17;
}

uint64_t __32__BiometricKitXPCClient_connect__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __32__BiometricKitXPCClient_connect__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;
  uint8_t v4[16];

  if (a2 == 266)
  {
    if (isInternalBuild())
    {
      if (__osLog)
        v3 = __osLog;
      else
        v3 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1AF533000, v3, OS_LOG_TYPE_ERROR, "Please adopt new BiometricKit entitlements (see rdar://105770455 for additional details)\n", v4, 2u);
      }
    }
    a2 = 0;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (void)disconnect
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disconnect:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), &__block_literal_global_280);

}

- (void)registerDelegateCall:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_281);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerDelegate:client:replyBlock:", v3, -[BiometricKitXPCClient clientID](self, "clientID"), &__block_literal_global_282);

}

- (void)registerDelegate:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (self->_connectionInitialized)
  {
    -[BiometricKitXPCClient registerDelegateCall:](self, "registerDelegateCall:", a3);
  }
  else if (a3)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__BiometricKitXPCClient_registerDelegate___block_invoke;
    block[3] = &unk_1E5F83D50;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

uint64_t __42__BiometricKitXPCClient_registerDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initializeConnection");
}

- (void)notifyAppIsBackground:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_283);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notifyAppIsBackground:client:", v3, -[BiometricKitXPCClient clientID](self, "clientID"));

}

- (void)notifyAppIsInactive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_284);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notifyAppIsInactive:client:", v3, -[BiometricKitXPCClient clientID](self, "clientID"));

}

- (void)enroll:(int)a3 forUser:(unsigned int)a4 withOptions:(id)a5 async:(BOOL)a6 withReply:(id)a7
{
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  void (**v13)(id, _QWORD);
  int v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  void (**v18)(id, _QWORD);
  void *v19;
  unint64_t v20;
  void *v21;
  void (**v22)(id, _QWORD);
  void *v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[4];
  void (**v28)(id, _QWORD);
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  void (**v32)(id, _QWORD);
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v8 = a6;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a7;
  v14 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v14)
  {
    v25 = v14;
    if (__osLog)
      v26 = __osLog;
    else
      v26 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "status == 0 ";
      v37 = 2048;
      v38 = v25;
      v39 = 2080;
      v40 = &unk_1AF575226;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v43 = 1024;
      v44 = 784;
      _os_log_impl(&dword_1AF533000, v26, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v13[2](v13, v25);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke;
      v33[3] = &unk_1E5F83DB8;
      v18 = v13;
      v34 = v18;
      objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v33);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[BiometricKitXPCClient clientID](self, "clientID");
      v31[0] = v17;
      v31[1] = 3221225472;
      v31[2] = __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_2;
      v31[3] = &unk_1E5F83DE0;
      v32 = v18;
      objc_msgSend(v19, "enroll:user:options:async:client:replyBlock:", v10, v9, v12, 1, v20, v31);

      v21 = v34;
    }
    else
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_3;
      v29[3] = &unk_1E5F83DB8;
      v22 = v13;
      v30 = v22;
      objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[BiometricKitXPCClient clientID](self, "clientID");
      v27[0] = v17;
      v27[1] = 3221225472;
      v27[2] = __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_4;
      v27[3] = &unk_1E5F83DE0;
      v28 = v22;
      objc_msgSend(v23, "enroll:user:options:async:client:replyBlock:", v10, v9, v12, 0, v24, v27);

      v21 = v30;
    }

  }
}

uint64_t __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __68__BiometricKitXPCClient_enroll_forUser_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)match:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  int v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void (**v17)(id, _QWORD);
  void *v18;
  unint64_t v19;
  void *v20;
  void (**v21)(id, _QWORD);
  void *v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  void (**v27)(id, _QWORD);
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  void (**v31)(id, _QWORD);
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v7 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  v13 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v13)
  {
    v24 = v13;
    if (__osLog)
      v25 = __osLog;
    else
      v25 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v35 = "status == 0 ";
      v36 = 2048;
      v37 = v24;
      v38 = 2080;
      v39 = &unk_1AF575226;
      v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v42 = 1024;
      v43 = 816;
      _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12[2](v12, v24);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke;
      v32[3] = &unk_1E5F83DB8;
      v17 = v12;
      v33 = v17;
      objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[BiometricKitXPCClient clientID](self, "clientID");
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_2;
      v30[3] = &unk_1E5F83DE0;
      v31 = v17;
      objc_msgSend(v18, "match:options:async:client:replyBlock:", v10, v11, 1, v19, v30);

      v20 = v33;
    }
    else
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_3;
      v28[3] = &unk_1E5F83DB8;
      v21 = v12;
      v29 = v21;
      objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[BiometricKitXPCClient clientID](self, "clientID");
      v26[0] = v16;
      v26[1] = 3221225472;
      v26[2] = __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_4;
      v26[3] = &unk_1E5F83DE0;
      v27 = v21;
      objc_msgSend(v22, "match:options:async:client:replyBlock:", v10, v11, 0, v23, v26);

      v20 = v29;
    }

  }
}

uint64_t __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __59__BiometricKitXPCClient_match_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)detectPresenceWithOptions:(id)a3 async:(BOOL)a4 withReply:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD);
  int v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void (**v14)(id, _QWORD);
  void *v15;
  unint64_t v16;
  void *v17;
  void (**v18)(id, _QWORD);
  void *v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[4];
  void (**v24)(id, _QWORD);
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  void (**v28)(id, _QWORD);
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v6 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v10)
  {
    v21 = v10;
    if (__osLog)
      v22 = __osLog;
    else
      v22 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v32 = "status == 0 ";
      v33 = 2048;
      v34 = v21;
      v35 = 2080;
      v36 = &unk_1AF575226;
      v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v39 = 1024;
      v40 = 848;
      _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v9[2](v9, v21);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke;
      v29[3] = &unk_1E5F83DB8;
      v14 = v9;
      v30 = v14;
      objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[BiometricKitXPCClient clientID](self, "clientID");
      v27[0] = v13;
      v27[1] = 3221225472;
      v27[2] = __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_2;
      v27[3] = &unk_1E5F83DE0;
      v28 = v14;
      objc_msgSend(v15, "detectPresenceWithOptions:async:client:replyBlock:", v8, 1, v16, v27);

      v17 = v30;
    }
    else
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_3;
      v25[3] = &unk_1E5F83DB8;
      v18 = v9;
      v26 = v18;
      objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[BiometricKitXPCClient clientID](self, "clientID");
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_4;
      v23[3] = &unk_1E5F83DE0;
      v24 = v18;
      objc_msgSend(v19, "detectPresenceWithOptions:async:client:replyBlock:", v8, 0, v20, v23);

      v17 = v26;
    }

  }
}

uint64_t __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __67__BiometricKitXPCClient_detectPresenceWithOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancel
{
  int v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  id WeakRetained;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    v6 = v3;
    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v10 = "[self initializeConnection] == 0 ";
      v11 = 2048;
      v12 = v6;
      v13 = 2080;
      v14 = &unk_1AF575226;
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v17 = 1024;
      v18 = 877;
      _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_287);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), &__block_literal_global_288);

  }
}

- (void)updateIdentity:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  int v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void (**v17)(id, _QWORD);
  void *v18;
  unint64_t v19;
  void *v20;
  void (**v21)(id, _QWORD);
  void *v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  void (**v27)(id, _QWORD);
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  void (**v31)(id, _QWORD);
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v7 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  v13 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v13)
  {
    v24 = v13;
    if (__osLog)
      v25 = __osLog;
    else
      v25 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v35 = "status == 0 ";
      v36 = 2048;
      v37 = v24;
      v38 = 2080;
      v39 = &unk_1AF575226;
      v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v42 = 1024;
      v43 = 894;
      _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12[2](v12, v24);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke;
      v32[3] = &unk_1E5F83DB8;
      v17 = v12;
      v33 = v17;
      objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[BiometricKitXPCClient clientID](self, "clientID");
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_2;
      v30[3] = &unk_1E5F83DE0;
      v31 = v17;
      objc_msgSend(v18, "updateIdentity:options:async:client:replyBlock:", v10, v11, 1, v19, v30);

      v20 = v33;
    }
    else
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_3;
      v28[3] = &unk_1E5F83DB8;
      v21 = v12;
      v29 = v21;
      objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[BiometricKitXPCClient clientID](self, "clientID");
      v26[0] = v16;
      v26[1] = 3221225472;
      v26[2] = __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_4;
      v26[3] = &unk_1E5F83DE0;
      v27 = v21;
      objc_msgSend(v22, "updateIdentity:options:async:client:replyBlock:", v10, v11, 0, v23, v26);

      v20 = v29;
    }

  }
}

uint64_t __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __68__BiometricKitXPCClient_updateIdentity_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeIdentity:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  int v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void (**v17)(id, _QWORD);
  void *v18;
  unint64_t v19;
  void *v20;
  void (**v21)(id, _QWORD);
  void *v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  void (**v27)(id, _QWORD);
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  void (**v31)(id, _QWORD);
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v7 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  v13 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v13)
  {
    v24 = v13;
    if (__osLog)
      v25 = __osLog;
    else
      v25 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v35 = "status == 0 ";
      v36 = 2048;
      v37 = v24;
      v38 = 2080;
      v39 = &unk_1AF575226;
      v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v42 = 1024;
      v43 = 926;
      _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12[2](v12, v24);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke;
      v32[3] = &unk_1E5F83DB8;
      v17 = v12;
      v33 = v17;
      objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[BiometricKitXPCClient clientID](self, "clientID");
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_2;
      v30[3] = &unk_1E5F83DE0;
      v31 = v17;
      objc_msgSend(v18, "removeIdentity:options:async:client:replyBlock:", v10, v11, 1, v19, v30);

      v20 = v33;
    }
    else
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_3;
      v28[3] = &unk_1E5F83DB8;
      v21 = v12;
      v29 = v21;
      objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[BiometricKitXPCClient clientID](self, "clientID");
      v26[0] = v16;
      v26[1] = 3221225472;
      v26[2] = __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_4;
      v26[3] = &unk_1E5F83DE0;
      v27 = v21;
      objc_msgSend(v22, "removeIdentity:options:async:client:replyBlock:", v10, v11, 0, v23, v26);

      v20 = v29;
    }

  }
}

uint64_t __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __68__BiometricKitXPCClient_removeIdentity_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeAllIdentitiesForUser:(unsigned int)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6
{
  _BOOL4 v7;
  uint64_t v8;
  id v10;
  void (**v11)(id, _QWORD);
  int v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  void (**v16)(id, _QWORD);
  void *v17;
  unint64_t v18;
  void *v19;
  void (**v20)(id, _QWORD);
  void *v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[4];
  void (**v26)(id, _QWORD);
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  void (**v30)(id, _QWORD);
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v43 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a6;
  v12 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v12)
  {
    v23 = v12;
    if (__osLog)
      v24 = __osLog;
    else
      v24 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v34 = "status == 0 ";
      v35 = 2048;
      v36 = v23;
      v37 = 2080;
      v38 = &unk_1AF575226;
      v39 = 2080;
      v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v41 = 1024;
      v42 = 958;
      _os_log_impl(&dword_1AF533000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v11[2](v11, v23);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke;
      v31[3] = &unk_1E5F83DB8;
      v16 = v11;
      v32 = v16;
      objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[BiometricKitXPCClient clientID](self, "clientID");
      v29[0] = v15;
      v29[1] = 3221225472;
      v29[2] = __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_2;
      v29[3] = &unk_1E5F83DE0;
      v30 = v16;
      objc_msgSend(v17, "removeAllIdentitiesForUser:options:async:client:replyBlock:", v8, v10, 1, v18, v29);

      v19 = v32;
    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_3;
      v27[3] = &unk_1E5F83DB8;
      v20 = v11;
      v28 = v20;
      objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[BiometricKitXPCClient clientID](self, "clientID");
      v25[0] = v15;
      v25[1] = 3221225472;
      v25[2] = __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_4;
      v25[3] = &unk_1E5F83DE0;
      v26 = v20;
      objc_msgSend(v21, "removeAllIdentitiesForUser:options:async:client:replyBlock:", v8, v10, 0, v22, v25);

      v19 = v28;
    }

  }
}

uint64_t __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __80__BiometricKitXPCClient_removeAllIdentitiesForUser_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)getIdentityFromUUID:(id)a3
{
  id v4;
  int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "[self initializeConnection] == 0 ";
      v22 = 2048;
      v23 = v5;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v28 = 1024;
      v29 = 989;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_289);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BiometricKitXPCClient clientID](self, "clientID");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__BiometricKitXPCClient_getIdentityFromUUID___block_invoke_2;
    v13[3] = &unk_1E5F83E48;
    v13[4] = &v14;
    objc_msgSend(v8, "getIdentityFromUUID:client:replyBlock:", v4, v9, v13);

  }
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __45__BiometricKitXPCClient_getIdentityFromUUID___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)identities:(id)a3
{
  id v4;
  int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "[self initializeConnection] == 0 ";
      v22 = 2048;
      v23 = v5;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v28 = 1024;
      v29 = 1008;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_291);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BiometricKitXPCClient clientID](self, "clientID");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __36__BiometricKitXPCClient_identities___block_invoke_2;
    v13[3] = &unk_1E5F83E90;
    v13[4] = &v14;
    objc_msgSend(v8, "identities:client:replyBlock:", v4, v9, v13);

  }
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __36__BiometricKitXPCClient_identities___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int64_t)getMaxIdentityCount:(int)a3
{
  uint64_t v3;
  int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  NSObject *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self initializeConnection] == 0 ";
      v20 = 2048;
      v21 = v5;
      v22 = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v26 = 1024;
      v27 = 1027;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_293);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BiometricKitXPCClient clientID](self, "clientID");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__BiometricKitXPCClient_getMaxIdentityCount___block_invoke_2;
    v13[3] = &unk_1E5F83ED8;
    v13[4] = &v14;
    objc_msgSend(v8, "getMaxIdentityCount:client:replyBlock:", v3, v9, v13);

  }
  v10 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v10;
}

uint64_t __45__BiometricKitXPCClient_getMaxIdentityCount___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)getFreeIdentityCount:(int)a3 forUser:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  int v7;
  id WeakRetained;
  void *v9;
  void *v10;
  unint64_t v11;
  int64_t v12;
  NSObject *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v7)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "[self initializeConnection] == 0 ";
      v22 = 2048;
      v23 = v7;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v28 = 1024;
      v29 = 1046;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_295);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BiometricKitXPCClient clientID](self, "clientID");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__BiometricKitXPCClient_getFreeIdentityCount_forUser___block_invoke_2;
    v15[3] = &unk_1E5F83ED8;
    v15[4] = &v16;
    objc_msgSend(v10, "getFreeIdentityCount:user:client:replyBlock:", v5, v4, v11, v15);

  }
  v12 = v17[3];
  _Block_object_dispose(&v16, 8);
  return v12;
}

uint64_t __54__BiometricKitXPCClient_getFreeIdentityCount_forUser___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)enrollContinue
{
  int v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v14 + 6) = v3;
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "status == 0 ";
      v19 = 2048;
      v20 = v3;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v25 = 1024;
      v26 = 1066;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__BiometricKitXPCClient_enrollContinue__block_invoke;
    v12[3] = &unk_1E5F83C60;
    v12[4] = &v13;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __39__BiometricKitXPCClient_enrollContinue__block_invoke_2;
    v11[3] = &unk_1E5F83C88;
    v11[4] = &v13;
    objc_msgSend(v7, "enrollContinue:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), v11);

  }
  v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __39__BiometricKitXPCClient_enrollContinue__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __39__BiometricKitXPCClient_enrollContinue__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)pullAlignmentData
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self initializeConnection] == 0 ";
      v20 = 2048;
      v21 = v3;
      v22 = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v26 = 1024;
      v27 = 1086;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_296);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__BiometricKitXPCClient_pullAlignmentData__block_invoke_2;
    v11[3] = &unk_1E5F83F20;
    v11[4] = &v12;
    objc_msgSend(v6, "pullAlignmentData:replyBlock:", v7, v11);

  }
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __42__BiometricKitXPCClient_pullAlignmentData__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)pullMatchPolicyInfoData
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self initializeConnection] == 0 ";
      v20 = 2048;
      v21 = v3;
      v22 = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v26 = 1024;
      v27 = 1105;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_298);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__BiometricKitXPCClient_pullMatchPolicyInfoData__block_invoke_2;
    v11[3] = &unk_1E5F83F20;
    v11[4] = &v12;
    objc_msgSend(v6, "pullMatchPolicyInfoData:replyBlock:", v7, v11);

  }
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __48__BiometricKitXPCClient_pullMatchPolicyInfoData__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getNodeTopologyForIdentity:(id)a3
{
  id v4;
  int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "[self initializeConnection] == 0 ";
      v22 = 2048;
      v23 = v5;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v28 = 1024;
      v29 = 1124;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_299);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BiometricKitXPCClient clientID](self, "clientID");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__BiometricKitXPCClient_getNodeTopologyForIdentity___block_invoke_2;
    v13[3] = &unk_1E5F83F20;
    v13[4] = &v14;
    objc_msgSend(v8, "getNodeTopologyForIdentity:client:replyBlock:", v4, v9, v13);

  }
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __52__BiometricKitXPCClient_getNodeTopologyForIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getSystemProtectedConfiguration
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self initializeConnection] == 0 ";
      v20 = 2048;
      v21 = v3;
      v22 = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v26 = 1024;
      v27 = 1162;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_302);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__BiometricKitXPCClient_getSystemProtectedConfiguration__block_invoke_2;
    v11[3] = &unk_1E5F83F88;
    v11[4] = &v12;
    objc_msgSend(v6, "getSystemProtectedConfiguration:replyBlock:", v7, v11);

  }
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __56__BiometricKitXPCClient_getSystemProtectedConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setProtectedConfiguration:(id)a3 forUser:(unsigned int)a4 withOptions:(id)a5 async:(BOOL)a6 withReply:(id)a7
{
  _BOOL4 v8;
  uint64_t v10;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  int v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  void (**v19)(id, _QWORD);
  void *v20;
  unint64_t v21;
  void *v22;
  void (**v23)(id, _QWORD);
  void *v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[4];
  void (**v29)(id, _QWORD);
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  void (**v33)(id, _QWORD);
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v8 = a6;
  v10 = *(_QWORD *)&a4;
  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, _QWORD))a7;
  v15 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v15)
  {
    v26 = v15;
    if (__osLog)
      v27 = __osLog;
    else
      v27 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v37 = "status == 0 ";
      v38 = 2048;
      v39 = v26;
      v40 = 2080;
      v41 = &unk_1AF575226;
      v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v44 = 1024;
      v45 = 1182;
      _os_log_impl(&dword_1AF533000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v14[2](v14, v26);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke;
      v34[3] = &unk_1E5F83DB8;
      v19 = v14;
      v35 = v19;
      objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[BiometricKitXPCClient clientID](self, "clientID");
      v32[0] = v18;
      v32[1] = 3221225472;
      v32[2] = __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_2;
      v32[3] = &unk_1E5F83DE0;
      v33 = v19;
      objc_msgSend(v20, "setProtectedConfiguration:user:options:async:client:replyBlock:", v12, v10, v13, 1, v21, v32);

      v22 = v35;
    }
    else
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_3;
      v30[3] = &unk_1E5F83DB8;
      v23 = v14;
      v31 = v23;
      objc_msgSend(v17, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[BiometricKitXPCClient clientID](self, "clientID");
      v28[0] = v18;
      v28[1] = 3221225472;
      v28[2] = __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_4;
      v28[3] = &unk_1E5F83DE0;
      v29 = v23;
      objc_msgSend(v24, "setProtectedConfiguration:user:options:async:client:replyBlock:", v12, v10, v13, 0, v25, v28);

      v22 = v31;
    }

  }
}

uint64_t __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __87__BiometricKitXPCClient_setProtectedConfiguration_forUser_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSystemProtectedConfiguration:(id)a3 withOptions:(id)a4 async:(BOOL)a5 withReply:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  int v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void (**v17)(id, _QWORD);
  void *v18;
  unint64_t v19;
  void *v20;
  void (**v21)(id, _QWORD);
  void *v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD v26[4];
  void (**v27)(id, _QWORD);
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  void (**v31)(id, _QWORD);
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v7 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  v13 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v13)
  {
    v24 = v13;
    if (__osLog)
      v25 = __osLog;
    else
      v25 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v35 = "status == 0 ";
      v36 = 2048;
      v37 = v24;
      v38 = 2080;
      v39 = &unk_1AF575226;
      v40 = 2080;
      v41 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v42 = 1024;
      v43 = 1214;
      _os_log_impl(&dword_1AF533000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12[2](v12, v24);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke;
      v32[3] = &unk_1E5F83DB8;
      v17 = v12;
      v33 = v17;
      objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[BiometricKitXPCClient clientID](self, "clientID");
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_2;
      v30[3] = &unk_1E5F83DE0;
      v31 = v17;
      objc_msgSend(v18, "setSystemProtectedConfiguration:options:async:client:replyBlock:", v10, v11, 1, v19, v30);

      v20 = v33;
    }
    else
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_3;
      v28[3] = &unk_1E5F83DB8;
      v21 = v12;
      v29 = v21;
      objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[BiometricKitXPCClient clientID](self, "clientID");
      v26[0] = v16;
      v26[1] = 3221225472;
      v26[2] = __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_4;
      v26[3] = &unk_1E5F83DE0;
      v27 = v21;
      objc_msgSend(v22, "setSystemProtectedConfiguration:options:async:client:replyBlock:", v10, v11, 0, v23, v26);

      v20 = v29;
    }

  }
}

uint64_t __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __85__BiometricKitXPCClient_setSystemProtectedConfiguration_withOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)getBioLockoutState:(int64_t *)a3 forUser:(unsigned int)a4
{
  uint64_t v4;
  int v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
    *((_DWORD *)v19 + 6) = v7;
    if (v7)
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v23 = "status == 0 ";
        v24 = 2048;
        v25 = v7;
        v26 = 2080;
        v27 = &unk_1AF575226;
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        v30 = 1024;
        v31 = 1248;
        _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      objc_msgSend(WeakRetained, "xpcConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52__BiometricKitXPCClient_getBioLockoutState_forUser___block_invoke;
      v17[3] = &unk_1E5F83C60;
      v17[4] = &v18;
      objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __52__BiometricKitXPCClient_getBioLockoutState_forUser___block_invoke_2;
      v16[3] = &unk_1E5F83FB0;
      v16[4] = &v18;
      v16[5] = a3;
      objc_msgSend(v11, "getBioLockoutStateForUser:client:replyBlock:", v4, -[BiometricKitXPCClient clientID](self, "clientID"), v16);

    }
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "state";
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = &unk_1AF575226;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v30 = 1024;
      v31 = 1245;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    *((_DWORD *)v19 + 6) = 22;
  }
  v12 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __52__BiometricKitXPCClient_getBioLockoutState_forUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __52__BiometricKitXPCClient_getBioLockoutState_forUser___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(result + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *v3 = a3;
  return result;
}

- (int)getExpressModeState:(int64_t *)a3 forUser:(unsigned int)a4
{
  uint64_t v4;
  int v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
    *((_DWORD *)v19 + 6) = v7;
    if (v7)
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v23 = "status == 0 ";
        v24 = 2048;
        v25 = v7;
        v26 = 2080;
        v27 = &unk_1AF575226;
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        v30 = 1024;
        v31 = 1272;
        _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      objc_msgSend(WeakRetained, "xpcConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __53__BiometricKitXPCClient_getExpressModeState_forUser___block_invoke;
      v17[3] = &unk_1E5F83C60;
      v17[4] = &v18;
      objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __53__BiometricKitXPCClient_getExpressModeState_forUser___block_invoke_2;
      v16[3] = &unk_1E5F83FB0;
      v16[4] = &v18;
      v16[5] = a3;
      objc_msgSend(v11, "getExpressModeStateForUser:client:replyBlock:", v4, -[BiometricKitXPCClient clientID](self, "clientID"), v16);

    }
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "state";
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = &unk_1AF575226;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v30 = 1024;
      v31 = 1269;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    *((_DWORD *)v19 + 6) = 22;
  }
  v12 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __53__BiometricKitXPCClient_getExpressModeState_forUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __53__BiometricKitXPCClient_getExpressModeState_forUser___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(result + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *v3 = a3;
  return result;
}

- (int64_t)getProvisioningState
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  int64_t v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "[self initializeConnection] == 0 ";
      v18 = 2048;
      v19 = v3;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v24 = 1024;
      v25 = 1293;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_305);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__BiometricKitXPCClient_getProvisioningState__block_invoke_2;
    v11[3] = &unk_1E5F83ED8;
    v11[4] = &v12;
    objc_msgSend(v6, "getProvisioningState:replyBlock:", v7, v11);

  }
  v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __45__BiometricKitXPCClient_getProvisioningState__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)dropUnlockToken
{
  int v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v14 + 6) = v3;
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "status == 0 ";
      v19 = 2048;
      v20 = v3;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v25 = 1024;
      v26 = 1313;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__BiometricKitXPCClient_dropUnlockToken__block_invoke;
    v12[3] = &unk_1E5F83C60;
    v12[4] = &v13;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __40__BiometricKitXPCClient_dropUnlockToken__block_invoke_2;
    v11[3] = &unk_1E5F83C88;
    v11[4] = &v13;
    objc_msgSend(v7, "dropUnlockToken:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), v11);

  }
  v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __40__BiometricKitXPCClient_dropUnlockToken__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __40__BiometricKitXPCClient_dropUnlockToken__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)forceBioLockoutForUser:(unsigned int)a3 withOptions:(id)a4
{
  uint64_t v4;
  id v6;
  int v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v4 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v18 + 6) = v7;
  if (v7)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v22 = "status == 0 ";
      v23 = 2048;
      v24 = v7;
      v25 = 2080;
      v26 = &unk_1AF575226;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v29 = 1024;
      v30 = 1334;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__BiometricKitXPCClient_forceBioLockoutForUser_withOptions___block_invoke;
    v16[3] = &unk_1E5F83C60;
    v16[4] = &v17;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __60__BiometricKitXPCClient_forceBioLockoutForUser_withOptions___block_invoke_2;
    v15[3] = &unk_1E5F83C88;
    v15[4] = &v17;
    objc_msgSend(v11, "forceBioLockoutForUser:options:client:replyBlock:", v4, v6, -[BiometricKitXPCClient clientID](self, "clientID"), v15);

  }
  v12 = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);

  return v12;
}

uint64_t __60__BiometricKitXPCClient_forceBioLockoutForUser_withOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __60__BiometricKitXPCClient_forceBioLockoutForUser_withOptions___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)registerDSID:(unint64_t)a3 withOptions:(id)a4
{
  id v6;
  int v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v18 + 6) = v7;
  if (v7)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v22 = "err == 0 ";
      v23 = 2048;
      v24 = v7;
      v25 = 2080;
      v26 = &unk_1AF575226;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v29 = 1024;
      v30 = 1357;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__BiometricKitXPCClient_registerDSID_withOptions___block_invoke;
    v16[3] = &unk_1E5F83C60;
    v16[4] = &v17;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __50__BiometricKitXPCClient_registerDSID_withOptions___block_invoke_2;
    v15[3] = &unk_1E5F83C88;
    v15[4] = &v17;
    objc_msgSend(v11, "registerDSID:options:client:replyBlock:", a3, v6, -[BiometricKitXPCClient clientID](self, "clientID"), v15);

  }
  v12 = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);

  return v12;
}

uint64_t __50__BiometricKitXPCClient_registerDSID_withOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __50__BiometricKitXPCClient_registerDSID_withOptions___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)resetAppleConnectCounter
{
  int v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v14 + 6) = v3;
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "status == 0 ";
      v19 = 2048;
      v20 = v3;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v25 = 1024;
      v26 = 1378;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__BiometricKitXPCClient_resetAppleConnectCounter__block_invoke;
    v12[3] = &unk_1E5F83C60;
    v12[4] = &v13;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __49__BiometricKitXPCClient_resetAppleConnectCounter__block_invoke_2;
    v11[3] = &unk_1E5F83C88;
    v11[4] = &v13;
    objc_msgSend(v7, "resetAppleConnectCounter:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), v11);

  }
  v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __49__BiometricKitXPCClient_resetAppleConnectCounter__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __49__BiometricKitXPCClient_resetAppleConnectCounter__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)registerStoreToken:(id)a3
{
  id v4;
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v16 + 6) = v5;
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "err == 0 ";
      v21 = 2048;
      v22 = v5;
      v23 = 2080;
      v24 = &unk_1AF575226;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v27 = 1024;
      v28 = 1399;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__BiometricKitXPCClient_registerStoreToken___block_invoke;
    v14[3] = &unk_1E5F83C60;
    v14[4] = &v15;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __44__BiometricKitXPCClient_registerStoreToken___block_invoke_2;
    v13[3] = &unk_1E5F83C88;
    v13[4] = &v15;
    objc_msgSend(v9, "registerStoreToken:client:replyBlock:", v4, -[BiometricKitXPCClient clientID](self, "clientID"), v13);

  }
  v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __44__BiometricKitXPCClient_registerStoreToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __44__BiometricKitXPCClient_registerStoreToken___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)getCountersignedStoreToken:(id *)a3
{
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v22 + 6) = v5;
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "err == 0 ";
      v27 = 2048;
      v28 = v5;
      v29 = 2080;
      v30 = &unk_1AF575226;
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v33 = 1024;
      v34 = 1421;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__BiometricKitXPCClient_getCountersignedStoreToken___block_invoke;
    v14[3] = &unk_1E5F83C60;
    v14[4] = &v21;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __52__BiometricKitXPCClient_getCountersignedStoreToken___block_invoke_2;
    v13[3] = &unk_1E5F83FF8;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v9, "getCountersignedStoreToken:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), v13);

    if (a3)
      *a3 = objc_retainAutorelease((id)v16[5]);
  }
  v10 = *((_DWORD *)v22 + 6);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

uint64_t __52__BiometricKitXPCClient_getCountersignedStoreToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __52__BiometricKitXPCClient_getCountersignedStoreToken___block_invoke_2(uint64_t a1, int a2, id obj)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (id)getIdentitiesDatabaseUUIDForUser:(unsigned int)a3
{
  uint64_t v3;
  int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v3 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "[self initializeConnection] == 0 ";
      v22 = 2048;
      v23 = v5;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v28 = 1024;
      v29 = 1444;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_307);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BiometricKitXPCClient clientID](self, "clientID");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__BiometricKitXPCClient_getIdentitiesDatabaseUUIDForUser___block_invoke_2;
    v13[3] = &unk_1E5F84020;
    v13[4] = &v14;
    objc_msgSend(v8, "getIdentitiesDatabaseUUIDForUser:client:replyBlock:", v3, v9, v13);

  }
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __58__BiometricKitXPCClient_getIdentitiesDatabaseUUIDForUser___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getIdentitiesDatabaseHashForUser:(unsigned int)a3
{
  uint64_t v3;
  int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  NSObject *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v3 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "[self initializeConnection] == 0 ";
      v22 = 2048;
      v23 = v5;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v28 = 1024;
      v29 = 1463;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_309);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BiometricKitXPCClient clientID](self, "clientID");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__BiometricKitXPCClient_getIdentitiesDatabaseHashForUser___block_invoke_2;
    v13[3] = &unk_1E5F83F20;
    v13[4] = &v14;
    objc_msgSend(v8, "getIdentitiesDatabaseHashForUser:client:replyBlock:", v3, v9, v13);

  }
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __58__BiometricKitXPCClient_getIdentitiesDatabaseHashForUser___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (int)diagnostics:(int)a3 withOptions:(id)a4 passed:(BOOL *)a5 withDetails:(id *)a6
{
  uint64_t v8;
  id v10;
  int v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v18;
  _QWORD v19[7];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v8 = *(_QWORD *)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v11 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v32 + 6) = v11;
  if (v11)
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v36 = "err == 0 ";
      v37 = 2048;
      v38 = v11;
      v39 = 2080;
      v40 = &unk_1AF575226;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v43 = 1024;
      v44 = 1486;
      _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__BiometricKitXPCClient_diagnostics_withOptions_passed_withDetails___block_invoke;
    v20[3] = &unk_1E5F83C60;
    v20[4] = &v31;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __68__BiometricKitXPCClient_diagnostics_withOptions_passed_withDetails___block_invoke_2;
    v19[3] = &unk_1E5F84068;
    v19[4] = &v31;
    v19[5] = &v27;
    v19[6] = &v21;
    objc_msgSend(v15, "diagnostics:options:client:replyBlock:", v8, v10, -[BiometricKitXPCClient clientID](self, "clientID"), v19);

    if (a5)
      *a5 = *((_BYTE *)v28 + 24);
    if (a6)
      *a6 = objc_retainAutorelease((id)v22[5]);
  }
  v16 = *((_DWORD *)v32 + 6);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

uint64_t __68__BiometricKitXPCClient_diagnostics_withOptions_passed_withDetails___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __68__BiometricKitXPCClient_diagnostics_withOptions_passed_withDetails___block_invoke_2(_QWORD *a1, int a2, char a3, id obj)
{
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

- (void)timestampEvent:(unint64_t)a3 absoluteTime:(unint64_t)a4
{
  int v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  id WeakRetained;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v7)
  {
    v10 = v7;
    if (__osLog)
      v11 = __osLog;
    else
      v11 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v14 = "[self initializeConnection] == 0 ";
      v15 = 2048;
      v16 = v10;
      v17 = 2080;
      v18 = &unk_1AF575226;
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v21 = 1024;
      v22 = 1509;
      _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_311);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestampEvent:absoluteTime:client:replyBlock:", a3, a4, -[BiometricKitXPCClient clientID](self, "clientID"), &__block_literal_global_312);

  }
}

- (int)setUserDSID:(unint64_t)a3 withOptions:(id)a4
{
  id v6;
  int v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v18 + 6) = v7;
  if (v7)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v22 = "err == 0 ";
      v23 = 2048;
      v24 = v7;
      v25 = 2080;
      v26 = &unk_1AF575226;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v29 = 1024;
      v30 = 1528;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__BiometricKitXPCClient_setUserDSID_withOptions___block_invoke;
    v16[3] = &unk_1E5F83C60;
    v16[4] = &v17;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __49__BiometricKitXPCClient_setUserDSID_withOptions___block_invoke_2;
    v15[3] = &unk_1E5F83C88;
    v15[4] = &v17;
    objc_msgSend(v11, "setUserDSID:options:client:replyBlock:", a3, v6, -[BiometricKitXPCClient clientID](self, "clientID"), v15);

  }
  v12 = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);

  return v12;
}

uint64_t __49__BiometricKitXPCClient_setUserDSID_withOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __49__BiometricKitXPCClient_setUserDSID_withOptions___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)getSensorCalibrationStatus
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  int64_t v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "[self initializeConnection] == 0 ";
      v18 = 2048;
      v19 = v3;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v24 = 1024;
      v25 = 1548;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_313);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__BiometricKitXPCClient_getSensorCalibrationStatus__block_invoke_2;
    v11[3] = &unk_1E5F83ED8;
    v11[4] = &v12;
    objc_msgSend(v6, "getSensorCalibrationStatus:replyBlock:", v7, v11);

  }
  v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __51__BiometricKitXPCClient_getSensorCalibrationStatus__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)getCalibrationDataInfo
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self initializeConnection] == 0 ";
      v20 = 2048;
      v21 = v3;
      v22 = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v26 = 1024;
      v27 = 1568;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_314);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__BiometricKitXPCClient_getCalibrationDataInfo__block_invoke_2;
    v11[3] = &unk_1E5F83F20;
    v11[4] = &v12;
    objc_msgSend(v6, "getCalibrationDataInfo:replyBlock:", v7, v11);

  }
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __47__BiometricKitXPCClient_getCalibrationDataInfo__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getSensorInfo
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self initializeConnection] == 0 ";
      v20 = 2048;
      v21 = v3;
      v22 = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v26 = 1024;
      v27 = 1587;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_315);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__BiometricKitXPCClient_getSensorInfo__block_invoke_2;
    v11[3] = &unk_1E5F83F20;
    v11[4] = &v12;
    objc_msgSend(v6, "getSensorInfo:replyBlock:", v7, v11);

  }
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __38__BiometricKitXPCClient_getSensorInfo__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)pullCalibrationData
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self initializeConnection] == 0 ";
      v20 = 2048;
      v21 = v3;
      v22 = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v26 = 1024;
      v27 = 1606;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_316);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__BiometricKitXPCClient_pullCalibrationData__block_invoke_2;
    v11[3] = &unk_1E5F83F20;
    v11[4] = &v12;
    objc_msgSend(v6, "pullCalibrationData:replyBlock:", v7, v11);

  }
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __44__BiometricKitXPCClient_pullCalibrationData__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)pullCaptureBuffer
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "[self initializeConnection] == 0 ";
      v20 = 2048;
      v21 = v3;
      v22 = 2080;
      v23 = &unk_1AF575226;
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v26 = 1024;
      v27 = 1625;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_317);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__BiometricKitXPCClient_pullCaptureBuffer__block_invoke_2;
    v11[3] = &unk_1E5F83F20;
    v11[4] = &v12;
    objc_msgSend(v6, "pullCaptureBuffer:replyBlock:", v7, v11);

  }
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __42__BiometricKitXPCClient_pullCaptureBuffer__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)pullDebugImageData:(BOOL)a3 rotated:(BOOL)a4 imageWidth:(unsigned int *)a5 imageHeight:(unsigned int *)a6
{
  _BOOL8 v8;
  _BOOL8 v9;
  int v11;
  id WeakRetained;
  void *v13;
  void *v14;
  unint64_t v15;
  id v16;
  NSObject *v18;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v8 = a4;
  v9 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v11 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v11)
  {
    if (__osLog)
      v18 = __osLog;
    else
      v18 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v27 = "[self initializeConnection] == 0 ";
      v28 = 2048;
      v29 = v11;
      v30 = 2080;
      v31 = &unk_1AF575226;
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v34 = 1024;
      v35 = 1644;
      _os_log_impl(&dword_1AF533000, v18, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_318);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[BiometricKitXPCClient clientID](self, "clientID");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__BiometricKitXPCClient_pullDebugImageData_rotated_imageWidth_imageHeight___block_invoke_2;
    v19[3] = &unk_1E5F84130;
    v19[4] = &v20;
    v19[5] = a5;
    v19[6] = a6;
    objc_msgSend(v14, "pullDebugImageData:rotated:client:replyBlock:", v9, v8, v15, v19);

  }
  v16 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v16;
}

void __75__BiometricKitXPCClient_pullDebugImageData_rotated_imageWidth_imageHeight___block_invoke_2(_QWORD *a1, void *a2, int a3, int a4)
{
  _DWORD *v8;
  _DWORD *v9;
  id v10;

  v10 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  v8 = (_DWORD *)a1[5];
  if (v8)
    *v8 = a3;
  v9 = (_DWORD *)a1[6];
  if (v9)
    *v9 = a4;

}

- (void)setDebugImages:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id WeakRetained;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v5)
  {
    v8 = v5;
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "[self initializeConnection] == 0 ";
      v13 = 2048;
      v14 = v8;
      v15 = 2080;
      v16 = &unk_1AF575226;
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v19 = 1024;
      v20 = 1663;
      _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_320);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDebugImages:client:replyBlock:", v3, -[BiometricKitXPCClient clientID](self, "clientID"), &__block_literal_global_321);

  }
}

- (id)getLogs:(BOOL)a3 withDetails:(id *)a4
{
  _BOOL8 v5;
  int v7;
  id WeakRetained;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  NSObject *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v5 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v7)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "[self initializeConnection] == 0 ";
      v30 = 2048;
      v31 = v7;
      v32 = 2080;
      v33 = &unk_1AF575226;
      v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v36 = 1024;
      v37 = 1681;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_322);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BiometricKitXPCClient clientID](self, "clientID");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__BiometricKitXPCClient_getLogs_withDetails___block_invoke_2;
    v15[3] = &unk_1E5F84178;
    v15[4] = &v22;
    v15[5] = &v16;
    objc_msgSend(v10, "getLogs:client:replyBlock:", v5, v11, v15);

    if (a4)
      *a4 = objc_retainAutorelease((id)v17[5]);
  }
  v12 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __45__BiometricKitXPCClient_getLogs_withDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)fileRadarWithLogs:(id)a3 withDescription:(id)a4
{
  id v6;
  id v7;
  int v8;
  id WeakRetained;
  void *v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  NSObject *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v8)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v22 = "[self initializeConnection] == 0 ";
      v23 = 2048;
      v24 = v8;
      v25 = 2080;
      v26 = &unk_1AF575226;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v29 = 1024;
      v30 = 1702;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_324);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BiometricKitXPCClient clientID](self, "clientID");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__BiometricKitXPCClient_fileRadarWithLogs_withDescription___block_invoke_2;
    v16[3] = &unk_1E5F841C0;
    v16[4] = &v17;
    objc_msgSend(v11, "fileRadarWithLogs:description:client:replyBlock:", v6, v7, v12, v16);

  }
  v13 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  return v13;
}

uint64_t __59__BiometricKitXPCClient_fileRadarWithLogs_withDescription___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isFingerOn
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  char v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "[self initializeConnection] == 0 ";
      v18 = 2048;
      v19 = v3;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v24 = 1024;
      v25 = 1721;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_326);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __35__BiometricKitXPCClient_isFingerOn__block_invoke_2;
    v11[3] = &unk_1E5F841C0;
    v11[4] = &v12;
    objc_msgSend(v6, "isFingerOn:replyBlock:", v7, v11);

  }
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __35__BiometricKitXPCClient_isFingerOn__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)enableBackgroundFdet:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v16 + 6) = v5;
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "status == 0 ";
      v21 = 2048;
      v22 = v5;
      v23 = 2080;
      v24 = &unk_1AF575226;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v27 = 1024;
      v28 = 1741;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__BiometricKitXPCClient_enableBackgroundFdet___block_invoke;
    v14[3] = &unk_1E5F83C60;
    v14[4] = &v15;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __46__BiometricKitXPCClient_enableBackgroundFdet___block_invoke_2;
    v13[3] = &unk_1E5F83C88;
    v13[4] = &v15;
    objc_msgSend(v9, "enableBackgroundFdet:client:replyBlock:", v3, -[BiometricKitXPCClient clientID](self, "clientID"), v13);

  }
  v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __46__BiometricKitXPCClient_enableBackgroundFdet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __46__BiometricKitXPCClient_enableBackgroundFdet___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isAriadneSignpostsEnabled
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  char v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "[self initializeConnection] == 0 ";
      v18 = 2048;
      v19 = v3;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v24 = 1024;
      v25 = 1761;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_327);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__BiometricKitXPCClient_isAriadneSignpostsEnabled__block_invoke_2;
    v11[3] = &unk_1E5F841C0;
    v11[4] = &v12;
    objc_msgSend(v6, "isAriadneSignpostsEnabled:replyBlock:", v7, v11);

  }
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __50__BiometricKitXPCClient_isAriadneSignpostsEnabled__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isXARTAvailable
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  char v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "[self initializeConnection] == 0 ";
      v18 = 2048;
      v19 = v3;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v24 = 1024;
      v25 = 1780;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_328);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__BiometricKitXPCClient_isXARTAvailable__block_invoke_2;
    v11[3] = &unk_1E5F841C0;
    v11[4] = &v12;
    objc_msgSend(v6, "isXARTAvailable:replyBlock:", v7, v11);

  }
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __40__BiometricKitXPCClient_isXARTAvailable__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int64_t)getDeviceState
{
  int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  int64_t v8;
  NSObject *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "[self initializeConnection] == 0 ";
      v18 = 2048;
      v19 = v3;
      v20 = 2080;
      v21 = &unk_1AF575226;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v24 = 1024;
      v25 = 1799;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_329);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BiometricKitXPCClient clientID](self, "clientID");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__BiometricKitXPCClient_getDeviceState__block_invoke_2;
    v11[3] = &unk_1E5F83ED8;
    v11[4] = &v12;
    objc_msgSend(v6, "getDeviceState:replyBlock:", v7, v11);

  }
  v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __39__BiometricKitXPCClient_getDeviceState__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)startNewMatchAttempt
{
  int v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v14 + 6) = v3;
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "status == 0 ";
      v19 = 2048;
      v20 = v3;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v25 = 1024;
      v26 = 1819;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__BiometricKitXPCClient_startNewMatchAttempt__block_invoke;
    v12[3] = &unk_1E5F83C60;
    v12[4] = &v13;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __45__BiometricKitXPCClient_startNewMatchAttempt__block_invoke_2;
    v11[3] = &unk_1E5F83C88;
    v11[4] = &v13;
    objc_msgSend(v7, "startNewMatchAttempt:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), v11);

  }
  v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __45__BiometricKitXPCClient_startNewMatchAttempt__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __45__BiometricKitXPCClient_startNewMatchAttempt__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)getBiometryAvailability:(int64_t *)a3 forUser:(unsigned int)a4
{
  uint64_t v4;
  int v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v14;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v4 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v18 + 6) = v7;
  if (v7)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v22 = "status == 0 ";
      v23 = 2048;
      v24 = v7;
      v25 = 2080;
      v26 = &unk_1AF575226;
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v29 = 1024;
      v30 = 1840;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__BiometricKitXPCClient_getBiometryAvailability_forUser___block_invoke;
    v16[3] = &unk_1E5F83C60;
    v16[4] = &v17;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __57__BiometricKitXPCClient_getBiometryAvailability_forUser___block_invoke_2;
    v15[3] = &unk_1E5F83FB0;
    v15[4] = &v17;
    v15[5] = a3;
    objc_msgSend(v11, "getBiometryAvailabilityForUser:client:replyBlock:", v4, -[BiometricKitXPCClient clientID](self, "clientID"), v15);

  }
  v12 = *((_DWORD *)v18 + 6);
  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __57__BiometricKitXPCClient_getBiometryAvailability_forUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __57__BiometricKitXPCClient_getBiometryAvailability_forUser___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(result + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  if (v3)
    *v3 = a3;
  return result;
}

- (int)completeEnrollment
{
  int v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v14 + 6) = v3;
  if (v3)
  {
    if (__osLog)
      v10 = __osLog;
    else
      v10 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "status == 0 ";
      v19 = 2048;
      v20 = v3;
      v21 = 2080;
      v22 = &unk_1AF575226;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v25 = 1024;
      v26 = 1862;
      _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__BiometricKitXPCClient_completeEnrollment__block_invoke;
    v12[3] = &unk_1E5F83C60;
    v12[4] = &v13;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __43__BiometricKitXPCClient_completeEnrollment__block_invoke_2;
    v11[3] = &unk_1E5F83C88;
    v11[4] = &v13;
    objc_msgSend(v7, "completeEnrollment:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), v11);

  }
  v8 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __43__BiometricKitXPCClient_completeEnrollment__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __43__BiometricKitXPCClient_completeEnrollment__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)suspendEnrollment:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v16 + 6) = v5;
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "status == 0 ";
      v21 = 2048;
      v22 = v5;
      v23 = 2080;
      v24 = &unk_1AF575226;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v27 = 1024;
      v28 = 1883;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __43__BiometricKitXPCClient_suspendEnrollment___block_invoke;
    v14[3] = &unk_1E5F83C60;
    v14[4] = &v15;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __43__BiometricKitXPCClient_suspendEnrollment___block_invoke_2;
    v13[3] = &unk_1E5F83C88;
    v13[4] = &v15;
    objc_msgSend(v9, "suspendEnrollment:client:replyBlock:", v3, -[BiometricKitXPCClient clientID](self, "clientID"), v13);

  }
  v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __43__BiometricKitXPCClient_suspendEnrollment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __43__BiometricKitXPCClient_suspendEnrollment___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)setTemplate:(id)a3 forIdentity:(id)a4
{
  id v6;
  id v7;
  int v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v8 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v19 + 6) = v8;
  if (v8)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "status == 0 ";
      v24 = 2048;
      v25 = v8;
      v26 = 2080;
      v27 = &unk_1AF575226;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v30 = 1024;
      v31 = 1904;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __49__BiometricKitXPCClient_setTemplate_forIdentity___block_invoke;
    v17[3] = &unk_1E5F83C60;
    v17[4] = &v18;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __49__BiometricKitXPCClient_setTemplate_forIdentity___block_invoke_2;
    v16[3] = &unk_1E5F83C88;
    v16[4] = &v18;
    objc_msgSend(v12, "setTemplate:forIdentity:client:replyBlock:", v6, v7, -[BiometricKitXPCClient clientID](self, "clientID"), v16);

  }
  v13 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);

  return v13;
}

uint64_t __49__BiometricKitXPCClient_setTemplate_forIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __49__BiometricKitXPCClient_setTemplate_forIdentity___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)isPeriocularEnrollmentSupported:(BOOL *)a3
{
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (a3)
  {
    v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
    *((_DWORD *)v17 + 6) = v5;
    if (v5)
    {
      if (__osLog)
        v13 = __osLog;
      else
        v13 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = "status == 0 ";
        v22 = 2048;
        v23 = v5;
        v24 = 2080;
        v25 = &unk_1AF575226;
        v26 = 2080;
        v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        v28 = 1024;
        v29 = 1929;
        _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      objc_msgSend(WeakRetained, "xpcConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __57__BiometricKitXPCClient_isPeriocularEnrollmentSupported___block_invoke;
      v15[3] = &unk_1E5F83C60;
      v15[4] = &v16;
      objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      v14[1] = 3221225472;
      v14[2] = __57__BiometricKitXPCClient_isPeriocularEnrollmentSupported___block_invoke_2;
      v14[3] = &unk_1E5F84248;
      v14[4] = &v16;
      v14[5] = a3;
      objc_msgSend(v9, "isPeriocularEnrollmentSupported:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), v14);

    }
  }
  else
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "supported";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v28 = 1024;
      v29 = 1926;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    *((_DWORD *)v17 + 6) = 22;
  }
  v10 = *((_DWORD *)v17 + 6);
  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __57__BiometricKitXPCClient_isPeriocularEnrollmentSupported___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __57__BiometricKitXPCClient_isPeriocularEnrollmentSupported___block_invoke_2(uint64_t result, int a2, char a3)
{
  _BYTE *v3;

  v3 = *(_BYTE **)(result + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *v3 = a3;
  return result;
}

- (int)getPeriocularMatchState:(unsigned int)a3 state:(int64_t *)a4
{
  uint64_t v5;
  int v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (a4)
  {
    v5 = *(_QWORD *)&a3;
    v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
    *((_DWORD *)v19 + 6) = v7;
    if (v7)
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v23 = "status == 0 ";
        v24 = 2048;
        v25 = v7;
        v26 = 2080;
        v27 = &unk_1AF575226;
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
        v30 = 1024;
        v31 = 1953;
        _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      objc_msgSend(WeakRetained, "xpcConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __55__BiometricKitXPCClient_getPeriocularMatchState_state___block_invoke;
      v17[3] = &unk_1E5F83C60;
      v17[4] = &v18;
      objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      v16[1] = 3221225472;
      v16[2] = __55__BiometricKitXPCClient_getPeriocularMatchState_state___block_invoke_2;
      v16[3] = &unk_1E5F83FB0;
      v16[4] = &v18;
      v16[5] = a4;
      objc_msgSend(v11, "getPeriocularMatchState:client:replyBlock:", v5, -[BiometricKitXPCClient clientID](self, "clientID"), v16);

    }
  }
  else
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "state";
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = &unk_1AF575226;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v30 = 1024;
      v31 = 1950;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    *((_DWORD *)v19 + 6) = 22;
  }
  v12 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);
  return v12;
}

uint64_t __55__BiometricKitXPCClient_getPeriocularMatchState_state___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __55__BiometricKitXPCClient_getPeriocularMatchState_state___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(result + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *v3 = a3;
  return result;
}

- (void)removePeriocularTemplatesWithOptions:(id)a3 async:(BOOL)a4 withReply:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD);
  int v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void (**v14)(id, _QWORD);
  void *v15;
  unint64_t v16;
  void *v17;
  void (**v18)(id, _QWORD);
  void *v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[4];
  void (**v24)(id, _QWORD);
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  void (**v28)(id, _QWORD);
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v6 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v10)
  {
    v21 = v10;
    if (__osLog)
      v22 = __osLog;
    else
      v22 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v32 = "status == 0 ";
      v33 = 2048;
      v34 = v21;
      v35 = 2080;
      v36 = &unk_1AF575226;
      v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v39 = 1024;
      v40 = 1975;
      _os_log_impl(&dword_1AF533000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v9[2](v9, v21);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke;
      v29[3] = &unk_1E5F83DB8;
      v14 = v9;
      v30 = v14;
      objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[BiometricKitXPCClient clientID](self, "clientID");
      v27[0] = v13;
      v27[1] = 3221225472;
      v27[2] = __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_2;
      v27[3] = &unk_1E5F83DE0;
      v28 = v14;
      objc_msgSend(v15, "removePeriocularTemplatesWithOptions:async:client:replyBlock:", v8, 1, v16, v27);

      v17 = v30;
    }
    else
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_3;
      v25[3] = &unk_1E5F83DB8;
      v18 = v9;
      v26 = v18;
      objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[BiometricKitXPCClient clientID](self, "clientID");
      v23[0] = v13;
      v23[1] = 3221225472;
      v23[2] = __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_4;
      v23[3] = &unk_1E5F83DE0;
      v24 = v18;
      objc_msgSend(v19, "removePeriocularTemplatesWithOptions:async:client:replyBlock:", v8, 0, v20, v23);

      v17 = v26;
    }

  }
}

uint64_t __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_3(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "code"));
}

uint64_t __78__BiometricKitXPCClient_removePeriocularTemplatesWithOptions_async_withReply___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)queryIdentityMigrationFailureForUser:(unsigned int)a3 failed:(BOOL *)a4 clear:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  int v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v16;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v5 = a5;
  v7 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v9 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v20 + 6) = v9;
  if (v9)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "status == 0 ";
      v25 = 2048;
      v26 = v9;
      v27 = 2080;
      v28 = &unk_1AF575226;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v31 = 1024;
      v32 = 2009;
      _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__BiometricKitXPCClient_queryIdentityMigrationFailureForUser_failed_clear___block_invoke;
    v18[3] = &unk_1E5F83C60;
    v18[4] = &v19;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __75__BiometricKitXPCClient_queryIdentityMigrationFailureForUser_failed_clear___block_invoke_2;
    v17[3] = &unk_1E5F84248;
    v17[4] = &v19;
    v17[5] = a4;
    objc_msgSend(v13, "queryIdentityMigrationFailureForUser:clear:client:replyBlock:", v7, v5, -[BiometricKitXPCClient clientID](self, "clientID"), v17);

  }
  v14 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v14;
}

uint64_t __75__BiometricKitXPCClient_queryIdentityMigrationFailureForUser_failed_clear___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __75__BiometricKitXPCClient_queryIdentityMigrationFailureForUser_failed_clear___block_invoke_2(uint64_t result, int a2, char a3)
{
  _BYTE *v3;

  v3 = *(_BYTE **)(result + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  if (v3)
    *v3 = a3;
  return result;
}

- (void)logEventOrCode:(unint64_t)a3
{
  int v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id WeakRetained;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  if (v5)
  {
    v8 = v5;
    if (__osLog)
      v9 = __osLog;
    else
      v9 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "[self initializeConnection] == 0 ";
      v13 = 2048;
      v14 = v8;
      v15 = 2080;
      v16 = &unk_1AF575226;
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v19 = 1024;
      v20 = 2030;
      _os_log_impl(&dword_1AF533000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_332);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logEventOrCode:", a3);

  }
}

- (int)enableMatchAutoRetry:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v16 + 6) = v5;
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "status == 0 ";
      v21 = 2048;
      v22 = v5;
      v23 = 2080;
      v24 = &unk_1AF575226;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v27 = 1024;
      v28 = 2046;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__BiometricKitXPCClient_enableMatchAutoRetry___block_invoke;
    v14[3] = &unk_1E5F83C60;
    v14[4] = &v15;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __46__BiometricKitXPCClient_enableMatchAutoRetry___block_invoke_2;
    v13[3] = &unk_1E5F83C88;
    v13[4] = &v15;
    objc_msgSend(v9, "enableMatchAutoRetry:client:replyBlock:", v3, -[BiometricKitXPCClient clientID](self, "clientID"), v13);

  }
  v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __46__BiometricKitXPCClient_enableMatchAutoRetry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __46__BiometricKitXPCClient_enableMatchAutoRetry___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)pauseFaceDetectTimer:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v16 + 6) = v5;
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "status == 0 ";
      v21 = 2048;
      v22 = v5;
      v23 = 2080;
      v24 = &unk_1AF575226;
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v27 = 1024;
      v28 = 2067;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__BiometricKitXPCClient_pauseFaceDetectTimer___block_invoke;
    v14[3] = &unk_1E5F83C60;
    v14[4] = &v15;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __46__BiometricKitXPCClient_pauseFaceDetectTimer___block_invoke_2;
    v13[3] = &unk_1E5F83C88;
    v13[4] = &v15;
    objc_msgSend(v9, "pauseFaceDetectTimer:client:replyBlock:", v3, -[BiometricKitXPCClient clientID](self, "clientID"), v13);

  }
  v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __46__BiometricKitXPCClient_pauseFaceDetectTimer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __46__BiometricKitXPCClient_pauseFaceDetectTimer___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (int)getLastMatchEvent:(id *)a3
{
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v22 + 6) = v5;
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "status == 0 ";
      v27 = 2048;
      v28 = v5;
      v29 = 2080;
      v30 = &unk_1AF575226;
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v33 = 1024;
      v34 = 2089;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __43__BiometricKitXPCClient_getLastMatchEvent___block_invoke;
    v14[3] = &unk_1E5F83C60;
    v14[4] = &v21;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __43__BiometricKitXPCClient_getLastMatchEvent___block_invoke_2;
    v13[3] = &unk_1E5F84270;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v9, "getLastMatchEvent:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), v13);

    if (a3)
      *a3 = objc_retainAutorelease((id)v16[5]);
  }
  v10 = *((_DWORD *)v22 + 6);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

uint64_t __43__BiometricKitXPCClient_getLastMatchEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __43__BiometricKitXPCClient_getLastMatchEvent___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    a3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
}

- (int)getDeviceHardwareState:(unsigned int *)a3
{
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v20 + 6) = v5;
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "status == 0 ";
      v25 = 2048;
      v26 = v5;
      v27 = 2080;
      v28 = &unk_1AF575226;
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v31 = 1024;
      v32 = 2116;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__BiometricKitXPCClient_getDeviceHardwareState___block_invoke;
    v14[3] = &unk_1E5F83C60;
    v14[4] = &v19;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __48__BiometricKitXPCClient_getDeviceHardwareState___block_invoke_2;
    v13[3] = &unk_1E5F84298;
    v13[4] = &v19;
    v13[5] = &v15;
    objc_msgSend(v9, "getDeviceHardwareState:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), v13);

    if (a3)
      *a3 = *((_DWORD *)v16 + 6);
  }
  v10 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __48__BiometricKitXPCClient_getDeviceHardwareState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __48__BiometricKitXPCClient_getDeviceHardwareState___block_invoke_2(uint64_t result, int a2, int a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
    a3 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (int)listAccessories:(id *)a3
{
  int v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v12;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v5 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v22 + 6) = v5;
  if (v5)
  {
    if (__osLog)
      v12 = __osLog;
    else
      v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "status == 0 ";
      v27 = 2048;
      v28 = v5;
      v29 = 2080;
      v30 = &unk_1AF575226;
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v33 = 1024;
      v34 = 2143;
      _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__BiometricKitXPCClient_listAccessories___block_invoke;
    v14[3] = &unk_1E5F83C60;
    v14[4] = &v21;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __41__BiometricKitXPCClient_listAccessories___block_invoke_2;
    v13[3] = &unk_1E5F842C0;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v9, "listAccessories:replyBlock:", -[BiometricKitXPCClient clientID](self, "clientID"), v13);

    if (a3)
      *a3 = objc_retainAutorelease((id)v16[5]);
  }
  v10 = *((_DWORD *)v22 + 6);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

uint64_t __41__BiometricKitXPCClient_listAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __41__BiometricKitXPCClient_listAccessories___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    a3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
}

- (int)getFreeIdentityCount:(unint64_t *)a3 forUser:(unsigned int)a4 accessoryGroup:(id)a5
{
  uint64_t v5;
  id v8;
  int v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v16;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v5 = *(_QWORD *)&a4;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v9 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v24 + 6) = v9;
  if (v9)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v28 = "status == 0 ";
      v29 = 2048;
      v30 = v9;
      v31 = 2080;
      v32 = &unk_1AF575226;
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v35 = 1024;
      v36 = 2170;
      _os_log_impl(&dword_1AF533000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__BiometricKitXPCClient_getFreeIdentityCount_forUser_accessoryGroup___block_invoke;
    v18[3] = &unk_1E5F83C60;
    v18[4] = &v23;
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __69__BiometricKitXPCClient_getFreeIdentityCount_forUser_accessoryGroup___block_invoke_2;
    v17[3] = &unk_1E5F842E8;
    v17[4] = &v23;
    v17[5] = &v19;
    objc_msgSend(v13, "getFreeIdentityCountForUser:accessoryGroup:client:replyBlock:", v5, v8, -[BiometricKitXPCClient clientID](self, "clientID"), v17);

    if (a3)
      *a3 = v20[3];
  }
  v14 = *((_DWORD *)v24 + 6);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v14;
}

uint64_t __69__BiometricKitXPCClient_getFreeIdentityCount_forUser_accessoryGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __69__BiometricKitXPCClient_getFreeIdentityCount_forUser_accessoryGroup___block_invoke_2(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
    a3 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

- (int)getPreferencesValue:(id *)a3 forKey:(id)a4
{
  id v6;
  int v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  NSObject *v15;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v7 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v25 + 6) = v7;
  if (v7)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "status == 0 ";
      v30 = 2048;
      v31 = v7;
      v32 = 2080;
      v33 = &unk_1AF575226;
      v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v36 = 1024;
      v37 = 2287;
LABEL_15:
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__BiometricKitXPCClient_getPreferencesValue_forKey___block_invoke;
    v17[3] = &unk_1E5F83C60;
    v17[4] = &v24;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __52__BiometricKitXPCClient_getPreferencesValue_forKey___block_invoke_2;
    v16[3] = &unk_1E5F84310;
    v16[4] = &v24;
    v16[5] = &v18;
    objc_msgSend(v11, "getPreferencesValueForKey:client:replyBlock:", v6, -[BiometricKitXPCClient clientID](self, "clientID"), v16);

    v12 = *((int *)v25 + 6);
    if (!(_DWORD)v12)
    {
      *a3 = objc_retainAutorelease((id)v19[5]);
      goto LABEL_4;
    }
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "status == 0 ";
      v30 = 2048;
      v31 = v12;
      v32 = 2080;
      v33 = &unk_1AF575226;
      v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v36 = 1024;
      v37 = 2296;
      goto LABEL_15;
    }
  }
LABEL_4:
  v13 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v13;
}

uint64_t __52__BiometricKitXPCClient_getPreferencesValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __52__BiometricKitXPCClient_getPreferencesValue_forKey___block_invoke_2(uint64_t a1, int a2, id obj)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (int)setPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v8 = -[BiometricKitXPCClient initializeConnection](self, "initializeConnection");
  *((_DWORD *)v19 + 6) = v8;
  if (v8)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v23 = "status == 0 ";
      v24 = 2048;
      v25 = v8;
      v26 = 2080;
      v27 = &unk_1AF575226;
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BiometricKitXPCClient.m";
      v30 = 1024;
      v31 = 2313;
      _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__BiometricKitXPCClient_setPreferencesValue_forKey___block_invoke;
    v17[3] = &unk_1E5F83C60;
    v17[4] = &v18;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __52__BiometricKitXPCClient_setPreferencesValue_forKey___block_invoke_2;
    v16[3] = &unk_1E5F83C88;
    v16[4] = &v18;
    objc_msgSend(v12, "setPreferencesValue:forKey:client:replyBlock:", v6, v7, -[BiometricKitXPCClient clientID](self, "clientID"), v16);

  }
  v13 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v18, 8);

  return v13;
}

uint64_t __52__BiometricKitXPCClient_setPreferencesValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __52__BiometricKitXPCClient_setPreferencesValue_forKey___block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BiometricKitXPCClientDelegate)delegate
{
  return (BiometricKitXPCClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
