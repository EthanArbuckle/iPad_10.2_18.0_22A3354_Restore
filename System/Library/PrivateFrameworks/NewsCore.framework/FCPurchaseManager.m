@implementation FCPurchaseManager

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FCPurchaseManager)initWithCloudContext:(id)a3 purchaseIntegrityChecker:(id)a4 purchaseReceiptProvider:(id)a5 paymentTransactionManager:(id)a6 bundleSubscriptionManager:(id)a7 keyValueStoreOption:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  FCPurchaseController *purchaseController;
  FCReceiptRefresher *v19;
  FCReceiptRefresher *receiptRefresher;
  uint64_t v21;
  NSMutableDictionary *cachedPurchaseModels;
  NFMutexLock *v23;
  NFMutexLock *accessLock;
  uint64_t v25;
  FCKeyValueStore *v26;
  uint64_t v27;
  FCKeyValueStore *localStore;
  void *v29;
  uint64_t v30;
  NSMutableDictionary *ongoingPurchaseEntriesByProductID;
  FCKeyValueStore *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  FCOngoingPurchaseEntry *v43;
  NSMutableDictionary *v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  FCKeyValueStore *v63;
  uint64_t v64;
  FCPurchaseManager *v65;
  objc_super v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v62 = a6;
  v61 = a7;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v50 = v16;
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "cloudContext != nil");
    *(_DWORD *)buf = 136315906;
    v72 = "-[FCPurchaseManager initWithCloudContext:purchaseIntegrityChecker:purchaseReceiptProvider:paymentTransactionMa"
          "nager:bundleSubscriptionManager:keyValueStoreOption:]";
    v73 = 2080;
    v74 = "FCPurchaseManager.m";
    v75 = 1024;
    v76 = 103;
    v77 = 2114;
    v78 = v51;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v16 = v50;
    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v52 = v16;
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "purchaseIntegrityChecker != nil");
    *(_DWORD *)buf = 136315906;
    v72 = "-[FCPurchaseManager initWithCloudContext:purchaseIntegrityChecker:purchaseReceiptProvider:paymentTransactionMa"
          "nager:bundleSubscriptionManager:keyValueStoreOption:]";
    v73 = 2080;
    v74 = "FCPurchaseManager.m";
    v75 = 1024;
    v76 = 104;
    v77 = 2114;
    v78 = v53;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v16 = v52;
  }
LABEL_6:
  if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "purchaseReceiptProvider != nil");
    *(_DWORD *)buf = 136315906;
    v72 = "-[FCPurchaseManager initWithCloudContext:purchaseIntegrityChecker:purchaseReceiptProvider:paymentTransactionMa"
          "nager:bundleSubscriptionManager:keyValueStoreOption:]";
    v73 = 2080;
    v74 = "FCPurchaseManager.m";
    v75 = 1024;
    v76 = 105;
    v77 = 2114;
    v78 = v54;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v16 = 0;
  }
  if (!v62 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v55 = v16;
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "paymentTransactionManager != nil");
    *(_DWORD *)buf = 136315906;
    v72 = "-[FCPurchaseManager initWithCloudContext:purchaseIntegrityChecker:purchaseReceiptProvider:paymentTransactionMa"
          "nager:bundleSubscriptionManager:keyValueStoreOption:]";
    v73 = 2080;
    v74 = "FCPurchaseManager.m";
    v75 = 1024;
    v76 = 106;
    v77 = 2114;
    v78 = v56;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    v16 = v55;
  }
  v66.receiver = self;
  v66.super_class = (Class)FCPurchaseManager;
  v65 = -[FCPurchaseManager init](&v66, sel_init);
  if (v65)
  {
    v58 = v16;
    v59 = v15;
    objc_msgSend(v14, "purchaseController");
    v17 = objc_claimAutoreleasedReturnValue();
    purchaseController = v65->_purchaseController;
    v65->_purchaseController = (FCPurchaseController *)v17;

    objc_storeStrong((id *)&v65->_purchaseIntegrityChecker, a4);
    objc_storeStrong((id *)&v65->_purchaseReceiptProvider, a5);
    objc_storeStrong((id *)&v65->_paymentTransactionManager, a6);
    objc_storeStrong((id *)&v65->_bundleSubscriptionManager, a7);
    v19 = objc_alloc_init(FCReceiptRefresher);
    receiptRefresher = v65->_receiptRefresher;
    v65->_receiptRefresher = v19;

    -[FCPaymentTransactionManager setDelegate:](v65->_paymentTransactionManager, "setDelegate:", v65);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    cachedPurchaseModels = v65->_cachedPurchaseModels;
    v65->_cachedPurchaseModels = (NSMutableDictionary *)v21;

    v23 = (NFMutexLock *)objc_alloc_init(MEMORY[0x1E0D60AE0]);
    accessLock = v65->_accessLock;
    v65->_accessLock = v23;

    objc_msgSend(v14, "privateDataDirectory");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = [FCKeyValueStore alloc];
    v57 = (void *)v25;
    v27 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:](v26, "initWithName:directory:version:options:classRegistry:", FCPurchaseManagementFileName, v25, 2, a8, 0);
    localStore = v65->_localStore;
    v65->_localStore = (FCKeyValueStore *)v27;

    v60 = v14;
    objc_msgSend(v14, "appActivityMonitor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:", v65);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    ongoingPurchaseEntriesByProductID = v65->_ongoingPurchaseEntriesByProductID;
    v65->_ongoingPurchaseEntriesByProductID = (NSMutableDictionary *)v30;

    v32 = v65->_localStore;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[FCKeyValueStore allKeys](v32, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v67, buf, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v68;
      v37 = 0x1E0C99000uLL;
      v63 = v32;
      v64 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v68 != v36)
            objc_enumerationMutation(v33);
          v39 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_opt_class();
          -[FCKeyValueStore objectForKey:](v32, "objectForKey:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v41 = v40;
            else
              v41 = 0;
          }
          else
          {
            v41 = 0;
          }
          v42 = v41;

          if (v42 && objc_msgSend(v39, "hasPrefix:", CFSTR("onpc-")))
          {
            v43 = -[FCOngoingPurchaseEntry initWithEntryID:dictionaryRepresentation:]([FCOngoingPurchaseEntry alloc], "initWithEntryID:dictionaryRepresentation:", v39, v42);
            if (v43)
            {
              v44 = v65->_ongoingPurchaseEntriesByProductID;
              -[FCOngoingPurchaseEntry productID](v43, "productID");
              v45 = v37;
              v46 = v35;
              v47 = v33;
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v44, "setObject:forKey:", v43, v48);

              v33 = v47;
              v35 = v46;
              v37 = v45;
              v32 = v63;
              v36 = v64;
              -[FCPaymentTransactionManager registerOngoingPurchaseTransactionsWithEntry:](v65->_paymentTransactionManager, "registerOngoingPurchaseTransactionsWithEntry:", v43);
            }

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v67, buf, 16);
      }
      while (v35);
    }

    v15 = v59;
    v14 = v60;
    v16 = v58;
  }

  return v65;
}

- (void)activityObservingApplicationWillEnterForeground
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  if (self)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", FCPurchaseModelCacheDate);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v7);
    v6 = v5;

    if (v6 > (double)(unint64_t)kPurchaseModelMaxAllowedCacheTime)
    {
      -[NFMutexLock lock](self->_accessLock, "lock");
      -[NSMutableDictionary removeAllObjects](self->_cachedPurchaseModels, "removeAllObjects");
      -[NFMutexLock unlock](self->_accessLock, "unlock");
    }

  }
}

- (FCPurchaseManager)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPurchaseManager init]";
    v9 = 2080;
    v10 = "FCPurchaseManager.m";
    v11 = 1024;
    v12 = 93;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPurchaseManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)activityObservingApplicationDidEnterBackground
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, FCPurchaseModelCacheDate);

  -[FCPurchaseManager cleanupStaleOngoingPurchaseEntries]((uint64_t)self);
  if (self)
    -[FCKeyValueStore saveWithCompletionHandler:](self->_localStore, "saveWithCompletionHandler:", 0);
}

- (void)cleanupStaleOngoingPurchaseEntries
{
  void *v2;
  _QWORD v3[5];

  if (a1)
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 80), "copy");
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__FCPurchaseManager_cleanupStaleOngoingPurchaseEntries__block_invoke;
    v3[3] = &unk_1E463EC10;
    v3[4] = a1;
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

  }
}

- (id)fetchPurchaseMetadataForPurchaseID:(id)a3 restorePurchase:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0D60AF0]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke;
  v11[3] = &unk_1E463EB48;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  v9 = (void *)objc_msgSend(v7, "initWithResolver:", v11);

  return v9;
}

void __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, void *);
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  void (**v24)(id, void *);
  _QWORD v25[4];
  id v26;
  char v27;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 104);
  else
    v8 = 0;
  objc_msgSend(v8, "lock");
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(void **)(v9 + 88);
  else
    v10 = 0;
  objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    v13 = *(void **)(v12 + 104);
  else
    v13 = 0;
  objc_msgSend(v13, "unlock");
  if (v11)
  {
    v5[2](v5, v11);
  }
  else
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = (void *)MEMORY[0x1E0D60AF0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_2;
    v25[3] = &unk_1E463EAF8;
    v26 = *(id *)(a1 + 40);
    v27 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v15, "firstly:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    zalgo();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    v23[1] = 3221225472;
    v23[2] = __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_3;
    v23[3] = &unk_1E463EB20;
    v23[4] = *(_QWORD *)(a1 + 32);
    v24 = v5;
    objc_msgSend(v16, "thenOn:then:", v17, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    zalgo();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_4;
    v21[3] = &unk_1E463DB48;
    v22 = v6;
    v20 = (id)objc_msgSend(v18, "errorOn:error:", v19, v21);

  }
}

id __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_2(uint64_t a1)
{
  FCPurchaseMetadataFetcher *v2;
  void *v3;

  v2 = objc_alloc_init(FCPurchaseMetadataFetcher);
  -[FCPurchaseMetadataFetcher fetchPurchaseMetadataForPurchaseID:restorePurchase:](v2, "fetchPurchaseMetadataForPurchaseID:restorePurchase:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 104);
  else
    v5 = 0;
  objc_msgSend(v5, "lock");
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[11];
  v7 = v6;
  objc_msgSend(v3, "purchaseID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, v8);

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(void **)(v9 + 104);
  else
    v10 = 0;
  objc_msgSend(v10, "unlock");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return 0;
}

uint64_t __72__FCPurchaseManager_fetchPurchaseMetadataForPurchaseID_restorePurchase___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startBundlePurchaseWithPurchase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  objc_msgSend(v6, "offerName");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "purchaseID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appAdamID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storeExternalVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "price");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "payment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPurchaseManager startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:price:webAccessOptIn:payment:error:]((id *)&self->super.isa, CFSTR("bundleSubscriptionTagID"), v13, v7, v8, v9, v10, v11, 0, v12, a4);
}

- (void)startPurchaseWithTagID:(void *)a3 productID:(void *)a4 purchaseID:(void *)a5 bundleID:(void *)a6 appAdamID:(void *)a7 storeExternalVersion:(void *)a8 price:(unsigned __int8)a9 webAccessOptIn:(void *)a10 payment:(_QWORD *)a11 error:
{
  id v18;
  id v19;
  char *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  SEL v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  dispatch_time_t v30;
  FCOngoingPurchaseEntry *v31;
  NSObject *v32;
  _BOOL4 v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  FCOngoingPurchaseEntry *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD block[4];
  FCOngoingPurchaseEntry *v60;
  id *v61;
  id v62;
  uint64_t v63;
  const __CFString *v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  char *v68;
  __int16 v69;
  _BYTE v70[18];
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v58 = a6;
  v57 = a7;
  v56 = a8;
  v22 = a10;
  if (!a1)
    goto LABEL_29;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "productID");
    *(_DWORD *)buf = 136315906;
    v66 = "-[FCPurchaseManager startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:price:"
          "webAccessOptIn:payment:error:]";
    v67 = 2080;
    v68 = "FCPurchaseManager.m";
    v69 = 1024;
    *(_DWORD *)v70 = 250;
    *(_WORD *)&v70[4] = 2114;
    *(_QWORD *)&v70[6] = v51;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v20)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "purchaseID");
        *(_DWORD *)buf = 136315906;
        v66 = "-[FCPurchaseManager startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:pr"
              "ice:webAccessOptIn:payment:error:]";
        v67 = 2080;
        v68 = "FCPurchaseManager.m";
        v69 = 1024;
        *(_DWORD *)v70 = 251;
        *(_WORD *)&v70[4] = 2114;
        *(_QWORD *)&v70[6] = v52;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
    }
  }
  else if (!v20)
  {
    goto LABEL_5;
  }
  if (!v22 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "payment");
    *(_DWORD *)buf = 136315906;
    v66 = "-[FCPurchaseManager startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:price:"
          "webAccessOptIn:payment:error:]";
    v67 = 2080;
    v68 = "FCPurchaseManager.m";
    v69 = 1024;
    *(_DWORD *)v70 = 252;
    *(_WORD *)&v70[4] = 2114;
    *(_QWORD *)&v70[6] = v53;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (objc_msgSend(a1, "anyOngoingPurchases"))
    -[FCPurchaseManager cleanupStaleOngoingPurchaseEntries]((uint64_t)a1);
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "iTunesAccountDSID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setProperty_nonatomic_copy(a1, v25, v24, 96);

  objc_msgSend(a1, "purchaseFlowOverrideProvider");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    objc_msgSend(a1, "purchaseFlowOverrideProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "shouldOverridePurchaseFlow");

    if (v29)
    {
      v30 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __140__FCPurchaseManager_startPurchaseWithTagID_productID_purchaseID_bundleID_appAdamID_storeExternalVersion_price_webAccessOptIn_payment_error___block_invoke;
      block[3] = &unk_1E463B228;
      v60 = (FCOngoingPurchaseEntry *)v19;
      v61 = a1;
      v62 = v18;
      dispatch_after(v30, MEMORY[0x1E0C80D38], block);

      v31 = v60;
LABEL_28:

      goto LABEL_29;
    }
  }
  if ((objc_msgSend(a1[4], "canMakePayments") & 1) != 0)
  {
    objc_msgSend(a1[10], "objectForKey:", v19);
    v31 = (FCOngoingPurchaseEntry *)objc_claimAutoreleasedReturnValue();
    v32 = FCPurchaseLog;
    v33 = os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v33)
      {
        *(_DWORD *)buf = 138412802;
        v66 = (const char *)v18;
        v67 = 2112;
        v68 = v20;
        v69 = 2112;
        *(_QWORD *)v70 = v19;
        _os_log_impl(&dword_1A1B90000, v32, OS_LOG_TYPE_DEFAULT, "ongoingPurchaseEntry already exists for tagID:%@ purchaseID:%@ productIdentifier:%@", buf, 0x20u);
      }
      if (a11)
      {
        v34 = v21;
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v36 = FCOngoingPurchaseErrorCode;
        v63 = *MEMORY[0x1E0CB2D50];
        v64 = CFSTR("There is a ongoing purchase transaction for the given product identifier");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v35;
        v21 = v34;
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.purchase"), v36, v37);
        *a11 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (v33)
      {
        *(_DWORD *)buf = 138544130;
        v66 = (const char *)v18;
        v67 = 2114;
        v68 = v20;
        v69 = 2114;
        *(_QWORD *)v70 = v19;
        *(_WORD *)&v70[8] = 2114;
        *(_QWORD *)&v70[10] = v21;
        _os_log_impl(&dword_1A1B90000, v32, OS_LOG_TYPE_DEFAULT, "Starting purchase for tagID: %{public}@ purchaseID: %{public}@ productIdentifier: %{public}@, bundleID: %{public}@", buf, 0x2Au);
      }
      v42 = [FCOngoingPurchaseEntry alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("onpc-"), v19);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      FCDeviceIdentifierForVendor();
      v55 = v21;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExternalVersion:vendorIdentifier:purchaseInitiatedTime:price:](v42, "initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExternalVersion:vendorIdentifier:purchaseInitiatedTime:price:", v43, v18, v20, v19, v55, a9, v58, v57, v44, v45, v56);

      v46 = a1[10];
      -[FCOngoingPurchaseEntry productID](v31, "productID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setObject:forKey:", v31, v47);

      v48 = a1[3];
      -[FCOngoingPurchaseEntry dictionaryRepresentation](v31, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCOngoingPurchaseEntry identifier](v31, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKey:", v49, v50);

      v21 = v55;
      LOBYTE(v54) = a9;
      objc_msgSend(a1[4], "startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:price:webAccessOptIn:payment:", v18, v19, v20, v55, v58, v57, v56, v54, v22);
    }
    goto LABEL_28;
  }
  v39 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v39, OS_LOG_TYPE_DEFAULT, "In-App purchase is disabled in this device.", buf, 2u);
  }
  if (a11)
  {
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = FCPaymentRestrictedErrorCode;
    v71 = *MEMORY[0x1E0CB2D50];
    v72[0] = CFSTR("This device is not able or allowed to make payments");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
    v31 = (FCOngoingPurchaseEntry *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.purchase"), v41, v31);
    *a11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_29:

}

- (void)startPurchaseWithTagID:(id)a3 purchase:(id)a4 webAccessOptIn:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "offerName");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purchaseID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appAdamID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storeExternalVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "price");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPurchaseManager startPurchaseWithTagID:productID:purchaseID:bundleID:appAdamID:storeExternalVersion:price:webAccessOptIn:payment:error:]((id *)&self->super.isa, v10, v18, v11, v12, v13, v14, v15, a5, v16, a6);
}

void __140__FCPurchaseManager_startPurchaseWithTagID_productID_purchaseID_bundleID_appAdamID_storeExternalVersion_price_webAccessOptIn_payment_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  FCCompletedPaymentTransaction *v7;

  v7 = -[FCCompletedPaymentTransaction initWithProductID:receipt:appleIDAccountDetails:]([FCCompletedPaymentTransaction alloc], "initWithProductID:receipt:appleIDAccountDetails:", *(_QWORD *)(a1 + 32), CFSTR("receipt"), 0);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  +[FCOngoingPurchaseEntry dummyOngoingPurchaseEntryWithTagID:](FCOngoingPurchaseEntry, "dummyOngoingPurchaseEntryWithTagID:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purchaseSuccessWithProductID:transaction:chargeCurrencyCode:ongoingPurchaseEntry:", v3, v7, CFSTR("USD"), v4);

  -[FCPurchaseManager finishPurchaseTransactionWithProductID:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    v6 = *(void **)(v5 + 56);
  else
    v6 = 0;
  objc_msgSend(v6, "refreshBundleSubscriptionWithCachePolicy:completion:", 2, 0);

}

- (void)finishPurchaseTransactionWithProductID:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (a1)
  {
    v3 = *(void **)(a1 + 80);
    v4 = a2;
    objc_msgSend(v3, "removeObjectForKey:", v4);
    v5 = *(void **)(a1 + 24);
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), CFSTR("onpc-"), v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeObjectForKey:", v8);
  }
}

- (void)transactionFailedWithProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *ongoingPurchaseEntriesByProductID;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *lastSignedInItunesAccountDSID;
  void *v16;
  FCPurchaseIntegrityChecker *purchaseIntegrityChecker;
  FCPurchaseManager *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  int64_t v27;

  v8 = a3;
  v9 = a5;
  if (self)
    ongoingPurchaseEntriesByProductID = self->_ongoingPurchaseEntriesByProductID;
  else
    ongoingPurchaseEntriesByProductID = 0;
  v11 = ongoingPurchaseEntriesByProductID;
  -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v18 = self;
    v19 = v8;
    v20 = a4;
    v21 = v9;
    v22 = 0;
LABEL_10:
    -[FCPurchaseManager _purchaseFailedWithProductID:transactionState:transactionError:ongoingPurchaseEntry:]((uint64_t)v18, v19, v20, v21, v22);
    goto LABEL_11;
  }
  if (!self
    || (+[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "iTunesAccountDSID"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        lastSignedInItunesAccountDSID = self->_lastSignedInItunesAccountDSID,
        v14,
        v13,
        lastSignedInItunesAccountDSID)
    || !v14)
  {
    v18 = self;
    v19 = v8;
    v20 = a4;
    v21 = v9;
    v22 = v12;
    goto LABEL_10;
  }
  objc_msgSend(v12, "purchaseID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  purchaseIntegrityChecker = self->_purchaseIntegrityChecker;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86__FCPurchaseManager_transactionFailedWithProductID_transactionState_transactionError___block_invoke;
  v23[3] = &unk_1E463EB70;
  v23[4] = self;
  v24 = v8;
  v27 = a4;
  v25 = v12;
  v26 = v9;
  -[FCPurchaseIntegrityChecker isUserEntitledToSubscriptionForPurchaseID:completion:](purchaseIntegrityChecker, "isUserEntitledToSubscriptionForPurchaseID:completion:", v16, v23);

LABEL_11:
}

void __86__FCPurchaseManager_transactionFailedWithProductID_transactionState_transactionError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = FCAlreadyPurchasedErrorCode;
    v7 = *MEMORY[0x1E0CB2D50];
    v8[0] = CFSTR("Subscription already purchased by this itunes account");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.news.purchase"), v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCPurchaseManager _purchaseFailedWithProductID:transactionState:transactionError:ongoingPurchaseEntry:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 64), v6, *(void **)(a1 + 48));
  }
  else
  {
    -[FCPurchaseManager _purchaseFailedWithProductID:transactionState:transactionError:ongoingPurchaseEntry:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 64), *(void **)(a1 + 56), *(void **)(a1 + 48));
  }
}

- (void)_purchaseFailedWithProductID:(uint64_t)a3 transactionState:(void *)a4 transactionError:(void *)a5 ongoingPurchaseEntry:
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __105__FCPurchaseManager__purchaseFailedWithProductID_transactionState_transactionError_ongoingPurchaseEntry___block_invoke;
    v12[3] = &unk_1E463C940;
    v12[4] = a1;
    v13 = v9;
    v16 = a3;
    v14 = v10;
    v15 = v11;
    FCPerformBlockOnMainThread(v12);

  }
}

void __105__FCPurchaseManager__purchaseFailedWithProductID_transactionState_transactionError_ongoingPurchaseEntry___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purchaseFailedWithProductID:transactionState:transactionError:ongoingPurchaseEntry:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  -[FCPurchaseManager finishPurchaseTransactionWithProductID:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)transactionPurchased:(id)a3
{
  id v4;
  NSMutableDictionary *ongoingPurchaseEntriesByProductID;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  FCPurchaseIntegrityChecker *purchaseIntegrityChecker;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    ongoingPurchaseEntriesByProductID = self->_ongoingPurchaseEntriesByProductID;
  else
    ongoingPurchaseEntriesByProductID = 0;
  v6 = ongoingPurchaseEntriesByProductID;
  objc_msgSend(v4, "productID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "tagID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "purchaseID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v8, "bundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      v27 = 2114;
      v28 = v13;
      _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "transaction purchase callback with ongoingPurchaseEntry tagID: %{public}@ purchaseID: %{public}@ bundleID: %{public}@", buf, 0x20u);

    }
    if (self)
      purchaseIntegrityChecker = self->_purchaseIntegrityChecker;
    else
      purchaseIntegrityChecker = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __42__FCPurchaseManager_transactionPurchased___block_invoke;
    v19[3] = &unk_1E463EB98;
    v19[4] = self;
    v20 = v9;
    v21 = v8;
    v22 = v4;
    v15 = v9;
    -[FCPurchaseIntegrityChecker isUserEntitledToSubscriptionForPurchaseID:completion:](purchaseIntegrityChecker, "isUserEntitledToSubscriptionForPurchaseID:completion:", v10, v19);

  }
  else
  {
    v16 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
    {
      v17 = v16;
      objc_msgSend(v4, "productID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v18;
      _os_log_error_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_ERROR, "ongoingPurchaseEntry not found for productID: %{public}@", buf, 0xCu);

    }
  }

}

void __42__FCPurchaseManager_transactionPurchased___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id *v7;
  id *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[16];

  v3 = a2;
  v4 = FCPurchaseLog;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "Purchase is found in entitlements response.", buf, 2u);
    }
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__FCPurchaseManager_transactionPurchased___block_invoke_52;
    v12[3] = &unk_1E463C918;
    v12[4] = v5;
    v7 = &v13;
    v13 = *(id *)(a1 + 48);
    v8 = &v14;
    v14 = *(id *)(a1 + 56);
    v15 = v3;
    -[FCPurchaseManager performEntitlementWithTagID:completion:](v5, v6, v12);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "Purchase is not found in entitlements response. Could be an illegal purchase attempt.", buf, 2u);
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__FCPurchaseManager_transactionPurchased___block_invoke_53;
    v9[3] = &unk_1E463B228;
    v9[4] = *(_QWORD *)(a1 + 32);
    v7 = &v10;
    v10 = *(id *)(a1 + 56);
    v8 = &v11;
    v11 = *(id *)(a1 + 48);
    FCPerformBlockOnMainThread(v9);
  }

}

void __42__FCPurchaseManager_transactionPurchased___block_invoke_52(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__FCPurchaseManager_transactionPurchased___block_invoke_2;
  v3[3] = &unk_1E463C918;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  FCPerformBlockOnMainThread(v3);

}

void __42__FCPurchaseManager_transactionPurchased___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  FCCompletedPaymentTransaction *v8;
  void *v9;
  void *v10;
  FCCompletedPaymentTransaction *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = *(void **)(a1 + 40);
  v4 = v2;
  objc_msgSend(v3, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purchaseReceiptWithBundleID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "PurchaseReceipt:  %@", (uint8_t *)&v17, 0xCu);
  }
  v8 = [FCCompletedPaymentTransaction alloc];
  objc_msgSend(*(id *)(a1 + 48), "productID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "appleIDAccountDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCCompletedPaymentTransaction initWithProductID:receipt:appleIDAccountDetails:](v8, "initWithProductID:receipt:appleIDAccountDetails:", v9, v6, v10);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCompletedPaymentTransaction productID](v11, "productID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "chargeCurrencyCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "purchaseSuccessWithProductID:transaction:chargeCurrencyCode:ongoingPurchaseEntry:", v13, v11, v14, *(_QWORD *)(a1 + 40));

  v15 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "productID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseManager finishPurchaseTransactionWithProductID:](v15, v16);

}

- (void)performEntitlementWithTagID:(void *)a3 completion:
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("bundleSubscriptionTagID")))
    {
      v7 = *(void **)(a1 + 56);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __60__FCPurchaseManager_performEntitlementWithTagID_completion___block_invoke;
      v8[3] = &unk_1E463E560;
      v9 = v6;
      objc_msgSend(v7, "refreshBundleSubscriptionWithCachePolicy:completion:", 2, v8);

    }
    else
    {
      v6[2](v6);
    }
  }

}

void __42__FCPurchaseManager_transactionPurchased___block_invoke_53(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "productID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purchaseFailedForInvalidPurchaseReceiptWithProductID:ongoingPurchaseEntry:", v3, *(_QWORD *)(a1 + 48));

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "productID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseManager finishPurchaseTransactionWithProductID:](v4, v5);

}

uint64_t __60__FCPurchaseManager_performEntitlementWithTagID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isPurchaseOngoingForTagID:(id)a3
{
  id v4;
  NSMutableDictionary *ongoingPurchaseEntriesByProductID;
  NSMutableDictionary *v6;
  void *v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  FCPurchaseManager *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (self)
    ongoingPurchaseEntriesByProductID = self->_ongoingPurchaseEntriesByProductID;
  else
    ongoingPurchaseEntriesByProductID = 0;
  v6 = ongoingPurchaseEntriesByProductID;
  v7 = (void *)-[NSMutableDictionary copy](v6, "copy");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__FCPurchaseManager_isPurchaseOngoingForTagID___block_invoke;
  v11[3] = &unk_1E463EBE8;
  v8 = v4;
  v12 = v8;
  v13 = self;
  v14 = &v15;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  v9 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __47__FCPurchaseManager_isPurchaseOngoingForTagID___block_invoke(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "tagID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", a1[4]);

  v8 = v11;
  if (v7)
  {
    if (-[FCPurchaseManager isPurchaseTimeElapsedWithEntry:](a1[5], v11))
    {
      v9 = a1[5];
      objc_msgSend(v11, "productID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPurchaseManager finishPurchaseTransactionWithProductID:](v9, v10);

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    }
    *a4 = 1;
    v8 = v11;
  }

}

- (BOOL)isPurchaseTimeElapsedWithEntry:(_BOOL8)result
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  if (result)
  {
    v2 = (void *)MEMORY[0x1E0C99D68];
    v3 = a2;
    objc_msgSend(v2, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "purchaseInitiatedTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

    return v7 > (double)(unint64_t)kOngoingPurchaseMaxAllowedPurchaseTime;
  }
  return result;
}

- (BOOL)anyOngoingPurchases
{
  if (self)
    self = (FCPurchaseManager *)self->_ongoingPurchaseEntriesByProductID;
  return -[FCPurchaseManager count](self, "count") != 0;
}

void __55__FCPurchaseManager_cleanupStaleOngoingPurchaseEntries__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[FCPurchaseManager isPurchaseTimeElapsedWithEntry:](*(_QWORD *)(a1 + 32), v6))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "productID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPurchaseManager finishPurchaseTransactionWithProductID:](v4, v5);

  }
}

void __67__FCPurchaseManager_simulateSuccessfulPurchaseWithProductID_tagID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__FCPurchaseManager_simulateSuccessfulPurchaseWithProductID_tagID___block_invoke_2;
  v5[3] = &unk_1E463B228;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  FCPerformBlockOnMainThread(v5);

}

void __67__FCPurchaseManager_simulateSuccessfulPurchaseWithProductID_tagID___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  FCCompletedPaymentTransaction *v5;

  v5 = -[FCCompletedPaymentTransaction initWithProductID:receipt:appleIDAccountDetails:]([FCCompletedPaymentTransaction alloc], "initWithProductID:receipt:appleIDAccountDetails:", *(_QWORD *)(a1 + 32), CFSTR("purchaseReceipt"), 0);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  +[FCOngoingPurchaseEntry dummyOngoingPurchaseEntryWithTagID:](FCOngoingPurchaseEntry, "dummyOngoingPurchaseEntryWithTagID:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purchaseSuccessWithProductID:transaction:chargeCurrencyCode:ongoingPurchaseEntry:", v3, v5, CFSTR("currencyCode"), v4);

}

- (void)simulateSuccessfulPurchaseWithProductID:(id)a3 tagID:(id)a4 purchaseID:(id)a5
{
  FCPurchaseController *purchaseController;
  id v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  id v14;
  __CFString *v15;
  id v17;
  _QWORD v18[4];
  id v19;
  FCPurchaseManager *v20;
  __CFString *v21;

  if (self)
  {
    purchaseController = self->_purchaseController;
    v9 = a3;
    -[FCPurchaseController addAppStorePurchaseWithTagID:purchaseID:](purchaseController, "addAppStorePurchaseWithTagID:purchaseID:", a4, a5, a3);
    v10 = v9;
    v11 = CFSTR("tagID");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __67__FCPurchaseManager_simulateSuccessfulPurchaseWithProductID_tagID___block_invoke;
    v18[3] = &unk_1E463B228;
    v19 = v10;
    v20 = self;
    v12 = CFSTR("tagID");
    v21 = CFSTR("tagID");
    -[FCPurchaseManager performEntitlementWithTagID:completion:]((uint64_t)self, CFSTR("tagID"), v18);

  }
  else
  {
    v13 = a3;
    objc_msgSend(0, "addAppStorePurchaseWithTagID:purchaseID:", a4, a5, a3);
    v14 = v13;
    v15 = CFSTR("tagID");
  }

}

- (void)simulateFailurePurchaseWithProductID:(id)a3 transactionState:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a3;
  -[FCPurchaseManager delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[FCOngoingPurchaseEntry dummyOngoingPurchaseEntryWithTagID:](FCOngoingPurchaseEntry, "dummyOngoingPurchaseEntryWithTagID:", CFSTR("tagID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "purchaseFailedWithProductID:transactionState:transactionError:ongoingPurchaseEntry:", v9, a4, v8, v10);

}

- (FCPurchaseManagerDelegate)delegate
{
  return (FCPurchaseManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (FCPurchaseFlowOverrideProviderType)purchaseFlowOverrideProvider
{
  return self->purchaseFlowOverrideProvider;
}

- (void)setPurchaseFlowOverrideProvider:(id)a3
{
  objc_storeStrong((id *)&self->purchaseFlowOverrideProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_lastSignedInItunesAccountDSID, 0);
  objc_storeStrong((id *)&self->_cachedPurchaseModels, 0);
  objc_storeStrong((id *)&self->_ongoingPurchaseEntriesByProductID, 0);
  objc_storeStrong((id *)&self->_receiptRefresher, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_purchaseReceiptProvider, 0);
  objc_storeStrong((id *)&self->_purchaseIntegrityChecker, 0);
  objc_storeStrong((id *)&self->_paymentTransactionManager, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->purchaseFlowOverrideProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
