@implementation BROperation

- (BROperation)init
{
  BROperation *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  _QWORD v14[3];
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  BROperation *v19;
  __int16 v20;
  void *v21;
  char out[40];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  memset(out, 0, 37);
  v15.receiver = self;
  v15.super_class = (Class)BROperation;
  v2 = -[BROperation init](&v15, sel_init);
  if (v2)
  {
    memset(v14, 0, sizeof(v14));
    __brc_create_section(0, (uint64_t)"-[BROperation init]", 30, v14);
    brc_bread_crumbs((uint64_t)"-[BROperation init]", 30);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v17 = v14[0];
      v18 = 2112;
      v19 = v2;
      v20 = 2112;
      v21 = v3;
      _os_log_debug_impl(&dword_19CBF0000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Creating %@%@", buf, 0x20u);
    }

    MEMORY[0x1A1AD89D4](v2->_uuid);
    uuid_unparse_upper(v2->_uuid, out);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %s"), objc_opt_class(), out);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BROperation setName:](v2, "setName:", v5);

    -[BROperation name](v2, "name");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v7, v10);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    __brc_leave_section((uint64_t)v14);
  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _BOOL4 v8;
  void *v9;
  objc_super v10;

  -[BROperation name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[BROperation name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[BROperation isExecuting](self, "isExecuting"))
    {
      v6 = CFSTR("executing");
    }
    else
    {
      v8 = -[BROperation isFinished](self, "isFinished");
      v6 = CFSTR("idle");
      if (v8)
        v6 = CFSTR("finished");
    }
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%p %@ %@>"), self, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BROperation;
    -[BROperation description](&v10, sel_description);
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: _executionTransation == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    -[BROperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = a3;
    -[BROperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (BOOL)isExecuting
{
  return self->_executionTransation != 0;
}

- (void)_setExecuting:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id executionTransation;

  if ((((self->_executionTransation == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[BROperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    if (v3)
      v5 = (void *)os_transaction_create();
    else
      v5 = 0;
    executionTransation = self->_executionTransation;
    self->_executionTransation = v5;

    -[BROperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  dispatch_activate((dispatch_object_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__BROperation_start__block_invoke;
  block[3] = &unk_1E3DA4738;
  block[4] = self;
  dispatch_async(queue, block);
}

void __20__BROperation_start__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[3];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v5, 0, sizeof(v5));
  __brc_create_section(0, (uint64_t)"-[BROperation start]_block_invoke", 101, v5);
  brc_bread_crumbs((uint64_t)"-[BROperation start]_block_invoke", 101);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v7 = v5[0];
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v2;
    _os_log_debug_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Starting %@%@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setExecuting:", 1);
  if ((objc_msgSend(*(id *)(a1 + 32), "_finishIfCancelled") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "main");
  __brc_leave_section((uint64_t)v5);
}

- (void)cancel
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_19CBF0000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelling %@%@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

uint64_t __21__BROperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setRemoteOperation:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "waitForRemoteToBeCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_finishIfCancelled");
  return result;
}

- (BOOL)_finishIfCancelled
{
  int v2;
  void *v4;

  if (self->_finished)
  {
LABEL_2:
    LOBYTE(v2) = 1;
    return v2;
  }
  if (self->_executionTransation)
  {
    v2 = -[BROperation isCancelled](self, "isCancelled");
    if (!v2)
      return v2;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BROperation finishWithResult:error:](self, "finishWithResult:error:", 0, v4);

    goto LABEL_2;
  }
  LOBYTE(v2) = 0;
  return v2;
}

- (BOOL)finishIfCancelled
{
  int v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v18;
  const char *label;
  _QWORD v20[5];
  __int128 v21;
  uint64_t v22;
  _BYTE block[24];
  void *v24;
  NSObject *v25;
  id v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = -[BROperation isCancelled](self, "isCancelled");
  if (v3)
  {
    queue = self->_queue;
    v5 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __32__BROperation_finishIfCancelled__block_invoke;
    v20[3] = &unk_1E3DA4738;
    v20[4] = self;
    v6 = queue;
    v7 = v20;
    v12 = (void *)MEMORY[0x1A1AD841C](v7, v8, v9, v10, v11);
    v21 = 0uLL;
    v22 = 0;
    __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v21);
    brc_bread_crumbs((uint64_t)"dispatch_async_with_logs", 262);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = v21;
      label = dispatch_queue_get_label(v6);
      *(_DWORD *)block = 134218498;
      *(_QWORD *)&block[4] = v18;
      *(_WORD *)&block[12] = 2080;
      *(_QWORD *)&block[14] = label;
      *(_WORD *)&block[22] = 2112;
      v24 = v13;
      _os_log_debug_impl(&dword_19CBF0000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
    }

    v27 = v21;
    v28 = v22;
    *(_QWORD *)block = v5;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke;
    v24 = &unk_1E3DA4A98;
    v15 = v6;
    v25 = v15;
    v16 = v7;
    v26 = v16;
    dispatch_async(v15, block);

    objc_autoreleasePoolPop(v12);
  }
  return v3;
}

uint64_t __32__BROperation_finishIfCancelled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishIfCancelled");
}

- (id)remoteObject
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__BROperation_remoteObject__block_invoke;
  v6[3] = &unk_1E3DA47F0;
  v6[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __27__BROperation_remoteObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (id)remoteFPFSObject
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[5];

  if ((BRIsFPFSEnabled(self, a2) & 1) != 0)
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__BROperation_remoteFPFSObject__block_invoke;
    v8[3] = &unk_1E3DA47F0;
    v8[4] = self;
    objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BROperation remoteFPFSObject]", 170);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BROperation remoteFPFSObject].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_remoteFPFSObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BROperation completedWithResult:error:](self, "completedWithResult:error:", 0, v3);
    v4 = 0;
  }

  return v4;
}

uint64_t __31__BROperation_remoteFPFSObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (id)remoteLegacyObject
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  if (BRIsFPFSEnabled(self, a2))
  {
    brc_bread_crumbs((uint64_t)"-[BROperation remoteLegacyObject]", 182);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BROperation remoteLegacyObject].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_remoteLegacyObject);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BROperation completedWithResult:error:](self, "completedWithResult:error:", 0, v5);
    v6 = 0;
  }
  else
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __33__BROperation_remoteLegacyObject__block_invoke;
    v8[3] = &unk_1E3DA47F0;
    v8[4] = self;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t __33__BROperation_remoteLegacyObject__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void)completedWithResult:(id)a3 error:(id)a4
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
  block[2] = __41__BROperation_completedWithResult_error___block_invoke;
  block[3] = &unk_1E3DA4A48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __41__BROperation_completedWithResult_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_finishIfCancelled") & 1) == 0)
  {
    memset(v7, 0, sizeof(v7));
    __brc_create_section(0, (uint64_t)"-[BROperation completedWithResult:error:]_block_invoke", 201, v7);
    brc_bread_crumbs((uint64_t)"-[BROperation completedWithResult:error:]_block_invoke", 201);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134219010;
      v9 = v7[0];
      v10 = 2112;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v2;
      _os_log_debug_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx finishing %@ with result %@ error %@%@", buf, 0x34u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    __brc_leave_section((uint64_t)v7);
  }
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  -[BROperation _setExecuting:](self, "_setExecuting:", 0, a4);
  -[BROperation _setFinished:](self, "_setFinished:", 1);
  -[BROperation _setRemoteOperation:](self, "_setRemoteOperation:", 0);
}

- (void)_setRemoteOperation:(id)a3
{
  id v4;
  id remoteOperation;
  char v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];

  v4 = a3;
  remoteOperation = self->_remoteOperation;
  if (v4 && remoteOperation)
  {
    brc_bread_crumbs((uint64_t)"-[BROperation _setRemoteOperation:]", 218);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BROperation _setRemoteOperation:].cold.1();

    remoteOperation = self->_remoteOperation;
  }
  objc_msgSend(remoteOperation, "invalidate");
  if (self->_finished)
  {
    if (!v4)
      goto LABEL_9;
    goto LABEL_8;
  }
  v6 = -[BROperation isCancelled](self, "isCancelled");
  if (v4 && (v6 & 1) != 0)
  {
LABEL_8:
    objc_msgSend(v4, "invalidate");

    v4 = 0;
  }
LABEL_9:
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__BROperation__setRemoteOperation___block_invoke;
  v11[3] = &unk_1E3DA47F0;
  v11[4] = self;
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_remoteOperation;
  self->_remoteOperation = v7;

}

uint64_t __35__BROperation__setRemoteOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void)setRemoteOperationProxy:(id)a3 userInfo:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__BROperation_setRemoteOperationProxy_userInfo___block_invoke;
  v8[3] = &unk_1E3DA4A70;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __48__BROperation_setRemoteOperationProxy_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setRemoteOperation:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_queue;
}

- (BRCancellable)remoteOperation
{
  return (BRCancellable *)self->_remoteOperation;
}

- (void)setRemoteOperation:(id)a3
{
  objc_storeStrong(&self->_remoteOperation, a3);
}

- (BOOL)waitForRemoteToBeCancelled
{
  return self->_waitForRemoteToBeCancelled;
}

- (void)setWaitForRemoteToBeCancelled:(BOOL)a3
{
  self->_waitForRemoteToBeCancelled = a3;
}

- (BOOL)nonDiscretionary
{
  return self->_nonDiscretionary;
}

- (void)setNonDiscretionary:(BOOL)a3
{
  self->_nonDiscretionary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_executionTransation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_remoteOperation, 0);
}

- (void)remoteFPFSObject
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Asking for FPFS object when FPFS isn't enabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)remoteLegacyObject
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Asking for Legacy object when FPFS is enabled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_setRemoteOperation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: !_remoteOperation || !proxy%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
