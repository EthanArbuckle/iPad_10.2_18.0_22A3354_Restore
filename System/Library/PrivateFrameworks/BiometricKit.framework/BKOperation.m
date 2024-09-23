@implementation BKOperation

- (BKOperation)initWithDevice:(id)a3
{
  BKOperation *v5;
  NSObject *v6;
  NSObject *v7;
  BKOperation *v8;
  BKOperation *v9;
  BiometricKitXPCClient *v10;
  void *v11;
  uint64_t v12;
  BiometricKitXPCClient *xpcClient;
  BiometricKitXPCClient *v14;
  NSObject *v15;
  BiometricKitXPCClient *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  BKOperation *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (BKOperation *)a3;
  kdebug_trace();
  v6 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v5;
    _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKOperation::initWithDevice %@\n", buf, 0xCu);
  }
  v21.receiver = self;
  v21.super_class = (Class)BKOperation;
  v8 = -[BKOperation init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_state = 1;
    v10 = [BiometricKitXPCClient alloc];
    -[BKOperation descriptor](v5, "descriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BiometricKitXPCClient initWithDeviceType:clientType:](v10, "initWithDeviceType:clientType:", objc_msgSend(v11, "type"), 3);
    xpcClient = v9->_xpcClient;
    v9->_xpcClient = (BiometricKitXPCClient *)v12;

    v14 = v9->_xpcClient;
    if (v14)
      -[BiometricKitXPCClient setDelegate:](v14, "setDelegate:", v9);
    if (__osLogTrace)
      v15 = __osLogTrace;
    else
      v15 = v6;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v9->_xpcClient;
      v17 = v15;
      v18 = -[BiometricKitXPCClient connectionId](v16, "connectionId");
      *(_DWORD *)buf = 138412546;
      v23 = v9;
      v24 = 2048;
      v25 = v18;
      _os_log_impl(&dword_1AF533000, v17, OS_LOG_TYPE_DEFAULT, "BKOperation::initWithDevice -> %@ (_cid %lu)\n", buf, 0x16u);

    }
  }
  else
  {
    if (__osLogTrace)
      v19 = __osLogTrace;
    else
      v19 = v6;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = 0;
      v24 = 2048;
      v25 = 0;
      _os_log_impl(&dword_1AF533000, v19, OS_LOG_TYPE_ERROR, "BKOperation::initWithDevice -> %@ (_cid %lu)\n", buf, 0x16u);
    }
  }
  kdebug_trace();

  return v9;
}

- (void)dealloc
{
  BiometricKitXPCClient *v3;
  NSObject *v4;
  BiometricKitXPCClient *v5;
  BiometricKitXPCClient *xpcClient;
  objc_super v7;
  _QWORD block[4];
  BiometricKitXPCClient *v9;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[BiometricKitXPCClient setDelegate:](self->_xpcClient, "setDelegate:", 0);
  v3 = self->_xpcClient;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__BKOperation_dealloc__block_invoke;
  block[3] = &unk_1E5F83D50;
  v9 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  xpcClient = self->_xpcClient;
  self->_xpcClient = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKOperation;
  -[BKOperation dealloc](&v7, sel_dealloc);
}

uint64_t __22__BKOperation_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateConnection");
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  id WeakRetained;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v8 = v6;
    v11 = 138412546;
    v12 = v4;
    v13 = 2048;
    v14 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKOperation::setDelegate %@ (_cid %lu)\n", (uint8_t *)&v11, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    -[BiometricKitXPCClient registerDelegate:](self->_xpcClient, "registerDelegate:", v4 != 0);
  }
  if (__osLogTrace)
    v10 = __osLogTrace;
  else
    v10 = v5;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1AF533000, v10, OS_LOG_TYPE_DEFAULT, "BKOperation::setDelegate -> void\n", (uint8_t *)&v11, 2u);
  }

}

- (id)dispatchQueue
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v3;
  id v4;

  queue = self->_queue;
  if (queue)
  {
    v3 = queue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
  }
  return v3;
}

- (void)connectionInterrupted
{
  int64_t state;
  BKOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  state = obj->_state;
  if (state != 1 && state != 4)
    -[BKOperation operationInterrupted](obj, "operationInterrupted");
  objc_sync_exit(obj);

}

- (void)operationInterrupted
{
  -[BKOperation operationEndsWithReason:](self, "operationEndsWithReason:", 3);
}

- (id)optionsDictionaryWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary", a3);
}

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  void (**v4)(id, _QWORD, id);
  id v5;
  id v6;

  v6 = 0;
  v4 = (void (**)(id, _QWORD, id))a4;
  setError((id)1, &v6);
  v5 = v6;
  v4[2](v4, 0, v5);

}

- (void)startOperation:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  BKOperation *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  void (**v17)(_QWORD, _QWORD, _QWORD);
  _QWORD v18[4];
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

  v4 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  kdebug_trace();
  v7 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v21) = v4;
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKOperation::startOperation(async=%u)\n", buf, 8u);
  }
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __36__BKOperation_startOperation_reply___block_invoke;
  v18[3] = &unk_1E5F844A8;
  v10 = v6;
  v19 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5DF8A2C](v18);
  v12 = self;
  objc_sync_enter(v12);
  if (-[BKOperation state](v12, "state") != 1 || v12->_startPending)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v21 = "self.state == BKOperationStateIdle && !_startPending";
      v22 = 2048;
      v23 = 0;
      v24 = 2080;
      v25 = &unk_1AF575226;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      v28 = 1024;
      v29 = 161;
      _os_log_impl(&dword_1AF533000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    +[BKErrorHelper errorWithCode:](BKErrorHelper, "errorWithCode:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v15);

    objc_sync_exit(v12);
  }
  else
  {
    v12->_startPending = 1;
    objc_sync_exit(v12);

    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __36__BKOperation_startOperation_reply___block_invoke_9;
    v16[3] = &unk_1E5F84538;
    v16[4] = v12;
    v17 = v11;
    -[BKOperation startBioOperation:reply:](v12, "startBioOperation:reply:", v4, v16);

  }
  if (__osLogTrace)
    v13 = __osLogTrace;
  else
    v13 = v7;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v13, OS_LOG_TYPE_DEFAULT, "BKOperation::startOperation -> void\n", buf, 2u);
  }
  kdebug_trace();

}

void __36__BKOperation_startOperation_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  int v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 67109378;
      v11 = 1;
      v12 = 2112;
      v13 = v5;
      v7 = v6;
      v8 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      _os_log_impl(&dword_1AF533000, v7, v8, "BKOperation::startOperation -> reply(%d, %@)\n", (uint8_t *)&v10, 0x12u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = 67109378;
    v11 = 0;
    v12 = 2112;
    v13 = v5;
    v7 = v6;
    v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_9;
  }
  kdebug_trace();
  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, v5, v9);

}

void __36__BKOperation_startOperation_reply___block_invoke_9(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];

  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  v7 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    if (*(_QWORD *)(v7 + 48) == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "changeState:", 2);
      v7 = *(_QWORD *)(a1 + 32);
    }
    if (*(_BYTE *)(v7 + 17))
    {
      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__BKOperation_startOperation_reply___block_invoke_2;
      block[3] = &unk_1E5F83D50;
      block[4] = v7;
      dispatch_async(v8, block);

      v7 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v7 + 16) = 0;
  objc_sync_exit(v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __36__BKOperation_startOperation_reply___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (BOOL)startWithError:(id *)a3
{
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__BKOperation_startWithError___block_invoke;
  v6[3] = &unk_1E5F84458;
  v6[4] = &v13;
  v6[5] = &v7;
  -[BKOperation startOperation:reply:](self, "startOperation:reply:", 0, v6);
  if (a3)
    *a3 = objc_retainAutorelease((id)v8[5]);
  v4 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __30__BKOperation_startWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)startWithReply:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__BKOperation_startWithReply___block_invoke;
  v6[3] = &unk_1E5F844A8;
  v7 = v4;
  v5 = v4;
  -[BKOperation startOperation:reply:](self, "startOperation:reply:", 1, v6);

}

void __30__BKOperation_startWithReply___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__BKOperation_startWithReply___block_invoke_2;
  block[3] = &unk_1E5F84480;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __30__BKOperation_startWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)cancel
{
  NSObject *v3;
  NSObject *v4;
  BiometricKitXPCClient *xpcClient;
  NSObject *v6;
  BKOperation *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v3 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v4 = __osLogTrace;
  else
    v4 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v6 = v4;
    v9 = 134217984;
    v10 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKOperation::cancel (_cid %lu)\n", (uint8_t *)&v9, 0xCu);

  }
  v7 = self;
  objc_sync_enter(v7);
  if (v7->_state != 4)
  {
    v7->_cancelPending = 1;
    -[BiometricKitXPCClient cancel](v7->_xpcClient, "cancel");
  }
  objc_sync_exit(v7);

  if (__osLogTrace)
    v8 = __osLogTrace;
  else
    v8 = v3;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKOperation::cancel -> void\n", (uint8_t *)&v9, 2u);
  }
  kdebug_trace();
}

- (id)userPresentWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  int v18;
  _DWORD v19[7];

  *(_QWORD *)&v19[5] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v8 = v6;
    v18 = 134217984;
    *(_QWORD *)v19 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKOperation::userPresent (_cid %lu)\n", (uint8_t *)&v18, 0xCu);

  }
  v9 = -[BiometricKitXPCClient isFingerOn](self->_xpcClient, "isFingerOn");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = v5;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v13 = *a3;
      else
        v13 = 0;
      v18 = 67109378;
      v19[0] = v9;
      LOWORD(v19[1]) = 2112;
      *(_QWORD *)((char *)&v19[1] + 2) = v13;
      v15 = v12;
      v16 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
      _os_log_impl(&dword_1AF533000, v15, v16, "BKOperation::userPresent -> %d %@\n", (uint8_t *)&v18, 0x12u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    if (a3)
      v14 = *a3;
    else
      v14 = 0;
    v18 = 67109378;
    v19[0] = v9;
    LOWORD(v19[1]) = 2112;
    *(_QWORD *)((char *)&v19[1] + 2) = v14;
    v15 = v12;
    v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_20;
  }
  kdebug_trace();
  return v11;
}

- (void)changeState:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  BKOperation *v7;
  id WeakRetained;
  char v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_log_impl(&dword_1AF533000, v6, OS_LOG_TYPE_DEFAULT, "BKOperation::changeState %ld\n", buf, 0xCu);
  }
  v7 = self;
  objc_sync_enter(v7);
  if (v7->_state != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v7->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[BKOperation dispatchQueue](v7, "dispatchQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __27__BKOperation_changeState___block_invoke;
      v12[3] = &unk_1E5F83C10;
      v12[4] = v7;
      v12[5] = a3;
      dispatch_async(v10, v12);

    }
    v7->_state = a3;
  }
  objc_sync_exit(v7);

  if (__osLogTrace)
    v11 = __osLogTrace;
  else
    v11 = v5;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v11, OS_LOG_TYPE_DEFAULT, "BKOperation::changeState -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __27__BKOperation_changeState___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "operation:stateChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)operationEndsWithReason:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  BiometricKitXPCClient *xpcClient;
  NSObject *v8;
  id WeakRetained;
  char v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  int64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v6 = __osLogTrace;
  else
    v6 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->_xpcClient;
    v8 = v6;
    *(_DWORD *)buf = 134218240;
    v15 = a3;
    v16 = 2048;
    v17 = -[BiometricKitXPCClient connectionId](xpcClient, "connectionId");
    _os_log_impl(&dword_1AF533000, v8, OS_LOG_TYPE_DEFAULT, "BKOperation::operationEndsWithReason: %ld (_cid %lu)\n", buf, 0x16u);

  }
  -[BKOperation changeState:](self, "changeState:", 4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[BKOperation dispatchQueue](self, "dispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__BKOperation_operationEndsWithReason___block_invoke;
    v13[3] = &unk_1E5F83C10;
    v13[4] = self;
    v13[5] = a3;
    dispatch_async(v11, v13);

  }
  -[BiometricKitXPCClient setDelegate:](self->_xpcClient, "setDelegate:", 0);
  -[BiometricKitXPCClient invalidateConnection](self->_xpcClient, "invalidateConnection");
  if (__osLogTrace)
    v12 = __osLogTrace;
  else
    v12 = v5;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF533000, v12, OS_LOG_TYPE_DEFAULT, "BKOperation::operationEndsWithReason: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __39__BKOperation_operationEndsWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "operation:finishedWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  BKOperation *v8;
  uint64_t v9;
  id WeakRetained;
  char v11;
  NSObject *v12;
  BKOperation *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  unsigned int v17;
  uint8_t buf[4];
  unsigned int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v6 = MEMORY[0x1E0C81028];
  if (__osLogTrace)
    v7 = __osLogTrace;
  else
    v7 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v19 = a3;
    _os_log_impl(&dword_1AF533000, v7, OS_LOG_TYPE_DEFAULT, "BKOperation::statusMessage: %u\n", buf, 8u);
  }
  switch(a3)
  {
    case '3':
    case '>':
    case 'C':
      v8 = self;
      v9 = 3;
      goto LABEL_13;
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
    case ';':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
      goto LABEL_21;
    case ':':
    case 'A':
      v8 = self;
      v9 = 1;
      goto LABEL_13;
    case '<':
      v13 = self;
      v14 = 3;
      goto LABEL_20;
    case '=':
      goto LABEL_17;
    case '?':
    case '@':
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        -[BKOperation dispatchQueue](self, "dispatchQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __36__BKOperation_statusMessage_client___block_invoke;
        v16[3] = &unk_1E5F843A8;
        v16[4] = self;
        v17 = a3;
        dispatch_async(v12, v16);

      }
      if (a3 != 64)
        goto LABEL_21;
LABEL_17:
      v13 = self;
      v14 = 2;
LABEL_20:
      -[BKOperation changeState:](v13, "changeState:", v14);
      goto LABEL_21;
    case 'B':
    case 'P':
      goto LABEL_11;
    case 'D':
      goto LABEL_10;
    case 'J':
      v13 = self;
      v14 = 5;
      goto LABEL_20;
    default:
      if (a3 == 99)
      {
LABEL_11:
        v8 = self;
        v9 = 2;
      }
      else
      {
        if (a3 != 502)
          goto LABEL_21;
LABEL_10:
        v8 = self;
        v9 = 4;
      }
LABEL_13:
      -[BKOperation operationEndsWithReason:](v8, "operationEndsWithReason:", v9);
LABEL_21:
      if (__osLogTrace)
        v15 = __osLogTrace;
      else
        v15 = v6;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF533000, v15, OS_LOG_TYPE_DEFAULT, "BKOperation::statusMessage: -> void\n", buf, 2u);
      }
      kdebug_trace();
      return;
  }
}

void __36__BKOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "operation:presenceStateChanged:", *(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 40) == 63);

}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  -[BKOperation statusMessage:client:](self, "statusMessage:client:", *(_QWORD *)&a3, a5);
}

- (BOOL)isDelegate
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = WeakRetained != 0;

  return v3;
}

- (BKDevice)device
{
  return self->_device;
}

- (BKOperationDelegate)delegate
{
  return (BKOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

@end
