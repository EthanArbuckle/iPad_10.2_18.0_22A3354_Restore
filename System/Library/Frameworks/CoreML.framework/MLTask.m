@implementation MLTask

- (MLTask)initWithState:(int64_t)a3
{
  MLTask *v4;
  MLTask *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *syncQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MLTask;
  v4 = -[MLTask init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_state = a3;
    v6 = dispatch_queue_create("com.apple.coreml.mltask_work_queue", 0);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v6;

  }
  return v5;
}

- (BOOL)_canResume
{
  return -[MLTask state](self, "state") == MLTaskStateSuspended;
}

- (BOOL)_canCancel
{
  MLTaskState v3;

  v3 = -[MLTask state](self, "state");
  if (v3 != MLTaskStateSuspended)
    LOBYTE(v3) = -[MLTask state](self, "state") == MLTaskStateRunning;
  return v3;
}

- (BOOL)_canSuspend
{
  return -[MLTask state](self, "state") == MLTaskStateRunning;
}

- (BOOL)_canComplete
{
  MLTaskState v3;

  v3 = -[MLTask state](self, "state");
  if (v3 != MLTaskStateSuspended)
    LOBYTE(v3) = -[MLTask state](self, "state") == MLTaskStateRunning;
  return v3;
}

- (BOOL)_canFail
{
  MLTaskState v3;

  v3 = -[MLTask state](self, "state");
  if (v3 != MLTaskStateSuspended)
    LOBYTE(v3) = -[MLTask state](self, "state") == MLTaskStateRunning;
  return v3;
}

- (void)_resumeWithTaskContext:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MLTask syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__MLTask__resumeWithTaskContext___block_invoke;
  v6[3] = &unk_1E3D66E20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  if (*((_BYTE *)v8 + 24))
    -[MLTask onResumptionWithTaskContext:](self, "onResumptionWithTaskContext:", v4);
  _Block_object_dispose(&v7, 8);

}

- (void)resume
{
  -[MLTask _resumeWithTaskContext:](self, "_resumeWithTaskContext:", 0);
}

- (void)cancel
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[MLTask syncQueue](self, "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __16__MLTask_cancel__block_invoke;
  block[3] = &unk_1E3D66E20;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(v3, block);

  if (*((_BYTE *)v9 + 24))
  {
    -[MLTask onCancellation](self, "onCancellation");
    -[MLTask syncQueue](self, "syncQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __16__MLTask_cancel__block_invoke_2;
    v6[3] = &unk_1E3D66E48;
    v6[4] = self;
    dispatch_sync(v5, v6);

  }
  _Block_object_dispose(&v8, 8);
}

- (void)suspendWithTaskContext:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MLTask syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__MLTask_suspendWithTaskContext___block_invoke;
  v6[3] = &unk_1E3D66E20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  if (*((_BYTE *)v8 + 24))
    -[MLTask onSuspensionWithTaskContext:](self, "onSuspensionWithTaskContext:", v4);
  _Block_object_dispose(&v7, 8);

}

- (void)completeWithTaskContext:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MLTask syncQueue](self, "syncQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__MLTask_completeWithTaskContext___block_invoke;
  v6[3] = &unk_1E3D66E20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  if (*((_BYTE *)v8 + 24))
    -[MLTask onCompletionWithTaskContext:](self, "onCompletionWithTaskContext:", v4);
  _Block_object_dispose(&v7, 8);

}

- (void)failWithError:(id)a3 taskContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[MLTask syncQueue](self, "syncQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MLTask_failWithError_taskContext___block_invoke;
  block[3] = &unk_1E3D66E70;
  block[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  dispatch_sync(v8, block);

  if (*((_BYTE *)v14 + 24))
    -[MLTask onFailureWithTaskContext:](self, "onFailureWithTaskContext:", v7);

  _Block_object_dispose(&v13, 8);
}

- (id)taskStatesToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3)
    return CFSTR("Task Suspended");
  else
    return off_1E3D66E90[a3 - 2];
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (MLTaskState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

uint64_t __36__MLTask_failWithError_taskContext___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_canFail");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
    result = objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __34__MLTask_completeWithTaskContext___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_canComplete");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __33__MLTask_suspendWithTaskContext___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_canSuspend");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __16__MLTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_canCancel");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __16__MLTask_cancel__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
}

uint64_t __33__MLTask__resumeWithTaskContext___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_canResume");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

@end
