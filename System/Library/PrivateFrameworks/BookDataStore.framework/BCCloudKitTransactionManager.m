@implementation BCCloudKitTransactionManager

- (BCCloudKitTransactionManager)initWithCloudKitController:(id)a3
{
  id v4;
  BCCloudKitTransactionManager *v5;
  BDSServiceProxy *v6;
  BDSServiceProxy *serviceProxy;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *transactionAccessQueue;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *transactions;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableDictionary *transactionCompletionCallbacks;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BCCloudKitTransactionManager;
  v5 = -[BCCloudKitTransactionManager init](&v24, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(BDSServiceProxy);
    serviceProxy = v5->_serviceProxy;
    v5->_serviceProxy = v6;

    objc_storeWeak((id *)&v5->_cloudKitController, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.iBooks.CloudKitTransactionManager", v8);
    transactionAccessQueue = v5->_transactionAccessQueue;
    v5->_transactionAccessQueue = (OS_dispatch_queue *)v9;

    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    transactions = v5->_transactions;
    v5->_transactions = (NSMutableDictionary *)v15;

    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v17, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    transactionCompletionCallbacks = v5->_transactionCompletionCallbacks;
    v5->_transactionCompletionCallbacks = (NSMutableDictionary *)v21;

  }
  return v5;
}

- (void)signalDataChangeTransactionForEntityName:(id)a3 notificationName:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend_transactionAccessQueue(self, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D9184C;
  block[3] = &unk_24F08A3B8;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

- (void)signalSyncToCKTransactionForEntityName:(id)a3 syncManager:(id)a4
{
  MEMORY[0x24BEDD108](self, sel_signalSyncToCKTransactionForEntityName_syncManager_completion_, a3, a4, 0);
}

- (void)signalSyncToCKTransactionForEntityName:(id)a3 syncManager:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_transactionAccessQueue(self, v11, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_227D91A14;
  v19[3] = &unk_24F089EC8;
  v19[4] = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  dispatch_async(v15, v19);

}

- (void)signalFetchChangesTransaction:(id)a3
{
  BCCloudKitController **p_cloudKitController;
  id v5;
  id WeakRetained;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int isEqualToString;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD block[5];

  p_cloudKitController = &self->_cloudKitController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_cloudKitController);
  objc_msgSend_privateCloudDatabaseController(WeakRetained, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subscriptionID(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v5, v18, v19);

  if (isEqualToString)
  {
    objc_msgSend_transactionAccessQueue(self, v21, v22, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227D91CB0;
    block[3] = &unk_24F08A3E0;
    block[4] = self;
    dispatch_async(v25, block);

  }
}

- (void)signalFetchChangesTransactionInService:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_serviceProxy(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalFetchChangesTransaction_(v12, v9, (uint64_t)v4, v10, v11);

}

- (void)transactionCompleted:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BCCloudKitTransactionManager *v13;

  v4 = a3;
  objc_msgSend_transactionAccessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_227D91E94;
  v11[3] = &unk_24F08A408;
  v12 = v4;
  v13 = self;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (BCCloudKitController)cloudKitController
{
  return (BCCloudKitController *)objc_loadWeakRetained((id *)&self->_cloudKitController);
}

- (void)setCloudKitController:(id)a3
{
  objc_storeWeak((id *)&self->_cloudKitController, a3);
}

- (OS_dispatch_queue)transactionAccessQueue
{
  return self->_transactionAccessQueue;
}

- (void)setTransactionAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transactionAccessQueue, a3);
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_transactions, a3);
}

- (NSMutableDictionary)transactionCompletionCallbacks
{
  return self->_transactionCompletionCallbacks;
}

- (void)setTransactionCompletionCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_transactionCompletionCallbacks, a3);
}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_transactionCompletionCallbacks, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_transactionAccessQueue, 0);
  objc_destroyWeak((id *)&self->_cloudKitController);
}

@end
