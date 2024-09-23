@implementation MGRemoteQueryServerClient

- (MGRemoteQueryServerClient)initWithPeer:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  MGRemoteQueryServerClient *v12;
  MGRemoteQueryServerClient *v13;
  NSArray *v14;
  NSArray *transactions;
  NSObject *v16;
  _QWORD block[4];
  MGRemoteQueryServerClient *v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MGRemoteQueryServerClient;
  v12 = -[MGRemoteQueryServerClient init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_transactionsLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeStrong((id *)&v13->_dispatchQueue, a5);
    objc_storeStrong((id *)&v13->_peer, a3);
    v14 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    transactions = v13->_transactions;
    v13->_transactions = v14;

    v13->_invalidated = 0;
    v13->_timeout = 900;
    -[MGRemoteQueryServerClient dispatchQueue](v13, "dispatchQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__MGRemoteQueryServerClient_initWithPeer_delegate_dispatchQueue___block_invoke;
    block[3] = &unk_24E0AA4F8;
    v19 = v13;
    dispatch_async(v16, block);

  }
  return v13;
}

uint64_t __65__MGRemoteQueryServerClient_initWithPeer_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timerInit");
}

- (void)dealloc
{
  objc_super v3;

  -[MGRemoteQueryServerClient _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryServerClient;
  -[MGRemoteQueryServerClient dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGRemoteQueryServerClient peer](self, "peer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _peer = %@, _transactions = %lu>"), v5, self, v6, -[MGRemoteQueryServerClient transactionCount](self, "transactionCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)addNewConnection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__MGRemoteQueryServerClient_addNewConnection_completion___block_invoke;
  block[3] = &unk_24E0AAB88;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __57__MGRemoteQueryServerClient_addNewConnection_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "invalidated") & 1) != 0)
  {
    v8[3] = 3;
  }
  else
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __57__MGRemoteQueryServerClient_addNewConnection_completion___block_invoke_2;
    v3[3] = &unk_24E0AA610;
    v2 = *(void **)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    v5 = v2;
    v6 = &v7;
    objc_msgSend(v4, "_withTransactionsLock:", v3);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _Block_object_dispose(&v7, 8);
}

void __57__MGRemoteQueryServerClient_addNewConnection_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 > 0xE)
  {
    MGLogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 134218242;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_error_impl(&dword_21CBD2000, v5, OS_LOG_TYPE_ERROR, "%p server client concurrency rejecting %@", (uint8_t *)&v8, 0x16u);
    }

    v4 = 2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_transactionAdd:", *(_QWORD *)(a1 + 40));
    v4 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
}

- (unint64_t)transactionCount
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__MGRemoteQueryServerClient_transactionCount__block_invoke;
  v4[3] = &unk_24E0AA728;
  v4[4] = self;
  v4[5] = &v5;
  -[MGRemoteQueryServerClient _withTransactionsLock:](self, "_withTransactionsLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __45__MGRemoteQueryServerClient_transactionCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (void)_invalidate
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  MGRemoteQueryServerClient *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!-[MGRemoteQueryServerClient invalidated](self, "invalidated"))
  {
    MGLogForCategory(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v6 = self;
      _os_log_impl(&dword_21CBD2000, v3, OS_LOG_TYPE_DEFAULT, "%p server client invalidating", buf, 0xCu);
    }

    -[MGRemoteQueryServerClient setInvalidated:](self, "setInvalidated:", 1);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __40__MGRemoteQueryServerClient__invalidate__block_invoke;
    v4[3] = &unk_24E0AA4F8;
    v4[4] = self;
    -[MGRemoteQueryServerClient _withTransactionsLock:](self, "_withTransactionsLock:", v4);
    -[MGRemoteQueryServerClient _timerCancel](self, "_timerCancel");
    -[MGRemoteQueryServerClient _invalidated](self, "_invalidated");
  }
}

void __40__MGRemoteQueryServerClient__invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTransactions:", v2);

}

- (void)_transactionAdd:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  unint64_t v9;
  MGRemoteQueryServerTransaction *v10;
  void *v11;
  MGRemoteQueryServerTransaction *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  MGRemoteQueryServerClient *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  MGRemoteQueryServerTransaction *v21;
  __int16 v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_assert_owner(&self->_transactionsLock);
  if (-[MGRemoteQueryServerClient invalidated](self, "invalidated"))
  {
    MGLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v16 = 134218242;
      v17 = self;
      v18 = 2112;
      v19 = (uint64_t)v4;
      v7 = "%p server client invalidated, not adding %@";
LABEL_12:
      _os_log_error_impl(&dword_21CBD2000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v16, 0x16u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  -[MGRemoteQueryServerClient transactions](self, "transactions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 0xF)
  {
    MGLogForCategory(5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v16 = 134218242;
      v17 = self;
      v18 = 2112;
      v19 = (uint64_t)v4;
      v7 = "%p server client exceeded limit, not adding %@";
      goto LABEL_12;
    }
LABEL_6:

    nw_connection_cancel(v4);
    goto LABEL_10;
  }
  v10 = [MGRemoteQueryServerTransaction alloc];
  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MGRemoteQueryServerTransaction initWithConnection:delegate:dispatchQueue:](v10, "initWithConnection:delegate:dispatchQueue:", v4, self, v11);

  -[MGRemoteQueryServerClient transactions](self, "transactions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MGRemoteQueryServerClient setTransactions:](self, "setTransactions:", v14);
  MGLogForCategory(5);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = 134218754;
    v17 = self;
    v18 = 2048;
    v19 = objc_msgSend(v14, "count");
    v20 = 2048;
    v21 = v12;
    v22 = 2112;
    v23 = v4;
    _os_log_debug_impl(&dword_21CBD2000, v15, OS_LOG_TYPE_DEBUG, "%p server client now %lu transactions after adding %p with connection %@", (uint8_t *)&v16, 0x2Au);
  }

LABEL_10:
}

- (void)_transactionRemove:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  MGRemoteQueryServerClient *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__MGRemoteQueryServerClient__transactionRemove___block_invoke;
  v9[3] = &unk_24E0AA610;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[MGRemoteQueryServerClient _withTransactionsLock:](self, "_withTransactionsLock:", v9);
  MGLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = v13[3];
    *(_DWORD *)buf = 134218496;
    v17 = self;
    v18 = 2048;
    v19 = v8;
    v20 = 2048;
    v21 = v6;
    _os_log_debug_impl(&dword_21CBD2000, v7, OS_LOG_TYPE_DEBUG, "%p server client now %lu transactions after removing %p", buf, 0x20u);
  }

  -[MGRemoteQueryServerClient _delegateNotifyLostTransaction](self, "_delegateNotifyLostTransaction");
  if (!v13[3])
    -[MGRemoteQueryServerClient _invalidate](self, "_invalidate");

  _Block_object_dispose(&v12, 8);
}

void __48__MGRemoteQueryServerClient__transactionRemove___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setTransactions:", v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "count");

}

- (BOOL)_transactionExists:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__MGRemoteQueryServerClient__transactionExists___block_invoke;
  v8[3] = &unk_24E0AA660;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[MGRemoteQueryServerClient _withTransactionsLock:](self, "_withTransactionsLock:", v8);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __48__MGRemoteQueryServerClient__transactionExists___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (void)_timerInit
{
  NSObject *v3;
  NSObject *v4;
  dispatch_source_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v4);

  objc_storeStrong((id *)&self->_timeoutTimer, v5);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __39__MGRemoteQueryServerClient__timerInit__block_invoke;
  v9 = &unk_24E0AA750;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v5, &v6);
  -[MGRemoteQueryServerClient _timerReschedule](self, "_timerReschedule", v6, v7, v8, v9);
  dispatch_resume(v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __39__MGRemoteQueryServerClient__timerInit__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_timerFired");
    WeakRetained = v2;
  }

}

- (void)_timerReschedule
{
  NSObject *v3;
  unint64_t v4;
  dispatch_time_t v5;
  NSObject *source;

  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[MGRemoteQueryServerClient invalidated](self, "invalidated"))
  {
    v4 = -[MGRemoteQueryServerClient timeout](self, "timeout");
    -[MGRemoteQueryServerClient timeoutTimer](self, "timeoutTimer");
    source = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_walltime(0, 1000000000 * v4 + 60000000000);
    dispatch_source_set_timer(source, v5, 0xFFFFFFFFFFFFFFFFLL, 0);

  }
}

- (void)_timerCancel
{
  NSObject *v2;
  NSObject *v3;

  -[MGRemoteQueryServerClient timeoutTimer](self, "timeoutTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v2);
    v2 = v3;
  }

}

- (void)_timerFired
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  MGRemoteQueryServerClient *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[MGRemoteQueryServerClient invalidated](self, "invalidated"))
  {
    MGLogForCategory(5);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[MGRemoteQueryServerClient peer](self, "peer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 134218242;
      v7 = self;
      v8 = 2112;
      v9 = v5;
      _os_log_error_impl(&dword_21CBD2000, v4, OS_LOG_TYPE_ERROR, "%p watchdog fired, terminating communication with peer %@", (uint8_t *)&v6, 0x16u);

    }
    -[MGRemoteQueryServerClient _invalidate](self, "_invalidate");
  }
}

- (void)_delegateNotifyLostTransaction
{
  void *v3;
  id v4;

  -[MGRemoteQueryServerClient delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "clientLostTransaction:", self);
    v3 = v4;
  }

}

- (void)_delegateNotifyInvalidated
{
  void *v3;
  id v4;

  -[MGRemoteQueryServerClient delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "clientInvalidated:", self);
    v3 = v4;
  }

}

- (void)_withTransactionsLock:(id)a3
{
  os_unfair_lock_s *p_transactionsLock;
  void (**v4)(_QWORD);

  p_transactionsLock = &self->_transactionsLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_transactionsLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_transactionsLock);
}

- (void)transaction:(id)a3 receivedTimeoutInterval:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__MGRemoteQueryServerClient_transaction_receivedTimeoutInterval___block_invoke;
  block[3] = &unk_24E0AABB0;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __65__MGRemoteQueryServerClient_transaction_receivedTimeoutInterval___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(result + 48))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "timeout");
    if (result != *(_QWORD *)(v1 + 48))
    {
      result = objc_msgSend(*(id *)(v1 + 32), "_transactionExists:", *(_QWORD *)(v1 + 40));
      if ((_DWORD)result)
      {
        MGLogForCategory(5);
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        {
          v3 = *(void **)(v1 + 32);
          v4 = *(_QWORD *)(v1 + 48);
          v5 = objc_msgSend(v3, "timeout");
          v6 = *(_QWORD *)(v1 + 40);
          objc_msgSend(*(id *)(v1 + 32), "peer");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 134219010;
          v9 = v3;
          v10 = 2048;
          v11 = v4;
          v12 = 2048;
          v13 = v5;
          v14 = 2048;
          v15 = v6;
          v16 = 2112;
          v17 = v7;
          _os_log_debug_impl(&dword_21CBD2000, v2, OS_LOG_TYPE_DEBUG, "%p updating timeout interval to %lu from %lu via %p for %@", (uint8_t *)&v8, 0x34u);

        }
        objc_msgSend(*(id *)(v1 + 32), "setTimeout:", *(_QWORD *)(v1 + 48));
        return objc_msgSend(*(id *)(v1 + 32), "_timerReschedule");
      }
    }
  }
  return result;
}

- (void)transactionActivityOccurred:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__MGRemoteQueryServerClient_transactionActivityOccurred___block_invoke;
  v7[3] = &unk_24E0AA5E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__MGRemoteQueryServerClient_transactionActivityOccurred___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_transactionExists:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_timerReschedule");
  return result;
}

- (void)transactionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MGRemoteQueryServerClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__MGRemoteQueryServerClient_transactionInvalidated___block_invoke;
  v7[3] = &unk_24E0AA5E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__MGRemoteQueryServerClient_transactionInvalidated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transactionRemove:", *(_QWORD *)(a1 + 40));
}

- (NSArray)transactions
{
  os_unfair_lock_assert_owner(&self->_transactionsLock);
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
  NSArray *v5;
  NSArray **p_transactions;
  NSArray *transactions;
  char v8;
  NSArray *v9;

  v9 = (NSArray *)a3;
  os_unfair_lock_assert_owner(&self->_transactionsLock);
  v5 = v9;
  transactions = self->_transactions;
  p_transactions = &self->_transactions;
  if (transactions != v9)
  {
    v8 = -[NSArray isEqual:](v9, "isEqual:");
    v5 = v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)p_transactions, a3);
      v5 = v9;
    }
  }

}

- (MGRemoteQueryServerClientDelegate)delegate
{
  return (MGRemoteQueryServerClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_nw_endpoint)peer
{
  return self->_peer;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactions, 0);
}

@end
