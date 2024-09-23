@implementation ATLegacyMessageLink

- (ATLegacyMessageLink)initWithSocket:(id)a3
{
  id v4;
  ATLegacyMessageLink *v5;
  ATLegacyMessageLink *v6;
  objc_class *v7;
  const char *Name;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v11;
  NSMutableDictionary *requestHandlerTable;
  uint64_t v13;
  NSMutableData *incomingData;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATLegacyMessageLink;
  v5 = -[ATLockdownMessageLink initWithSocket:](&v16, sel_initWithSocket_, v4);
  v6 = v5;
  if (v5)
  {
    -[ATConcreteMessageLink setEndpointType:](v5, "setEndpointType:", 0);
    objc_msgSend(v4, "setSocketMode:", 1);
    v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);
    v9 = dispatch_queue_create(Name, 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestHandlerTable = v6->_requestHandlerTable;
    v6->_requestHandlerTable = v11;

    v13 = objc_opt_new();
    incomingData = v6->_incomingData;
    v6->_incomingData = (NSMutableData *)v13;

    v6->_idleTimeoutInterval = 45.0;
  }

  return v6;
}

- (BOOL)open
{
  uint64_t v3;
  _BOOL4 v4;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __27__ATLegacyMessageLink_open__block_invoke;
  v9[3] = &unk_1E927E0F8;
  objc_copyWeak(&v10, &location);
  -[ATLegacyMessageLink setHandlerForMessage:handler:](self, "setHandlerForMessage:handler:", CFSTR("Ping"), v9);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __27__ATLegacyMessageLink_open__block_invoke_2;
  v7[3] = &unk_1E927E0F8;
  objc_copyWeak(&v8, &location);
  -[ATLegacyMessageLink setHandlerForMessage:handler:](self, "setHandlerForMessage:handler:", CFSTR("Pong"), v7);
  v6.receiver = self;
  v6.super_class = (Class)ATLegacyMessageLink;
  v4 = -[ATConcreteMessageLink open](&v6, sel_open);
  if (v4)
    -[ATConcreteMessageLink setInitialized:](self, "setInitialized:", 1);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v4;
}

- (void)close
{
  objc_super v3;

  -[ATLegacyMessageLink removeHandlerForMessage:](self, "removeHandlerForMessage:", CFSTR("Ping"));
  -[ATLegacyMessageLink removeHandlerForMessage:](self, "removeHandlerForMessage:", CFSTR("Pong"));
  v3.receiver = self;
  v3.super_class = (Class)ATLegacyMessageLink;
  -[ATConcreteMessageLink close](&v3, sel_close);
}

- (void)setHandlerForMessage:(id)a3 handler:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *requestHandlerTable;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = self->_requestHandlerTable;
  objc_sync_enter(v7);
  requestHandlerTable = self->_requestHandlerTable;
  v9 = (void *)objc_msgSend(v6, "copy");
  -[NSMutableDictionary setObject:forKey:](requestHandlerTable, "setObject:forKey:", v9, v10);

  objc_sync_exit(v7);
}

- (void)removeHandlerForMessage:(id)a3
{
  NSMutableDictionary *v4;
  id v5;

  v5 = a3;
  v4 = self->_requestHandlerTable;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](self->_requestHandlerTable, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (void)sendMessage:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATLegacyMessageLink *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATLegacyMessageLink_sendMessage_withCompletion___block_invoke;
  block[3] = &unk_1E927E0A8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)socket:(id)a3 hasDataAvailable:(const char *)a4 length:(int64_t)a5
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  int v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *requestHandlerTable;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  char v23;
  id v24;
  uint8_t buf[4];
  ATLegacyMessageLink *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  _ATLogCategoryiTunesSync_Oversize();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 1024;
    LODWORD(v28) = a5;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ received %d bytes of data", buf, 0x12u);
  }

  -[NSMutableData appendBytes:length:](self->_incomingData, "appendBytes:length:", a4, a5);
  if (-[NSMutableData length](self->_incomingData, "length") >= 4)
  {
    while (1)
    {
      v9 = *(unsigned int *)-[NSMutableData bytes](self->_incomingData, "bytes");
      v10 = v9 + 4;
      if (-[NSMutableData length](self->_incomingData, "length") < v9 + 4)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSMutableData bytes](self->_incomingData, "bytes") + 4, v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CF7690], "messageFromData:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("AssetManifest"));

      if (v14)
        break;
      objc_msgSend(v12, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("LocalCloudDownloadResponse"));

      if ((v17 & 1) == 0)
      {
        _ATLogCategoryiTunesSync();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_10;
        goto LABEL_11;
      }
LABEL_12:
      v18 = self->_requestHandlerTable;
      objc_sync_enter(v18);
      requestHandlerTable = self->_requestHandlerTable;
      objc_msgSend(v12, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](requestHandlerTable, "objectForKey:", v20);
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v21)
        ((void (**)(_QWORD, ATLegacyMessageLink *, void *))v21)[2](v21, self, v12);

      objc_sync_exit(v18);
      objc_msgSend(v12, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("Pong"));

      if ((v23 & 1) == 0)
        -[ATConcreteMessageLink setLastActivityTime:](self, "setLastActivityTime:", CFAbsoluteTimeGetCurrent());
      -[NSMutableData replaceBytesInRange:withBytes:length:](self->_incomingData, "replaceBytesInRange:withBytes:length:", 0, v10, 0, 0);

      if (-[NSMutableData length](self->_incomingData, "length") <= 3)
        goto LABEL_17;
    }
    _ATLogCategoryiTunesSync_Oversize();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2114;
      v28 = v12;
      _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ <--- %{public}@", buf, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_17:

}

- (BOOL)idleTimeoutEnabled
{
  _BOOL4 v3;
  objc_super v5;

  if (!-[ATLegacyMessageLink hostSupportsLocalCloudDownloads](self, "hostSupportsLocalCloudDownloads")
    || (v3 = -[ATLockdownMessageLink isWifiConnection](self, "isWifiConnection")))
  {
    v5.receiver = self;
    v5.super_class = (Class)ATLegacyMessageLink;
    LOBYTE(v3) = -[ATConcreteMessageLink idleTimeoutEnabled](&v5, sel_idleTimeoutEnabled);
  }
  return v3;
}

- (BOOL)_sendData:(const char *)a3 offset:(unsigned int)a4 len:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  void *v10;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  -[ATConcreteMessageLink socket](self, "socket");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "send:offset:len:error:", a3, v8, v7, a6) == (_DWORD)v7;

  return (char)a6;
}

- (double)_idleTimeoutInterval
{
  _BOOL4 v2;
  double result;

  v2 = -[ATLegacyMessageLink hostSupportsLocalCloudDownloads](self, "hostSupportsLocalCloudDownloads");
  result = 45.0;
  if (v2)
    return 180.0;
  return result;
}

- (void)_checkMessageTimeouts
{
  double Current;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  ATLegacyMessageLink *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  if (-[ATLegacyMessageLink idleTimeoutEnabled](self, "idleTimeoutEnabled")
    && (-[ATConcreteMessageLink lastActivityTime](self, "lastActivityTime"),
        v5 = Current - v4,
        -[ATLegacyMessageLink _idleTimeoutInterval](self, "_idleTimeoutInterval"),
        v5 > v6))
  {
    _ATLogCategoryiTunesSync();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_ERROR, "%{public}@ inactivity timeout fired - sending idle exit message and closing link", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("IdleExit"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__ATLegacyMessageLink__checkMessageTimeouts__block_invoke;
    v9[3] = &unk_1E927E0D0;
    v9[4] = self;
    -[ATLegacyMessageLink sendMessage:withCompletion:](self, "sendMessage:withCompletion:", v8, v9);

  }
  else
  {
    -[ATLegacyMessageLink _sendPingMessage](self, "_sendPingMessage");
  }
}

- (void)_sendPingMessage
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("Ping"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__ATLegacyMessageLink__sendPingMessage__block_invoke;
  v4[3] = &unk_1E927E0D0;
  v4[4] = self;
  -[ATLegacyMessageLink sendMessage:withCompletion:](self, "sendMessage:withCompletion:", v3, v4);

}

- (void)_handlePingMessage:(id)a3 fromLink:(id)a4
{
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0CF7690], "messageWithName:parameters:", CFSTR("Pong"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__ATLegacyMessageLink__handlePingMessage_fromLink___block_invoke;
  v6[3] = &unk_1E927E0D0;
  v6[4] = self;
  -[ATLegacyMessageLink sendMessage:withCompletion:](self, "sendMessage:withCompletion:", v5, v6);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, wifi=%d>"), v5, self, -[ATLockdownMessageLink isWifiConnection](self, "isWifiConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)hostSupportsLocalCloudDownloads
{
  return self->_hostSupportsLocalCloudDownloads;
}

- (void)setHostSupportsLocalCloudDownloads:(BOOL)a3
{
  self->_hostSupportsLocalCloudDownloads = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHandlerTable, 0);
  objc_storeStrong((id *)&self->_incomingData, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __51__ATLegacyMessageLink__handlePingMessage_fromLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryiTunesSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "failed to send pong response. err=%{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "close");
  }

}

void __39__ATLegacyMessageLink__sendPingMessage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryiTunesSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "failed to send ping message. err=%{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "close");
  }

}

void __44__ATLegacyMessageLink__checkMessageTimeouts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _ATLogCategoryiTunesSync();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "failed to send idleExit message. err=%{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "close");

}

void __50__ATLegacyMessageLink_sendMessage_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  unsigned int v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  _WORD v25[17];

  *(_QWORD *)&v25[13] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("AssetManifest")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("AssetMetrics")))
  {
    _ATLogCategoryiTunesSync_Oversize();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
  }
  else
  {
    _ATLogCategoryiTunesSync();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
  }
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)buf = 138543618;
  v23 = v4;
  v24 = 2114;
  *(_QWORD *)v25 = v5;
  _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ---> %{public}@", buf, 0x16u);
LABEL_7:

  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Ping"));

  if ((v7 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setLastActivityTime:", CFAbsoluteTimeGetCurrent());
  objc_msgSend(*(id *)(a1 + 32), "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v8, "length");
  v9 = *(void **)(a1 + 40);
  v20 = 0;
  v10 = objc_msgSend(v9, "_sendData:offset:len:error:", &v21, 0, 4, &v20);
  v11 = v20;
  if ((v10 & 1) != 0)
  {
    v12 = *(void **)(a1 + 40);
    v13 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
    v19 = v11;
    LOBYTE(v12) = objc_msgSend(v12, "_sendData:offset:len:error:", v13, 0, v21, &v19);
    v14 = v19;

    if ((v12 & 1) != 0)
      goto LABEL_17;
    _ATLogCategoryiTunesSync();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v23 = v16;
      v24 = 1024;
      *(_DWORD *)v25 = v21;
      v25[2] = 2114;
      *(_QWORD *)&v25[3] = v14;
      _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_ERROR, "%{public}@ failed to send message. len=%u, err=%{public}@", buf, 0x1Cu);
    }
    v11 = v14;
  }
  else
  {
    _ATLogCategoryiTunesSync();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v23 = v17;
      v24 = 2114;
      *(_QWORD *)v25 = v11;
      _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_ERROR, "%{public}@ failed to send size. err=%{public}@", buf, 0x16u);
    }
  }

  v14 = v11;
LABEL_17:
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v14);

}

void __27__ATLegacyMessageLink_open__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handlePingMessage:fromLink:", v5, v6);

}

void __27__ATLegacyMessageLink_open__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handlePongMessage:fromLink:", v5, v6);

}

@end
