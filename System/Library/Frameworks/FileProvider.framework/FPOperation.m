@implementation FPOperation

- (FPOperation)init
{
  FPOperation *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;
  uint8_t buf[4];
  FPOperation *v17;
  char out[40];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(out, 0, 37);
  v15.receiver = self;
  v15.super_class = (Class)FPOperation;
  v2 = -[FPOperation init](&v15, sel_init);
  if (v2)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v2;
      _os_log_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_INFO, "[INFO] creating %@", buf, 0xCu);
    }

    MEMORY[0x1A1B00D24](v2->_uuid);
    uuid_unparse_upper(v2->_uuid, out);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPOperation setName:](v2, "setName:", v6);

    -[FPOperation name](v2, "name");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UNSPECIFIED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v8, v11);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v12;

  }
  return v2;
}

- (id)operationDescription
{
  return CFSTR(" ");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  _BOOL4 v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPOperation name](self, "name");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[FPOperation operationDescription](self, "operationDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPOperation operationDescription](self, "operationDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasSuffix:", CFSTR(" "));
  if (-[FPOperation isExecuting](self, "isExecuting"))
  {
    v9 = CFSTR("executing");
  }
  else
  {
    v10 = -[FPOperation isFinished](self, "isFinished");
    v9 = CFSTR("idle");
    if (v10)
      v9 = CFSTR("finished");
  }
  v11 = &stru_1E4450B40;
  if (v8)
    v12 = &stru_1E4450B40;
  else
    v12 = CFSTR(" ");
  if (v5)
    v11 = v5;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ %@%@%@>"), v4, self, v11, v6, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_executionTransaction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPOperation.m"), 84, &stru_1E4450B40);

  }
  -[FPOperation setCallbackQueue:](self, "setCallbackQueue:", 0);
  v5.receiver = self;
  v5.super_class = (Class)FPOperation;
  -[FPOperation dealloc](&v5, sel_dealloc);
}

- (void)setCallbackQueue:(id)a3
{
  OS_dispatch_queue *v4;
  NSObject *queue;
  OS_dispatch_queue *v6;

  v4 = (OS_dispatch_queue *)a3;
  queue = self->_queue;
  if (queue)
    dispatch_activate(queue);
  v6 = self->_queue;
  self->_queue = v4;

}

- (void)_setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    -[FPOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = a3;
    -[FPOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (BOOL)isExecuting
{
  return self->_executionTransaction != 0;
}

- (void)_setExecuting:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id executionTransaction;

  if ((((self->_executionTransaction == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[FPOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    if (v3)
      v5 = (void *)os_transaction_create();
    else
      v5 = 0;
    executionTransaction = self->_executionTransaction;
    self->_executionTransaction = v5;

    -[FPOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
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
  block[2] = __20__FPOperation_start__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __20__FPOperation_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A0A34000, v2, OS_LOG_TYPE_INFO, "[INFO] Starting %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setExecuting:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "_finishIfCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "main");
  return result;
}

- (void)cancel
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelling %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __21__FPOperation_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setRemoteCancellationHandler:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_finishIfCancelled");
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
  if (self->_executionTransaction)
  {
    v2 = -[FPOperation isCancelled](self, "isCancelled");
    if (!v2)
      return v2;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPOperation finishWithResult:error:](self, "finishWithResult:error:", 0, v4);

    goto LABEL_2;
  }
  LOBYTE(v2) = 0;
  return v2;
}

- (BOOL)finishIfCancelled
{
  int v3;
  NSObject *queue;
  _QWORD block[5];

  v3 = -[FPOperation isCancelled](self, "isCancelled");
  if (v3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__FPOperation_finishIfCancelled__block_invoke;
    block[3] = &unk_1E444A308;
    block[4] = self;
    dispatch_async(queue, block);
  }
  return v3;
}

uint64_t __32__FPOperation_finishIfCancelled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishIfCancelled");
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
  block[2] = __41__FPOperation_completedWithResult_error___block_invoke;
  block[3] = &unk_1E444AB48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __41__FPOperation_completedWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_finishIfCancelled");
  if ((result & 1) == 0)
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1A0A34000, v3, OS_LOG_TYPE_INFO, "[INFO] finishing %@", (uint8_t *)&v5, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  return result;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[FPOperation finishedBlock](self, "finishedBlock");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v6);
    -[FPOperation setFinishedBlock:](self, "setFinishedBlock:", 0);
  }

  -[FPOperation _setExecuting:](self, "_setExecuting:", 0);
  -[FPOperation _setFinished:](self, "_setFinished:", 1);
  -[FPOperation _setRemoteCancellationHandler:](self, "_setRemoteCancellationHandler:", 0);

}

- (void)resetRemoteOperation
{
  FPCancellable *remoteOperation;

  remoteOperation = self->_remoteOperation;
  self->_remoteOperation = 0;

}

- (void)_setRemoteCancellationHandler:(id)a3
{
  id v5;
  FPCancellable *remoteOperation;
  char v7;
  FPCancellable *v8;
  FPCancellable *v9;
  void *v10;
  _QWORD v11[5];

  v5 = a3;
  remoteOperation = self->_remoteOperation;
  if (v5 && remoteOperation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPOperation.m"), 219, &stru_1E4450B40);

    remoteOperation = self->_remoteOperation;
  }
  -[FPCancellable cancel](remoteOperation, "cancel");
  if (self->_finished)
  {
    if (!v5)
      goto LABEL_10;
    goto LABEL_9;
  }
  v7 = -[FPOperation isCancelled](self, "isCancelled");
  if (v5 && (v7 & 1) != 0)
  {
LABEL_9:
    objc_msgSend(v5, "cancel");

    v5 = 0;
  }
LABEL_10:
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__FPOperation__setRemoteCancellationHandler___block_invoke;
  v11[3] = &unk_1E444A598;
  v11[4] = self;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
  v8 = (FPCancellable *)objc_claimAutoreleasedReturnValue();
  v9 = self->_remoteOperation;
  self->_remoteOperation = v8;

}

uint64_t __45__FPOperation__setRemoteCancellationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void)setCancellationHandler:(id)a3
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
  v7[2] = __38__FPOperation_setCancellationHandler___block_invoke;
  v7[3] = &unk_1E4449A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __38__FPOperation_setCancellationHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setRemoteCancellationHandler:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_queue;
}

- (FPCancellable)remoteOperation
{
  return self->_remoteOperation;
}

- (void)setRemoteOperation:(id)a3
{
  objc_storeStrong((id *)&self->_remoteOperation, a3);
}

- (id)finishedBlock
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setFinishedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishedBlock, 0);
  objc_storeStrong(&self->_executionTransaction, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteOperation, 0);
}

@end
