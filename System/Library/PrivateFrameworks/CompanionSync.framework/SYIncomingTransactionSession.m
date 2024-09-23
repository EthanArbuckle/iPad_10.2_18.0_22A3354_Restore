@implementation SYIncomingTransactionSession

- (SYIncomingTransactionSession)initWithService:(id)a3 transaction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SYIncomingTransactionSession *v11;
  void *v12;
  uint64_t v13;
  id completion;
  NSObject *v15;
  os_activity_t v16;
  OS_os_activity *sessionActivity;
  SYIncomingTransactionSession *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SYIncomingTransactionSession;
  v11 = -[SYSession initWithService:](&v20, sel_initWithService_, v8);
  if (v11)
  {
    objc_msgSend(v9, "header");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timestamp");
    -[SYSession setBirthDate:](v11, "setBirthDate:");

    objc_storeStrong((id *)&v11->_message, a4);
    v13 = objc_msgSend(v10, "copy");
    completion = v11->_completion;
    v11->_completion = (id)v13;

    objc_msgSend(v8, "serviceActivity");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = _os_activity_create(&dword_211704000, "SYSession (v1 Delta Sync, Incoming)", v15, OS_ACTIVITY_FLAG_DEFAULT);

    sessionActivity = v11->_sessionActivity;
    v11->_sessionActivity = (OS_os_activity *)v16;

    v18 = v11;
  }

  return v11;
}

- (BOOL)isSending
{
  return 0;
}

- (BOOL)isResetSync
{
  return 0;
}

- (BOOL)wasCancelled
{
  return 0;
}

- (unint64_t)protocolVersion
{
  return 1;
}

- (void)_sendComplete
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SYSession targetQueue](self, "targetQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SYIncomingTransactionSession__sendComplete__block_invoke;
  block[3] = &unk_24CC65418;
  block[4] = self;
  dispatch_sync(v4, block);

  -[SYSession service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYSession error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionDidEnd:withError:", self, v6);

  -[SYIncomingTransactionSession didCompleteSession](self, "didCompleteSession");
}

void __45__SYIncomingTransactionSession__sendComplete__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:didEndWithError:", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncSession:didEndWithError:", v4, v5);

}

- (void)_sendCancelled
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;

  -[SYSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", -128, 0);
  -[SYSession targetQueue](self, "targetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SYIncomingTransactionSession__sendCancelled__block_invoke;
  block[3] = &unk_24CC652B8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v5, block);

  -[SYSession service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionDidEnd:withError:", self, v7);

  -[SYIncomingTransactionSession didCompleteSession](self, "didCompleteSession");
}

void __46__SYIncomingTransactionSession__sendCancelled__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_INFO, "Delegate: -syncSession:didEndWithError:", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncSession:didEndWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_sendChanges
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_211704000, v1, OS_LOG_TYPE_ERROR, "Unable to create an _SYLazyChangeArray object for %{public}@", (uint8_t *)&v4, 0xCu);

}

void __44__SYIncomingTransactionSession__sendChanges__block_invoke(uint64_t a1)
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
  v7 = __44__SYIncomingTransactionSession__sendChanges__block_invoke_2;
  v8 = &unk_24CC65290;
  v9 = v4;
  objc_msgSend(v3, "syncSession:applyChanges:completion:");

}

void __44__SYIncomingTransactionSession__sendChanges__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD block[5];
  id v11;
  char v12;
  os_activity_scope_state_s state;

  v5 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 208), &state);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v6 = qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEBUG))
    __44__SYIncomingTransactionSession__sendChanges__block_invoke_2_cold_1(a2, v6);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SYIncomingTransactionSession__sendChanges__block_invoke_5;
  block[3] = &unk_24CC65268;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = a2;
  block[4] = v8;
  v11 = v5;
  v9 = v5;
  dispatch_async(v7, block);

  os_activity_scope_leave(&state);
}

void __44__SYIncomingTransactionSession__sendChanges__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 208), &v12);
  if (!*(_BYTE *)(a1 + 48))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v10 = (id)qword_253D84AB8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      _SYObfuscate(*(void **)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v11;
      _os_log_impl(&dword_211704000, v10, OS_LOG_TYPE_DEFAULT, "Client failed to process incoming SYChangeMessage, returning error: %{public}@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setError:", *(_QWORD *)(a1 + 40));
    goto LABEL_17;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "state") != 12)
  {
    v9 = 9;
    goto LABEL_18;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v2 = (id)qword_253D84AB8;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _SYObfuscate(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl(&dword_211704000, v2, OS_LOG_TYPE_DEFAULT, "An error occurred while client was processing: %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SYErrorDomain")) & 1) == 0)
  {

    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "code") == -128;

  if (!v8)
  {
LABEL_17:
    v9 = 5;
    goto LABEL_18;
  }
  v9 = 3;
LABEL_18:
  objc_msgSend(*(id *)(a1 + 32), "setState:", v9);
  objc_msgSend(*(id *)(a1 + 32), "_sendComplete");
  os_activity_scope_leave(&v12);
}

- (void)start:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  -[SYSession didStartSession](self, "didStartSession");
  -[SYSession queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__SYIncomingTransactionSession_start___block_invoke;
  v7[3] = &unk_24CC657F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  os_activity_scope_leave(&state);
}

void __38__SYIncomingTransactionSession_start___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  os_activity_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD block[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "didStartSession");
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[27] || !v2[28])
  {
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2013, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setError:", v22);
    objc_msgSend(*(id *)(a1 + 32), "_sendComplete");

    return;
  }
  objc_msgSend(v2, "serializer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "serializer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
    {
      v15 = objc_alloc(MEMORY[0x24BDD1540]);
      v29[0] = CFSTR("SYDelegateProtocolName");
      NSStringFromProtocol((Protocol *)&unk_254AC3ED8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v16;
      v29[1] = CFSTR("SYDelegateMethodNames");
      NSStringFromSelector(sel_decodeChangeData_fromProtocolVersion_ofType_);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v17;
      NSStringFromSelector(sel_SYObjectWithData_);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v15, "initWithSYError:userInfo:", 2020, v20);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "setError:", v21);
      objc_msgSend(*(id *)(a1 + 32), "_sendComplete");

      return;
    }
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v6 = (void *)qword_253D84AB8;
  if (os_log_type_enabled((os_log_t)qword_253D84AB8, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    v26 = 2114;
    v27 = v10;
    _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_DEFAULT, "Starting %{public}@ with identifier %{public}@", buf, 0x16u);

  }
  v11 = _os_activity_create(&dword_211704000, "SYSession (v1 Delta Sync, Incoming)", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DETACHED);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 208);
  *(_QWORD *)(v12 + 208) = v11;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SYIncomingTransactionSession_start___block_invoke_70;
  block[3] = &unk_24CC65418;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v14, block);

}

uint64_t __38__SYIncomingTransactionSession_start___block_invoke_70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendChanges");
}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  if (-[SYIncomingTransactionSession state](self, "state") != 11)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("SYErrorDomain")))
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == -128)
      {
        -[SYIncomingTransactionSession setState:](self, "setState:", 3);
        -[SYSession queue](self, "queue");
        v7 = objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __48__SYIncomingTransactionSession_cancelWithError___block_invoke;
        v10[3] = &unk_24CC65418;
        v10[4] = self;
        v8 = v10;
LABEL_8:
        dispatch_async(v7, v8);

        goto LABEL_9;
      }
    }
    else
    {

    }
    -[SYSession setError:](self, "setError:", v4);
    -[SYIncomingTransactionSession setState:](self, "setState:", 5);
    -[SYSession queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__SYIncomingTransactionSession_cancelWithError___block_invoke_2;
    v9[3] = &unk_24CC65418;
    v9[4] = self;
    v8 = v9;
    goto LABEL_8;
  }
  -[SYIncomingTransactionSession setState:](self, "setState:", 12);
  -[SYSession setError:](self, "setError:", v4);
LABEL_9:
  os_activity_scope_leave(&state);

}

uint64_t __48__SYIncomingTransactionSession_cancelWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCancelled");
}

uint64_t __48__SYIncomingTransactionSession_cancelWithError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendComplete");
}

- (void)didCompleteSession
{
  void (**completion)(id, _QWORD, void *);
  void *v4;
  objc_super v5;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_sessionActivity, &state);
  v5.receiver = self;
  v5.super_class = (Class)SYIncomingTransactionSession;
  -[SYSession didCompleteSession](&v5, sel_didCompleteSession);
  completion = (void (**)(id, _QWORD, void *))self->_completion;
  if (completion)
  {
    -[SYSession wrappedUserContext](self, "wrappedUserContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    completion[2](completion, 0, v4);

  }
  os_activity_scope_leave(&state);
}

- (unsigned)state
{
  return self->state;
}

- (void)setState:(unsigned int)a3
{
  self->state = a3;
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
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_sessionActivity, 0);
}

void __44__SYIncomingTransactionSession__sendChanges__block_invoke_2_cold_1(char a1, NSObject *a2)
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
  _os_log_debug_impl(&dword_211704000, a2, OS_LOG_TYPE_DEBUG, "Delegate callout complete: -syncSession:applyChanges:completion:, v1 transaction, success = %s", (uint8_t *)&v3, 0xCu);
}

@end
