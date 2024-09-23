@implementation DATransactionMonitor

+ (id)sharedTransactionMonitor
{
  if (sharedTransactionMonitor_creationToken != -1)
    dispatch_once(&sharedTransactionMonitor_creationToken, &__block_literal_global_0);
  return (id)sharedTransactionMonitor_gDATransactionMonitor;
}

void __48__DATransactionMonitor_sharedTransactionMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedTransactionMonitor_gDATransactionMonitor;
  sharedTransactionMonitor_gDATransactionMonitor = v0;

}

- (DATransactionMonitor)init
{
  DATransactionMonitor *v2;
  DATransactionMonitor *v3;
  NSObject *v4;
  os_log_type_t v5;
  int transactionCount;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)DATransactionMonitor;
  v2 = -[DATransactionMonitor init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_transactionCount = 0;
    DALoggingwithCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
    if (os_log_type_enabled(v4, v5))
    {
      transactionCount = v3->_transactionCount;
      *(_DWORD *)buf = 67109120;
      v10 = transactionCount;
      _os_log_impl(&dword_1C1CD1000, v4, v5, "Transaction count is initialized to %d", buf, 8u);
    }

  }
  return v3;
}

- (void)incrementTransactionCountForTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (incrementTransactionCountForTransaction__onceToken != -1)
    dispatch_once(&incrementTransactionCountForTransaction__onceToken, &__block_literal_global_1);
  v5 = transactionMonitorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__DATransactionMonitor_incrementTransactionCountForTransaction___block_invoke_2;
  block[3] = &unk_1E7B923C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __64__DATransactionMonitor_incrementTransactionCountForTransaction___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.dataaccess.DATransactionMonitorQueue", v2);
  v1 = (void *)transactionMonitorQueue;
  transactionMonitorQueue = (uint64_t)v0;

}

void __64__DATransactionMonitor_incrementTransactionCountForTransaction___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "transactionCount");
  v3 = MEMORY[0x1E0D03918];
  if (!v2)
  {
    MEMORY[0x1C3BB55C0]();
    DALoggingwithCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(v3 + 5);
    if (os_log_type_enabled(v4, v5))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1C1CD1000, v4, v5, "DATransactionMonitor: xpc_transaction_begin INIT {name: com.apple.remindd.dataaccess.transactions}", (uint8_t *)v12, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", objc_msgSend(*(id *)(a1 + 32), "transactionCount") + 1);
  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setTransactions:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 40));

  DALoggingwithCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_BYTE *)(v3 + 5);
  if (os_log_type_enabled(v9, v10))
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "transactionCount");
    v12[0] = 67109120;
    v12[1] = v11;
    _os_log_impl(&dword_1C1CD1000, v9, v10, "Transaction count is incremented to %d", (uint8_t *)v12, 8u);
  }

}

- (void)decrementTransactionCountForTransaction:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = transactionMonitorQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__DATransactionMonitor_decrementTransactionCountForTransaction___block_invoke;
  block[3] = &unk_1E7B923F0;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __64__DATransactionMonitor_decrementTransactionCountForTransaction___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id WeakRetained;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "transactionCount");
  v3 = MEMORY[0x1E0D03918];
  if (v2 == 1)
  {
    MEMORY[0x1C3BB55CC]();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "didFinishAllXPCTransactions");

    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_BYTE *)(v3 + 5);
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1CD1000, v5, v6, "DATransactionMonitor: xpc_transaction_end RELEASE {name: com.apple.remindd.dataaccess.transactions}", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", objc_msgSend(*(id *)(a1 + 32), "transactionCount") - 1);
  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));

  if ((objc_msgSend(*(id *)(a1 + 32), "transactionCount") & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("DATransactionMonitor.m"), 111, CFSTR("Transaction count becomes negative, %d"), objc_msgSend(*(id *)(a1 + 32), "transactionCount"));

  }
  DALoggingwithCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_BYTE *)(v3 + 5);
  if (os_log_type_enabled(v8, v9))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "transactionCount");
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v10;
    _os_log_impl(&dword_1C1CD1000, v8, v9, "Transaction count is decremented to %d", buf, 8u);
  }

  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "transactions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v12;
    _os_log_impl(&dword_1C1CD1000, v11, v9, "Remaining transactions: %@", buf, 0xCu);

  }
}

- (int)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(int)a3
{
  self->_transactionCount = a3;
}

- (NSMutableArray)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_transactions, a3);
}

- (DATransactionMonitorDelegate)transactionMonitorDelegate
{
  return (DATransactionMonitorDelegate *)objc_loadWeakRetained((id *)&self->_transactionMonitorDelegate);
}

- (void)setTransactionMonitorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transactionMonitorDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transactionMonitorDelegate);
  objc_storeStrong((id *)&self->_transactions, 0);
}

@end
