@implementation ULTransactionManager

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__ULTransactionManager_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_ul_once_token_4 != -1)
    dispatch_once(&shared_ul_once_token_4, block);
  return (id)shared_ul_once_object_4;
}

void __30__ULTransactionManager_shared__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared_ul_once_object_4;
  shared_ul_once_object_4 = (uint64_t)v1;

}

- (ULTransactionManager)init
{
  ULTransactionManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ULTransactionManager;
  v2 = -[ULTransactionManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.milod.ULTransactionManager", v3);
    -[ULTransactionManager setQueue:](v2, "setQueue:", v4);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULTransactionManager setTransactions:](v2, "setTransactions:", v5);

  }
  return v2;
}

- (void)beginTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  ULTransactionManager *v10;

  v4 = a3;
  -[ULTransactionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ULTransactionManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ULTransactionManager_beginTransaction___block_invoke;
  block[3] = &unk_2511D2CA8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __41__ULTransactionManager_beginTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(*(id *)(a1 + 40), "transactions"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        !v3))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_64);
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "beginTransaction for identifier: %@", (uint8_t *)&v10, 0xCu);
    }
    objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    v8 = (void *)os_transaction_create();
    objc_msgSend(*(id *)(a1 + 40), "transactions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_64);
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_ERROR, "beginTransaction: transaction exists: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)endTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  ULTransactionManager *v10;

  v4 = a3;
  -[ULTransactionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ULTransactionManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ULTransactionManager_endTransaction___block_invoke;
  block[3] = &unk_2511D2CA8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __39__ULTransactionManager_endTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(*(id *)(a1 + 40), "transactions"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_64);
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "endTransaction for identifier: %@", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "transactions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_64);
    v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_ERROR, "endTransaction: transaction doesnt exist: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)performUnderTransaction:(id)a3 block:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  id v8;

  v6 = (void (**)(_QWORD))a4;
  v8 = a3;
  -[ULTransactionManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[ULTransactionManager beginTransaction:](self, "beginTransaction:", v8);
  v6[2](v6);

  -[ULTransactionManager endTransaction:](self, "endTransaction:", v8);
}

- (void)invalidateAllTransactions
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  ULTransactionManager *v9;

  -[ULTransactionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[ULTransactionManager dumpActiveTransactions](self, "dumpActiveTransactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULTransactionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ULTransactionManager_invalidateAllTransactions__block_invoke;
  block[3] = &unk_2511D2CA8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __49__ULTransactionManager_invalidateAllTransactions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_64);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2419D9000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating all transactions: %@", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "transactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (id)dumpActiveTransactions
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ULTransactionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10;
  v12 = __Block_byref_object_dispose__10;
  v13 = 0;
  -[ULTransactionManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__ULTransactionManager_dumpActiveTransactions__block_invoke;
  v7[3] = &unk_2511D2E30;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __46__ULTransactionManager_dumpActiveTransactions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_transactions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
