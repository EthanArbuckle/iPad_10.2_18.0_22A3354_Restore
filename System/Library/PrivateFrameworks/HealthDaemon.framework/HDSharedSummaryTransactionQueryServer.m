@implementation HDSharedSummaryTransactionQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (HDSharedSummaryTransactionQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDSharedSummaryTransactionQueryServer *v11;
  objc_super v13;

  v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSharedSummaryTransactionQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v13, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
    v11->_committedTransactions = objc_msgSend(v10, "committedTransactions");

  return v11;
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDSharedSummaryTransactionQueryServer;
  -[HDQueryServer _queue_start](&v5, sel__queue_start);
  -[HDQueryServer profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedSummaryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:", self);

  -[HDSharedSummaryTransactionQueryServer _queue_deliverAllTransactions]((unsigned __int8 *)self);
}

- (void)_queue_deliverAllTransactions
{
  id v2;
  int v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = a1[200];
    objc_msgSend(a1, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedSummaryManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v19 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __70__HDSharedSummaryTransactionQueryServer__queue_deliverAllTransactions__block_invoke;
      v17[3] = &unk_1E6CEE5E0;
      v18 = v2;
      v6 = objc_msgSend(v5, "enumerateCommittedTransactionsWithError:handler:", &v19, v17);
      v7 = v19;

      if ((v6 & 1) != 0)
      {
LABEL_4:
        objc_msgSend(a1, "clientProxy", v11, v12, v13, v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "queryUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "client_deliverTransactions:query:", v2, v9);
LABEL_7:

        objc_msgSend(a1, "setDataCount:", objc_msgSend(v2, "count"));
        return;
      }
    }
    else
    {
      v16 = 0;
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __70__HDSharedSummaryTransactionQueryServer__queue_deliverAllTransactions__block_invoke_2;
      v14 = &unk_1E6CEE5E0;
      v15 = v2;
      v10 = objc_msgSend(v5, "enumerateNonCommittedTransactionsWithError:handler:", &v16, &v11);
      v7 = v16;

      if (v10)
        goto LABEL_4;
    }
    objc_msgSend(a1, "clientProxy", v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "client_deliverError:forQuery:", v7, v9);
    goto LABEL_7;
  }
}

- (void)_queue_didDeactivate
{
  void *v3;
  id v4;

  -[HDQueryServer profile](self, "profile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedSummaryManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

}

- (void)sharedSummaryManagerCommittedTransactionsDidChange:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__HDSharedSummaryTransactionQueryServer_sharedSummaryManagerCommittedTransactionsDidChange___block_invoke;
  v5[3] = &unk_1E6CECE78;
  objc_copyWeak(&v6, &location);
  -[HDQueryServer scheduleDatabaseAccessOnQueueWithBlock:](self, "scheduleDatabaseAccessOnQueueWithBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __92__HDSharedSummaryTransactionQueryServer_sharedSummaryManagerCommittedTransactionsDidChange___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  -[HDSharedSummaryTransactionQueryServer _queue_deliverAllTransactions](WeakRetained);

}

uint64_t __70__HDSharedSummaryTransactionQueryServer__queue_deliverAllTransactions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __70__HDSharedSummaryTransactionQueryServer__queue_deliverAllTransactions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
