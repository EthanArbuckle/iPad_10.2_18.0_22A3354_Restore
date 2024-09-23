@implementation SYIncomingBatchSyncSession

- (SYIncomingBatchSyncSession)initWithService:(id)a3
{
  SYIncomingBatchSyncSession *v3;
  uint64_t v4;
  NSMutableIndexSet *receivedBatchIndices;
  uint64_t v6;
  NSMutableArray *incomingBatchQueue;
  SYIncomingBatchSyncSession *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SYIncomingBatchSyncSession;
  v3 = -[SYIncomingFullSyncSession initWithService:](&v10, sel_initWithService_, a3);
  if (v3)
  {
    v4 = objc_opt_new();
    receivedBatchIndices = v3->_receivedBatchIndices;
    v3->_receivedBatchIndices = (NSMutableIndexSet *)v4;

    v6 = objc_opt_new();
    incomingBatchQueue = v3->_incomingBatchQueue;
    v3->_incomingBatchQueue = (NSMutableArray *)v6;

    v3->_queueLock._os_unfair_lock_opaque = 0;
    v8 = v3;
  }

  return v3;
}

- (void)_sendEndSessionResponse:(id)a3
{
  void (**completion)(id, id, id);
  id v5;
  id v6;

  completion = (void (**)(id, id, id))self->_completion;
  if (completion)
  {
    v5 = a3;
    -[SYSession wrappedUserContext](self, "wrappedUserContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    completion[2](completion, v5, v6);

  }
}

- (void)_continueProcessing
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  SYErrorInfo *v10;
  uint64_t v11;
  void *v12;
  SYErrorInfo *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _SYLazyChangeArray *v24;
  void *v25;
  void *v26;
  void *v27;
  _SYLazyChangeArray *v28;
  NSObject *v29;
  void *v30;
  SYErrorInfo *v31;
  void *v32;
  SYErrorInfo *v33;
  void *v34;
  void *v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  void *v43;
  SYIncomingBatchSyncSession *v44;
  _SYLazyChangeArray *v45;
  id v46;
  id v47;

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_lock(&self->_queueLock);
  -[NSMutableArray firstObject](self->_incomingBatchQueue, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_incomingBatchQueue, "removeObjectAtIndex:", 0);
    os_unfair_lock_unlock(&self->_queueLock);
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "batch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChunkIndex:", objc_msgSend(v6, "chunkIndex"));

    objc_msgSend(v4, "batch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSyncID:", v8);

    v9 = -[SYIncomingFullSyncSession state](self, "state");
    if (v9 == 5)
    {
      v10 = [SYErrorInfo alloc];
      -[SYSession error](self, "error");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 != 3)
        goto LABEL_9;
      v10 = [SYErrorInfo alloc];
      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);
    }
    v12 = (void *)v11;
    v13 = -[SYErrorInfo initWithError:](v10, "initWithError:", v11);
    objc_msgSend(v5, "setError:", v13);

LABEL_9:
    objc_msgSend(v5, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "completion");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[SYSession wrappedUserContext](self, "wrappedUserContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v15)[2](v15, v5, v16);

    }
    v17 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "batch");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v19, "count"));

    objc_msgSend(v4, "batch");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23 >= 1)
    {
      do
      {
        objc_msgSend(v20, "addObject:", &unk_24CC83A68);
        --v23;
      }
      while (v23);
    }
    v24 = [_SYLazyChangeArray alloc];
    objc_msgSend(v4, "batch");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession serializer](self, "serializer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[_SYLazyChangeArray initWithSYObjectDataArray:typeArray:decoder:](v24, "initWithSYObjectDataArray:typeArray:decoder:", v26, v20, v27);

    if (v28)
    {
      -[SYIncomingFullSyncSession setState:](self, "setState:", 11);
      -[SYSession targetQueue](self, "targetQueue");
      v29 = objc_claimAutoreleasedReturnValue();
      v40 = MEMORY[0x24BDAC760];
      v41 = 3221225472;
      v42 = __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke;
      v43 = &unk_24CC65C10;
      v44 = self;
      v45 = v28;
      v46 = v5;
      v47 = v4;
      dispatch_sync(v29, &v40);

    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v30 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_ERROR))
        -[SYIncomingTransactionSession _sendChanges].cold.1(v30);
      v31 = [SYErrorInfo alloc];
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2001, 0);
      v33 = -[SYErrorInfo initWithError:](v31, "initWithError:", v32);
      objc_msgSend(v5, "setError:", v33);

      -[SYSession service](self, "service");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v34, "_newMessageHeader");
      objc_msgSend(v5, "setHeader:", v35);

      objc_msgSend(v4, "completion");
      v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[SYSession wrappedUserContext](self, "wrappedUserContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v36)[2](v36, v5, v37);

    }
    os_unfair_lock_lock(&self->_queueLock);
    v38 = -[NSMutableArray count](self->_incomingBatchQueue, "count");
    os_unfair_lock_unlock(&self->_queueLock);
    if (v38)
    {
      v39 = 1;
    }
    else
    {
      if (!self->_hasReceivedEndSync)
      {
LABEL_25:

        goto LABEL_26;
      }
      v39 = 9;
    }
    -[SYIncomingFullSyncSession setState:](self, "setState:", v39, v40, v41, v42, v43, v44);
    goto LABEL_25;
  }
  os_unfair_lock_unlock(&self->_queueLock);
  if (self->_hasReceivedEndSync)
    -[SYIncomingFullSyncSession setState:](self, "setState:", 9);
LABEL_26:

}

void __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  uint8_t buf[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:applyChanges:completion:", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_23;
  v8[3] = &unk_24CC669E0;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v3, "syncSession:applyChanges:completion:", v4, v5, v8);

}

void __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  char v17;

  v5 = a3;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v6 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_23_cold_1(a1, v6, a2);
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_26;
  block[3] = &unk_24CC669B8;
  v8 = *(id *)(a1 + 32);
  v17 = a2;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v13 = v8;
  v14 = v9;
  v15 = v5;
  v16 = v10;
  v11 = v5;
  dispatch_async(v7, block);

}

void __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_26(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  SYErrorInfo *v14;
  void *v15;
  SYErrorInfo *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  SYErrorInfo *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  void *v24;
  int v25;
  _DWORD v26[7];

  *(_QWORD *)&v26[5] = *MEMORY[0x24BDAC8D0];
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = objc_msgSend(v3, "chunkIndex");
    v6 = "YES";
    if (!*(_BYTE *)(a1 + 64))
      v6 = "NO";
    v25 = 67109378;
    v26[0] = v5;
    LOWORD(v26[1]) = 2080;
    *(_QWORD *)((char *)&v26[1] + 2) = v6;
    _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_INFO, "Building response for processed changes, chunkIndex = %u, success = %s", (uint8_t *)&v25, 0x12u);

  }
  objc_msgSend(*(id *)(a1 + 40), "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "_newMessageHeader");
  objc_msgSend(*(id *)(a1 + 32), "setHeader:", v8);

  if (*(_BYTE *)(a1 + 64))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "state") == 12)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v9 = (void *)qword_253D84AB8;
      if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(void **)(a1 + 40);
        v11 = v9;
        objc_msgSend(v10, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _SYObfuscate(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        *(_QWORD *)v26 = v13;
        _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "Error occurred while waiting for v1 Sync Batch ingestion, returning error: %{public}@", (uint8_t *)&v25, 0xCu);

      }
      v14 = [SYErrorInfo alloc];
      objc_msgSend(*(id *)(a1 + 40), "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SYErrorInfo initWithError:](v14, "initWithError:", v15);
      objc_msgSend(*(id *)(a1 + 32), "setError:", v16);

      objc_msgSend(*(id *)(a1 + 40), "setState:", 5);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v17 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 32);
      v19 = v17;
      LODWORD(v18) = objc_msgSend(v18, "chunkIndex");
      _SYObfuscate(*(void **)(a1 + 48));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 67109378;
      v26[0] = (_DWORD)v18;
      LOWORD(v26[1]) = 2114;
      *(_QWORD *)((char *)&v26[1] + 2) = v20;
      _os_log_impl(&dword_211704000, v19, OS_LOG_TYPE_DEFAULT, "Client failed to process incoming BatchSyncChunk (%u), returning error: %{public}@", (uint8_t *)&v25, 0x12u);

    }
    v21 = -[SYErrorInfo initWithError:]([SYErrorInfo alloc], "initWithError:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setError:", v21);

  }
  objc_msgSend(*(id *)(a1 + 56), "completion");
  v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "wrappedUserContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *))v22)[2](v22, v23, v24);

}

- (void)_handleBatchChunk:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  os_activity_scope_state_s v10;

  v6 = a3;
  v7 = a4;
  -[SYIncomingFullSyncSession sessionActivity](self, "sessionActivity", 0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v8, &v10);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setBatch:", v6);
  objc_msgSend(v9, "setCompletion:", v7);
  os_unfair_lock_lock(&self->_queueLock);
  -[NSMutableArray addObject:](self->_incomingBatchQueue, "addObject:", v9);
  os_unfair_lock_unlock(&self->_queueLock);
  -[SYIncomingFullSyncSession setState:](self, "setState:", 1);

  os_activity_scope_leave(&v10);
}

- (void)_handleEndSync:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id completion;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = a4;
  -[SYIncomingFullSyncSession sessionActivity](self, "sessionActivity", 0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v8, &v11);

  v9 = (void *)objc_msgSend(v7, "copy");
  completion = self->_completion;
  self->_completion = v9;

  self->_hasReceivedEndSync = 1;
  -[SYIncomingFullSyncSession setState:](self, "setState:", 1);
  os_activity_scope_leave(&v11);

}

- (BOOL)canRestart
{
  return self->canRestart;
}

- (void)setCanRestart:(BOOL)a3
{
  self->canRestart = a3;
}

- (BOOL)canRollback
{
  return self->canRollback;
}

- (void)setCanRollback:(BOOL)a3
{
  self->canRollback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingBatchQueue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_receivedBatchIndices, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
}

void __49__SYIncomingBatchSyncSession__continueProcessing__block_invoke_23_cold_1(uint64_t a1, void *a2, char a3)
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = objc_msgSend(v4, "chunkIndex");
  v7 = "NO";
  if ((a3 & 1) != 0)
    v7 = "YES";
  v8[0] = 67109378;
  v8[1] = v6;
  v9 = 2080;
  v10 = v7;
  _os_log_debug_impl(&dword_211704000, v5, OS_LOG_TYPE_DEBUG, "Delegate callout complete: -syncSession:applyChanges:completion:, v1 chunkIndex = %u, success = %s", (uint8_t *)v8, 0x12u);

}

@end
