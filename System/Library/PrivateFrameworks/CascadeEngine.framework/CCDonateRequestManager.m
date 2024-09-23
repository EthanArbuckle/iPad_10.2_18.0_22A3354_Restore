@implementation CCDonateRequestManager

uint64_t __44__CCDonateRequestManager__handleNextRequest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_237B02000, v2, OS_LOG_TYPE_DEFAULT, "Handling donate request %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "handle");
}

uint64_t __40__CCDonateRequestManager_submitRequest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_beginTransaction");
  objc_msgSend(*(id *)(a1 + 32), "_enqueue:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_handleNextRequest");
}

- (void)_enqueue:(id)a3
{
  id v4;
  CCDonateRequestQueueNode **p_lastNode;
  CCDonateRequestQueueNode *lastNode;
  CCDonateRequestQueueNode *firstNode;
  CCDonateRequestQueueNode *v8;
  CCDonateRequestQueueNode *v9;
  CCDonateRequestQueueNode *obj;

  v4 = a3;
  obj = (CCDonateRequestQueueNode *)objc_opt_new();
  -[CCDonateRequestQueueNode setRequest:](obj, "setRequest:", v4);

  if (self->_firstNode)
  {
    lastNode = self->_lastNode;
    p_lastNode = &self->_lastNode;
    -[CCDonateRequestQueueNode setNext:](lastNode, "setNext:", obj);
    firstNode = obj;
  }
  else
  {
    objc_storeStrong((id *)&self->_firstNode, obj);
    firstNode = self->_firstNode;
    p_lastNode = &self->_lastNode;
  }
  v8 = firstNode;
  v9 = *p_lastNode;
  *p_lastNode = v8;

}

- (void)_beginTransaction
{
  OUTLINED_FUNCTION_0_2(&dword_237B02000, a2, a3, "Acquired OS transaction: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)_handleNextRequest
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_237B02000, log, OS_LOG_TYPE_DEBUG, "All enqueued donate requests have been handled.", v1, 2u);
}

- (id)_dequeue
{
  CCDonateRequestQueueNode *firstNode;
  CCDonateRequestQueueNode *v4;
  CCDonateRequestQueueNode *lastNode;
  void *v6;

  firstNode = self->_firstNode;
  if (firstNode)
  {
    if (firstNode == self->_lastNode)
    {
      self->_firstNode = 0;

      lastNode = self->_lastNode;
      self->_lastNode = 0;
    }
    else
    {
      -[CCDonateRequestQueueNode next](firstNode, "next");
      v4 = (CCDonateRequestQueueNode *)objc_claimAutoreleasedReturnValue();
      lastNode = self->_firstNode;
      self->_firstNode = v4;
    }

    -[CCDonateRequestQueueNode request](firstNode, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void __42__CCDonateRequestManager_completeRequest___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_isActiveRequestId:", objc_msgSend(*(id *)(a1 + 40), "requestId"));
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *v2;
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_237B02000, v5, OS_LOG_TYPE_DEFAULT, "Donate request %@ handling complete", (uint8_t *)&v15, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 64);
    *(_QWORD *)(v7 + 64) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_handleNextRequest");
    objc_msgSend(*(id *)(a1 + 32), "_endTransaction");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __42__CCDonateRequestManager_completeRequest___block_invoke_cold_1((uint64_t)v2, v5, v9, v10, v11, v12, v13, v14);

  }
}

- (BOOL)_isActiveRequestId:(unsigned int)a3
{
  CCDonateRequest *activeRequest;

  activeRequest = self->_activeRequest;
  if (activeRequest)
    LOBYTE(activeRequest) = -[CCDonateRequest requestId](activeRequest, "requestId") == a3;
  return (char)activeRequest;
}

- (void)_endTransaction
{
  OUTLINED_FUNCTION_0_2(&dword_237B02000, a2, a3, "Releasing OS transaction: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)submitRequest:(id)a3
{
  id v4;
  NSObject *registryQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  registryQueue = self->_registryQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__CCDonateRequestManager_submitRequest___block_invoke;
  v7[3] = &unk_25098ABB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(registryQueue, v7);

}

- (void)completeRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *registryQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    registryQueue = self->_registryQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __42__CCDonateRequestManager_completeRequest___block_invoke;
    v7[3] = &unk_25098ABB8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(registryQueue, v7);

  }
}

- (CCDifferentialUpdaterFactory)updaterFactory
{
  return self->_updaterFactory;
}

- (CCDonateRequestManager)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCDonateRequestManager)initWithWriteAccess:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CCDonateRequestManager *v7;

  v4 = (void *)MEMORY[0x24BE156E8];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CCDonateRequestManager initWithWriteAccess:changeNotifier:donationTimeout:](self, "initWithWriteAccess:changeNotifier:donationTimeout:", v5, v6, 300.0);

  return v7;
}

- (CCDonateRequestManager)initWithWriteAccess:(id)a3 changeNotifier:(id)a4 donationTimeout:(double)a5
{
  id v8;
  id v9;
  CCDonateRequestManager *v10;
  CCDifferentialUpdaterFactory *v11;
  CCDifferentialUpdaterFactory *updaterFactory;
  OS_os_transaction *transaction;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *registryQueue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *executionQueue;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CCDonateRequestManager;
  v10 = -[CCDonateRequestManager init](&v21, sel_init);
  if (v10)
  {
    v11 = -[CCDifferentialUpdaterFactory initWithWriteAccess:changeNotifier:timeout:]([CCDifferentialUpdaterFactory alloc], "initWithWriteAccess:changeNotifier:timeout:", v8, v9, a5 * 0.8);
    updaterFactory = v10->_updaterFactory;
    v10->_updaterFactory = v11;

    v10->_eventIdCounter = 0;
    transaction = v10->_transaction;
    v10->_transaction = 0;

    v10->_transactionCounter = 0;
    v10->_donationTimeout = a5;
    v10->_suspended = 0;
    objc_storeStrong((id *)&v10->_changeNotifier, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("registryQueue", v14);
    registryQueue = v10->_registryQueue;
    v10->_registryQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("executionQueue", v17);
    executionQueue = v10->_executionQueue;
    v10->_executionQueue = (OS_dispatch_queue *)v18;

  }
  return v10;
}

- (void)suspend
{
  NSObject *registryQueue;
  _QWORD block[5];

  registryQueue = self->_registryQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CCDonateRequestManager_suspend__block_invoke;
  block[3] = &unk_25098A6F0;
  block[4] = self;
  dispatch_async(registryQueue, block);
}

uint64_t __33__CCDonateRequestManager_suspend__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = 1;
  return result;
}

- (void)resume
{
  NSObject *registryQueue;
  _QWORD block[5];

  registryQueue = self->_registryQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__CCDonateRequestManager_resume__block_invoke;
  block[3] = &unk_25098A6F0;
  block[4] = self;
  dispatch_async(registryQueue, block);
}

uint64_t __32__CCDonateRequestManager_resume__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_handleNextRequest");
}

uint64_t __44__CCDonateRequestManager__handleNextRequest__block_invoke_22(uint64_t a1)
{
  int *v1;
  uint64_t result;
  NSObject *v3;

  v1 = (int *)(a1 + 32);
  result = objc_msgSend(*(id *)(a1 + 32), "_isActiveRequestId:", *(unsigned int *)(a1 + 40));
  if ((_DWORD)result)
  {
    __biome_log_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__CCDonateRequestManager__handleNextRequest__block_invoke_22_cold_1(v1 + 2, (uint64_t)v1, v3);

    return objc_msgSend(*(id *)(*(_QWORD *)v1 + 64), "timeout");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updaterFactory, 0);
  objc_storeStrong((id *)&self->_changeNotifier, 0);
  objc_storeStrong((id *)&self->_activeRequest, 0);
  objc_storeStrong((id *)&self->_lastNode, 0);
  objc_storeStrong((id *)&self->_firstNode, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_registryQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

void __42__CCDonateRequestManager_completeRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_237B02000, a2, a3, "Donate request %@ no longer active.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __44__CCDonateRequestManager__handleNextRequest__block_invoke_22_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 24);
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 2048;
  v7 = v4;
  _os_log_error_impl(&dword_237B02000, log, OS_LOG_TYPE_ERROR, "Expiring Donate requestId: %u after %lf seconds", (uint8_t *)v5, 0x12u);
  OUTLINED_FUNCTION_8();
}

@end
