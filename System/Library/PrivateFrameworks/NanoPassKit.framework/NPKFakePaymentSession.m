@implementation NPKFakePaymentSession

- (NPKFakePaymentSession)initWithQueue:(id)a3
{
  id v4;
  NPKFakePaymentSession *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *ourInternalQueue;
  NSObject *v8;
  _QWORD v10[4];
  NPKFakePaymentSession *v11;
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPKFakePaymentSession;
  v5 = -[NPKFakePaymentSession init](&v13, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("FakePaymentSessionInternal", 0);
    ourInternalQueue = v5->_ourInternalQueue;
    v5->_ourInternalQueue = (OS_dispatch_queue *)v6;

    v8 = v5->_ourInternalQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__NPKFakePaymentSession_initWithQueue___block_invoke;
    v10[3] = &unk_24CFE7E40;
    v11 = v5;
    v12 = v4;
    dispatch_sync(v8, v10);

  }
  return v5;
}

void __39__NPKFakePaymentSession_initWithQueue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  dispatch_source_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  int out_token;
  _QWORD handler[4];
  id v18;
  id location;

  v2 = *(void **)(a1 + 40);
  v3 = v2;
  if (!v2)
  {
    v3 = (void *)MEMORY[0x24BDAC9B8];
    v4 = MEMORY[0x24BDAC9B8];
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), v3);
  if (!v2)

  if ((NPKIsRunningInStoreDemoMode() & 1) == 0)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE6EB20]);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 184);
    *(_QWORD *)(v6 + 184) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "registerObserver:");
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v8);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 176);
  *(_QWORD *)(v10 + 176) = v9;

  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 176);
  v13 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __39__NPKFakePaymentSession_initWithQueue___block_invoke_2;
  handler[3] = &unk_24CFE7970;
  objc_copyWeak(&v18, &location);
  dispatch_source_set_event_handler(v12, handler);
  objc_msgSend(*(id *)(a1 + 32), "_setTimeoutTimer");
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 176));
  out_token = 0;
  v14[0] = v13;
  v14[1] = 3221225472;
  v14[2] = __39__NPKFakePaymentSession_initWithQueue___block_invoke_4;
  v14[3] = &unk_24CFE78F0;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch("com.apple.NPKFakePaymentSession.TransactionComplete", &out_token, v8, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __39__NPKFakePaymentSession_initWithQueue___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[21];
    block[1] = 3221225472;
    block[2] = __39__NPKFakePaymentSession_initWithQueue___block_invoke_3;
    block[3] = &unk_24CFE7998;
    v3 = WeakRetained;
    block[0] = MEMORY[0x24BDAC760];
    v5 = WeakRetained;
    dispatch_sync(v2, block);

    WeakRetained = v3;
  }

}

uint64_t __39__NPKFakePaymentSession_initWithQueue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTimeoutTimer");
}

void __39__NPKFakePaymentSession_initWithQueue___block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[21];
    block[1] = 3221225472;
    block[2] = __39__NPKFakePaymentSession_initWithQueue___block_invoke_5;
    block[3] = &unk_24CFE7998;
    v3 = WeakRetained;
    block[0] = MEMORY[0x24BDAC760];
    v5 = WeakRetained;
    dispatch_sync(v2, block);

    WeakRetained = v3;
  }

}

uint64_t __39__NPKFakePaymentSession_initWithQueue___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTransactionCompleteDarwinNotification");
}

- (BOOL)startSession
{
  return 1;
}

- (BOOL)sessionStarted
{
  return !-[NPKFakePaymentSession invalidated](self, "invalidated");
}

- (void)dealloc
{
  objc_super v3;

  -[PKFieldDetector unregisterObserver:](self->_fieldDetector, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)NPKFakePaymentSession;
  -[NPKQuickPaymentSession dealloc](&v3, sel_dealloc);
}

- (void)setCurrentPass:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: setting current pass %@", buf, 0xCu);
    }

  }
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__NPKFakePaymentSession_setCurrentPass___block_invoke;
  v10[3] = &unk_24CFE7E40;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_sync(v8, v10);

}

void __40__NPKFakePaymentSession_setCurrentPass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setOurCurrentPass:", *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 32), "invalidated") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "ourCallbackQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x24BDAC760];
    v5 = 3221225472;
    v6 = __40__NPKFakePaymentSession_setCurrentPass___block_invoke_2;
    v7 = &unk_24CFE7E40;
    v3 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = v3;
    dispatch_async(v2, &v4);

    objc_msgSend(*(id *)(a1 + 32), "_scheduleDidActivateEventForPass:", *(_QWORD *)(a1 + 40), v4, v5, v6, v7, v8);
  }
}

void __40__NPKFakePaymentSession_setCurrentPass___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSession:didMakePassCurrent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentSession:willActivatePass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (id)currentPass
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__NPKFakePaymentSession_currentPass__block_invoke;
  v6[3] = &unk_24CFE8318;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __36__NPKFakePaymentSession_currentPass__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "ourCurrentPass");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setVasPasses:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: setting VAS passes %@", buf, 0xCu);
    }

  }
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__NPKFakePaymentSession_setVasPasses___block_invoke;
  v10[3] = &unk_24CFE7E40;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_sync(v8, v10);

}

uint64_t __38__NPKFakePaymentSession_setVasPasses___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOurVasPasses:", *(_QWORD *)(a1 + 40));
}

- (void)setCredential:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__NPKFakePaymentSession_setCredential___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __39__NPKFakePaymentSession_setCredential___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "ourCurrentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleSessionHasCredentialIfNecessaryWithCurrentPass:", v3);

  objc_msgSend(*(id *)(a1 + 32), "ourCallbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__NPKFakePaymentSession_setCredential___block_invoke_2;
  block[3] = &unk_24CFE7998;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, block);

}

void __39__NPKFakePaymentSession_setCredential___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSessionDidReceiveCredential:", *(_QWORD *)(a1 + 32));

  }
}

- (id)vasPasses
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__NPKFakePaymentSession_vasPasses__block_invoke;
  v6[3] = &unk_24CFE8318;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __34__NPKFakePaymentSession_vasPasses__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "ourVasPasses");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)deferAuthorization
{
  return 0;
}

- (void)setInServiceMode:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__NPKFakePaymentSession_setInServiceMode___block_invoke;
  v6[3] = &unk_24CFE7D78;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

void __42__NPKFakePaymentSession_setInServiceMode___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "ourInServiceMode");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setOurInServiceMode:", v3 != 0);
    if ((objc_msgSend(*(id *)(a1 + 32), "invalidated") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "ourCurrentPass");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "ourCallbackQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x24BDAC760];
      v8 = 3221225472;
      v9 = __42__NPKFakePaymentSession_setInServiceMode___block_invoke_2;
      v10 = &unk_24CFE7E40;
      v11 = *(_QWORD *)(a1 + 32);
      v12 = v4;
      v6 = v4;
      dispatch_async(v5, &v7);

      objc_msgSend(*(id *)(a1 + 32), "_scheduleDidActivateEventForPass:", v6, v7, v8, v9, v10, v11);
    }
  }
}

void __42__NPKFakePaymentSession_setInServiceMode___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSession:didMakePassCurrent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentSession:willActivatePass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)inServiceMode
{
  NPKFakePaymentSession *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__NPKFakePaymentSession_inServiceMode__block_invoke;
  v5[3] = &unk_24CFE8318;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __38__NPKFakePaymentSession_inServiceMode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "ourInServiceMode");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)fieldDetectorDidEnterField:(id)a3 withProperties:(id)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: detected field", buf, 2u);
    }

  }
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NPKFakePaymentSession_fieldDetectorDidEnterField_withProperties___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_sync(v8, block);

}

uint64_t __67__NPKFakePaymentSession_fieldDetectorDidEnterField_withProperties___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidated");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_sendTransactionCompleteToDelegate");
  return result;
}

- (void)confirmSessionExpectingCredential:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__NPKFakePaymentSession_confirmSessionExpectingCredential___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __59__NPKFakePaymentSession_confirmSessionExpectingCredential___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "ourCurrentPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "ourConfirmed");
  objc_msgSend(*(id *)(a1 + 32), "setOurConfirmed:", 1);
  if ((v3 & 1) == 0)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138412290;
        v8 = v2;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: confirming session for pass %@", (uint8_t *)&v7, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "setOurConfirmed:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_handleSessionHasCredentialIfNecessaryWithCurrentPass:", v2);
  }

}

- (void)deactivateSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: deactivating session", buf, 2u);
    }

  }
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__NPKFakePaymentSession_deactivateSessionWithCompletion___block_invoke;
  v10[3] = &unk_24CFE7E90;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_sync(v8, v10);

}

void __57__NPKFakePaymentSession_deactivateSessionWithCompletion___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "invalidated");
  objc_msgSend(*(id *)(a1 + 32), "setInvalidated:", 1);
  objc_msgSend(*(id *)(a1 + 32), "ourCallbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__NPKFakePaymentSession_deactivateSessionWithCompletion___block_invoke_2;
  block[3] = &unk_24CFE87E0;
  v7 = v2;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, block);

}

uint64_t __57__NPKFakePaymentSession_deactivateSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t result;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "paymentSession:didCompleteTransactionForReason:withTransactionContext:shouldCleanupSession:", *(_QWORD *)(a1 + 32), 1, 0, 1);

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_scheduleDidActivateEventForPass:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v4 = a3;
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[NPKFakePaymentSession setChangeCardToken:](self, "setChangeCardToken:", -[NPKFakePaymentSession changeCardToken](self, "changeCardToken") + 1);
  v6 = -[NPKFakePaymentSession changeCardToken](self, "changeCardToken");
  v7 = dispatch_time(0, 500000000);
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__NPKFakePaymentSession__scheduleDidActivateEventForPass___block_invoke;
  block[3] = &unk_24CFE83A8;
  v11 = v4;
  v12 = v6;
  block[4] = self;
  v9 = v4;
  dispatch_after(v7, v8, block);

}

void __58__NPKFakePaymentSession__scheduleDidActivateEventForPass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == objc_msgSend(*(id *)(a1 + 32), "changeCardToken"))
  {
    objc_msgSend(*(id *)(a1 + 32), "ourCallbackQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__NPKFakePaymentSession__scheduleDidActivateEventForPass___block_invoke_2;
    v5[3] = &unk_24CFE7E40;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    dispatch_async(v3, v5);

  }
}

void __58__NPKFakePaymentSession__scheduleDidActivateEventForPass___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSession:didActivatePass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_setTimeoutTimer
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint8_t v9[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: setting timer", v9, 2u);
    }

  }
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[NPKFakePaymentSession timeoutTimer](self, "timeoutTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);

}

- (void)_handleTimeoutTimer
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: handling timeout", buf, 2u);
    }

  }
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!-[NPKFakePaymentSession invalidated](self, "invalidated"))
  {
    -[NPKFakePaymentSession ourCallbackQueue](self, "ourCallbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__NPKFakePaymentSession__handleTimeoutTimer__block_invoke;
    block[3] = &unk_24CFE7998;
    block[4] = self;
    dispatch_async(v7, block);

  }
}

void __44__NPKFakePaymentSession__handleTimeoutTimer__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSession:didCompleteTransactionForReason:withTransactionContext:shouldCleanupSession:", *(_QWORD *)(a1 + 32), 2, 0, 1);

  }
}

- (void)_handleTransactionCompleteDarwinNotification
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Fake payment session: Got transaction complete Darwin notification", v7, 2u);
    }

  }
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!-[NPKFakePaymentSession invalidated](self, "invalidated"))
    -[NPKFakePaymentSession _sendTransactionCompleteToDelegate](self, "_sendTransactionCompleteToDelegate");
}

- (void)_handleSessionHasCredentialIfNecessaryWithCurrentPass:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  NPKFakePaymentSession *v12;
  id v13;

  v4 = a3;
  -[NPKFakePaymentSession ourInternalQueue](self, "ourInternalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[NPKFakePaymentSession ourPerformedFirstActivation](self, "ourPerformedFirstActivation"))
  {
    -[NPKFakePaymentSession setOurPerformedFirstActivation:](self, "setOurPerformedFirstActivation:", 1);
    if (!-[NPKFakePaymentSession invalidated](self, "invalidated"))
    {
      -[NPKFakePaymentSession _setTimeoutTimer](self, "_setTimeoutTimer");
      -[NPKFakePaymentSession ourCallbackQueue](self, "ourCallbackQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x24BDAC760];
      v9 = 3221225472;
      v10 = __79__NPKFakePaymentSession__handleSessionHasCredentialIfNecessaryWithCurrentPass___block_invoke;
      v11 = &unk_24CFE7E40;
      v12 = self;
      v7 = v4;
      v13 = v7;
      dispatch_async(v6, &v8);

      -[NPKFakePaymentSession _scheduleDidActivateEventForPass:](self, "_scheduleDidActivateEventForPass:", v7, v8, v9, v10, v11, v12);
    }
  }

}

void __79__NPKFakePaymentSession__handleSessionHasCredentialIfNecessaryWithCurrentPass___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSession:willActivatePass:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_sendTransactionCompleteToDelegate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  -[NPKFakePaymentSession ourCurrentPass](self, "ourCurrentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x24BE6EAA0]);
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v4, "paymentPass");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "paymentPass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "npkPreferredContactlessPaymentApplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v7, "initWithPaymentPass:activatedPaymentApplications:", v8, v11);

      objc_msgSend(v12, "paymentPass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "npkPreferredContactlessPaymentApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPaymentApplication:", v14);

    }
    else
    {
      v12 = (void *)objc_msgSend(v6, "initWithPaymentPass:activatedPaymentApplications:", 0, 0);
      v19 = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValueAddedServicePasses:", v13);
    }

  }
  else
  {
    v12 = 0;
  }
  -[NPKFakePaymentSession ourCallbackQueue](self, "ourCallbackQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__NPKFakePaymentSession__sendTransactionCompleteToDelegate__block_invoke;
  block[3] = &unk_24CFE7E40;
  block[4] = self;
  v18 = v12;
  v16 = v12;
  dispatch_async(v15, block);

}

void __59__NPKFakePaymentSession__sendTransactionCompleteToDelegate__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "paymentSession:didCompleteTransactionForReason:withTransactionContext:shouldCleanupSession:", *(_QWORD *)(a1 + 32), 3, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "endSessionWhenAuthorizationIsConsumed"));

  }
}

- (PKPass)ourCurrentPass
{
  return self->_ourCurrentPass;
}

- (void)setOurCurrentPass:(id)a3
{
  objc_storeStrong((id *)&self->_ourCurrentPass, a3);
}

- (NSDictionary)ourVasPasses
{
  return self->_ourVasPasses;
}

- (void)setOurVasPasses:(id)a3
{
  objc_storeStrong((id *)&self->_ourVasPasses, a3);
}

- (OS_dispatch_queue)ourCallbackQueue
{
  return self->_ourCallbackQueue;
}

- (void)setOurCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ourCallbackQueue, a3);
}

- (OS_dispatch_queue)ourInternalQueue
{
  return self->_ourInternalQueue;
}

- (void)setOurInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ourInternalQueue, a3);
}

- (BOOL)ourConfirmed
{
  return self->_ourConfirmed;
}

- (void)setOurConfirmed:(BOOL)a3
{
  self->_ourConfirmed = a3;
}

- (BOOL)ourInServiceMode
{
  return self->_ourInServiceMode;
}

- (void)setOurInServiceMode:(BOOL)a3
{
  self->_ourInServiceMode = a3;
}

- (BOOL)ourPerformedFirstActivation
{
  return self->_ourPerformedFirstActivation;
}

- (void)setOurPerformedFirstActivation:(BOOL)a3
{
  self->_ourPerformedFirstActivation = a3;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimer, a3);
}

- (PKFieldDetector)fieldDetector
{
  return self->_fieldDetector;
}

- (void)setFieldDetector:(id)a3
{
  objc_storeStrong((id *)&self->_fieldDetector, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (unint64_t)changeCardToken
{
  return self->_changeCardToken;
}

- (void)setChangeCardToken:(unint64_t)a3
{
  self->_changeCardToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldDetector, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_ourInternalQueue, 0);
  objc_storeStrong((id *)&self->_ourCallbackQueue, 0);
  objc_storeStrong((id *)&self->_ourVasPasses, 0);
  objc_storeStrong((id *)&self->_ourCurrentPass, 0);
}

@end
