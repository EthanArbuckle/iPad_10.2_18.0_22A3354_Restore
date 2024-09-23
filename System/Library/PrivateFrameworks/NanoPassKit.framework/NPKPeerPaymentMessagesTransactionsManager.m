@implementation NPKPeerPaymentMessagesTransactionsManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_16);
  return (id)sharedInstance_sharedInstance_1;
}

void __59__NPKPeerPaymentMessagesTransactionsManager_sharedInstance__block_invoke()
{
  void *v0;
  NPKPeerPaymentMessagesTransactionsManager *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "peerPaymentPassUniqueID");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = -[NPKPeerPaymentMessagesTransactionsManager initWithPeerPaymentPassUniqueID:]([NPKPeerPaymentMessagesTransactionsManager alloc], "initWithPeerPaymentPassUniqueID:", v3);
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;

}

- (NPKPeerPaymentMessagesTransactionsManager)initWithPeerPaymentPassUniqueID:(id)a3
{
  return -[NPKPeerPaymentMessagesTransactionsManager initWithPeerPaymentPassUniqueID:paymentService:](self, "initWithPeerPaymentPassUniqueID:paymentService:", a3, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NPKPeerPaymentMessagesTransactionsManager;
  -[NPKPeerPaymentMessagesTransactionsManager dealloc](&v4, sel_dealloc);
}

- (NPKPeerPaymentMessagesTransactionsManager)initWithPeerPaymentPassUniqueID:(id)a3 paymentService:(id)a4
{
  id v6;
  id v7;
  NPKPeerPaymentMessagesTransactionsManager *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *transactionsQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *peerPaymentPassQueue;
  NSMutableDictionary *v13;
  NSMutableDictionary *transactionDetails;
  NSMutableSet *v15;
  NSMutableSet *currentLookupIdentifiers;
  uint64_t v17;
  NSString *peerPaymentPassUniqueID;
  PKPaymentService *v19;
  PKPaymentService *paymentService;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NPKPeerPaymentMessagesTransactionsManager;
  v8 = -[NPKPeerPaymentMessagesTransactionsManager init](&v25, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.nanopasskit.peerPaymentmessagesTransactionManager.transactions", 0);
    transactionsQueue = v8->_transactionsQueue;
    v8->_transactionsQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.nanopasskit.peerPaymentmessagesTransactionManager.peerPaymentPass", 0);
    peerPaymentPassQueue = v8->_peerPaymentPassQueue;
    v8->_peerPaymentPassQueue = (OS_dispatch_queue *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    transactionDetails = v8->_transactionDetails;
    v8->_transactionDetails = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    currentLookupIdentifiers = v8->_currentLookupIdentifiers;
    v8->_currentLookupIdentifiers = v15;

    v17 = objc_msgSend(v6, "copy");
    peerPaymentPassUniqueID = v8->_peerPaymentPassUniqueID;
    v8->_peerPaymentPassUniqueID = (NSString *)v17;

    if (v7)
      v19 = (PKPaymentService *)v7;
    else
      v19 = (PKPaymentService *)objc_msgSend(objc_alloc(MEMORY[0x24BE6ED30]), "initWithDelegate:", v8);
    paymentService = v8->_paymentService;
    v8->_paymentService = v19;

    -[PKPaymentService setDelegate:](v8->_paymentService, "setDelegate:", v8);
    -[NPKPeerPaymentMessagesTransactionsManager _fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:](v8, "_fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:", v8->_peerPaymentPassUniqueID);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BE6F588];
    objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v8, sel__passLibraryChanged_, v22, v23);

    objc_msgSend(v21, "addObserver:selector:name:object:", v8, sel__applicationWillEnterForeground_, *MEMORY[0x24BE6F910], 0);
  }

  return v8;
}

- (void)_passLibraryChanged:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "peerPaymentPassUniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPeerPaymentMessagesTransactionsManager setPeerPaymentPassUniqueID:](self, "setPeerPaymentPassUniqueID:", v4);

}

- (void)_applicationWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;

  -[NPKPeerPaymentMessagesTransactionsManager peerPaymentPassUniqueID](self, "peerPaymentPassUniqueID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[NPKPeerPaymentMessagesTransactionsManager _fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:](self, "_fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:", v4);
    v4 = v5;
  }

}

- (void)setPeerPaymentPassUniqueID:(id)a3
{
  void *v4;
  NSObject *peerPaymentPassQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  peerPaymentPassQueue = self->_peerPaymentPassQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__NPKPeerPaymentMessagesTransactionsManager_setPeerPaymentPassUniqueID___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(peerPaymentPassQueue, v7);

}

uint64_t __72__NPKPeerPaymentMessagesTransactionsManager_setPeerPaymentPassUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (result != v2)
  {
    result = objc_msgSend((id)result, "isEqualToString:");
    if ((result & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
      return objc_msgSend(*(id *)(a1 + 32), "_fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:", *(_QWORD *)(a1 + 40));
    }
  }
  return result;
}

- (NSString)peerPaymentPassUniqueID
{
  NSObject *peerPaymentPassQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  peerPaymentPassQueue = self->_peerPaymentPassQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__NPKPeerPaymentMessagesTransactionsManager_peerPaymentPassUniqueID__block_invoke;
  v5[3] = &unk_24CFE8318;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(peerPaymentPassQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __68__NPKPeerPaymentMessagesTransactionsManager_peerPaymentPassUniqueID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (unint64_t)statusOfPaymentTransactionWithServiceIdentifier:(id)a3
{
  id v4;
  NSObject *transactionsQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 2;
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__NPKPeerPaymentMessagesTransactionsManager_statusOfPaymentTransactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_24CFE9510;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(transactionsQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __93__NPKPeerPaymentMessagesTransactionsManager_statusOfPaymentTransactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_transactionQueue_statusOfPaymentTransactionWithServiceIdentifier:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)availableActionsForPaymentTransactionWithServiceIdentifier:(id)a3
{
  id v4;
  NSObject *transactionsQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__NPKPeerPaymentMessagesTransactionsManager_availableActionsForPaymentTransactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_24CFE9510;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(transactionsQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __104__NPKPeerPaymentMessagesTransactionsManager_availableActionsForPaymentTransactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "transactionDetails");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableActions");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unint64_t)_transactionQueue_statusOfPaymentTransactionWithServiceIdentifier:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  NSObject *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NPKPeerPaymentMessagesTransactionsManager peerPaymentPassUniqueID](self, "peerPaymentPassUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NPKPeerPaymentMessagesTransactionsManager transactionDetails](self, "transactionDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = -[NSObject paymentStatus](v7, "paymentStatus");
      if (v8)
      {
LABEL_18:
        pk_Payment_log();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

        if (v20)
        {
          pk_Payment_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            NSStringWithNPKPeerPaymentStatus(v8);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138412802;
            v25 = v22;
            v26 = 2112;
            v27 = v7;
            v28 = 2112;
            v29 = v4;
            _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Returning status %@ for transaction details %@ (service identifier %@)", (uint8_t *)&v24, 0x20u);

          }
        }
LABEL_22:

        goto LABEL_23;
      }
    }
    if (NPKShouldHonorUserPreferenceTransactionStatus())
    {
      NPKGlobalDomainPreferencesGetValue(CFSTR("NPKUserPreferenceTransactionsStatus"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = NPKPeerPaymentStatusWithNSString(v9);
      pk_General_log();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (!v11)
      {
LABEL_17:

        goto LABEL_18;
      }
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        NSStringWithNPKPeerPaymentStatus(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v13;
        v26 = 2112;
        v27 = v4;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Using mock SURF server; will return status %@ for transaction with identifier %@",
          (uint8_t *)&v24,
          0x16u);

      }
    }
    else
    {
      -[NSObject transaction](v7, "transaction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      if (!v17)
      {
        v8 = 0;
        goto LABEL_17;
      }
      v18 = objc_msgSend(v17, "peerPaymentStatus");
      -[NSObject availableActions](v7, "availableActions");
      v12 = objc_claimAutoreleasedReturnValue();
      v8 = NPKPeerPaymentStatusWithPKPeerPaymentStatusAndActions(v18, v12);
    }

    goto LABEL_17;
  }
  pk_Payment_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringWithNPKPeerPaymentStatus(0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v16;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Returning status %@ (service identifier %@). We don't have a peer payment pass setup.", (uint8_t *)&v24, 0x16u);

    }
    v8 = 1;
    goto LABEL_22;
  }
  v8 = 1;
LABEL_23:

  return v8;
}

- (void)setStatus:(unint64_t)a3 forPaymentTransactionWithServiceIdentifier:(id)a4
{
  id v6;
  NSObject *transactionsQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__NPKPeerPaymentMessagesTransactionsManager_setStatus_forPaymentTransactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_24CFE83A8;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync(transactionsQueue, block);

}

uint64_t __98__NPKPeerPaymentMessagesTransactionsManager_setStatus_forPaymentTransactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_setStatus:forPaymentTransactionWithServiceIdentifier:notifyUpdate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 1);
}

- (void)_transactionsQueue_setStatus:(unint64_t)a3 forPaymentTransactionWithServiceIdentifier:(id)a4 notifyUpdate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionsQueue);
  -[NPKPeerPaymentMessagesTransactionsManager _transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:](self, "_transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10
    && (v12 = NPKPeerPaymentStatusWithPKPeerPaymentStatus(objc_msgSend(v10, "peerPaymentStatus")), v12 > a3)
    && (v12 > 7 || ((1 << v12) & 0xB0) == 0))
  {
    pk_General_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      pk_General_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        NSStringWithNPKPeerPaymentStatus(a3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412802;
        v22 = v20;
        v23 = 2112;
        v24 = v8;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Ignoring new peer payment transaction status %@ for transaction with identifier: %@ transaction: %@", (uint8_t *)&v21, 0x20u);

      }
    }
  }
  else
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        NSStringWithNPKPeerPaymentStatus(a3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = v16;
        v23 = 2112;
        v24 = v8;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Setting new peer payment transaction status %@ for transaction with identifier: %@", (uint8_t *)&v21, 0x16u);

      }
    }
    objc_msgSend(v9, "setPaymentStatus:", a3);
    if (v5)
      -[NPKPeerPaymentMessagesTransactionsManager _transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:](self, "_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:", v8);
  }

}

- (id)peerPaymentTransactionWithServiceIdentifier:(id)a3
{
  id v4;
  NSObject *transactionsQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__NPKPeerPaymentMessagesTransactionsManager_peerPaymentTransactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_24CFE9510;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(transactionsQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __89__NPKPeerPaymentMessagesTransactionsManager_peerPaymentTransactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "transactionDetails");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transaction");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)lookupTransactionActionsIfNeededWithServiceIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *transactionsQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    transactionsQueue = self->_transactionsQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke;
    v7[3] = &unk_24CFE7E40;
    v7[4] = self;
    v8 = v4;
    dispatch_async(transactionsQueue, v7);

  }
}

void __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "currentLookupIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_transactionQueue_statusOfPaymentTransactionWithServiceIdentifier:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "transactionDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "availableActionsFetchDate");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v7 <= 3 && v7 != 1)
    {
      if (!v5 || (-[NSObject timeIntervalSinceNow](v5, "timeIntervalSinceNow"), fabs(v10) >= 60.0))
      {
        objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
        pk_General_log();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

        if (v12)
        {
          pk_General_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138412290;
            v21 = v14;
            _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Starting looking up actions for transaction with service identifier: %@", buf, 0xCu);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "_sharedPeerPaymentWebService");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke_89;
        v17[3] = &unk_24CFEAB10;
        v16 = *(_QWORD *)(a1 + 40);
        v17[4] = *(_QWORD *)(a1 + 32);
        v18 = v2;
        v19 = *(id *)(a1 + 40);
        objc_msgSend(v15, "peerPaymentStatusWithPaymentIdentifier:completion:", v16, v17);

      }
    }
    goto LABEL_14;
  }
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: We are currently looking up actions for transaction with service identifier: %@", buf, 0xCu);
    }
LABEL_14:

  }
}

void __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke_2;
  block[3] = &unk_24CFE82D8;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v15 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v16 = v5;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, block);

}

void __99__NPKPeerPaymentMessagesTransactionsManager_lookupTransactionActionsIfNeededWithServiceIdentifier___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48) || !*(_QWORD *)(a1 + 56))
  {
    pk_General_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (!v3)
      return;
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(a1 + 48);
      v18 = 138412546;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Warning: Error when looking up actions for transaction with service identifier %@: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "_transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:", *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAvailableActions:](v4, "setAvailableActions:", v7);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAvailableActionsFetchDate:](v4, "setAvailableActionsFetchDate:", v8);

    v9 = objc_msgSend(*(id *)(a1 + 56), "status");
    objc_msgSend(*(id *)(a1 + 56), "actions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = NPKPeerPaymentStatusWithPKPeerPaymentStatusAndActions(v9, v10);

    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      pk_General_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 40);
        -[NSObject availableActions](v4, "availableActions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringWithNPKPeerPaymentStatus(v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412802;
        v19 = v15;
        v20 = 2112;
        v21 = v16;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Finished looking up actions for transaction with service identifier %@: actions %@, status %@", (uint8_t *)&v18, 0x20u);

      }
    }
    objc_msgSend(*(id *)(a1 + 64), "_transactionsQueue_setStatus:forPaymentTransactionWithServiceIdentifier:notifyUpdate:", v11, *(_QWORD *)(a1 + 40), 1);
  }

}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *transactionsQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_General_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: TransactionManager: transactionSourceIdentifier:%@ didReceiveTransaction:%@", buf, 0x16u);
    }

  }
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(transactionsQueue, block);

}

void __95__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "peerPaymentPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passWithUniqueID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "deviceTransactionSourceIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 48), "serviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        pk_General_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412290;
          v13 = v7;
          _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: TransactionManager: did update transaction detail with service Identifier:%@", (uint8_t *)&v12, 0xCu);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTransaction:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v11, "setPaymentStatus:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:", v7);

    }
  }

}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *transactionsQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  transactionsQueue = self->_transactionsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __108__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  block[3] = &unk_24CFE8288;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(transactionsQueue, block);

}

void __108__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "peerPaymentPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passWithUniqueID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "deviceTransactionSourceIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__12;
    v19 = __Block_byref_object_dispose__12;
    v20 = 0;
    objc_msgSend(*(id *)(a1 + 32), "transactionDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __108__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2;
    v12 = &unk_24CFEAB38;
    v13 = *(id *)(a1 + 48);
    v14 = &v15;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v9);

    if (v16[5])
    {
      objc_msgSend(*(id *)(a1 + 32), "transactionDetails", v9, v10, v11, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v16[5]);

      objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:", v16[5]);
    }

    _Block_object_dispose(&v15, 8);
  }

}

void __108__NPKPeerPaymentMessagesTransactionsManager_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_msgSend(v13, "transaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }

}

- (id)_transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:(id)a3
{
  id v4;
  void *v5;
  NPKPeerPaymentTransactionDetails *v6;
  void *v7;

  v4 = a3;
  -[NPKPeerPaymentMessagesTransactionsManager transactionDetails](self, "transactionDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (NPKPeerPaymentTransactionDetails *)objc_claimAutoreleasedReturnValue();

  if (v4 && !v6)
  {
    v6 = objc_alloc_init(NPKPeerPaymentTransactionDetails);
    -[NPKPeerPaymentTransactionDetails setServiceIdentifier:](v6, "setServiceIdentifier:", v4);
    -[NPKPeerPaymentMessagesTransactionsManager transactionDetails](self, "transactionDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v4);

  }
  return v6;
}

- (void)_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  NPKPeerPaymentMessagesTransactionsManager *v18;
  unint64_t v19;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionsQueue);
  v5 = -[NPKPeerPaymentMessagesTransactionsManager _transactionQueue_statusOfPaymentTransactionWithServiceIdentifier:](self, "_transactionQueue_statusOfPaymentTransactionWithServiceIdentifier:", v4);
  -[NPKPeerPaymentMessagesTransactionsManager transactionDetails](self, "transactionDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "availableActions");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x24BDBD1A8];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  dispatch_get_global_queue(33, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __117__NPKPeerPaymentMessagesTransactionsManager__transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier___block_invoke;
  v15[3] = &unk_24CFE8A28;
  v16 = v11;
  v17 = v4;
  v18 = self;
  v19 = v5;
  v13 = v4;
  v14 = v11;
  dispatch_async(v12, v15);

}

void __117__NPKPeerPaymentMessagesTransactionsManager__transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("kNPKPeerPaymentMessagesTransactionsManagerTransactionStatus");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1[7]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("kNPKPeerPaymentMessagesTransactionsManagerAvailableActions");
  v6[0] = v2;
  v6[1] = a1[4];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", a1[5], a1[6], v3);

}

- (void)_fetchAllPeerPaymentTransactionsWithPeerPaymentPassID:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *transactionsQueue;
  _QWORD v15[4];
  id v16;
  NPKPeerPaymentMessagesTransactionsManager *v17;
  _QWORD block[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Start fetching all peer payment transactions With peer payment pass ID: %@", buf, 0xCu);
    }

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "passWithUniqueID:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "paymentPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "deviceTransactionSourceIdentifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPeerPaymentMessagesTransactionsManager paymentService](self, "paymentService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x24BE6F440];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_2;
      v15[3] = &unk_24CFEAB88;
      v16 = v4;
      v17 = self;
      objc_msgSend(v12, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:completion:", v11, 0, 0, v13, v15);

    }
  }
  else
  {
    transactionsQueue = self->_transactionsQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke;
    block[3] = &unk_24CFE7998;
    block[4] = self;
    dispatch_async(transactionsQueue, block);
  }

}

void __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: New peer payment pass identifier is nil. Removing existing transactions.", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "transactionDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "transactionDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_96;
  v8[3] = &unk_24CFE8260;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_96(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:", a2);
}

void __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v3, "count");
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Received %ld transactions for peer payment pass with unique ID %@", buf, 0x16u);
    }

  }
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(NSObject **)(v9 + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_98;
  v12[3] = &unk_24CFE7E40;
  v13 = v3;
  v14 = v9;
  v11 = v3;
  dispatch_async(v10, v12);

}

uint64_t __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_98(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_2_99;
  v3[3] = &unk_24CFEAB60;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

void __99__NPKPeerPaymentMessagesTransactionsManager__fetchAllPeerPaymentTransactionsWithPeerPaymentPassID___block_invoke_2_99(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "serviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_transactionsQueue_transactionDetailsCreatedIfNecessaryForServiceIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTransaction:", v7);
    if (objc_msgSend(v7, "peerPaymentStatus"))
      objc_msgSend(v4, "setPaymentStatus:", 0);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "serviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_transactionsQueue_notifyStatusUpdateOfTransactionWithServiceIdentifier:", v6);

  }
}

- (id)_sharedPeerPaymentWebService
{
  return (id)objc_msgSend(MEMORY[0x24BE6EE00], "sharedService");
}

- (PKPaymentService)paymentService
{
  return self->_paymentService;
}

- (NSMutableDictionary)transactionDetails
{
  return self->_transactionDetails;
}

- (NSMutableSet)currentLookupIdentifiers
{
  return self->_currentLookupIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLookupIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionDetails, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_peerPaymentPassUniqueID, 0);
  objc_storeStrong((id *)&self->_peerPaymentPassQueue, 0);
  objc_storeStrong((id *)&self->_transactionsQueue, 0);
}

@end
