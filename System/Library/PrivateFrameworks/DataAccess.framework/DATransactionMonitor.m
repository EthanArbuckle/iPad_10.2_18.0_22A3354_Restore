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
    v5 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
    if (os_log_type_enabled(v4, v5))
    {
      transactionCount = v3->_transactionCount;
      *(_DWORD *)buf = 67109120;
      v10 = transactionCount;
      _os_log_impl(&dword_1B51E4000, v4, v5, "Transaction count is initialized to %d", buf, 8u);
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
  block[3] = &unk_1E68CB568;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __64__DATransactionMonitor_incrementTransactionCountForTransaction___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.dataaccess.DATransactionMonitorQueue", 0);
  v1 = (void *)transactionMonitorQueue;
  transactionMonitorQueue = (uint64_t)v0;

}

void __64__DATransactionMonitor_incrementTransactionCountForTransaction___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", objc_msgSend(*(id *)(a1 + 32), "transactionCount") + 1);
  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setTransactions:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

  DALoggingwithCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v5, v6))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "transactionCount");
    v8[0] = 67109120;
    v8[1] = v7;
    _os_log_impl(&dword_1B51E4000, v5, v6, "Transaction count is incremented to %d", (uint8_t *)v8, 8u);
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
  block[3] = &unk_1E68CB590;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_sync(v6, block);

}

void __64__DATransactionMonitor_decrementTransactionCountForTransaction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  void *v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "transactionCount") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "didFinishAllXPCTransactions");

  }
  objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", objc_msgSend(*(id *)(a1 + 32), "transactionCount") - 1);
  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

  if ((objc_msgSend(*(id *)(a1 + 32), "transactionCount") & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("DATransactionMonitor.m"), 69, CFSTR("Transaction count becomes negative, %d"), objc_msgSend(*(id *)(a1 + 32), "transactionCount"));

  }
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D1C448] + 6);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "transactionCount");
    *(_DWORD *)buf = 67109120;
    v9 = v6;
    _os_log_impl(&dword_1B51E4000, v4, v5, "Transaction count is decremented to %d", buf, 8u);
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
