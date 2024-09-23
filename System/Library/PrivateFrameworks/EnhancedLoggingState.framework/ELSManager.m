@implementation ELSManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_singleton;
}

void __27__ELSManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ELSManager initSingleton]([ELSManager alloc], "initSingleton");
  v1 = (void *)sharedManager_singleton;
  sharedManager_singleton = (uint64_t)v0;

}

- (id)initSingleton
{
  ELSManager *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  uint64_t v5;
  ELSSnapshot *snapshot;
  dispatch_queue_t v7;
  OS_dispatch_queue *transactionQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ELSManager;
  v2 = -[ELSManager init](&v10, sel_init);
  if (v2)
  {
    +[ELSEntitlementUtilities assertCurrentProcessHasEntitlement](ELSEntitlementUtilities, "assertCurrentProcessHasEntitlement");
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.enhanced-logging-state"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    v5 = objc_opt_new();
    snapshot = v2->_snapshot;
    v2->_snapshot = (ELSSnapshot *)v5;

    v7 = dispatch_queue_create("com.apple.enhanced-logging-state.transactionQueue", 0);
    transactionQueue = v2->_transactionQueue;
    v2->_transactionQueue = (OS_dispatch_queue *)v7;

    -[ELSManager beginUpdates](v2, "beginUpdates");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ELSManager;
  -[ELSManager dealloc](&v4, sel_dealloc);
}

- (void)beginUpdates
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __26__ELSManager_beginUpdates__block_invoke;
  v6[3] = &unk_24D1737D0;
  v6[4] = self;
  v5 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("ELSDidBatchUpdate"), 0, v4, v6);

}

void __26__ELSManager_beginUpdates__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "transactionQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__ELSManager_beginUpdates__block_invoke_2;
  block[3] = &unk_24D1737A8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __26__ELSManager_beginUpdates__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  v5 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setSnapshot:", v5);

  objc_sync_exit(v2);
  objc_msgSend(*(id *)(a1 + 32), "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "status");

  if (v4 != v7)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    v13 = CFSTR("ELSUserInfo");
    objc_msgSend(v9, "snapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    v14[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("ELSDidUpdateStatus"), v9, v12);

  }
}

- (void)transactionWithBlock:(id)a3
{
  -[ELSManager transactionWithBlock:completion:](self, "transactionWithBlock:completion:", a3, 0);
}

- (void)transactionWithBlock:(id)a3 completion:(id)a4
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
  -[ELSManager transactionQueue](self, "transactionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ELSManager_transactionWithBlock_completion___block_invoke;
  block[3] = &unk_24D1737F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __46__ELSManager_transactionWithBlock_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(a1 + 32), "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(a1 + 32), "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "commitBatchTransaction:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setSnapshot:", v7);
  dispatch_semaphore_signal(v2);
  objc_sync_exit(v5);

  v8 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v8);
  if (v4 != objc_msgSend(v7, "status"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v13 = CFSTR("ELSUserInfo");
    v14[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("ELSDidUpdateStatus"), v10, v11);

  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v7);

}

- (void)finish
{
  -[ELSManager finishWithCompletion:](self, "finishWithCompletion:", 0);
}

- (void)finishWithFailure
{
  -[ELSManager finishWithFailureBlock:](self, "finishWithFailureBlock:", 0);
}

- (void)finishWithFailureBlock:(id)a3
{
  -[ELSManager transactionWithBlock:completion:](self, "transactionWithBlock:completion:", &__block_literal_global_18, a3);
}

void __37__ELSManager_finishWithFailureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setStatus:", 8);
  objc_msgSend(v2, "setConsent:", 0);
  objc_msgSend(v2, "setQueue:", 0);
  objc_msgSend(v2, "setRetriesRemaining:", 0);
  objc_msgSend(v2, "setIdentifiersToRetry:", 0);
  objc_msgSend(v2, "setMetadata:", 0);
  objc_msgSend(v2, "setUploadCompletedPercentage:", 0);
  objc_msgSend(v2, "setFollowUpOptions:", 0);
  objc_msgSend(v2, "setTargetDevices:", 0);
  objc_msgSend(v2, "setConsentHandles:", 0);
  objc_msgSend(v2, "setConsentData:", 0);

}

- (void)finishWithCompletion:(id)a3
{
  -[ELSManager transactionWithBlock:completion:](self, "transactionWithBlock:completion:", &__block_literal_global_19, a3);
}

void __35__ELSManager_finishWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setStatus:", 7);
  objc_msgSend(v2, "setConsent:", 0);
  objc_msgSend(v2, "setQueue:", 0);
  objc_msgSend(v2, "setRetriesRemaining:", 0);
  objc_msgSend(v2, "setIdentifiersToRetry:", 0);
  objc_msgSend(v2, "setMetadata:", 0);
  objc_msgSend(v2, "setUploadCompletedPercentage:", 0);
  objc_msgSend(v2, "setFollowUpOptions:", 0);
  objc_msgSend(v2, "setTargetDevices:", 0);
  objc_msgSend(v2, "setConsentHandles:", 0);
  objc_msgSend(v2, "setConsentData:", 0);

}

- (void)flush
{
  -[ELSManager flushWithCompletion:](self, "flushWithCompletion:", 0);
}

- (void)flushWithCompletion:(id)a3
{
  -[ELSManager transactionWithBlock:completion:](self, "transactionWithBlock:completion:", &__block_literal_global_20, a3);
}

void __34__ELSManager_flushWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setStatus:", 0);
  objc_msgSend(v2, "setConsent:", 0);
  objc_msgSend(v2, "setStartDate:", 0);
  objc_msgSend(v2, "setEndDate:", 0);
  objc_msgSend(v2, "setQueue:", 0);
  objc_msgSend(v2, "setRetriesRemaining:", 0);
  objc_msgSend(v2, "setIdentifiersToRetry:", 0);
  objc_msgSend(v2, "setMetadata:", 0);
  objc_msgSend(v2, "setUploadCompletedPercentage:", 0);
  objc_msgSend(v2, "setFollowUpOptions:", 0);
  objc_msgSend(v2, "setTargetDevices:", 0);
  objc_msgSend(v2, "setConsentHandles:", 0);
  objc_msgSend(v2, "setConsentData:", 0);

}

- (void)commitBatchTransaction:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  id v18;

  v4 = a3;
  v14 = -[ELSManager commitStatusTransaction:](self, "commitStatusTransaction:", v4);
  v15 = -[ELSManager commitConsentTransaction:](self, "commitConsentTransaction:", v4);
  v17 = -[ELSManager commitDatesTransaction:](self, "commitDatesTransaction:", v4);
  v16 = -[ELSManager commitQueueTransaction:](self, "commitQueueTransaction:", v4);
  v5 = -[ELSManager commitConsentHandlesTransaction:](self, "commitConsentHandlesTransaction:", v4);
  v6 = -[ELSManager commitRetriesRemainingTransaction:](self, "commitRetriesRemainingTransaction:", v4);
  v7 = -[ELSManager commitIdentifiersToRetryTransaction:](self, "commitIdentifiersToRetryTransaction:", v4);
  v8 = -[ELSManager commitMetadataTransaction:](self, "commitMetadataTransaction:", v4);
  v9 = -[ELSManager commitUploadCompletedPercentage:](self, "commitUploadCompletedPercentage:", v4);
  v10 = -[ELSManager commitFollowUpOptions:](self, "commitFollowUpOptions:", v4);
  v11 = -[ELSManager commitSessionDeviceTransaction:](self, "commitSessionDeviceTransaction:", v4);
  v12 = -[ELSManager commitConsentDataTransaction:](self, "commitConsentDataTransaction:", v4);

  if (v12 || v11 || v10 || v9 || v8 || v7 || v6 || v5 || v16 || v17 || v15 || v14)
  {
    -[ELSManager defaults](self, "defaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "synchronize");

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("ELSDidBatchUpdate"), 0, 0, 1);

  }
}

- (BOOL)commitStatusTransaction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  if (!objc_msgSend(v4, "status"))
  {
    -[ELSManager snapshot](self, "snapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "status");

    if (v12)
    {
      -[ELSManager defaults](self, "defaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("status"));
      goto LABEL_7;
    }
  }
  v5 = objc_msgSend(v4, "status");
  -[ELSManager snapshot](self, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "status");

  if (v5 != v7)
  {
    -[ELSManager defaults](self, "defaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("status"));

LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)commitConsentTransaction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  if (!objc_msgSend(v4, "consent"))
  {
    -[ELSManager snapshot](self, "snapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "consent");

    if (v12)
    {
      -[ELSManager defaults](self, "defaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("consent"));
      goto LABEL_7;
    }
  }
  v5 = objc_msgSend(v4, "consent");
  -[ELSManager snapshot](self, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "consent");

  if (v5 != v7)
  {
    -[ELSManager defaults](self, "defaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "consent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("consent"));

LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)commitDatesTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v4 = a3;
  -[ELSManager defaults](self, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("dates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v4, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSManager snapshot](self, "snapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ELSManager object:isEqualToObject:](self, "object:isEqualToObject:", v11, v13))
  {

  }
  else
  {
    objc_msgSend(v4, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("startDate"));

      goto LABEL_12;
    }
  }
  objc_msgSend(v4, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  else
  {
    -[ELSManager snapshot](self, "snapshot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      objc_msgSend(v10, "removeObjectForKey:", CFSTR("startDate"));
  }
LABEL_12:
  objc_msgSend(v4, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSManager snapshot](self, "snapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ELSManager object:isEqualToObject:](self, "object:isEqualToObject:", v19, v21))
  {

  }
  else
  {
    objc_msgSend(v4, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("endDate"));

      goto LABEL_20;
    }
  }
  objc_msgSend(v4, "endDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {

  }
  else
  {
    -[ELSManager snapshot](self, "snapshot");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "endDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      objc_msgSend(v10, "removeObjectForKey:", CFSTR("endDate"));
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "count"))
  {

  }
  else
  {
    objc_msgSend(v9, "allKeys");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
    {
      -[ELSManager defaults](self, "defaults");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeObjectForKey:", CFSTR("dates"));
      goto LABEL_27;
    }
  }
  if (!-[ELSManager object:isEqualToObject:](self, "object:isEqualToObject:", v27, v9))
  {
    -[ELSManager defaults](self, "defaults");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v27, CFSTR("dates"));
LABEL_27:

    v29 = 1;
    goto LABEL_28;
  }
  v29 = 0;
LABEL_28:

  return v29;
}

- (BOOL)commitQueueTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[ELSManager snapshot](self, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ELSManager defaults](self, "defaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("queue"));
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSManager snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ELSManager object:isEqualToObject:](self, "object:isEqualToObject:", v6, v8);

  if (!v9)
  {
    -[ELSManager defaults](self, "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodedQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("queue"));

LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitConsentHandlesTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "consentHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[ELSManager snapshot](self, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "consentHandles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ELSManager defaults](self, "defaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("consentHandles"));
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "consentHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSManager snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "consentHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ELSManager object:isEqualToObject:](self, "object:isEqualToObject:", v6, v8);

  if (!v9)
  {
    -[ELSManager defaults](self, "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "consentHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("consentHandles"));

LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitSessionDeviceTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "targetDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[ELSManager snapshot](self, "snapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "targetDevices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[ELSManager defaults](self, "defaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObjectForKey:", CFSTR("targetDevices"));

      v10 = 1;
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "targetDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSManager snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ELSManager array:isEqualToArray:](self, "array:isEqualToArray:", v6, v8);

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v4, "targetDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 0, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;

    -[ELSManager defaults](self, "defaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v13, CFSTR("targetDevices"));

    v10 = v14 == 0;
  }
LABEL_8:

  return v10;
}

- (BOOL)commitConsentDataTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "consentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[ELSManager snapshot](self, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "consentData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ELSManager defaults](self, "defaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("consentData"));
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "consentData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSManager snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "consentData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ELSManager object:isEqualToObject:](self, "object:isEqualToObject:", v6, v8);

  if (!v9)
  {
    -[ELSManager defaults](self, "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "consentData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("consentData"));

LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitRetriesRemainingTransaction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  if (!objc_msgSend(v4, "retriesRemaining"))
  {
    -[ELSManager snapshot](self, "snapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "retriesRemaining");

    if (v12)
    {
      -[ELSManager defaults](self, "defaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("retriesRemaining"));
      goto LABEL_7;
    }
  }
  v5 = objc_msgSend(v4, "retriesRemaining");
  -[ELSManager snapshot](self, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "retriesRemaining");

  if (v5 != v7)
  {
    -[ELSManager defaults](self, "defaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "retriesRemaining"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("retriesRemaining"));

LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)commitIdentifiersToRetryTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "identifiersToRetry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[ELSManager snapshot](self, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifiersToRetry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ELSManager defaults](self, "defaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("identifiersToRetry"));
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "identifiersToRetry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSManager snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifiersToRetry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ELSManager object:isEqualToObject:](self, "object:isEqualToObject:", v6, v8);

  if (!v9)
  {
    -[ELSManager defaults](self, "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifiersToRetry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("identifiersToRetry"));

LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitMetadataTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[ELSManager snapshot](self, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ELSManager defaults](self, "defaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("metadata"));
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSManager snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ELSManager object:isEqualToObject:](self, "object:isEqualToObject:", v6, v8);

  if (!v9)
  {
    -[ELSManager defaults](self, "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("metadata"));

LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitUploadCompletedPercentage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "uploadCompletedPercentage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[ELSManager snapshot](self, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uploadCompletedPercentage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ELSManager defaults](self, "defaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("uploadCompletedPercentage"));
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "uploadCompletedPercentage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSManager snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uploadCompletedPercentage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ELSManager object:isEqualToObject:](self, "object:isEqualToObject:", v6, v8);

  if (!v9)
  {
    -[ELSManager defaults](self, "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uploadCompletedPercentage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("uploadCompletedPercentage"));

LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)commitFollowUpOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "followUpOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[ELSManager snapshot](self, "snapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "followUpOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ELSManager defaults](self, "defaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", CFSTR("followUpOptions"));
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "followUpOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ELSManager snapshot](self, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "followUpOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ELSManager object:isEqualToObject:](self, "object:isEqualToObject:", v6, v8);

  if (!v9)
  {
    -[ELSManager defaults](self, "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "followUpOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("followUpOptions"));

LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)object:(id)a3 isEqualToObject:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
    return objc_msgSend(a3, "isEqual:", a4);
  else
    return 1;
}

- (BOOL)array:(id)a3 isEqualToArray:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
    return objc_msgSend(a3, "isEqualToArray:", a4);
  else
    return 1;
}

- (void)refreshWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t *v14;
  _QWORD *v15;
  id v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[3];
  uint64_t v24;
  uint8_t v25[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ELSLogHandleForCategory(11);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2141BF000, v5, OS_LOG_TYPE_DEFAULT, "Performing refresh of enhanced logging state...", buf, 2u);
  }

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  -[ELSManager snapshot](self, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "status");

  v24 = v7;
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  -[ELSManager snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dedSessionIdentifier");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  ELSLogHandleForCategory(11);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *((_QWORD *)v18 + 5);
    *(_DWORD *)v25 = 138412290;
    v26 = v10;
    _os_log_impl(&dword_2141BF000, v9, OS_LOG_TYPE_DEFAULT, "Refreshing %@ bug session...", v25, 0xCu);
  }

  objc_initWeak((id *)v25, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __36__ELSManager_refreshWithCompletion___block_invoke;
  v12[3] = &unk_24D1738C8;
  v14 = buf;
  v15 = v23;
  objc_copyWeak(&v16, (id *)v25);
  v11 = v4;
  v13 = v11;
  -[ELSManager getBugSessionActivityWithCompletion:](self, "getBugSessionActivityWithCompletion:", v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)v25);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v23, 8);
}

void __36__ELSManager_refreshWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  id WeakRetained;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  const __CFString *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  char v25;
  _QWORD v26[4];
  id v27;
  char v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  ELSLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v30 = v5;
    _os_log_impl(&dword_2141BF000, v4, OS_LOG_TYPE_DEFAULT, "Successfully retrieved %@ bug session activity...", buf, 0xCu);
  }

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v6 == 8)
  {
    ELSLogHandleForCategory(11);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      +[ELSSnapshot statusToString:](ELSSnapshot, "statusToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_2141BF000, v7, OS_LOG_TYPE_DEFAULT, "ELS is at [%@] but no %@ session exists: marking ELS failed...", buf, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __36__ELSManager_refreshWithCompletion___block_invoke_23;
    v26[3] = &unk_24D1738A0;
    v27 = *(id *)(a1 + 32);
    v28 = a2;
    objc_msgSend(WeakRetained, "finishWithFailureBlock:", v26);

    v11 = v27;
    goto LABEL_19;
  }
  ELSLogHandleForCategory(11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6 >= 3 && (a2 & 1) == 0)
  {
    if (v13)
    {
      +[ELSSnapshot statusToString:](ELSSnapshot, "statusToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_2141BF000, v12, OS_LOG_TYPE_DEFAULT, "ELS is at [%@] but no %@ session exists: marking ELS finished...", buf, 0x16u);

    }
    v16 = objc_loadWeakRetained((id *)(a1 + 56));
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __36__ELSManager_refreshWithCompletion___block_invoke_24;
    v23[3] = &unk_24D1738A0;
    v24 = *(id *)(a1 + 32);
    v25 = a2;
    objc_msgSend(v16, "finishWithCompletion:", v23);

    v11 = v24;
    goto LABEL_19;
  }
  if (v13)
  {
    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if ((_DWORD)a2)
      v18 = CFSTR("active");
    else
      v18 = CFSTR("inactive");
    +[ELSSnapshot statusToString:](ELSSnapshot, "statusToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_2141BF000, v12, OS_LOG_TYPE_DEFAULT, "%@ bug session is %@, and ELS is at [%@]: no change needed.", buf, 0x20u);

  }
  v20 = *(_QWORD *)(a1 + 32);
  if (v20)
  {
    v11 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v11, "snapshot");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v20 + 16))(v20, v22, a2, 0);

LABEL_19:
  }
}

void __36__ELSManager_refreshWithCompletion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  ELSLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2141BF000, v4, OS_LOG_TYPE_DEFAULT, "Successfully flushed ELS.", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __36__ELSManager_refreshWithCompletion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  ELSLogHandleForCategory(11);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2141BF000, v4, OS_LOG_TYPE_DEFAULT, "Successfully flushed ELS.", v5, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getBugSessionActivityWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  ELSLogHandleForCategory(11);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ELSManager snapshot](self, "snapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dedSessionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v7;
    _os_log_impl(&dword_2141BF000, v5, OS_LOG_TYPE_DEFAULT, "Checking %@ bug session activity (defaults scan)...", (uint8_t *)&v16, 0xCu);

  }
  -[ELSManager snapshot](self, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "targetDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 1;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.diagnosticextensionsd"));
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("sessionIdentifiers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[ELSManager snapshot](self, "snapshot");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dedSessionIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "containsObject:", v15);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  v4[2](v4, v10);

}

- (ELSSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (OS_dispatch_queue)transactionQueue
{
  return self->_transactionQueue;
}

- (void)setTransactionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transactionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end
