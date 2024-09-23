@implementation SYIncomingSyncAllObjectsSession

- (SYIncomingSyncAllObjectsSession)initWithService:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  SYIncomingSyncAllObjectsSession *v10;
  uint64_t v11;
  NSMutableArray *allObjectsAsData;
  uint64_t v13;
  id completion;
  void *v15;
  void *v16;
  SYIncomingSyncAllObjectsSession *v17;
  objc_super v19;

  v8 = a4;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SYIncomingSyncAllObjectsSession;
  v10 = -[SYIncomingFullSyncSession initWithService:](&v19, sel_initWithService_, a3);
  if (v10)
  {
    objc_msgSend(v8, "allObjects");
    v11 = objc_claimAutoreleasedReturnValue();
    allObjectsAsData = v10->_allObjectsAsData;
    v10->_allObjectsAsData = (NSMutableArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    completion = v10->_completion;
    v10->_completion = (id)v13;

    objc_msgSend(v8, "header");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timestamp");
    -[SYSession setBirthDate:](v10, "setBirthDate:");

    objc_msgSend(v8, "syncID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYSession setIdentifier:](v10, "setIdentifier:", v16);

    v17 = v10;
  }

  return v10;
}

- (void)_sendEndSessionResponse:(id)a3
{
  void (**completion)(id, id, id);
  id v5;
  id v6;

  completion = (void (**)(id, id, id))self->_completion;
  v5 = a3;
  -[SYSession wrappedUserContext](self, "wrappedUserContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  completion[2](completion, v5, v6);

}

- (void)_continueProcessing
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_211704000, log, OS_LOG_TYPE_FAULT, "Unable to create an _SYLazyChangeArray object for %{public}@", buf, 0xCu);

}

void __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, char, void *);
  void *v8;
  uint64_t v9;
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
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_3;
  v8 = &unk_24CC65290;
  v9 = v4;
  objc_msgSend(v3, "syncSession:applyChanges:completion:");

}

void __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  char v14;
  os_activity_scope_state_s state;

  v5 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_msgSend(*(id *)(a1 + 32), "sessionActivity");
  v6 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v6, &state);

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v7 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_3_cold_1(a2, v7);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_6;
  block[3] = &unk_24CC65268;
  v14 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v9;
  v10 = v5;
  dispatch_async(v8, block);

  os_activity_scope_leave(&state);
}

uint64_t __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 48))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v13 = (void *)qword_253D84AB8;
    if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 32);
      v15 = v13;
      _SYObfuscate(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v16;
      _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_DEFAULT, "Client failed to process incoming SyncAllObjects, returning error: %{public}@", (uint8_t *)&v18, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "setError:", *(_QWORD *)(a1 + 32));
    goto LABEL_17;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "state") != 12)
    return objc_msgSend(*(id *)(a1 + 40), "setState:", 9);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 40);
    v4 = v2;
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _SYObfuscate(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v6;
    _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "Error occurred while waiting for SyncAllObjects ingestion, will set error state: %{public}@", (uint8_t *)&v18, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SYErrorDomain")) & 1) == 0)
  {

    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 40), "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "code");

  if (v10 != -128)
  {
LABEL_17:
    v11 = *(void **)(a1 + 40);
    v12 = 5;
    return objc_msgSend(v11, "setState:", v12);
  }
  v11 = *(void **)(a1 + 40);
  v12 = 3;
  return objc_msgSend(v11, "setState:", v12);
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
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_allObjectsAsData, 0);
}

void __54__SYIncomingSyncAllObjectsSession__continueProcessing__block_invoke_3_cold_1(char a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = "NO";
  if ((a1 & 1) != 0)
    v2 = "YES";
  v3 = 136315138;
  v4 = v2;
  _os_log_debug_impl(&dword_211704000, a2, OS_LOG_TYPE_DEBUG, "Delegate callout complete: -syncSession:applyChanges:completion:, v1 allObjects, success = %s", (uint8_t *)&v3, 0xCu);
}

@end
