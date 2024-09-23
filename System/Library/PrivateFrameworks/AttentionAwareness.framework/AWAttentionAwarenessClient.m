@implementation AWAttentionAwarenessClient

uint64_t __42__AWAttentionAwarenessClient_notifyEvent___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (AWAttentionAwarenessClient)init
{
  AWAttentionAwarenessClient *v2;
  AWAttentionAwarenessClient *v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  AWAttentionAwarenessConfiguration *v6;
  AWAttentionAwarenessConfiguration *configuration;
  uint64_t v8;
  NSUUID *clientId;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AWAttentionAwarenessClient;
  v2 = -[AWAttentionAwarenessClient init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_suspensionCount = 1;
    awQueue(0);
    v4 = objc_claimAutoreleasedReturnValue();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(AWAttentionAwarenessConfiguration);
    configuration = v3->_configuration;
    v3->_configuration = v6;

    v3->_clientIndex = -1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    clientId = v3->_clientId;
    v3->_clientId = (NSUUID *)v8;

  }
  return v3;
}

void __61__AWAttentionAwarenessClient_setEventHandlerWithQueue_block___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = dispatch_queue_create("com.apple.AttentionAwareness.clientEventQueue", 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 64);
    *(_QWORD *)(v3 + 64) = v2;

    dispatch_set_target_queue(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 64), *(dispatch_queue_t *)(a1 + 40));
    v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = v5;

  }
}

void __42__AWAttentionAwarenessClient_notifyEvent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "updateWithConfig:", *(_QWORD *)(v1 + 96));
    v3 = objc_msgSend(*(id *)(a1 + 40), "eventMask");
    v4 = v3 != 1;
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 72) && *(_QWORD *)(v5 + 64) && (v3 == 1 || !*(_BYTE *)(v5 + 112)))
    {
      v6 = (void *)MEMORY[0x1B5DF9110]();
      v7 = *(void **)(a1 + 40);
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __42__AWAttentionAwarenessClient_notifyEvent___block_invoke_2;
      v10[3] = &unk_1E5F8EB38;
      v12 = v6;
      v11 = v7;
      v9 = v6;
      dispatch_async(v8, v10);

      v5 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v5 + 112) = v4;
  }
}

void __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  char v7;
  NSObject *v8;
  unint64_t v9;
  double v10;
  uint64_t v11;
  _QWORD v12[5];
  char v13;
  id obj;
  uint8_t buf[4];
  double v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = v2;

    v5 = *(_QWORD **)(a1 + 32);
    if (v5[3])
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v6 + 40);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke_2;
      v12[3] = &unk_1E5F8E8C8;
      v12[4] = v5;
      v13 = *(_BYTE *)(a1 + 64);
      v7 = objc_msgSend(v5, "_invokeRequiringClient:error:block:", 1, &obj, v12);
      objc_storeStrong((id *)(v6 + 40), obj);
      if ((v7 & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      }
      else if (currentLogLevel >= 3)
      {
        _AALog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = absTimeNS();
          if (v9 == -1)
            v10 = INFINITY;
          else
            v10 = (double)v9 / 1000000000.0;
          v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)buf = 134218242;
          v16 = v10;
          v17 = 2112;
          v18 = v11;
          _os_log_error_impl(&dword_1AF589000, v8, OS_LOG_TYPE_ERROR, "%13.5f: setClientConfig failed: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

- (void)notifyEvent:(id)a3
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
  v7[2] = __42__AWAttentionAwarenessClient_notifyEvent___block_invoke;
  v7[3] = &unk_1E5F8EC40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setEventHandlerWithQueue:(id)a3 block:(id)a4
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
  if (!v6)
    __assert_rtn("-[AWAttentionAwarenessClient setEventHandlerWithQueue:block:]", "FrameworkClient.m", 248, "queue");
  if (!v7)
    __assert_rtn("-[AWAttentionAwarenessClient setEventHandlerWithQueue:block:]", "FrameworkClient.m", 249, "block");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AWAttentionAwarenessClient_setEventHandlerWithQueue_block___block_invoke;
  block[3] = &unk_1E5F8E9D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)setConfiguration:(id)a3 shouldReset:(BOOL)a4
{
  BOOL v4;
  id v5;
  id v6;

  v6 = 0;
  v4 = -[AWAttentionAwarenessClient setConfiguration:shouldReset:error:](self, "setConfiguration:shouldReset:error:", a3, a4, &v6);
  v5 = v6;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("setConfiguration failed: %@"), v5);

}

- (BOOL)setConfiguration:(id)a3 shouldReset:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  NSObject *queue;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  _QWORD block[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  BOOL v23;
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2138;
  v29 = __Block_byref_object_dispose__2139;
  v30 = 0;
  if (v8)
  {
    obj = 0;
    v10 = objc_msgSend(v8, "validateWithError:", &obj);
    objc_storeStrong(&v30, obj);
    if (v10)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke;
      block[3] = &unk_1E5F8E8F0;
      block[4] = self;
      v20 = v9;
      v21 = &v25;
      v23 = a4;
      v22 = &v31;
      dispatch_sync(queue, block);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36[0] = CFSTR(" NIL identifer not allowed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v26[5];
    v26[5] = v14;

  }
  if (a5)
  {
    v16 = (void *)v26[5];
    if (v16)
      *a5 = objc_retainAutorelease(v16);
  }
  v17 = *((_BYTE *)v32 + 24) != 0;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v17;
}

- (void)setConfiguration:(id)a3
{
  -[AWAttentionAwarenessClient setConfiguration:shouldReset:](self, "setConfiguration:shouldReset:", a3, 0);
}

- (AWAttentionAwarenessConfiguration)configuration
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2138;
  v10 = __Block_byref_object_dispose__2139;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AWAttentionAwarenessClient_configuration__block_invoke;
  v5[3] = &unk_1E5F8EAC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AWAttentionAwarenessConfiguration *)v3;
}

- (BOOL)_invokeRequiringClient:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  _BOOL4 v6;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  id v11;
  NSXPCProxyCreating *remoteClientProxy;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  unint64_t v23;
  double v24;
  unint64_t v25;
  double v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[4];
  double v43;
  __int16 v44;
  _QWORD v45[2];
  uint64_t v46;
  _QWORD v47[3];

  v6 = a3;
  v47[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v46 = *MEMORY[0x1E0CB2D50];
    v47[0] = CFSTR(" Client is already invalid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  if (!v6)
  {
    v8[2](v8, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__2138;
  v38 = __Block_byref_object_dispose__2139;
  v39 = 0;
  remoteClientProxy = self->_remoteClientProxy;
  if (remoteClientProxy)
  {
    v14 = (void *)*MEMORY[0x1E0CB28A8];
    v15 = 1;
    while (1)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __65__AWAttentionAwarenessClient__invokeRequiringClient_error_block___block_invoke;
      v33[3] = &unk_1E5F8E8A0;
      v33[4] = &v34;
      -[NSXPCProxyCreating synchronousRemoteObjectProxyWithErrorHandler:](remoteClientProxy, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v8)[2](v8, v16);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
      {

        goto LABEL_44;
      }
      v17 = (void *)v35[5];
      if (!v17)
        break;
      if (currentLogLevel >= 3)
      {
        _AALog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v23 = absTimeNS();
          if (v23 == -1)
            v24 = INFINITY;
          else
            v24 = (double)v23 / 1000000000.0;
          v27 = v35[5];
          *(_DWORD *)buf = 134218242;
          v43 = v24;
          v44 = 2112;
          v45[0] = v27;
          _os_log_error_impl(&dword_1AF589000, v18, OS_LOG_TYPE_ERROR, "%13.5f: XPC proxy error: %@", buf, 0x16u);
        }

        v17 = (void *)v35[5];
      }
      objc_msgSend(v17, "domain");
      v19 = objc_claimAutoreleasedReturnValue();
      if ((void *)v19 != v14)
      {
        v14 = (void *)v19;
LABEL_39:

        break;
      }
      if (objc_msgSend((id)v35[5], "code") != 4099)
        goto LABEL_39;

      if ((v15 & 1) == 0)
        break;
      -[AWAttentionAwarenessClient connect:](self, "connect:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (currentLogLevel >= 3)
      {
        _AALog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v25 = absTimeNS();
          if (v25 == -1)
            v26 = INFINITY;
          else
            v26 = (double)v25 / 1000000000.0;
          v28 = CFSTR("succeeded");
          if (v20)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed: %@"), v20);
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v28 = v32;
          }
          *(_DWORD *)buf = 134218498;
          v43 = v26;
          v44 = 1024;
          LODWORD(v45[0]) = 1;
          WORD2(v45[0]) = 2112;
          *(_QWORD *)((char *)v45 + 6) = v28;
          _os_log_error_impl(&dword_1AF589000, v21, OS_LOG_TYPE_ERROR, "%13.5f: XPC proxy invalid: reconnect %u %@", buf, 0x1Cu);
          if (v20)

        }
      }

      v22 = (void *)v35[5];
      v35[5] = 0;

      v15 = 0;
      remoteClientProxy = self->_remoteClientProxy;
      if (!remoteClientProxy)
        goto LABEL_35;
    }

    goto LABEL_41;
  }
LABEL_35:
  v29 = (void *)MEMORY[0x1E0CB35C8];
  v40 = *MEMORY[0x1E0CB2D50];
  v41 = CFSTR(" Not connected to server");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, v30);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_41:
    v31 = (void *)v35[5];
    if (v31)
      v11 = v31;
    else
      v11 = 0;
  }
LABEL_44:
  _Block_object_dispose(&v34, 8);

LABEL_3:
  if (a4)
LABEL_4:
    *a4 = objc_retainAutorelease(v11);
LABEL_5:

  return v11 == 0;
}

- (BOOL)invokeRequiringClient:(BOOL)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  void *v11;
  char v12;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2138;
  v23 = __Block_byref_object_dispose__2139;
  v24 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AWAttentionAwarenessClient_invokeRequiringClient_error_block___block_invoke;
  block[3] = &unk_1E5F8E918;
  v16 = &v25;
  v17 = &v19;
  block[4] = self;
  v18 = a3;
  v10 = v8;
  v15 = v10;
  dispatch_sync(queue, block);
  if (a4)
  {
    v11 = (void *)v20[5];
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  v12 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (AWAttentionEvent)lastEvent
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2138;
  v9 = __Block_byref_object_dispose__2139;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__AWAttentionAwarenessClient_lastEvent__block_invoke;
  v4[3] = &unk_1E5F8E968;
  v4[4] = self;
  v4[5] = &v5;
  -[AWAttentionAwarenessClient invokeRequiringClient:error:block:](self, "invokeRequiringClient:error:block:", 1, 0, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (AWAttentionEvent *)v2;
}

- (BOOL)resetAttentionLostTimeoutWithError:(id *)a3
{
  return -[AWAttentionAwarenessClient invokeRequiringClient:error:block:](self, "invokeRequiringClient:error:block:", 1, a3, &__block_literal_global_2164);
}

- (void)setNotificationHandlerWithQueue:(id)a3 block:(id)a4
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
  if (!v6)
    __assert_rtn("-[AWAttentionAwarenessClient setNotificationHandlerWithQueue:block:]", "FrameworkClient.m", 233, "queue");
  if (!v7)
    __assert_rtn("-[AWAttentionAwarenessClient setNotificationHandlerWithQueue:block:]", "FrameworkClient.m", 234, "block");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AWAttentionAwarenessClient_setNotificationHandlerWithQueue_block___block_invoke;
  block[3] = &unk_1E5F8E9D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)setEventStreamerWithQueue:(id)a3 block:(id)a4
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
  if (!v6)
    __assert_rtn("-[AWAttentionAwarenessClient setEventStreamerWithQueue:block:]", "FrameworkClient.m", 263, "queue");
  if (!v7)
    __assert_rtn("-[AWAttentionAwarenessClient setEventStreamerWithQueue:block:]", "FrameworkClient.m", 264, "block");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AWAttentionAwarenessClient_setEventStreamerWithQueue_block___block_invoke;
  block[3] = &unk_1E5F8E9D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (BOOL)pollForAttentionWithTimeout:(double)a3 queue:(id)a4 block:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  uint64_t v14;
  AWClientPollWaiter *v15;
  uint64_t v16;
  AWClientPollWaiter *v17;
  BOOL v18;
  NSObject *queue;
  void *v20;
  _QWORD block[5];
  AWClientPollWaiter *v23;
  _QWORD v24[5];
  AWClientPollWaiter *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (!v10)
    __assert_rtn("-[AWAttentionAwarenessClient pollForAttentionWithTimeout:queue:block:error:]", "FrameworkClient.m", 279, "queue");
  v12 = v11;
  if (!v11)
    __assert_rtn("-[AWAttentionAwarenessClient pollForAttentionWithTimeout:queue:block:error:]", "FrameworkClient.m", 280, "block");
  v13 = 3153600000.0;
  if (a3 <= 3153600000.0)
    v13 = a3;
  if (v13 > 1.84467441e19)
    v14 = -1;
  else
    v14 = (unint64_t)(v13 * 1000000000.0);
  if (v14 <= 0)
  {
    if (!a6)
    {
      v18 = 0;
      goto LABEL_17;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    v33[0] = CFSTR(" Timeout less than 0 is invalid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v17 = (AWClientPollWaiter *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 34, v17);
    v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = -[AWClientPollWaiter initWithClient:timeout:queue:block:]([AWClientPollWaiter alloc], "initWithClient:timeout:queue:block:", self, v14, v10, v11);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v16 = MEMORY[0x1E0C809B0];
    v31 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke;
    v24[3] = &unk_1E5F8E9F8;
    v24[4] = self;
    v17 = v15;
    v25 = v17;
    v26 = &v28;
    v27 = v14;
    v18 = -[AWAttentionAwarenessClient invokeRequiringClient:error:block:](self, "invokeRequiringClient:error:block:", 1, a6, v24);
    if (!v18)
    {
      if (*((_BYTE *)v29 + 24))
      {
        queue = self->_queue;
        block[0] = v16;
        block[1] = 3221225472;
        block[2] = __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke_3;
        block[3] = &unk_1E5F8EC40;
        block[4] = self;
        v23 = v17;
        dispatch_sync(queue, block);

      }
      -[AWClientPollWaiter invalidate](v17, "invalidate");
    }

    _Block_object_dispose(&v28, 8);
  }

LABEL_17:
  return v18;
}

- (BOOL)pollForAttentionWithTimeout:(double)a3 event:(id *)a4 error:(id *)a5
{
  dispatch_queue_t v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2138;
  v30 = __Block_byref_object_dispose__2139;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v9 = dispatch_queue_create("com.apple.AttentionAwareness.clientSynchronousPollQueue", 0);
  v10 = dispatch_semaphore_create(0);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __70__AWAttentionAwarenessClient_pollForAttentionWithTimeout_event_error___block_invoke;
  v18 = &unk_1E5F8EA20;
  v20 = &v26;
  v21 = &v22;
  v11 = v10;
  v19 = v11;
  if (!-[AWAttentionAwarenessClient pollForAttentionWithTimeout:queue:block:error:](self, "pollForAttentionWithTimeout:queue:block:error:", v9, &v15, a5, a3))goto LABEL_5;
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v23 + 24))
  {
    if (a5)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      v33[0] = CFSTR(" Polling was cancelled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1, v15, v16, v17, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 89, v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_5:
      LOBYTE(a5) = 0;
    }
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease((id)v27[5]);
    LOBYTE(a5) = 1;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return (char)a5;
}

- (BOOL)cancelPollForAttentionWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__AWAttentionAwarenessClient_cancelPollForAttentionWithError___block_invoke;
  v4[3] = &unk_1E5F8EA48;
  v4[4] = self;
  return -[AWAttentionAwarenessClient invokeRequiringClient:error:block:](self, "invokeRequiringClient:error:block:", 1, a3, v4);
}

- (id)connect:(BOOL)a3
{
  _QWORD v6[5];
  BOOL v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__AWAttentionAwarenessClient_connect___block_invoke;
  v6[3] = &unk_1E5F8EA98;
  v6[4] = self;
  v7 = a3;
  +[AWServiceManager invokeWithService:](AWServiceManager, "invokeWithService:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)startStream
{
  uint64_t v2;
  NSXPCProxyCreating *remoteClientProxy;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2138;
  v15 = __Block_byref_object_dispose__2139;
  v16 = 0;
  self->_eventDelivered = 0;
  v2 = MEMORY[0x1E0C809B0];
  remoteClientProxy = self->_remoteClientProxy;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__AWAttentionAwarenessClient_startStream__block_invoke;
  v10[3] = &unk_1E5F8E8A0;
  v10[4] = &v11;
  -[NSXPCProxyCreating synchronousRemoteObjectProxyWithErrorHandler:](remoteClientProxy, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = (void *)v12[5];
  if (!v6)
  {
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __41__AWAttentionAwarenessClient_startStream__block_invoke_2;
    v9[3] = &unk_1E5F8E8A0;
    v9[4] = &v11;
    objc_msgSend(v4, "streamFaceDetectEventsWithReply:", v9);
    v6 = (void *)v12[5];
  }
  v7 = v6;

  _Block_object_dispose(&v11, 8);
  return v7;
}

- (BOOL)resumeWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AWAttentionAwarenessClient_resumeWithError___block_invoke;
  v4[3] = &unk_1E5F8EA48;
  v4[4] = self;
  return -[AWAttentionAwarenessClient invokeRequiringClient:error:block:](self, "invokeRequiringClient:error:block:", 0, a3, v4);
}

- (BOOL)cancelFaceDetectStreamWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__AWAttentionAwarenessClient_cancelFaceDetectStreamWithError___block_invoke;
  v4[3] = &unk_1E5F8EA48;
  v4[4] = self;
  return -[AWAttentionAwarenessClient invokeRequiringClient:error:block:](self, "invokeRequiringClient:error:block:", 1, a3, v4);
}

- (BOOL)invalidateRemoteClientWithError:(id *)a3
{
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__AWAttentionAwarenessClient_invalidateRemoteClientWithError___block_invoke;
  v6[3] = &unk_1E5F8EA48;
  v6[4] = self;
  return -[AWAttentionAwarenessClient _invokeRequiringClient:error:block:](self, "_invokeRequiringClient:error:block:", 1, a3, v6);
}

- (BOOL)suspendWithError:(id *)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__AWAttentionAwarenessClient_suspendWithError___block_invoke;
  v4[3] = &unk_1E5F8EA48;
  v4[4] = self;
  return -[AWAttentionAwarenessClient invokeRequiringClient:error:block:](self, "invokeRequiringClient:error:block:", 0, a3, v4);
}

- (BOOL)invalidateWithError:(id *)a3
{
  NSObject *queue;
  void *v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2138;
  v13 = __Block_byref_object_dispose__2139;
  v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__AWAttentionAwarenessClient_invalidateWithError___block_invoke;
  v8[3] = &unk_1E5F8EAC0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(queue, v8);
  v5 = (void *)v10[5];
  if (a3 && v5)
  {
    *a3 = objc_retainAutorelease(v5);
    v5 = (void *)v10[5];
  }
  v6 = v5 == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)notify:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__AWAttentionAwarenessClient_notify___block_invoke;
  v4[3] = &unk_1E5F8EB10;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)notifyPollEventType:(unint64_t)a3 event:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AWAttentionAwarenessClient_notifyPollEventType_event___block_invoke;
  block[3] = &unk_1E5F8EB60;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)notifyStreamingEvent:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  double v7;
  void *v8;
  NSObject *queue;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (currentLogLevel >= 7)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      -[AWAttentionAwarenessConfiguration identifier](self->_configuration, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: Delivering event to client %@", buf, 0x16u);

    }
  }
  if (self->_clientStreamingBlock)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__AWAttentionAwarenessClient_notifyStreamingEvent___block_invoke;
    v10[3] = &unk_1E5F8EC40;
    v10[4] = self;
    v11 = v4;
    dispatch_async(queue, v10);

  }
}

- (void)setUnitTestMode:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AWAttentionAwarenessClient_setUnitTestMode___block_invoke;
  v4[3] = &unk_1E5F8EB88;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

- (id)unitTestSampler
{
  return +[AWUnitTestSampler sharedSampler](AWUnitTestSampler, "sharedSampler");
}

- (void)serviceInterrupted
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke;
  block[3] = &unk_1E5F8EC18;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_clientStreamingBlock, 0);
  objc_storeStrong((id *)&self->_clientStreamingQueue, 0);
  objc_storeStrong(&self->_clientEventBlock, 0);
  objc_storeStrong((id *)&self->_clientEventQueue, 0);
  objc_storeStrong(&self->_clientNotifBlock, 0);
  objc_storeStrong((id *)&self->_clientNotifQueue, 0);
  objc_storeStrong((id *)&self->_remoteClientProxy, 0);
  objc_storeStrong((id *)&self->_pollWaiter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke(uint64_t a1)
{
  char v2;
  id v3;
  NSObject *v4;
  unint64_t v5;
  double v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  double v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = *(id *)(a1 + 32);
  v10 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke_2;
  v8[3] = &unk_1E5F8EA48;
  v2 = objc_msgSend(v9, "_invokeRequiringClient:error:block:", 1, &v10, v8);
  v3 = v10;
  if ((v2 & 1) == 0 && currentLogLevel >= 3)
  {
    _AALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = absTimeNS();
      if (v5 == -1)
        v6 = INFINITY;
      else
        v6 = (double)v5 / 1000000000.0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v3;
      _os_log_error_impl(&dword_1AF589000, v4, OS_LOG_TYPE_ERROR, "%13.5f: XPC interruption: %@ failed to ping remote client: %@", buf, 0x20u);

    }
  }

}

id __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a2;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2138;
  v11 = __Block_byref_object_dispose__2139;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke_3;
  v6[3] = &unk_1E5F8EBB0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = &v7;
  objc_msgSend(v3, "pingWithReply:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__AWAttentionAwarenessClient_serviceInterrupted__block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v3;
  unint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
    __assert_rtn("-[AWAttentionAwarenessClient serviceInterrupted]_block_invoke_3", "FrameworkClient.m", 699, "alive");
  if (currentLogLevel >= 6)
  {
    _AALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = absTimeNS();
      if (v4 == -1)
        v5 = INFINITY;
      else
        v5 = (double)v4 / 1000000000.0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: %@ remote client is alive", (uint8_t *)&v10, 0x16u);

    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "continuousFaceDetectMode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "startStream");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

uint64_t __46__AWAttentionAwarenessClient_setUnitTestMode___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 105))
    *(_BYTE *)(v2 + 105) = v1;
  return result;
}

void __51__AWAttentionAwarenessClient_notifyStreamingEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    v2 = (void *)MEMORY[0x1B5DF9110]();
    v3 = *(void **)(a1 + 40);
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__AWAttentionAwarenessClient_notifyStreamingEvent___block_invoke_2;
    v6[3] = &unk_1E5F8EB38;
    v8 = v2;
    v7 = v3;
    v5 = v2;
    dispatch_async(v4, v6);

  }
}

uint64_t __51__AWAttentionAwarenessClient_notifyStreamingEvent___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __56__AWAttentionAwarenessClient_notifyPollEventType_event___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v1 = *(void **)(a1[4] + 16);
  if (v1)
  {
    v6 = v1;
    if (a1[6] == 1)
    {
      v3 = 1;
    }
    else
    {
      v4 = a1[4];
      v5 = *(void **)(v4 + 16);
      *(_QWORD *)(v4 + 16) = 0;

      v3 = a1[6];
    }
    objc_msgSend(v6, "notifyPollEventType:event:", v3, a1[5]);

  }
}

void __37__AWAttentionAwarenessClient_notify___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 40) && *(_QWORD *)(v1 + 56))
  {
    if (*(_QWORD *)(v1 + 48))
    {
      v3 = (void *)MEMORY[0x1B5DF9110]();
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __37__AWAttentionAwarenessClient_notify___block_invoke_2;
      v7[3] = &unk_1E5F8EAE8;
      v8 = v3;
      v9 = v4;
      v6 = v3;
      dispatch_async(v5, v7);

    }
  }
}

uint64_t __37__AWAttentionAwarenessClient_notify___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __50__AWAttentionAwarenessClient_invalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id obj;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    v3 = *(void **)(v1 + 48);
    *(_QWORD *)(v1 + 48) = 0;

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = 0;

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = 0;

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 72);
    *(_QWORD *)(v8 + 72) = 0;

    v10 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v10 + 32))
    {
      if (!objc_msgSend(*(id *)(v10 + 96), "continuousFaceDetectMode"))
      {
LABEL_6:
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
        return;
      }
      v10 = *(_QWORD *)(a1 + 32);
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v11 + 40);
    objc_msgSend((id)v10, "invalidateRemoteClientWithError:", &obj);
    objc_storeStrong((id *)(v11 + 40), obj);
    goto LABEL_6;
  }
}

id __47__AWAttentionAwarenessClient_suspendWithError___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v1 + 32) = v2 + 1;
  if (v2)
    return 0;
  v4 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v4, "invalidateRemoteClientWithError:", &v5);
  return v5;
}

uint64_t __62__AWAttentionAwarenessClient_invalidateRemoteClientWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;

  objc_msgSend(a2, "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 108) = -1;
  +[AWServiceManager removeObserver:](AWServiceManager, "removeObserver:", *(_QWORD *)(a1 + 32));
  return 0;
}

id __62__AWAttentionAwarenessClient_cancelFaceDetectStreamWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2138;
  v15 = __Block_byref_object_dispose__2139;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__AWAttentionAwarenessClient_cancelFaceDetectStreamWithError___block_invoke_2;
  v10[3] = &unk_1E5F8E8A0;
  v10[4] = &v11;
  objc_msgSend(v3, "cancelFaceDetectStreamWithReply:", v10);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = 0;

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __62__AWAttentionAwarenessClient_cancelFaceDetectStreamWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __46__AWAttentionAwarenessClient_resumeWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "continuousFaceDetectMode"))
  {
    if (a2)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "connect:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "startStream");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v9 = v4;

    return v9;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 32);
    if (v6)
    {
      v7 = v6 - 1;
      *(_QWORD *)(v5 + 32) = v7;
      if (v7)
      {
        return 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "connect:", 0);
        return (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2FE0];
      v14 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR(" Cannot resume client if it isn't already suspended");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 34, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }
  }
}

void __41__AWAttentionAwarenessClient_startStream__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __41__AWAttentionAwarenessClient_startStream__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __38__AWAttentionAwarenessClient_connect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v11;
  _QWORD v12[6];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2138;
  v18 = __Block_byref_object_dispose__2139;
  v19 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 96);
  v6 = *(unsigned int *)(v4 + 108);
  v7 = *(_QWORD *)(v4 + 120);
  v8 = *(unsigned __int8 *)(v4 + 105);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__AWAttentionAwarenessClient_connect___block_invoke_2;
  v12[3] = &unk_1E5F8EA70;
  v12[4] = v4;
  v12[5] = &v14;
  v13 = *(_BYTE *)(a1 + 40);
  LOBYTE(v11) = objc_msgSend(v5, "continuousFaceDetectMode");
  objc_msgSend(v3, "addClient:clientConfig:clientIndex:clientId:unitTestMode:reply:subscribeForStreamingEvents:", v4, v5, v6, v7, v8 != 0, v12, v11);
  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __38__AWAttentionAwarenessClient_connect___block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  id v8;
  id v9;
  char v10;
  NSObject *v11;
  unint64_t v12;
  double v13;
  int v14;
  double v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "continuousFaceDetectMode");
  if (v9 && (v10 & 1) != 0
    || (objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 108) = a3, v9))
  {
    if (currentLogLevel >= 3)
    {
      _AALog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = absTimeNS();
        if (v12 == -1)
          v13 = INFINITY;
        else
          v13 = (double)v12 / 1000000000.0;
        v14 = 134218242;
        v15 = v13;
        v16 = 2112;
        v17 = v9;
        _os_log_error_impl(&dword_1AF589000, v11, OS_LOG_TYPE_ERROR, "%13.5f: client resume failed: %@", (uint8_t *)&v14, 0x16u);
      }

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }
  else if (!*(_BYTE *)(a1 + 48))
  {
    +[AWServiceManager addObserver:](AWServiceManager, "addObserver:", *(_QWORD *)(a1 + 32));
  }

}

id __62__AWAttentionAwarenessClient_cancelPollForAttentionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v4)
  {
    objc_msgSend(v4, "cancel");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2138;
  v14 = __Block_byref_object_dispose__2139;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__AWAttentionAwarenessClient_cancelPollForAttentionWithError___block_invoke_2;
  v9[3] = &unk_1E5F8E8A0;
  v9[4] = &v10;
  objc_msgSend(v3, "pollWithTimeout:reply:", 0, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __62__AWAttentionAwarenessClient_cancelPollForAttentionWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __70__AWAttentionAwarenessClient_pollForAttentionWithTimeout_event_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;

  v6 = a3;
  if ((unint64_t)(a2 - 2) < 2)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
LABEL_6:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v6 = v7;
    goto LABEL_7;
  }
  if (a2 != 1)
  {
    v7 = v6;
    if (a2 == 4)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_6;
  }
LABEL_7:

}

id __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v4 + 16);
  v5 = (id *)(v4 + 16);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR(" Polling already going on");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 36, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_storeStrong(v5, *(id *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__2138;
    v17 = __Block_byref_object_dispose__2139;
    v18 = 0;
    v10 = *(_QWORD *)(a1 + 56);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke_2;
    v12[3] = &unk_1E5F8E8A0;
    v12[4] = &v13;
    objc_msgSend(v3, "pollWithTimeout:reply:", v10, v12);
    v9 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  return v9;
}

void __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 16);
  if (v3 == v2)
  {
    *(_QWORD *)(v1 + 16) = 0;

  }
}

void __76__AWAttentionAwarenessClient_pollForAttentionWithTimeout_queue_block_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __62__AWAttentionAwarenessClient_setEventStreamerWithQueue_block___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = dispatch_queue_create("com.apple.AttentionAwareness.clientStreamingQueue", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  dispatch_set_target_queue(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80), *(dispatch_queue_t *)(a1 + 40));
  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v5;

}

void __68__AWAttentionAwarenessClient_setNotificationHandlerWithQueue_block___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = dispatch_queue_create("com.apple.AttentionAwareness.clientNotificationQueue", 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v2;

    dispatch_set_target_queue(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 48), *(dispatch_queue_t *)(a1 + 40));
    v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;

  }
}

id __65__AWAttentionAwarenessClient_resetAttentionLostTimeoutWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2138;
  v10 = __Block_byref_object_dispose__2139;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__AWAttentionAwarenessClient_resetAttentionLostTimeoutWithError___block_invoke_2;
  v5[3] = &unk_1E5F8E8A0;
  v5[4] = &v6;
  objc_msgSend(v2, "resetAttentionLostTimerWithReply:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __65__AWAttentionAwarenessClient_resetAttentionLostTimeoutWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __39__AWAttentionAwarenessClient_lastEvent__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__AWAttentionAwarenessClient_lastEvent__block_invoke_2;
  v4[3] = &unk_1E5F8E940;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "getLastEvent:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "updateWithConfig:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  return 0;
}

void __39__AWAttentionAwarenessClient_lastEvent__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__AWAttentionAwarenessClient_invokeRequiringClient_error_block___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = *(unsigned __int8 *)(a1 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(*(id *)(a1 + 32), "_invokeRequiringClient:error:block:", v2, &obj, *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
}

void __65__AWAttentionAwarenessClient__invokeRequiringClient_error_block___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__AWAttentionAwarenessClient_configuration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2138;
  v13 = __Block_byref_object_dispose__2139;
  v14 = 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke_3;
  v8[3] = &unk_1E5F8E8A0;
  v8[4] = &v9;
  objc_msgSend(v3, "setClientConfig:shouldReset:reply:", v4, v5, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __65__AWAttentionAwarenessClient_setConfiguration_shouldReset_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)initialize
{
  +[AWClientPreferences initializePreferences](AWClientPreferences, "initializePreferences");
}

@end
