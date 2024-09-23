@implementation FBSOrientationObserver

- (FBSOrientationObserver)init
{
  FBSOrientationObserver *v2;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  uint64_t v5;
  OS_dispatch_queue *callback_queue;
  FBSOrientationObserverClient *v7;
  FBSOrientationObserverClient *client;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FBSOrientationObserver;
  v2 = -[FBSOrientationObserver init](&v10, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    v5 = BSDispatchQueueCreateSerial();
    callback_queue = v2->_callback_queue;
    v2->_callback_queue = (OS_dispatch_queue *)v5;

    v7 = -[FBSOrientationObserverClient initWithDelegate:calloutQueue:]([FBSOrientationObserverClient alloc], "initWithDelegate:calloutQueue:", v2, v2->_queue);
    client = v2->_client;
    v2->_client = v7;

    -[FBSServiceFacilityClient activate](v2->_client, "activate");
  }
  return v2;
}

void __67__FBSOrientationObserver_activeInterfaceOrientationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__FBSOrientationObserver_activeInterfaceOrientationWithCompletion___block_invoke_2;
  block[3] = &unk_1E38EB8D8;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

- (void)activeInterfaceOrientationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  FBSOrientationObserverClient *client;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    client = self->_client;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__FBSOrientationObserver_activeInterfaceOrientationWithCompletion___block_invoke;
    v7[3] = &unk_1E38EB900;
    v7[4] = self;
    v8 = v4;
    -[FBSOrientationObserverClient activeInterfaceOrientationWithCompletion:](client, "activeInterfaceOrientationWithCompletion:", v7);

  }
}

void *__37__FBSOrientationObserver_setHandler___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = *(void **)(a1 + 40);
  if (result != *(void **)(*(_QWORD *)(a1 + 32) + 32))
  {
    v3 = objc_msgSend(result, "copy");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v6 = *(_QWORD *)(a1 + 40);
    FBLogInterfaceOrientationObserver();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v12 = 134217984;
        *(_QWORD *)&v12[4] = v9;
        v10 = "<%p>: Registering interest for orientation updates.";
LABEL_7:
        _os_log_impl(&dword_19A6D4000, v7, OS_LOG_TYPE_DEFAULT, v10, v12, 0xCu);
      }
    }
    else if (v8)
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v12 = 134217984;
      *(_QWORD *)&v12[4] = v11;
      v10 = "<%p>: Unregistering interest for orientation updates.";
      goto LABEL_7;
    }

    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "registerOrientationInterest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) != 0, *(_OWORD *)v12);
  }
  return result;
}

- (void)handleOrientationResetForClient:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FBSOrientationObserver_handleOrientationResetForClient___block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)client:(id)a3 handleOrientationUpdate:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *callback_queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  FBSOrientationObserver *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  FBLogInterfaceOrientationObserver();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v12 = self;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_19A6D4000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Received orientation update: %{public}@.", buf, 0x16u);
  }

  callback_queue = self->_callback_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__FBSOrientationObserver_client_handleOrientationUpdate___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(callback_queue, v9);

}

void __62__FBSOrientationObserver__getAndSetFreshestUpdateGivenUpdate___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t *v3;
  id *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;

  v3 = a1 + 4;
  v2 = a1[4];
  v6 = *(void **)(v2 + 40);
  v4 = (id *)(v2 + 40);
  v5 = v6;
  if (v6)
  {
    v7 = objc_msgSend(v5, "sequenceNumber");
    if (v7 <= objc_msgSend((id)a1[5], "sequenceNumber"))
    {
      v9 = (void *)a1[5];
      v10 = *v3;
    }
    else
    {
      FBLogInterfaceOrientationObserver();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __62__FBSOrientationObserver__getAndSetFreshestUpdateGivenUpdate___block_invoke_cold_1(v3, a1 + 5, v8);

      v9 = *(void **)(a1[4] + 40);
      v10 = *(_QWORD *)(a1[6] + 8);
    }
    v4 = (id *)(v10 + 40);
  }
  else
  {
    v9 = (void *)a1[5];
  }
  objc_storeStrong(v4, v9);
}

void __58__FBSOrientationObserver_handleOrientationResetForClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __33__FBSOrientationObserver_handler__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __67__FBSOrientationObserver_activeInterfaceOrientationWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getAndSetFreshestUpdateGivenUpdate:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

void __57__FBSOrientationObserver_client_handleOrientationUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_getAndSetFreshestUpdateGivenUpdate:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v4);

}

- (id)_getAndSetFreshestUpdateGivenUpdate:(id)a3
{
  NSObject *queue;
  id v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__53;
  v15 = __Block_byref_object_dispose__54;
  v16 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__FBSOrientationObserver__getAndSetFreshestUpdateGivenUpdate___block_invoke;
  block[3] = &unk_1E38EB950;
  block[4] = self;
  v9 = v16;
  v10 = &v11;
  v5 = v16;
  dispatch_sync(queue, block);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)handler
{
  NSObject *queue;
  void *v3;
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
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__FBSOrientationObserver_handler__block_invoke;
  v5[3] = &unk_1E38EB928;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (void *)MEMORY[0x19AECA324](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__FBSOrientationObserver_setHandler___block_invoke;
  block[3] = &unk_1E38EB888;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)dealloc
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FBSOrientationObserver dealloc]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("FBSOrientationObserver.m");
  v7 = 1024;
  v8 = 95;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

- (void)invalidate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  FBSOrientationObserver *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  FBLogInterfaceOrientationObserver();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_19A6D4000, v3, OS_LOG_TYPE_DEFAULT, "%p: Invalidating client.", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__FBSOrientationObserver_invalidate__block_invoke;
  block[3] = &unk_1E38EAE78;
  block[4] = self;
  dispatch_async(queue, block);
  -[FBSOrientationObserver setHandler:](self, "setHandler:", 0);
}

uint64_t __36__FBSOrientationObserver_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

- (int64_t)activeInterfaceOrientation
{
  return -[FBSOrientationObserverClient activeInterfaceOrientation](self->_client, "activeInterfaceOrientation");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freshestUpdate, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_callback_queue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

void __62__FBSOrientationObserver__getAndSetFreshestUpdateGivenUpdate___block_invoke_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5 = *(_QWORD *)(*a1 + 40);
  v6 = 134218498;
  v7 = v3;
  v8 = 2114;
  v9 = v4;
  v10 = 2114;
  v11 = v5;
  _os_log_error_impl(&dword_19A6D4000, log, OS_LOG_TYPE_ERROR, "<%p> Received orientation update: %{public}@ with a sequence number less than the last update received %{public}@.", (uint8_t *)&v6, 0x20u);
}

@end
