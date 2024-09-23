@implementation AMSPurchaseQueue

+ (AMSBagKeySet)bagKeySet
{
  return objc_alloc_init(AMSBagKeySet);
}

- (AMSPurchaseQueue)initWithConfiguration:(id)a3
{
  id v5;
  AMSPurchaseQueue *v6;
  AMSPurchaseQueue *v7;
  AMSPurchaseQueueBatchList *v8;
  AMSPurchaseQueueBatchList *batches;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *dispatchQueue;
  AMSThreadSafeSet *v13;
  AMSThreadSafeSet *preAuthenticatedDSIDs;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSPurchaseQueue;
  v6 = -[AMSPurchaseQueue init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = objc_alloc_init(AMSPurchaseQueueBatchList);
    batches = v7->_batches;
    v7->_batches = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.ams.purchasequeue.dispatch", v10);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(AMSThreadSafeSet);
    preAuthenticatedDSIDs = v7->_preAuthenticatedDSIDs;
    v7->_preAuthenticatedDSIDs = v13;

  }
  return v7;
}

- (id)enquePurchases:(id)a3
{
  id v4;
  AMSMutableLazyPromise *v5;
  id v6;
  AMSMutableLazyPromise *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [AMSMutableLazyPromise alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__AMSPurchaseQueue_enquePurchases___block_invoke;
  v9[3] = &unk_1E253FB50;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = -[AMSMutableLazyPromise initWithBlock:](v5, "initWithBlock:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __35__AMSPurchaseQueue_enquePurchases___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  AMSPurchaseBatch *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    v5 = -[AMSPurchaseBatch initWithPurchases:weakPromise:]([AMSPurchaseBatch alloc], "initWithPurchases:weakPromise:", *(_QWORD *)(a1 + 32), v4);

    objc_msgSend(WeakRetained, "batches");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendBatch:", v5);

    objc_msgSend(WeakRetained, "_handleNextPurchase");
  }
  else
  {
    AMSError(0, CFSTR("Purchase Failed"), CFSTR("Queue has vanished"), 0);
    v5 = (AMSPurchaseBatch *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithError:", v5);

  }
}

- (void)setSuspended:(BOOL)a3 logUUID:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  BOOL v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[AMSPurchaseQueue batches](self, "batches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[AMSPurchaseQueue dispatchQueue](self, "dispatchQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__AMSPurchaseQueue_setSuspended_logUUID___block_invoke;
    block[3] = &unk_1E2543B28;
    block[4] = self;
    v14 = a3;
    v13 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = objc_opt_class();
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ignoring suspend request due to queue being empty", buf, 0x16u);
    }

  }
}

void __41__AMSPurchaseQueue_setSuspended_logUUID___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setSuspended:", *(unsigned __int8 *)(a1 + 48));
  v2 = *(unsigned __int8 *)(a1 + 48);
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v6;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Suspending purchase queue", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Resuming purchase queue", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_handleNextPurchase");
  }
}

+ (NSString)bagSubProfile
{
  return +[AMSPurchaseBagConsumer bagSubProfile](AMSPurchaseBagConsumer, "bagSubProfile");
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSPurchaseBagConsumer bagSubProfileVersion](AMSPurchaseBagConsumer, "bagSubProfileVersion");
}

+ (id)createBagForSubProfile
{
  return +[AMSPurchaseBagConsumer createBagForSubProfile](AMSPurchaseBagConsumer, "createBagForSubProfile");
}

- (void)_handleNextPurchase
{
  NSObject *v3;
  _QWORD block[5];

  -[AMSPurchaseQueue dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AMSPurchaseQueue__handleNextPurchase__block_invoke;
  block[3] = &unk_1E253DBD8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __39__AMSPurchaseQueue__handleNextPurchase__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "batches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = objc_msgSend(*(id *)(a1 + 32), "isSuspended");
  if ((v4 & 1) != 0 || !v3)
  {
    +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v4)
    {
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      v13 = "%{public}@: [%{public}@]: Not handling next purchase due to queue being suspended";
    }
    else
    {
      if (!v8)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v14 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      v18 = 2114;
      v19 = v12;
      v13 = "%{public}@: [%{public}@]: Queue empty";
    }
    _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);

LABEL_16:
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "batches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextPurchase");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v15;
  if (v15)
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "_processPurchase:", v15);
    v6 = v15;
  }

}

- (id)_processPurchase:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(id *);
  void *v34;
  AMSPurchaseQueue *v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD aBlock[5];
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSPurchaseQueue dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    objc_msgSend(v4, "logUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v8;
    v45 = 2114;
    v46 = v9;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Processing purchase", buf, 0x16u);

  }
  -[AMSPurchaseQueue config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_msgSend(v10, "purchaseTaskClass");
  if (!v11)
    v11 = (objc_class *)objc_opt_class();

  v12 = [v11 alloc];
  -[AMSPurchaseQueue config](self, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithPurchase:bag:", v4, v14);

  objc_msgSend(v15, "setDelegate:", self);
  objc_msgSend(v15, "setRunMode:", 1);
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__AMSPurchaseQueue__processPurchase___block_invoke;
  aBlock[3] = &unk_1E253D370;
  aBlock[4] = self;
  v17 = v4;
  v41 = v17;
  v18 = v15;
  v42 = v18;
  v19 = _Block_copy(aBlock);
  -[AMSPurchaseQueue preAuthenticatedDSIDs](self, "preAuthenticatedDSIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "account");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ams_DSID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v20, "containsObject:", v22);

  if (v23)
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v16;
    v38[1] = 3221225472;
    v38[2] = __37__AMSPurchaseQueue__processPurchase___block_invoke_2;
    v38[3] = &unk_1E2544F30;
    v38[4] = self;
    v39 = v18;
    objc_msgSend(v24, "addSuccessBlock:", v38);
    objc_msgSend(v24, "continueWithBlock:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v39;
  }
  else
  {
    objc_msgSend(v18, "purchaseInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = +[AMSPurchaseTask shouldPreauthenticatePurchaseWithInfo:](AMSPurchaseTask, "shouldPreauthenticatePurchaseWithInfo:", v27);

    if (!v28)
    {
      -[AMSPurchaseQueue _createPurchasePromiseForTask:purchase:](self, "_createPurchasePromiseForTask:purchase:", v18, v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    -[AMSPurchaseQueue _performPreauthenticateForPurchaseTask:](self, "_performPreauthenticateForPurchaseTask:", v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v16;
    v32 = 3221225472;
    v33 = __37__AMSPurchaseQueue__processPurchase___block_invoke_15;
    v34 = &unk_1E2544F58;
    v35 = self;
    v36 = v18;
    v37 = v17;
    objc_msgSend(v29, "addSuccessBlock:", &v31);
    objc_msgSend(v29, "continueWithBlock:", v19, v31, v32, v33, v34, v35);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v36;
  }

LABEL_13:
  return v25;
}

id __37__AMSPurchaseQueue__processPurchase___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)a1[4];
  if (v4)
  {
    objc_msgSend(v5, "_handleResult:error:forPurchase:", 0, v4, a1[5]);
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v4);
  }
  else
  {
    objc_msgSend(v5, "_createPurchasePromiseForTask:purchase:", a1[6], a1[5]);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __37__AMSPurchaseQueue__processPurchase___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] 'hasBeenAuthedForBuy' flag set for purchase, queue already authenticated for this account.", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "purchaseInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHasBeenAuthedForBuy:", 1);

}

void __37__AMSPurchaseQueue__processPurchase___block_invoke_15(id *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v4;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] 'hasBeenAuthedForBuy' flag set for purchase: Device Restrictions", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(a1[5], "purchaseInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHasBeenAuthedForBuy:", 1);

  objc_msgSend(a1[4], "preAuthenticatedDSIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ams_DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

}

- (id)_createPurchasePromiseForTask:(id)a3 purchase:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  objc_msgSend(a3, "performPurchase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__AMSPurchaseQueue__createPurchasePromiseForTask_purchase___block_invoke;
  v10[3] = &unk_1E2544F80;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "addFinishBlock:", v10);

  return v7;
}

void __59__AMSPurchaseQueue__createPurchasePromiseForTask_purchase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__AMSPurchaseQueue__createPurchasePromiseForTask_purchase___block_invoke_2;
  v11[3] = &unk_1E2541468;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __59__AMSPurchaseQueue__createPurchasePromiseForTask_purchase___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isSuspended");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleResult:error:forPurchase:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    return objc_msgSend(*(id *)(a1 + 32), "_handleNextPurchase");
  }
  return result;
}

- (void)_handleResult:(id)a3 error:(id)a4 forPurchase:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[AMSPurchaseQueue batches](self, "batches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "batchForPurchase:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v8)
      objc_msgSend(v11, "finishPurchase:withError:", v9, v8);
    else
      objc_msgSend(v11, "finishPurchase:withResult:", v9, v13);
    if (objc_msgSend(v11, "isComplete"))
    {
      -[AMSPurchaseQueue batches](self, "batches");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "popBatch:", v11);

    }
  }

}

- (id)_performPreauthenticateForPurchaseTask:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  AMSAuthenticateOptions *v10;
  void *v11;
  void *v12;
  AMSAuthenticateRequest *v13;
  void *v14;
  void *v15;
  AMSAuthenticateRequest *v16;
  void *v17;
  void *v18;
  AMSPromise *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSPurchaseQueue dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v8;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to pre-authenticate purchase queue for device restrictions", buf, 0x16u);

  }
  v10 = objc_alloc_init(AMSAuthenticateOptions);
  -[AMSAuthenticateOptions setAuthenticationType:](v10, "setAuthenticationType:", 2);
  -[AMSAuthenticateOptions setCanMakeAccountActive:](v10, "setCanMakeAccountActive:", 0);
  objc_msgSend(v4, "purchaseInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateOptions setClientInfo:](v10, "setClientInfo:", v12);

  -[AMSAuthenticateOptions setDebugReason:](v10, "setDebugReason:", CFSTR("Pre-authentication due to device restrictions around purchasing."));
  v13 = [AMSAuthenticateRequest alloc];
  objc_msgSend(v4, "purchaseInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AMSAuthenticateRequest initWithAccount:options:](v13, "initWithAccount:options:", v15, v10);

  AMSLogKey();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSAuthenticateRequest setLogKey:](v16, "setLogKey:", v17);

  objc_msgSend(v4, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = objc_alloc_init(AMSPromise);
    v20 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __59__AMSPurchaseQueue__performPreauthenticateForPurchaseTask___block_invoke;
    v26[3] = &unk_1E2544FA8;
    v26[4] = self;
    -[AMSPromise addSuccessBlock:](v19, "addSuccessBlock:", v26);
    v25[0] = v20;
    v25[1] = 3221225472;
    v25[2] = __59__AMSPurchaseQueue__performPreauthenticateForPurchaseTask___block_invoke_28;
    v25[3] = &unk_1E253E120;
    v25[4] = self;
    -[AMSPromise addErrorBlock:](v19, "addErrorBlock:", v25);
    objc_msgSend(v4, "purchaseInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "purchase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSPromise completionHandlerAdapter](v19, "completionHandlerAdapter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "purchase:handleAuthenticateRequest:completion:", v22, v16, v23);

  }
  else
  {
    AMSError(12, CFSTR("Purchase Authentication Failed"), CFSTR("Delegate does not respond to auth callback"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v21);
    v19 = (AMSPromise *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

void __59__AMSPurchaseQueue__performPreauthenticateForPurchaseTask___block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v0, "OSLogObject");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v2 = objc_opt_class();
    AMSLogKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543618;
    v5 = v2;
    v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_18C849000, v1, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Queue pre-authentication for device restrictions succeeded.", (uint8_t *)&v4, 0x16u);

  }
}

void __59__AMSPurchaseQueue__performPreauthenticateForPurchaseTask___block_invoke_28(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Queue pre-authentication for device restrictions failed with error: %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

- (BOOL)isSuspended
{
  NSObject *v3;

  -[AMSPurchaseQueue dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  NSObject *v5;

  -[AMSPurchaseQueue dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_suspended = a3;
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[AMSPurchaseQueue config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSPurchaseQueue config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleAuthenticateRequest:purchase:purchaseQueue:completion:", v8, v15, self, v9);

    v9 = v14;
  }
  else
  {
    AMSError(12, CFSTR("Purchase Batch Failed"), CFSTR("Delegate method for authentications not found"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);
  }

}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[AMSPurchaseQueue config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSPurchaseQueue config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleDialogRequest:purchase:purchaseQueue:completion:", v8, v15, self, v9);

    v9 = v14;
  }
  else
  {
    AMSError(12, CFSTR("Purchase Batch Failed"), CFSTR("Delegate method for dialogs not found"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);
  }

}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[AMSPurchaseQueue config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[AMSPurchaseQueue config](self, "config");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleEngagementRequest:purchase:purchaseQueue:completion:", v8, v15, self, v9);

    v9 = v14;
  }
  else
  {
    AMSError(12, CFSTR("Purchase Batch Failed"), CFSTR("Delegate method for engagement not found"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);
  }

}

- (AMSPurchaseQueueConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (AMSPurchaseQueueBatchList)batches
{
  return self->_batches;
}

- (void)setBatches:(id)a3
{
  objc_storeStrong((id *)&self->_batches, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (AMSThreadSafeSet)preAuthenticatedDSIDs
{
  return self->_preAuthenticatedDSIDs;
}

- (void)setPreAuthenticatedDSIDs:(id)a3
{
  objc_storeStrong((id *)&self->_preAuthenticatedDSIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preAuthenticatedDSIDs, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_batches, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
