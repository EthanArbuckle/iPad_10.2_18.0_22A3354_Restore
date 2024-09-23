@implementation SKPaymentQueue

BOOL __41__SKPaymentQueue_addTransactionObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(a2, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
    *a4 = 1;
  return v6 == v7;
}

- (void)_updatedTransactions:(id)a3 restored:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  SKPaymentTransaction *v21;
  SKPaymentTransaction *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  SKPaymentTransaction *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id obj;
  _BOOL4 v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[4];
  SKPaymentTransaction *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  SKPaymentTransaction *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v39 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = *((id *)self->_internal + 6);
  objc_sync_enter(v35);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v8 = *((id *)self->_internal + 5);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v12, "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "UUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v14);

        }
        objc_msgSend(v12, "transactionIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v12, "transactionIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v16);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v9);
  }

  v47 = 0u;
  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  obj = v5;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v45 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        v21 = -[SKPaymentTransaction initWithServerTransaction:]([SKPaymentTransaction alloc], "initWithServerTransaction:", v20);
        v22 = v21;
        if (v39)
        {
          -[SKPaymentTransaction originalTransaction](v21, "originalTransaction");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v24 = -[SKPaymentTransaction transactionState](v22, "transactionState") == SKPaymentTransactionStatePurchased;

            if (v24)
              -[SKPaymentTransaction _setTransactionState:](v22, "_setTransactionState:", 3);
          }
        }
        -[SKPaymentTransaction UUID](v22, "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25
          || (-[SKPaymentTransaction UUID](v22, "UUID"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v7, "objectForKeyedSubscript:", v26),
              v27 = (SKPaymentTransaction *)objc_claimAutoreleasedReturnValue(),
              v26,
              !v27))
        {
          -[SKPaymentTransaction transactionIdentifier](v22, "transactionIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28
            || (-[SKPaymentTransaction transactionIdentifier](v22, "transactionIdentifier"),
                v29 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v6, "objectForKeyedSubscript:", v29),
                v27 = (SKPaymentTransaction *)objc_claimAutoreleasedReturnValue(),
                v29,
                !v27))
          {
            v30 = (void *)*((_QWORD *)self->_internal + 6);
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __48__SKPaymentQueue__updatedTransactions_restored___block_invoke;
            v42[3] = &unk_1E5B27808;
            v43 = v22;
            v31 = objc_msgSend(v30, "indexOfObjectPassingTest:", v42);
            if (v31 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v27 = 0;
            }
            else
            {
              objc_msgSend(*((id *)self->_internal + 6), "objectAtIndexedSubscript:", v31);
              v27 = (SKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
            }

          }
        }
        v32 = -[SKPaymentTransaction transactionState](v22, "transactionState");
        if (v32 == -[SKPaymentTransaction transactionState](v27, "transactionState")
          || -[SKPaymentTransaction transactionState](v27, "transactionState") == SKPaymentTransactionStatePurchasing
          || -[SKPaymentTransaction transactionState](v27, "transactionState") == SKPaymentTransactionStateDeferred)
        {
          if (v27)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v53 = v27;
              _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Updating existing transaction %{public}@", buf, 0xCu);
            }
            if (-[SKPaymentTransaction mergeWithTransaction:](v27, "mergeWithTransaction:", v22))
              objc_msgSend(v37, "addObject:", v27);
            goto LABEL_44;
          }
        }
        else
        {

        }
        objc_msgSend(v20, "objectForKeyedSubscript:", 0x1E5B2E1E0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && objc_msgSend(*((id *)self->_internal + 2), "isEqualToString:", v33))
        {
          objc_msgSend(*((id *)self->_internal + 5), "addObject:", v22);
          objc_msgSend(*((id *)self->_internal + 6), "addObject:", v22);
          objc_msgSend(v37, "addObject:", v22);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v53 = v22;
            _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "New transaction added to queue %{public}@", buf, 0xCu);
          }
        }

        v27 = 0;
LABEL_44:

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v17);
  }

  objc_sync_exit(v35);
  if (objc_msgSend(v37, "count"))
  {
    v36 = *((id *)self->_internal + 8);
    objc_sync_enter(v36);
    v34 = (void *)*((_QWORD *)self->_internal + 8);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __48__SKPaymentQueue__updatedTransactions_restored___block_invoke_91;
    v40[3] = &unk_1E5B278A8;
    v40[4] = self;
    v41 = v37;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v40);

    objc_sync_exit(v36);
  }

}

- (SKStorefront)storefront
{
  id v3;
  id v4;

  v3 = *((id *)self->_internal + 8);
  objc_sync_enter(v3);
  v4 = *((id *)self->_internal + 7);
  objc_sync_exit(v3);

  return (SKStorefront *)v4;
}

- (void)addTransactionObserver:(id)observer
{
  id v4;
  SKWeakReference *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = observer;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot add nil observer"));
  v5 = -[SKWeakReference initWithObject:]([SKWeakReference alloc], "initWithObject:", v4);
  v6 = *((id *)self->_internal + 8);
  objc_sync_enter(v6);
  v7 = (void *)*((_QWORD *)self->_internal + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__SKPaymentQueue_addTransactionObserver___block_invoke;
  v9[3] = &unk_1E5B27808;
  v8 = v4;
  v10 = v8;
  if (objc_msgSend(v7, "indexOfObjectPassingTest:", v9) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*((id *)self->_internal + 8), "addObject:", v5);
    if (objc_msgSend(*((id *)self->_internal + 8), "count") == 1)
    {
      -[SKPaymentQueue _checkServerQueueForced:](self, "_checkServerQueueForced:", 0);
      -[SKPaymentQueue _checkForMessages](self, "_checkForMessages");
      -[SKPaymentQueue listenForPurchaseIntents](self, "listenForPurchaseIntents");
    }
  }

  objc_sync_exit(v6);
}

- (void)_checkServerQueueForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = a3;
  if (objc_msgSend(*((id *)self->_internal + 8), "count"))
  {
    +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__SKPaymentQueue__checkServerQueueForced___block_invoke;
    v11[3] = &unk_1E5B26708;
    v11[4] = self;
    objc_msgSend(v5, "storeKitServiceWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKPaymentQueue paymentQueueClient](self, "paymentQueueClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "plist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __42__SKPaymentQueue__checkServerQueueForced___block_invoke_74;
    v10[3] = &unk_1E5B26730;
    v10[4] = self;
    objc_msgSend(v7, "checkServerQueueForClientIfNecessary:forceCheck:reply:", v9, v3, v10);

  }
}

- (SKPaymentQueueClient)paymentQueueClient
{
  return (SKPaymentQueueClient *)*((id *)self->_internal + 3);
}

- (void)_checkForMessages
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SKPaymentQueue__checkForMessages__block_invoke;
  v5[3] = &unk_1E5B26708;
  v5[4] = self;
  objc_msgSend(v3, "storeKitServiceWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "checkForMessages");
}

uint64_t __30__SKPaymentQueue_defaultQueue__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id *v3;
  void *v4;
  void *v5;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultQueue_sSharedQueue;
  defaultQueue_sSharedQueue = (uint64_t)v1;

  v3 = (id *)*(id *)(defaultQueue_sSharedQueue + 8);
  +[SKClientBroker defaultBroker](SKClientBroker, "defaultBroker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterClientWithIdentifier:", v3[2]);

  objc_storeStrong(v3 + 2, CFSTR("DefaultQueue"));
  +[SKClientBroker defaultBroker](SKClientBroker, "defaultBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClient:withIdentifier:", defaultQueue_sSharedQueue, 0x1E5B2E0E0);

  return +[SKPaymentQueue listenForStorefrontChanges](SKPaymentQueue, "listenForStorefrontChanges");
}

- (id)_initSKPaymentQueue
{
  SKPaymentQueue *v2;
  SKPaymentQueueInternal *v3;
  id internal;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKPaymentQueue;
  v2 = -[SKPaymentQueue init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKPaymentQueueInternal);
    internal = v2->_internal;
    v2->_internal = v3;

    +[SKClientBroker defaultBroker](SKClientBroker, "defaultBroker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerClient:withIdentifier:", v2, *((_QWORD *)v2->_internal + 2));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x1E0DC4860], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__applicationDidBecomeActiveNotification_, *MEMORY[0x1E0DC4750], 0);

  }
  return v2;
}

+ (SKPaymentQueue)defaultQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SKPaymentQueue_defaultQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultQueue_sSharedInstanceOnce != -1)
    dispatch_once(&defaultQueue_sSharedInstanceOnce, block);
  return (SKPaymentQueue *)(id)defaultQueue_sSharedQueue;
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  if (*((_BYTE *)self->_internal + 9))
  {
    -[SKPaymentQueue _checkServerQueueForced:](self, "_checkServerQueueForced:", 1);
    *((_BYTE *)self->_internal + 9) = 0;
  }
}

- (void)listenForPurchaseIntents
{
  SKPaymentQueue *v2;

  v2 = self;
  sub_1ABFC3174();

}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DistributedCenter;
  void *v5;
  objc_super v6;

  +[SKClientBroker defaultBroker](SKClientBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterClientWithIdentifier:", *((_QWORD *)self->_internal + 2));

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, (CFNotificationName)*MEMORY[0x1E0DAFE08], 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4750], 0);

  v6.receiver = self;
  v6.super_class = (Class)SKPaymentQueue;
  -[SKPaymentQueue dealloc](&v6, sel_dealloc);
}

+ (BOOL)canMakePayments
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  char v10;
  char v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  int v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "applicationHasMIDBasedSINF") ^ 1;
  else
    v4 = 1;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47098]);

  v7 = objc_msgSend(MEMORY[0x1E0DC3470], "isRunningInStoreDemoMode");
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isOnDeviceAppInstallationAllowed");

  if (v6 == 2)
    v10 = 0;
  else
    v10 = v4;
  v11 = v10 & ~(_BYTE)v7 & v9;
  if ((v11 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("NO");
    if (v7)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v17 = 138544386;
    v18 = a1;
    if (v4)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v19 = 2114;
    v20 = v13;
    if (v6 == 2)
      v15 = CFSTR("NO");
    else
      v15 = CFSTR("YES");
    v21 = 2114;
    v22 = v14;
    if (v9)
      v12 = CFSTR("YES");
    v23 = 2114;
    v24 = v15;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Payments not allowed. demoMode: %{public}@ appAllowed: %{public}@ iapAllowed: %{public}@ appInstallAllowed: %{public}@", (uint8_t *)&v17, 0x34u);
  }

  return v11;
}

- (void)addPayment:(SKPayment *)payment
{
  SKPayment *v4;
  SKPayment *v5;
  void *v6;
  uint64_t v7;
  SKPaymentTransaction *v8;
  id v9;
  void *v10;
  SKPaymentTransaction *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  void *v24;
  SKPaymentTransaction *v25;
  void *v26;
  _QWORD v27[4];
  SKPaymentTransaction *v28;
  uint8_t buf[4];
  SKPaymentQueue *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = payment;
  v5 = v4;
  if (v4)
  {
    -[SKPayment productIdentifier](v4, "productIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      if (-[SKPayment quantity](v5, "quantity") <= 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid quantity: %ld"), -[SKPayment quantity](v5, "quantity"));
      }
      else
      {
        v8 = -[SKPaymentTransaction initWithPayment:]([SKPaymentTransaction alloc], "initWithPayment:", v5);
        v9 = *((id *)self->_internal + 6);
        objc_sync_enter(v9);
        v10 = (void *)*((_QWORD *)self->_internal + 6);
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __29__SKPaymentQueue_addPayment___block_invoke;
        v27[3] = &unk_1E5B27808;
        v11 = v8;
        v28 = v11;
        v12 = objc_msgSend(v10, "indexOfObjectPassingTest:", v27);
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(*((id *)self->_internal + 5), "addObject:", v11);
          objc_msgSend(*((id *)self->_internal + 6), "addObject:", v11);
          v13 = 1;
        }
        else
        {
          v16 = MEMORY[0x1E0C81028];
          v17 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            -[SKPayment productIdentifier](v5, "productIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v30 = self;
            v31 = 2114;
            v32 = (uint64_t)v18;
            _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Payment added for transaction already in the SKPaymentQueue: %{public}@", buf, 0x16u);

          }
          objc_msgSend(*((id *)self->_internal + 6), "objectAtIndexedSubscript:", v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "transactionState");
          if (v20 == 2 || v20 == 4)
          {
            v21 = MEMORY[0x1E0C81028];
            v22 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v23 = objc_msgSend(v19, "transactionState");
              -[SKPayment productIdentifier](v5, "productIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v30 = self;
              v31 = 2048;
              v32 = v23;
              v33 = 2114;
              v34 = v24;
              _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Reprocessing transaction with state %ld: %{public}@", buf, 0x20u);

            }
            objc_msgSend(*((id *)self->_internal + 5), "removeObjectAtIndex:", v12);
            objc_msgSend(*((id *)self->_internal + 6), "removeObjectAtIndex:", v12);
            objc_msgSend(*((id *)self->_internal + 5), "addObject:", v11);
            objc_msgSend(*((id *)self->_internal + 6), "addObject:", v11);
            v13 = 1;
          }
          else
          {
            v25 = v19;

            v13 = 0;
            v11 = v25;
          }

        }
        objc_sync_exit(v9);

        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKPaymentQueue _notifyObserversAboutChanges:sendUpdatedDownloads:](self, "_notifyObserversAboutChanges:sendUpdatedDownloads:", v26, 0);

        if (v13)
          -[SKPaymentQueue _processTransaction:](self, "_processTransaction:", v11);

      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C99DA0];
      -[SKPayment productIdentifier](v5, "productIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid product identifier: %@"), v15);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = self;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot add nil payment to SKPaymentQueue", buf, 0xCu);
  }

}

BOOL __29__SKPaymentQueue_addPayment___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "payment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "productIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "productIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "payment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "quantity");
    objc_msgSend(v6, "payment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12 == objc_msgSend(v13, "quantity");

  }
  else
  {
    v14 = 0;
  }

  *a4 = v14;
  return v14;
}

- (NSArray)transactionObservers
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *((id *)self->_internal + 8);
  objc_sync_enter(v3);
  v4 = (void *)*((_QWORD *)self->_internal + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SKPaymentQueue_transactionObservers__block_invoke;
  v7[3] = &unk_1E5B27830;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  objc_sync_exit(v3);

  v5 = (void *)objc_msgSend((id)v9[5], "copy");
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __38__SKPaymentQueue_transactionObservers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v3 = v4;
  }

}

- (void)cancelDownloads:(NSArray *)downloads
{
  NSArray *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = downloads;
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __34__SKPaymentQueue_cancelDownloads___block_invoke;
  v21[3] = &unk_1E5B26708;
  v21[4] = self;
  objc_msgSend(v5, "storeKitServiceWithErrorHandler:", v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!objc_msgSend(v12, "state", (_QWORD)v17)
          || objc_msgSend(v12, "state") == 1
          || objc_msgSend(v12, "state") == 2)
        {
          v13 = (void *)*((_QWORD *)self->_internal + 4);
          objc_msgSend(v12, "_downloadID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v12, "_downloadID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "cancelDownloadWithID:", v16);

          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }

}

void __34__SKPaymentQueue_cancelDownloads___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __34__SKPaymentQueue_cancelDownloads___block_invoke_cold_1();
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)self->_internal + 12);
}

- (void)finishTransaction:(SKPaymentTransaction *)transaction
{
  SKPaymentTransaction *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  SKPaymentTransaction *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  SKPaymentTransaction *v21;
  _QWORD v22[5];
  SKPaymentTransaction *v23;
  uint8_t buf[4];
  SKPaymentQueue *v25;
  __int16 v26;
  SKPaymentTransaction *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = transaction;
  if (-[SKPaymentTransaction transactionState](v4, "transactionState"))
  {
    -[SKPaymentTransaction downloads](v4, "downloads");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[SKPaymentTransaction downloads](v4, "downloads");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKPaymentQueue cancelDownloads:](self, "cancelDownloads:", v7);

    }
    -[SKPaymentTransaction transactionIdentifier](v4, "transactionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (-[SKPaymentTransaction transactionState](v4, "transactionState") == SKPaymentTransactionStateFailed)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[SKPaymentQueue finishTransaction:].cold.1((uint64_t)self, (uint64_t)v4, v9, v10, v11, v12, v13, v14);
        -[SKPaymentQueue _removeLocalTransaction:](self, "_removeLocalTransaction:", v4);
        -[SKPaymentQueue _checkServerQueueForced:](self, "_checkServerQueueForced:", 1);
      }
      else
      {
        +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = MEMORY[0x1E0C809B0];
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __36__SKPaymentQueue_finishTransaction___block_invoke;
        v22[3] = &unk_1E5B27858;
        v22[4] = self;
        v17 = v4;
        v23 = v17;
        objc_msgSend(v15, "storeKitServiceWithErrorHandler:", v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[SKPaymentTransaction transactionIdentifier](v17, "transactionIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v16;
        v20[1] = 3221225472;
        v20[2] = __36__SKPaymentQueue_finishTransaction___block_invoke_34;
        v20[3] = &unk_1E5B27858;
        v20[4] = self;
        v21 = v17;
        objc_msgSend(v18, "finishPaymentWithIdentifier:reply:", v19, v20);

      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v25 = self;
        v26 = 2114;
        v27 = v4;
        _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Finishing transaction %{public}@ with no identifier", buf, 0x16u);
      }
      -[SKPaymentQueue _removeLocalTransaction:](self, "_removeLocalTransaction:", v4);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot finish a purchasing transaction"));
  }

}

void __36__SKPaymentQueue_finishTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __36__SKPaymentQueue_finishTransaction___block_invoke_cold_1();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "payment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_logEventWithPrimaryError:mappedError:inAppPurchaseID:userAction:", v3, 0, v6, 4);

}

void __36__SKPaymentQueue_finishTransaction___block_invoke_34(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_removeLocalTransaction:", *(_QWORD *)(a1 + 40));
  if (v6)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "payment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_logEventWithPrimaryError:mappedError:inAppPurchaseID:userAction:", v6, 0, v5, 4);

  }
}

- (void)pauseDownloads:(NSArray *)downloads
{
  NSArray *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = downloads;
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __33__SKPaymentQueue_pauseDownloads___block_invoke;
  v21[3] = &unk_1E5B26708;
  v21[4] = self;
  objc_msgSend(v5, "storeKitServiceWithErrorHandler:", v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!objc_msgSend(v12, "state", (_QWORD)v17) || objc_msgSend(v12, "state") == 1)
        {
          v13 = (void *)*((_QWORD *)self->_internal + 4);
          objc_msgSend(v12, "_downloadID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v12, "_downloadID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "pauseDownloadWithID:", v16);

          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }

}

void __33__SKPaymentQueue_pauseDownloads___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __33__SKPaymentQueue_pauseDownloads___block_invoke_cold_1();
}

- (void)removeTransactionObserver:(id)observer
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = observer;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot remove nil observer"));
  v5 = *((id *)self->_internal + 8);
  objc_sync_enter(v5);
  v6 = (void *)*((_QWORD *)self->_internal + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__SKPaymentQueue_removeTransactionObserver___block_invoke;
  v9[3] = &unk_1E5B27808;
  v8 = v4;
  v10 = v8;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v9);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*((id *)self->_internal + 8), "removeObjectAtIndex:", v7);
    if (!objc_msgSend(*((id *)self->_internal + 8), "count"))
      -[SKPaymentQueue stopListeningForPurchaseIntents](self, "stopListeningForPurchaseIntents");
  }

  objc_sync_exit(v5);
}

BOOL __44__SKPaymentQueue_removeTransactionObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(a2, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
    *a4 = 1;
  return v6 == v7;
}

- (void)restoreCompletedTransactions
{
  -[SKPaymentQueue restoreCompletedTransactionsWithApplicationUsername:](self, "restoreCompletedTransactionsWithApplicationUsername:", 0);
}

- (void)restoreCompletedTransactionsWithApplicationUsername:(NSString *)username
{
  NSString *v4;
  id v5;
  _BYTE *internal;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  SKPaymentQueue *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = username;
  v5 = self->_internal;
  objc_sync_enter(v5);
  internal = self->_internal;
  if (internal[12])
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring restore transactions request because transactions are already being restored", buf, 0xCu);
    }
  }
  else
  {
    internal[12] = 1;
    +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke;
    v13[3] = &unk_1E5B26708;
    v13[4] = self;
    objc_msgSend(v7, "storeKitServiceWithErrorHandler:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKPaymentQueue paymentQueueClient](self, "paymentQueueClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "plist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_3;
    v12[3] = &unk_1E5B26730;
    v12[4] = self;
    objc_msgSend(v9, "restoreCompletedTransactionsForUsername:client:reply:", v4, v11, v12);

  }
  objc_sync_exit(v5);

}

void __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_cold_1();
  _SKErrorFromNSError(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_logEventWithPrimaryError:mappedError:inAppPurchaseID:userAction:", v3, v4, 0, 1);
  v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
  objc_sync_enter(v5);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(v6 + 8) + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_37;
  v10[3] = &unk_1E5B278A8;
  v10[4] = v6;
  v8 = v4;
  v11 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  objc_sync_exit(v5);
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_sync_enter(v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 12) = 0;
  objc_sync_exit(v9);

}

void __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_37(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_2;
    block[3] = &unk_1E5B27880;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    dispatch_async(v4, block);

  }
}

uint64_t __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentQueue:restoreCompletedTransactionsFailedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_updatedTransactions:restored:", v12, 1);
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
  objc_sync_enter(v6);
  if (v5)
  {
    _SKErrorFromNSError(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_logEventWithPrimaryError:mappedError:inAppPurchaseID:userAction:", v5, v7, 0, 1);
  }
  else
  {
    v7 = 0;
  }
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_4;
  v13[3] = &unk_1E5B278A8;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  objc_sync_exit(v6);
  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  objc_sync_enter(v11);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 12) = 0;
  objc_sync_exit(v11);

}

void __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_4(int8x16_t *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  int8x16_t v10;
  _QWORD v11[4];
  _QWORD v12[2];
  _QWORD block[4];
  id v14;
  int8x16_t v15;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[2].i64[0])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = *(NSObject **)(*(_QWORD *)(a1[2].i64[1] + 8) + 72);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_5;
      block[3] = &unk_1E5B27880;
      v5 = &v14;
      v14 = v3;
      v10 = a1[2];
      v6 = (id)v10.i64[0];
      v15 = vextq_s8(v10, v10, 8uLL);
      dispatch_async(v4, block);

LABEL_6:
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1[2].i64[1] + 8) + 72);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_6;
    v11[3] = &unk_1E5B27350;
    v5 = (id *)v12;
    v8 = v3;
    v9 = a1[2].i64[1];
    v12[0] = v8;
    v12[1] = v9;
    dispatch_async(v7, v11);
    goto LABEL_6;
  }

}

uint64_t __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentQueue:restoreCompletedTransactionsFailedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentQueueRestoreCompletedTransactionsFinished:", *(_QWORD *)(a1 + 40));
}

- (void)resumeDownloads:(NSArray *)downloads
{
  NSArray *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = downloads;
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __34__SKPaymentQueue_resumeDownloads___block_invoke;
  v21[3] = &unk_1E5B26708;
  v21[4] = self;
  objc_msgSend(v5, "storeKitServiceWithErrorHandler:", v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "state", (_QWORD)v17) == 2)
        {
          v13 = (void *)*((_QWORD *)self->_internal + 4);
          objc_msgSend(v12, "_downloadID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v12, "_downloadID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "resumeDownloadWithID:", v16);

          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }

}

void __34__SKPaymentQueue_resumeDownloads___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __34__SKPaymentQueue_resumeDownloads___block_invoke_cold_1();
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)self->_internal + 12, delegate);
}

- (void)showPriceConsentIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SKPaymentQueue_showPriceConsentIfNeeded__block_invoke;
  v5[3] = &unk_1E5B26708;
  v5[4] = self;
  objc_msgSend(v3, "storeKitServiceWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "displayMessageWithType:", &unk_1E5B4A218);
}

void __42__SKPaymentQueue_showPriceConsentIfNeeded__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __42__SKPaymentQueue_showPriceConsentIfNeeded__block_invoke_cold_1();
}

- (void)presentCodeRedemptionSheet
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SKPaymentQueue_presentCodeRedemptionSheet__block_invoke;
  v5[3] = &unk_1E5B26708;
  v5[4] = self;
  objc_msgSend(v3, "storeKitServiceWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  *((_BYTE *)self->_internal + 9) = 1;
  objc_msgSend(v4, "presentCodeRedemptionSheet");

}

void __44__SKPaymentQueue_presentCodeRedemptionSheet__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __44__SKPaymentQueue_presentCodeRedemptionSheet__block_invoke_cold_1();
}

- (void)startDownloads:(NSArray *)downloads
{
  NSArray *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  NSArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  uint8_t buf[4];
  SKPaymentQueue *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = downloads;
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __33__SKPaymentQueue_startDownloads___block_invoke;
  v26[3] = &unk_1E5B26708;
  v26[4] = self;
  objc_msgSend(v5, "storeKitServiceWithErrorHandler:", v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v23;
    *(_QWORD *)&v8 = 138543874;
    v20 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "state", v20);
        if (v13 > 5 || ((1 << v13) & 0x31) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v18 = objc_msgSend(v12, "state");
            *(_DWORD *)buf = v20;
            v28 = self;
            v29 = 2114;
            v30 = v12;
            v31 = 2048;
            v32 = v18;
            _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring download %{public}@ in state %ld.", buf, 0x20u);
          }
        }
        else
        {
          v15 = (void *)*((_QWORD *)self->_internal + 4);
          objc_msgSend(v12, "_downloadID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v16);

          objc_msgSend(v12, "_downloadID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addDownloadWithID:", v17);

        }
        ++v11;
      }
      while (v9 != v11);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
      v9 = v19;
    }
    while (v19);
  }

}

void __33__SKPaymentQueue_startDownloads___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __33__SKPaymentQueue_startDownloads___block_invoke_cold_1();
}

- (NSArray)transactions
{
  id v3;
  void *v4;

  v3 = *((id *)self->_internal + 6);
  objc_sync_enter(v3);
  v4 = (void *)objc_msgSend(*((id *)self->_internal + 6), "copy");
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (SKPaymentQueue)initWithPaymentQueueClient:(id)a3
{
  id v4;
  SKPaymentQueue *v5;
  uint64_t v6;
  _QWORD *internal;
  void *v8;

  v4 = a3;
  v5 = -[SKPaymentQueue _initSKPaymentQueue](self, "_initSKPaymentQueue");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    internal = v5->_internal;
    v8 = (void *)internal[3];
    internal[3] = v6;

  }
  return v5;
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[SKPaymentQueue paymentQueueClient](self, "paymentQueueClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "handleEngagementRequest:resultHandler:", v10, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);

  }
}

- (void)askToShowMessageWithReplyBlock:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void (**v8)(id, _QWORD, uint64_t);

  v8 = (void (**)(id, _QWORD, uint64_t))a3;
  -[SKPaymentQueue delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SKPaymentQueue delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "paymentQueueShouldShowPriceConsent:", self);

  }
  else
  {
    v7 = 1;
  }
  v8[2](v8, v5 & 1, v7);

}

- (void)updatedTransactions:(id)a3
{
  -[SKPaymentQueue _updatedTransactions:restored:](self, "_updatedTransactions:restored:", a3, 0);
}

- (void)removedTransactions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id obj;
  id obja;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  obj = *((id *)self->_internal + 6);
  objc_sync_enter(obj);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v5);
        v9 = 0;
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        while (objc_msgSend(*((id *)self->_internal + 6), "count") > v9)
        {
          objc_msgSend(*((id *)self->_internal + 6), "objectAtIndexedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v10);

          if (v13)
          {
            objc_msgSend(v18, "addObject:", v11);
            objc_msgSend(v17, "addIndex:", v9);

            break;
          }

          ++v9;
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v17, "count"))
    objc_msgSend(*((id *)self->_internal + 6), "removeObjectsAtIndexes:", v17);
  objc_sync_exit(obj);

  if (objc_msgSend(v18, "count"))
  {
    obja = *((id *)self->_internal + 8);
    objc_sync_enter(obja);
    v14 = (void *)*((_QWORD *)self->_internal + 8);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __38__SKPaymentQueue_removedTransactions___block_invoke;
    v19[3] = &unk_1E5B278A8;
    v19[4] = self;
    v20 = v18;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);

    objc_sync_exit(obja);
  }

}

void __38__SKPaymentQueue_removedTransactions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__SKPaymentQueue_removedTransactions___block_invoke_2;
    block[3] = &unk_1E5B27880;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    dispatch_async(v4, block);

  }
}

void __38__SKPaymentQueue_removedTransactions___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v1, "paymentQueue:removedTransactions:", v2, v3);

}

- (void)downloadAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)*((_QWORD *)self->_internal + 4);
  v11 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E320);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_setDownloadState:", 0);
  v8 = *((id *)self->_internal + 8);
  objc_sync_enter(v8);
  v9 = (void *)*((_QWORD *)self->_internal + 8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__SKPaymentQueue_downloadAdded___block_invoke;
  v12[3] = &unk_1E5B278A8;
  v12[4] = self;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  objc_sync_exit(v8);
}

void __32__SKPaymentQueue_downloadAdded___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__SKPaymentQueue_downloadAdded___block_invoke_2;
    block[3] = &unk_1E5B27880;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    dispatch_async(v4, block);

  }
}

void __32__SKPaymentQueue_downloadAdded___block_invoke_2(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "paymentQueue:updatedDownloads:", v2, v3);

}

- (void)downloadStatusChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  double v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  id v38;
  _QWORD v39[5];
  id v40;

  v38 = a3;
  objc_msgSend(v38, "objectForKeyedSubscript:", 0x1E5B2E320);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", 0x1E5B2E360);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*((id *)self->_internal + 4), "objectForKeyedSubscript:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "_setContentURL:", 0);
        objc_msgSend(v6, "_setError:", 0);
        objc_msgSend(v6, "_setTimeRemaining:", SKDownloadTimeRemainingUnknown);
        objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E5B2E2C0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "intValue");

        if (v8 != 4)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isFailed"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "BOOLValue");

          if (!v10)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isCancelled"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "BOOLValue");

            if (v23)
            {
              objc_msgSend(v6, "_setDownloadState:", 5);
              LODWORD(v24) = 1.0;
              objc_msgSend(v6, "_setProgress:", v24);
LABEL_20:
              v26 = *((id *)self->_internal + 8);
              objc_sync_enter(v26);
              v27 = (void *)*((_QWORD *)self->_internal + 8);
              v39[0] = MEMORY[0x1E0C809B0];
              v39[1] = 3221225472;
              v39[2] = __40__SKPaymentQueue_downloadStatusChanged___block_invoke;
              v39[3] = &unk_1E5B278A8;
              v39[4] = self;
              v6 = v6;
              v40 = v6;
              objc_msgSend(v27, "enumerateObjectsUsingBlock:", v39);

              objc_sync_exit(v26);
              goto LABEL_21;
            }
            if (v8 == 2
              || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isPaused")),
                  v28 = (void *)objc_claimAutoreleasedReturnValue(),
                  v29 = objc_msgSend(v28, "BOOLValue"),
                  v28,
                  v29))
            {
              objc_msgSend(v6, "_setDownloadState:", 2);
              objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E5B2E340);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "doubleValue");
              *(float *)&v30 = v30;
              objc_msgSend(v6, "_setProgress:", v30);
            }
            else
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E5B2E340);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "doubleValue");
              v33 = v32;

              if (v8 == 3 || (v34 = 1.0 - v33, 1.0 - v33 < 0.0001))
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E5B2E3A0, v34);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v35, "length"))
                {
                  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v35, 1);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "_setContentURL:", v36);

                }
                objc_msgSend(v6, "_setDownloadState:", 3);

              }
              else
              {
                objc_msgSend(v6, "_setDownloadState:", 1, v34);
              }
              objc_msgSend(v6, "_setError:", 0);
              *(float *)&v37 = v33;
              objc_msgSend(v6, "_setProgress:", v37);
              objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E5B2E380);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "doubleValue");
              objc_msgSend(v6, "_setTimeRemaining:");
            }
LABEL_19:

            goto LABEL_20;
          }
        }
        objc_msgSend(v6, "_setDownloadState:", 4);
        LODWORD(v11) = 1.0;
        objc_msgSend(v6, "_setProgress:", v11);
        objc_msgSend(v5, "objectForKeyedSubscript:", 0x1E5B2E1A0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = v12;
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("domain"));
            v13 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("code"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "integerValue");

            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("userInfo"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v13, v18, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            _SKErrorFromNSError(v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "_setError:", v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
            v13 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "_setError:", v13);
          }
          goto LABEL_18;
        }
        v13 = v12;
        objc_msgSend(v13, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
        {
          v15 = objc_msgSend(v13, "code");

          if (v15 == 3072)
          {
            objc_msgSend(v6, "_setDownloadState:", 5);
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {

        }
        _SKErrorFromNSError(v13);
        v25 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "_setError:", v25);
        v13 = (id)v25;
        goto LABEL_18;
      }
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_21:

}

void __40__SKPaymentQueue_downloadStatusChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__SKPaymentQueue_downloadStatusChanged___block_invoke_2;
    block[3] = &unk_1E5B27880;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    dispatch_async(v4, block);

  }
}

void __40__SKPaymentQueue_downloadStatusChanged___block_invoke_2(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "paymentQueue:updatedDownloads:", v2, v3);

}

- (void)downloadRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = (void *)*((_QWORD *)self->_internal + 4);
  v10 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E5B2E320);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "state") != 3 && objc_msgSend(v7, "state") != 4 && objc_msgSend(v7, "state") != 5)
  {
    objc_msgSend(v7, "_setDownloadState:", 5);
    v8 = *((id *)self->_internal + 8);
    objc_sync_enter(v8);
    v9 = (void *)*((_QWORD *)self->_internal + 8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __34__SKPaymentQueue_downloadRemoved___block_invoke;
    v11[3] = &unk_1E5B278A8;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

    objc_sync_exit(v8);
  }

}

void __34__SKPaymentQueue_downloadRemoved___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__SKPaymentQueue_downloadRemoved___block_invoke_2;
    block[3] = &unk_1E5B27880;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    dispatch_async(v4, block);

  }
}

void __34__SKPaymentQueue_downloadRemoved___block_invoke_2(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "paymentQueue:updatedDownloads:", v2, v3);

}

- (void)shouldContinueTransaction:(id)a3 withNewStorefront:(id)a4 replyBlock:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  id WeakRetained;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id obj;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v23 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  WeakRetained = objc_loadWeakRetained((id *)self->_internal + 12);
  objc_sync_enter(WeakRetained);
  v24 = objc_loadWeakRetained((id *)self->_internal + 12);
  objc_sync_exit(WeakRetained);

  v22 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", 0x1E5B2E200);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = 1;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v24 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    obj = *((id *)self->_internal + 6);
    objc_sync_enter(obj);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = *((id *)self->_internal + 6);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v17, "UUID", obj);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v11);

          if (v19)
          {
            -[SKPaymentQueue storefront](self, "storefront");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v24, "paymentQueue:shouldContinueTransaction:inStorefront:", self, v17, v20);

            goto LABEL_14;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v14)
          continue;
        break;
      }
    }
    v12 = 1;
LABEL_14:

    objc_sync_exit(obj);
  }
  v9[2](v9, v12);

}

- (void)removedEntitlementsForProductIdentifiers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = *((id *)self->_internal + 8);
  objc_sync_enter(v5);
  v6 = (void *)*((_QWORD *)self->_internal + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__SKPaymentQueue_removedEntitlementsForProductIdentifiers___block_invoke;
  v8[3] = &unk_1E5B278A8;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  objc_sync_exit(v5);
}

void __59__SKPaymentQueue_removedEntitlementsForProductIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "object");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentQueue:didRevokeEntitlementsForProductIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  -[SKPaymentQueue _checkServerQueueForced:](self, "_checkServerQueueForced:", 0);
  if (objc_msgSend(*((id *)self->_internal + 8), "count"))
    -[SKPaymentQueue _checkForMessages](self, "_checkForMessages");
}

- (void)clearTransactions
{
  id obj;

  obj = *((id *)self->_internal + 6);
  objc_sync_enter(obj);
  objc_msgSend(*((id *)self->_internal + 5), "removeAllObjects");
  objc_msgSend(*((id *)self->_internal + 6), "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)removeTransactionWithID:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  int v20;
  _QWORD *internal;
  void *v22;
  id v23;
  void *v24;
  id obj;
  id *p_internal;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = *((id *)self->_internal + 6);
  objc_sync_enter(obj);
  v5 = (void *)objc_msgSend(*((id *)self->_internal + 5), "mutableCopy");
  v6 = (void *)objc_msgSend(*((id *)self->_internal + 6), "mutableCopy");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = *((id *)self->_internal + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v11, "transactionIdentifier", obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "removeObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v8);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = *((id *)self->_internal + 6);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v18, "transactionIdentifier", obj);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v4);

        if (v20)
          objc_msgSend(v6, "removeObject:", v18);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v15);
  }

  internal = self->_internal;
  p_internal = &self->_internal;
  v22 = (void *)internal[5];
  internal[5] = v5;
  v23 = v5;

  v24 = (void *)*((_QWORD *)*p_internal + 6);
  *((_QWORD *)*p_internal + 6) = v6;

  objc_sync_exit(obj);
}

- (id)_applyDownloadChangeset:(id)a3
{
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id obj;
  id v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(v19, "downloadID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = *((id *)self->_internal + 6);
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    v5 = 0;
    if (v21)
    {
      v20 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "downloads");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v23 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                objc_msgSend(v13, "_downloadID");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "isEqualToNumber:", v4);

                if (v15)
                {
                  objc_msgSend(v13, "_applyChangeset:", v19);
                  v16 = v13;

                  v5 = v16;
                  goto LABEL_17;
                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v10)
                continue;
              break;
            }
          }
LABEL_17:

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v21);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __35__SKPaymentQueue__checkForMessages__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __35__SKPaymentQueue__checkForMessages__block_invoke_cold_1();
}

void __42__SKPaymentQueue__checkServerQueueForced___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __42__SKPaymentQueue__checkServerQueueForced___block_invoke_cold_1();
}

uint64_t __42__SKPaymentQueue__checkServerQueueForced___block_invoke_74(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatedTransactions:restored:", a2, 0);
}

- (void)_completeRestoreWithMessage:(id)a3
{
  id v4;
  CFDictionaryRef v5;
  void *v6;
  _BYTE *internal;
  CFDictionaryRef v8;

  v4 = a3;
  objc_opt_class();
  v8 = SKXPCDictionaryCopyCFObjectWithClass(v4, "1");

  v5 = v8;
  *((_BYTE *)self->_internal + 12) = 0;
  *((_BYTE *)self->_internal + 11) = 0;
  if (v8)
  {
    SKGetErrorForData((uint64_t)v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SKPaymentQueue _notifyObserversRestoreTransactionsFailedWithError:](self, "_notifyObserversRestoreTransactionsFailedWithError:", v6);

  }
  else
  {
    internal = self->_internal;
    if (internal[10])
    {
      internal[11] = 1;
      goto LABEL_8;
    }
    -[SKPaymentQueue _notifyObserversRestoreTransactionsFinished](self, "_notifyObserversRestoreTransactionsFinished");
  }
  v5 = v8;
LABEL_8:

}

- (id)_copyDownloadIDsForDownloads:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = *MEMORY[0x1E0C99778];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "_downloadID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

        }
        else
        {

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v9, CFSTR("Invalid download: %@"), v11);
          v4 = 0;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_copyRemovalsFromUnmergedIndexSet:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v6 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
  if (v6)
  {
    v7 = v6;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "getIndexes:maxCount:inIndexRange:", v7, v5, 0);
    if (v5 >= 1)
    {
      v9 = v7;
      do
      {
        objc_msgSend(*((id *)self->_internal + 6), "objectAtIndex:", *v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_transactionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v8, "addObject:", v10);
        else
          objc_msgSend(v4, "removeIndex:", *v9);

        ++v9;
        --v5;
      }
      while (v5);
    }
    free(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_copyTransactionsFromXPCArray:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD applier[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __48__SKPaymentQueue__copyTransactionsFromXPCArray___block_invoke;
  applier[3] = &unk_1E5B26800;
  v6 = v5;
  v9 = v6;
  xpc_array_apply(v4, applier);

  return v6;
}

uint64_t __48__SKPaymentQueue__copyTransactionsFromXPCArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SKPaymentTransaction *v5;

  v4 = a3;
  v5 = -[SKPaymentTransaction initWithXPCEncoding:]([SKPaymentTransaction alloc], "initWithXPCEncoding:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  return 1;
}

- (void)_finishRefreshPayments
{
  _BYTE *internal;

  internal = self->_internal;
  if (internal[11])
  {
    internal[11] = 0;
    -[SKPaymentQueue _notifyObserversRestoreTransactionsFinished](self, "_notifyObserversRestoreTransactionsFinished");
    internal = self->_internal;
  }
  internal[10] = 0;
}

- (void)_handleConnectionDisconnect
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SKPaymentQueue__handleConnectionDisconnect__block_invoke;
  block[3] = &unk_1E5B267D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __45__SKPaymentQueue__handleConnectionDisconnect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v3 = *(void **)(v2 + 48);
    v4 = *(id *)(v2 + 40);
    objc_msgSend(v3, "removeObjectsInArray:", v4);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversAboutRemovals:", v4);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v7 + 12))
  {
    *(_BYTE *)(v7 + 12) = 0;
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_notifyObserversRestoreTransactionsFailedWithError:", v9);

  }
}

- (void)_handleMessage:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  SKPaymentQueue *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SKPaymentQueue__handleMessage_connection___block_invoke;
  block[3] = &unk_1E5B27880;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __44__SKPaymentQueue__handleMessage_connection___block_invoke(uint64_t a1)
{
  char v2;
  xpc_object_t message;

  switch(xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "0"))
  {
    case 20000:
    case 20002:
      objc_msgSend(*(id *)(a1 + 40), "_updatePaymentsForMessage:", *(_QWORD *)(a1 + 32));
      break;
    case 20005:
      objc_msgSend(*(id *)(a1 + 40), "_completeRestoreWithMessage:", *(_QWORD *)(a1 + 32));
      break;
    case 20006:
      objc_msgSend(*(id *)(a1 + 40), "_updateDownloadsForMessage:", *(_QWORD *)(a1 + 32));
      break;
    case 20008:
      v2 = objc_msgSend(*(id *)(a1 + 40), "_shouldContinueTransactionForMessage:", *(_QWORD *)(a1 + 32));
      message = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
      xpc_dictionary_set_BOOL(message, "0", v2);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), message);

      break;
    default:
      return;
  }
}

- (void)_notifyObserversAboutChanges:(id)a3 sendUpdatedDownloads:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id obj;
  SKPaymentQueue *v19;
  id v20;
  uint64_t v21;
  _BOOL4 v22;
  _QWORD v23[4];
  id v24;
  SKPaymentQueue *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[4];
  id v32;
  SKPaymentQueue *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v22 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  -[SKPaymentQueue _removeNilTransactionObservers](self, "_removeNilTransactionObservers");
  v17 = *((id *)self->_internal + 8);
  objc_sync_enter(v17);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = self;
  obj = *((id *)self->_internal + 8);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v5)
  {
    v21 = *(_QWORD *)v36;
    do
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "object", v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v9 = *((_QWORD *)v19->_internal + 9);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __68__SKPaymentQueue__notifyObserversAboutChanges_sendUpdatedDownloads___block_invoke;
          block[3] = &unk_1E5B27880;
          v32 = v8;
          v33 = v19;
          v34 = v20;
          dispatch_async(v9, block);

        }
        if (v22 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v11 = v20;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v28;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v28 != v13)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v14), "downloads");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15)
                  objc_msgSend(v10, "addObjectsFromArray:", v15);

                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
            }
            while (v12);
          }

          if (objc_msgSend(v10, "count"))
          {
            v16 = *((_QWORD *)v19->_internal + 9);
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = __68__SKPaymentQueue__notifyObserversAboutChanges_sendUpdatedDownloads___block_invoke_2;
            v23[3] = &unk_1E5B27880;
            v24 = v8;
            v25 = v19;
            v26 = v10;
            dispatch_async(v16, v23);

          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v5);
  }

  objc_sync_exit(v17);
}

uint64_t __68__SKPaymentQueue__notifyObserversAboutChanges_sendUpdatedDownloads___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentQueue:updatedTransactions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __68__SKPaymentQueue__notifyObserversAboutChanges_sendUpdatedDownloads___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentQueue:updatedDownloads:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyObserversAboutDownloadChanges:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id obj;
  _QWORD block[4];
  id v13;
  SKPaymentQueue *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKPaymentQueue _removeNilTransactionObservers](self, "_removeNilTransactionObservers");
  obj = *((id *)self->_internal + 8);
  objc_sync_enter(obj);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = *((id *)self->_internal + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "object", obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = *((_QWORD *)self->_internal + 9);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __55__SKPaymentQueue__notifyObserversAboutDownloadChanges___block_invoke;
          block[3] = &unk_1E5B27880;
          v13 = v9;
          v14 = self;
          v15 = v4;
          dispatch_async(v10, block);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

uint64_t __55__SKPaymentQueue__notifyObserversAboutDownloadChanges___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentQueue:updatedDownloads:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyObserversAboutRemovals:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id obj;
  _QWORD block[4];
  id v13;
  SKPaymentQueue *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKPaymentQueue _removeNilTransactionObservers](self, "_removeNilTransactionObservers");
  obj = *((id *)self->_internal + 8);
  objc_sync_enter(obj);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = *((id *)self->_internal + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "object", obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = *((_QWORD *)self->_internal + 9);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __48__SKPaymentQueue__notifyObserversAboutRemovals___block_invoke;
          block[3] = &unk_1E5B27880;
          v13 = v9;
          v14 = self;
          v15 = v4;
          dispatch_async(v10, block);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

uint64_t __48__SKPaymentQueue__notifyObserversAboutRemovals___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentQueue:removedTransactions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyObserversRestoreTransactionsFailedWithError:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id obj;
  _QWORD block[4];
  id v13;
  SKPaymentQueue *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKPaymentQueue _removeNilTransactionObservers](self, "_removeNilTransactionObservers");
  -[SKPaymentQueue _logEventWithPrimaryError:mappedError:inAppPurchaseID:userAction:](self, "_logEventWithPrimaryError:mappedError:inAppPurchaseID:userAction:", v4, 0, 0, 2);
  obj = *((id *)self->_internal + 8);
  objc_sync_enter(obj);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = *((id *)self->_internal + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "object", obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = *((_QWORD *)self->_internal + 9);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __69__SKPaymentQueue__notifyObserversRestoreTransactionsFailedWithError___block_invoke;
          block[3] = &unk_1E5B27880;
          v13 = v9;
          v14 = self;
          v15 = v4;
          dispatch_async(v10, block);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

uint64_t __69__SKPaymentQueue__notifyObserversRestoreTransactionsFailedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentQueue:restoreCompletedTransactionsFailedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_notifyObserversRestoreTransactionsFinished
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id obj;
  _QWORD block[4];
  id v11;
  SKPaymentQueue *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SKPaymentQueue _removeNilTransactionObservers](self, "_removeNilTransactionObservers");
  obj = *((id *)self->_internal + 8);
  objc_sync_enter(obj);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *((id *)self->_internal + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v6), "object");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = *((_QWORD *)self->_internal + 9);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __61__SKPaymentQueue__notifyObserversRestoreTransactionsFinished__block_invoke;
          block[3] = &unk_1E5B27350;
          v11 = v7;
          v12 = self;
          dispatch_async(v8, block);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  objc_sync_exit(obj);
}

uint64_t __61__SKPaymentQueue__notifyObserversRestoreTransactionsFinished__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paymentQueueRestoreCompletedTransactionsFinished:", *(_QWORD *)(a1 + 40));
}

- (void)_processTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  SKPaymentDelegate *v68;
  void *v69;
  SKPaymentDelegate *v70;
  void *v71;
  void *v72;
  id v73;
  _QWORD v74[5];
  id v75;
  _QWORD v76[5];
  id v77;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, 0x1E5B2E200);

  objc_msgSend(v4, "payment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "productIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, SKPaymentOptionLegacyOfferName);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "payment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "quantity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, SKPaymentOptionLegacyQuantity);

  objc_msgSend(v4, "payment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, SKPaymentOptionLegacyRequestData);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "payment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "isStoreOriginated"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, SKPaymentOptionLegacyIsStoreOriginated);

  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "payment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "simulatesAskToBuyInSandbox"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, SKPaymentOptionLegacySimulateAskToBuy);

  objc_msgSend(v4, "payment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "requestParameters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, 0x1E5B2E3C0);

  objc_msgSend(v4, "payment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "applicationUsername");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, SKServerKeyApplicationUsername);

  objc_msgSend(v4, "payment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "partnerIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, 0x1E5B2E500);

  objc_msgSend(v4, "payment");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "partnerTransactionIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, 0x1E5B2E520);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[SKPaymentQueue paymentQueueClient](self, "paymentQueueClient");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithBool:", objc_msgSend(v29, "hidesConfirmationDialogs"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, 0x1E5B2E4C0);

  v31 = (void *)MEMORY[0x1E0CB37E8];
  -[SKPaymentQueue paymentQueueClient](self, "paymentQueueClient");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "numberWithBool:", objc_msgSend(v32, "ignoresInAppPurchaseRestriction"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, 0x1E5B2E4E0);

  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[SKPaymentQueue paymentQueueClient](self, "paymentQueueClient");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "numberWithBool:", objc_msgSend(v35, "requiresAuthenticationForPayment"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, 0x1E5B2E580);

  -[SKPaymentQueue paymentQueueClient](self, "paymentQueueClient");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "receiptDirectoryPath");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, 0x1E5B2E560);

  objc_msgSend(v4, "payment");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "appleIDAuthorizationClientInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v40, "clientIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, SKServerKeySiWAClientIdentifier);

    objc_msgSend(v40, "teamIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, SKServerKeySiWATeamIdentifier);

    objc_msgSend(v40, "serviceIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, SKServerKeySiWAServiceIdentifier);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", dyld_program_sdk_at_least() ^ 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, 0x1E5B2E4A0);

  objc_msgSend(v4, "payment");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "paymentDiscount");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v4, "payment");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "paymentDiscount");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "identifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, SKPaymentOptionLegacyDiscountIdentifier);

    objc_msgSend(v4, "payment");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "paymentDiscount");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "keyIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v52, SKPaymentOptionLegacyDiscountKeyIdentifier);

    objc_msgSend(v4, "payment");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "paymentDiscount");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "nonce");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "UUIDString");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "lowercaseString");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, SKPaymentOptionLegacyDiscountNonce);

    objc_msgSend(v4, "payment");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "paymentDiscount");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "signature");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v60, SKPaymentOptionLegacyDiscountSignature);

    objc_msgSend(v4, "payment");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "paymentDiscount");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "timestamp");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v63, SKPaymentOptionLegacyDiscountTimestamp);

  }
  +[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = MEMORY[0x1E0C809B0];
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __38__SKPaymentQueue__processTransaction___block_invoke;
  v76[3] = &unk_1E5B27858;
  v76[4] = self;
  v66 = v4;
  v77 = v66;
  objc_msgSend(v64, "storeKitServiceWithErrorHandler:", v76);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = [SKPaymentDelegate alloc];
  objc_msgSend(v66, "UUID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = -[SKPaymentDelegate initWithQueue:transactionUUID:](v68, "initWithQueue:transactionUUID:", self, v69);

  -[SKPaymentQueue paymentQueueClient](self, "paymentQueueClient");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "plist");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v65;
  v74[1] = 3221225472;
  v74[2] = __38__SKPaymentQueue__processTransaction___block_invoke_86;
  v74[3] = &unk_1E5B278D0;
  v74[4] = self;
  v75 = v66;
  v73 = v66;
  objc_msgSend(v67, "processPayment:forClient:paymentDelegate:reply:", v5, v72, v70, v74);

}

void __38__SKPaymentQueue__processTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __38__SKPaymentQueue__processTransaction___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "_processTransactionDict:forTransaction:error:", 0, *(_QWORD *)(a1 + 40), v3);

}

void __38__SKPaymentQueue__processTransaction___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __38__SKPaymentQueue__processTransaction___block_invoke_86_cold_1();
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: Payment completed", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_processTransactionDict:forTransaction:error:", v5, *(_QWORD *)(a1 + 40), v6);

}

- (void)_processTransactionDict:(id)a3 forTransaction:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  SKPaymentQueue *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v9)
  {
    if (v22)
    {
      objc_msgSend(v8, "mergeWithServerTransaction:");
      goto LABEL_13;
    }
    objc_msgSend(v8, "_setTransactionState:", 2);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setError:", v13);
    objc_msgSend(v8, "payment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "productIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self;
    v17 = v13;
    v18 = 0;
LABEL_12:
    -[SKPaymentQueue _logEventWithPrimaryError:mappedError:inAppPurchaseID:userAction:](v16, "_logEventWithPrimaryError:mappedError:inAppPurchaseID:userAction:", v17, v18, v15, 3);

    goto LABEL_13;
  }
  objc_msgSend(v9, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("ASDErrorDomain")))
  {

    goto LABEL_10;
  }
  v12 = objc_msgSend(v10, "code");

  if (v12 != 1052)
  {
LABEL_10:
    objc_msgSend(v8, "_setTransactionState:", 2);
    _SKErrorFromNSError(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setError:", v13);
    objc_msgSend(v8, "payment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "productIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self;
    v17 = v10;
    v18 = v13;
    goto LABEL_12;
  }
  if (v22)
    objc_msgSend(v8, "mergeWithServerTransaction:");
  objc_msgSend(v8, "_setTransactionState:", 4);
LABEL_13:
  v19 = *((id *)self->_internal + 8);
  objc_sync_enter(v19);
  v20 = (void *)*((_QWORD *)self->_internal + 8);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __63__SKPaymentQueue__processTransactionDict_forTransaction_error___block_invoke;
  v23[3] = &unk_1E5B278A8;
  v23[4] = self;
  v21 = v8;
  v24 = v21;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v23);

  objc_sync_exit(v19);
}

void __63__SKPaymentQueue__processTransactionDict_forTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SKPaymentQueue__processTransactionDict_forTransaction_error___block_invoke_2;
    block[3] = &unk_1E5B27880;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    dispatch_async(v4, block);

  }
}

void __63__SKPaymentQueue__processTransactionDict_forTransaction_error___block_invoke_2(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "paymentQueue:updatedTransactions:", v2, v3);

}

- (void)_processUpdates:(id)a3 trimUnmatched:(BOOL)a4 sendUpdatedDownloads:(BOOL)a5
{
  id v6;
  __CFArray *Mutable;
  __CFDictionary *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t Value;
  CFIndex Count;
  CFIndex v25;
  CFIndex v26;
  const void *ValueAtIndex;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id obj;
  const __CFDictionary *theDict;
  uint64_t v40;
  SKPaymentQueue *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  LODWORD(v33) = a5;
  HIDWORD(v33) = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(*((id *)self->_internal + 6), "count"));
  Mutable = CFArrayCreateMutable(0, 0, 0);
  v8 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v41 = self;
  v9 = *((id *)self->_internal + 6);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "_transactionIdentifier", v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          CFDictionarySetValue(v8, v15, (const void *)(v12 + i));
        else
          CFArrayAppendValue(Mutable, (const void *)(v12 + i));

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      v12 += i;
    }
    while (v11);
  }
  theDict = v8;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  v18 = (void *)v35;
  v17 = v36;
  if (v16)
  {
    v19 = v16;
    v40 = *(_QWORD *)v43;
    do
    {
      v20 = 0;
      v37 = v19;
      do
      {
        if (*(_QWORD *)v43 != v40)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v20);
        objc_msgSend(v21, "_transactionIdentifier", v33);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && CFDictionaryContainsKey(theDict, v22))
        {
          Value = (uint64_t)CFDictionaryGetValue(theDict, v22);
          if ((Value & 0x8000000000000000) == 0)
            goto LABEL_29;
        }
        else
        {
          Value = -1;
        }
        Count = CFArrayGetCount(Mutable);
        if (Count >= 1)
        {
          v25 = Count;
          v26 = 0;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(Mutable, v26);
            objc_msgSend(*((id *)v41->_internal + 6), "objectAtIndex:", ValueAtIndex);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "canMergeWithTransaction:", v21);

            if (v29)
              break;
            if (v25 == ++v26)
              goto LABEL_27;
          }
          Value = (uint64_t)ValueAtIndex;
LABEL_27:
          v18 = (void *)v35;
          v17 = v36;
          v19 = v37;
        }
        if (Value < 0)
        {
          objc_msgSend(v17, "addObject:", v21);
          objc_msgSend(*((id *)v41->_internal + 6), "addObject:", v21);
          goto LABEL_35;
        }
LABEL_29:
        objc_msgSend(*((id *)v41->_internal + 6), "objectAtIndex:", Value);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "mergeWithTransaction:", v21))
          objc_msgSend(v17, "addObject:", v30);
        objc_msgSend(v30, "matchingIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
          objc_msgSend(*((id *)v41->_internal + 5), "removeObject:", v30);
        objc_msgSend(v18, "removeIndex:", Value);

LABEL_35:
        ++v20;
      }
      while (v20 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v19);
  }

  CFRelease(Mutable);
  CFRelease(theDict);
  if (HIDWORD(v33) && objc_msgSend(v18, "count"))
  {
    v32 = -[SKPaymentQueue _copyRemovalsFromUnmergedIndexSet:](v41, "_copyRemovalsFromUnmergedIndexSet:", v18);
    objc_msgSend(*((id *)v41->_internal + 6), "removeObjectsAtIndexes:", v18);
  }
  else
  {
    v32 = 0;
  }
  if (objc_msgSend(v17, "count", v33))
    -[SKPaymentQueue _notifyObserversAboutChanges:sendUpdatedDownloads:](v41, "_notifyObserversAboutChanges:sendUpdatedDownloads:", v17, v34);
  if (objc_msgSend(v32, "count"))
    -[SKPaymentQueue _notifyObserversAboutRemovals:](v41, "_notifyObserversAboutRemovals:", v32);

}

- (void)_removeLocalTransaction:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(*((id *)self->_internal + 5), "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, 0);
    objc_msgSend(*((id *)self->_internal + 5), "removeObjectAtIndex:", v5);
    objc_msgSend(*((id *)self->_internal + 6), "removeObject:", v7);
    -[SKPaymentQueue _notifyObserversAboutRemovals:](self, "_notifyObserversAboutRemovals:", v6);

  }
}

- (void)_removeNilTransactionObservers
{
  void *v3;
  unint64_t i;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = *((id *)self->_internal + 8);
  objc_sync_enter(obj);
  v3 = (void *)objc_opt_new();
  for (i = 0; ; ++i)
  {
    v5 = objc_msgSend(*((id *)self->_internal + 8), "count");
    v6 = (void *)*((_QWORD *)self->_internal + 8);
    if (i >= v5)
      break;
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(v3, "addIndex:", i);

  }
  objc_msgSend(v6, "removeObjectsAtIndexes:", v3);

  objc_sync_exit(obj);
}

- (BOOL)_shouldContinueTransactionForMessage:(id)a3
{
  CFDictionaryRef v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  id v15;
  id WeakRetained;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = SKXPCDictionaryCopyCFObject(a3, "1");
  -[SKPaymentQueue storefront](self, "storefront");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = *((id *)self->_internal + 6);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_msgSend(v11, "matchingIdentifier", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v8)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v15 = v11;

      if (!v15)
        goto LABEL_16;
      WeakRetained = objc_loadWeakRetained((id *)self->_internal + 12);
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        v14 = objc_msgSend(WeakRetained, "paymentQueue:shouldContinueTransaction:inStorefront:", self, v15, v5);
      else
        v14 = 1;

    }
    else
    {
LABEL_11:
      v14 = 1;
      v15 = v6;
    }

  }
  else
  {
LABEL_16:
    v14 = 1;
  }

  return v14;
}

- (void)_updateDownloadsForMessage:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;
  id v7;
  xpc_object_t xarray;
  _QWORD applier[5];
  id v10;

  xpc_dictionary_get_value(a3, "1");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    xarray = v4;
    v5 = MEMORY[0x1AF43BC3C]() == MEMORY[0x1E0C812C8];
    v4 = xarray;
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __45__SKPaymentQueue__updateDownloadsForMessage___block_invoke;
      applier[3] = &unk_1E5B278F8;
      applier[4] = self;
      v7 = v6;
      v10 = v7;
      xpc_array_apply(xarray, applier);
      if (objc_msgSend(v7, "count"))
        -[SKPaymentQueue _notifyObserversAboutDownloadChanges:](self, "_notifyObserversAboutDownloadChanges:", v7);

      v4 = xarray;
    }
  }

}

uint64_t __45__SKPaymentQueue__updateDownloadsForMessage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SKDownloadChangeset *v5;
  void *v6;

  v4 = a3;
  v5 = -[SKDownloadChangeset initWithXPCEncoding:]([SKDownloadChangeset alloc], "initWithXPCEncoding:", v4);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_applyDownloadChangeset:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
  return 1;
}

uint64_t __48__SKPaymentQueue__updatedTransactions_restored___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "canMergeWithTransaction:", *(_QWORD *)(a1 + 32));
  *a4 = result;
  return result;
}

void __48__SKPaymentQueue__updatedTransactions_restored___block_invoke_91(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__SKPaymentQueue__updatedTransactions_restored___block_invoke_2;
    block[3] = &unk_1E5B27880;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    dispatch_async(v4, block);

  }
}

void __48__SKPaymentQueue__updatedTransactions_restored___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v1, "paymentQueue:updatedTransactions:", v2, v3);

}

- (void)_updatePaymentsForMessage:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  xpc_dictionary_get_value(a3, "1");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v8 = (void *)v4;
    v6 = MEMORY[0x1AF43BC3C](v4);
    v5 = v8;
    if (v6 == MEMORY[0x1E0C812C8])
    {
      v7 = -[SKPaymentQueue _copyTransactionsFromXPCArray:](self, "_copyTransactionsFromXPCArray:", v8);
      if (objc_msgSend(v7, "count"))
        -[SKPaymentQueue _processUpdates:trimUnmatched:sendUpdatedDownloads:](self, "_processUpdates:trimUnmatched:sendUpdatedDownloads:", v7, 0, 0);

      v5 = v8;
    }
  }

}

- (void)_logEventWithPrimaryError:(id)a3 mappedError:(id)a4 inAppPurchaseID:(id)a5 userAction:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  SKOneErrorEvent *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(SKOneErrorEvent);
  -[SKBaseErrorEvent setInAppPurchaseID:](v12, "setInAppPurchaseID:", v9);

  -[SKBaseErrorEvent setUserAction:](v12, "setUserAction:", a6);
  -[SKBaseErrorEvent setPrimaryError:](v12, "setPrimaryError:", v11);

  -[SKBaseErrorEvent setMappedError:](v12, "setMappedError:", v10);
  +[SKAnalyticsManager sendEvent:](SKAnalyticsManager, "sendEvent:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

- (void)notifyObserversForNewStorefront:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  v5 = *((id *)self->_internal + 8);
  objc_sync_enter(v5);
  v6 = *((id *)self->_internal + 7);
  if (!v6
    || (objc_msgSend(v11, "identifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    objc_storeStrong((id *)self->_internal + 7, a3);
    v10 = (void *)*((_QWORD *)self->_internal + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__SKPaymentQueue_Package__notifyObserversForNewStorefront___block_invoke;
    v12[3] = &unk_1E5B27920;
    v12[4] = self;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);
  }

  objc_sync_exit(v5);
}

void __59__SKPaymentQueue_Package__notifyObserversForNewStorefront___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "object");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentQueueDidChangeStorefront:", *(_QWORD *)(a1 + 32));

}

- (void)notifyPurchaseIntentObserversForProducts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  NSObject *v12;
  id v13;
  id obj;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _QWORD block[4];
  id v19;
  SKPaymentQueue *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKPaymentQueue _removeNilTransactionObservers](self, "_removeNilTransactionObservers");
  v13 = *((id *)self->_internal + 8);
  objc_sync_enter(v13);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        +[SKPayment paymentFromPurchaseIntentWithProduct:](SKPayment, "paymentFromPurchaseIntentWithProduct:", v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v7 = *((id *)self->_internal + 8);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v24 != v9)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "object");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v12 = *((_QWORD *)self->_internal + 9);
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __68__SKPaymentQueue_Package__notifyPurchaseIntentObserversForProducts___block_invoke;
                block[3] = &unk_1E5B26A38;
                v19 = v11;
                v20 = self;
                v21 = v17;
                v22 = v6;
                dispatch_async(v12, block);

              }
            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v8);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v5);
  }

  objc_sync_exit(v13);
}

void __68__SKPaymentQueue_Package__notifyPurchaseIntentObserversForProducts___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "paymentQueue:shouldAddStorePayment:forProduct:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 56), "productIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = CFSTR("NO");
    if (v2)
      v5 = CFSTR("YES");
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[SKPaymentQueue]: Sent purchase intent: %{public}@ to delegate, response was %{public}@", (uint8_t *)&v6, 0x16u);

  }
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "addPayment:", *(_QWORD *)(a1 + 48));
}

- (void)stopListeningForPurchaseIntents
{
  SKPaymentQueue *v2;

  v2 = self;
  sub_1AC025A38();

}

+ (void)listenForStorefrontChanges
{
  swift_getObjCClassMetadata();
  sub_1AC025CA8();
}

- (void)forceSandboxForBundleIdentifier:(id)a3 untilDate:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKPaymentQueue *v12;
  uint64_t v13;

  v5 = sub_1AC0F7564();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1AC0F79CC();
  v11 = v10;
  sub_1AC0F7540();
  v12 = self;
  SKPaymentQueue.forceSandbox(forBundleIdentifier:until:)(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void __34__SKPaymentQueue_cancelDownloads___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while cancelling downloads %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

- (void)finishTransaction:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "%{public}@: Finishing failed transaction %{public}@ with an identifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __36__SKPaymentQueue_finishTransaction___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while finishing transaction: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __33__SKPaymentQueue_pauseDownloads___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while pausing downloads: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __70__SKPaymentQueue_restoreCompletedTransactionsWithApplicationUsername___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while restoring transactions: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __34__SKPaymentQueue_resumeDownloads___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while resuming downloads: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __42__SKPaymentQueue_showPriceConsentIfNeeded__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while showing price consent: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __44__SKPaymentQueue_presentCodeRedemptionSheet__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while presenting code redemption sheet: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __33__SKPaymentQueue_startDownloads___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while starting downloads: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __35__SKPaymentQueue__checkForMessages__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while checking for messages: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __42__SKPaymentQueue__checkServerQueueForced___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while checking server queue: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __38__SKPaymentQueue__processTransaction___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Error in remote proxy while processing transaction: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

void __38__SKPaymentQueue__processTransaction___block_invoke_86_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_1ABFBE000, MEMORY[0x1E0C81028], v0, "%{public}@: Payment completed with error: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2_0();
}

@end
