@implementation ANXPCTransactionManager

- (ANXPCTransactionManager)init
{
  ANXPCTransactionManager *v2;
  uint64_t v3;
  NSMutableDictionary *transactions;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ANXPCTransactionManager;
  v2 = -[ANXPCTransactionManager init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    transactions = v2->_transactions;
    v2->_transactions = (NSMutableDictionary *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.announce.transaction-manager.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__ANXPCTransactionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedManager;
}

void __40__ANXPCTransactionManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;

}

- (id)description
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  __CFString *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = &stru_24D370F00;
  -[ANXPCTransactionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__ANXPCTransactionManager_description__block_invoke;
  v6[3] = &unk_24D370688;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__ANXPCTransactionManager_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_overview");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)status
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ANXPCTransactionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__ANXPCTransactionManager_status__block_invoke;
  v6[3] = &unk_24D370688;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__ANXPCTransactionManager_status__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_currentStatus");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSArray)activeTransactions
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
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = (id)MEMORY[0x24BDBD1A8];
  -[ANXPCTransactionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__ANXPCTransactionManager_activeTransactions__block_invoke;
  v6[3] = &unk_24D370688;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __45__ANXPCTransactionManager_activeTransactions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)transaction:(id)a3 forEndpointUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(".%@"), v7);

  }
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

- (void)transaction:(id)a3 setActive:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[ANXPCTransactionManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ANXPCTransactionManager_transaction_setActive___block_invoke;
  block[3] = &unk_24D3706B0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __49__ANXPCTransactionManager_transaction_setActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transaction:setActive:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)transaction:(id)a3 setActiveForTimeInterval:(double)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a3;
  -[ANXPCTransactionManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ANXPCTransactionManager_transaction_setActiveForTimeInterval___block_invoke;
  block[3] = &unk_24D3706D8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __64__ANXPCTransactionManager_transaction_setActiveForTimeInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transaction:setActiveForTimeInterval:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

- (unint64_t)_currentStatus
{
  NSObject *v3;
  void *v4;
  unint64_t v5;

  -[ANXPCTransactionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[ANXPCTransactionManager transactions](self, "transactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (id)_overview
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ANXPCTransactionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("\n===== Active Transactions =====\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANXPCTransactionManager transactions](self, "transactions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v7);

  objc_msgSend(v4, "appendString:", CFSTR("\n==============================="));
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (void)_transaction:(id)a3 setActive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ANXPCTransactionManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v4)
  {
    -[ANXPCTransactionManager transactions](self, "transactions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      ANLogHandleXPCTransactionManager();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412546;
        v13 = &stru_24D370F00;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_2156FF000, v10, OS_LOG_TYPE_DEFAULT, "%@Request to set transaction active but already active: %@", (uint8_t *)&v12, 0x16u);
      }

    }
    else
    {
      v11 = -[ANXPCTransactionManager _createTransaction:](self, "_createTransaction:", v6);
    }

  }
  else
  {
    -[ANXPCTransactionManager _removeTransaction:](self, "_removeTransaction:", v6);
  }

}

- (void)_transaction:(id)a3 setActiveForTimeInterval:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ANXPCTransactionManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ANXPCTransactionManager transactions](self, "transactions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    ANLogHandleXPCTransactionManager();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = &stru_24D370F00;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_2156FF000, v10, OS_LOG_TYPE_DEFAULT, "%@Request to set transaction active but already active: %@", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(v9, "timer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "expiration");
      -[ANXPCTransactionManager _resetTimer:expiration:](self, "_resetTimer:expiration:", v11);
    }

  }
  else
  {
    -[ANXPCTransactionManager _createTransaction:expiration:](self, "_createTransaction:expiration:", v6, a4);
  }

}

- (id)_createTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  v5 = (void *)os_transaction_create();
  if (v5)
  {
    +[ANTransactionInfo infoWithTransaction:](ANTransactionInfo, "infoWithTransaction:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANXPCTransactionManager transactions](self, "transactions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", v6, v4);

  }
  else
  {
    v6 = 0;
  }
  ANLogHandleXPCTransactionManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("TRUE");
    v13 = 138412802;
    v14 = &stru_24D370F00;
    v15 = 2112;
    if (!v5)
      v9 = CFSTR("FALSE");
    v16 = v4;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_2156FF000, v8, OS_LOG_TYPE_DEFAULT, "%@Created Transaction %@: %@", (uint8_t *)&v13, 0x20u);
  }

  ANLogHandleXPCTransactionManager();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[ANXPCTransactionManager _overview](self, "_overview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = &stru_24D370F00;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_2156FF000, v10, OS_LOG_TYPE_DEFAULT, "%@%@", (uint8_t *)&v13, 0x16u);

  }
  return v6;
}

- (void)_createTransaction:(id)a3 expiration:(double)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ANXPCTransactionManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v7);

  ANLogHandleXPCTransactionManager();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v20 = &stru_24D370F00;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2156FF000, v10, OS_LOG_TYPE_DEFAULT, "%@Created Transaction Timer %@ for %@", buf, 0x20u);
    }

    -[ANXPCTransactionManager _createTransaction:](self, "_createTransaction:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v11)
    {
      -[NSObject setTimer:](v11, "setTimer:", v8);
      -[NSObject setExpiration:](v10, "setExpiration:", a4);
      objc_initWeak((id *)buf, self);
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __57__ANXPCTransactionManager__createTransaction_expiration___block_invoke;
      v16 = &unk_24D370700;
      objc_copyWeak(&v18, (id *)buf);
      v17 = v6;
      dispatch_source_set_event_handler(v8, &v13);
      -[ANXPCTransactionManager _startTimer:expiration:](self, "_startTimer:expiration:", v8, a4, v13, v14, v15, v16);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      ANLogHandleXPCTransactionManager();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v20 = &stru_24D370F00;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_2156FF000, v12, OS_LOG_TYPE_ERROR, "%@Failed to create transaction: %@", buf, 0x16u);
      }

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v20 = &stru_24D370F00;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2156FF000, v10, OS_LOG_TYPE_ERROR, "%@Failed to create timer for transaction. Transaction not created: %@", buf, 0x16u);
  }

}

void __57__ANXPCTransactionManager__createTransaction_expiration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeTransaction:", *(_QWORD *)(a1 + 32));

}

- (void)_removeTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ANXPCTransactionManager transactions](self, "transactions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[ANXPCTransactionManager _currentStatus](self, "_currentStatus");
    objc_msgSend(v6, "timer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[ANXPCTransactionManager _cancelTimer:](self, "_cancelTimer:", v8);
    -[ANXPCTransactionManager transactions](self, "transactions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v4);

    v10 = -[ANXPCTransactionManager _currentStatus](self, "_currentStatus");
    if (v7 == 1 && !v10)
    {
      ANLogHandleXPCTransactionManager();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412802;
        v17 = &stru_24D370F00;
        v18 = 2048;
        v19 = 1;
        v20 = 2048;
        v21 = 0;
        _os_log_impl(&dword_2156FF000, v11, OS_LOG_TYPE_DEFAULT, "%@Transaction Status: %lu -> %lu", (uint8_t *)&v16, 0x20u);
      }

    }
  }
  ANLogHandleXPCTransactionManager();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("TRUE");
    v16 = 138412802;
    v17 = &stru_24D370F00;
    v18 = 2112;
    v19 = (uint64_t)v4;
    if (!v6)
      v13 = CFSTR("FALSE");
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_2156FF000, v12, OS_LOG_TYPE_DEFAULT, "%@Removed Transaction %@: %@", (uint8_t *)&v16, 0x20u);
  }

  ANLogHandleXPCTransactionManager();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[ANXPCTransactionManager _overview](self, "_overview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = &stru_24D370F00;
    v18 = 2112;
    v19 = (uint64_t)v15;
    _os_log_impl(&dword_2156FF000, v14, OS_LOG_TYPE_DEFAULT, "%@%@", (uint8_t *)&v16, 0x16u);

  }
}

- (void)_startTimer:(id)a3 expiration:(double)a4
{
  NSObject *v5;
  NSObject *v6;
  double v7;
  dispatch_time_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  NSObject *v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ANLogHandleXPCTransactionManager();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = &stru_24D370F00;
    v11 = 2112;
    v12 = v5;
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_2156FF000, v6, OS_LOG_TYPE_DEFAULT, "%@Starting Transaction Timer (%@) for %f seconds", (uint8_t *)&v9, 0x20u);
  }

  v7 = a4 * 1000000000.0;
  v8 = dispatch_time(0, (uint64_t)v7);
  dispatch_source_set_timer(v5, v8, (unint64_t)v7, 0);
  dispatch_resume(v5);

}

- (void)_resetTimer:(id)a3 expiration:(double)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  ANLogHandleXPCTransactionManager();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = &stru_24D370F00;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2156FF000, v7, OS_LOG_TYPE_DEFAULT, "%@Restarting Transaction Timer %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_suspend(v6);
  -[ANXPCTransactionManager _startTimer:expiration:](self, "_startTimer:expiration:", v6, a4);

}

- (void)_cancelTimer:(id)a3
{
  dispatch_source_cancel((dispatch_source_t)a3);
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

@end
