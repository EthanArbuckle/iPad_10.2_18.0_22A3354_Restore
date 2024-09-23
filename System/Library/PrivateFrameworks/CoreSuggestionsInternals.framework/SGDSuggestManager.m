@implementation SGDSuggestManager

- (id)consumerName
{
  return CFSTR("com.apple.CoreSuggestionsInternals.SGDSuggestManager");
}

- (void)namesForDetailCacheSnapshotsWithCompletion:(id)a3
{
  SGSqlEntityStore *harvestStore;
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  harvestStore = self->_harvestStore;
  v5 = (void (**)(id, void *))a3;
  -[SGSqlEntityStore kvCacheManager](harvestStore, "kvCacheManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cacheOfType:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[SGSqlEntityStore kvCacheManager](self->_harvestStore, "kvCacheManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cacheOfType:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D19998];
  -[SGDSuggestManager _maybeFormatString](self, "_maybeFormatString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "responseWith:also:also:", v8, v12, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v11);

}

- (id)_maybeFormatString
{
  if (_maybeFormatString_once != -1)
    dispatch_once(&_maybeFormatString_once, &__block_literal_global_693);
  return (id)_maybeFormatString_localizedString;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[16];

  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: deleteDataDerivedFromContentMatchingRequest", buf, 2u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke;
  v10[3] = &unk_1E7DAD540;
  v10[4] = self;
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_3;
  v9[3] = &unk_1E7DA93A0;
  v9[4] = self;
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_5;
  v8[3] = &unk_1E7DA93C8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_7;
  v7[3] = &unk_1E7DA93C8;
  objc_msgSend(v4, "accessCriteriaUsingBundleIdentifierBlock:domainSelectionBlock:incontrovertiblyDeletedUniqueIdentifiersBlock:purgedUniqueIdentifiersBlock:", v10, v9, v8, v7);

  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SGDSuggestManager)initWithConnection:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  SGDSuggestManager *v8;
  void *v9;
  void *v10;
  void *v11;
  SGDSuggestManager *v12;
  NSObject *v13;
  uint8_t v15[16];
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGDSuggestManager;
  v8 = -[SGDSuggestManager init](&v16, sel_init);
  if (!v8)
    goto LABEL_3;
  +[SGDManagerForCTS sharedSingletonInstance](SGDManagerForCTS, "sharedSingletonInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEKEventStoreProvider defaultEKStoreProvider](SGEKEventStoreProvider, "defaultEKStoreProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSuggestManager setupManagerWithConnection:store:ctsManager:ekStoreProvider:contactStore:pet2Tracker:](v8, "setupManagerWithConnection:store:ctsManager:ekStoreProvider:contactStore:pet2Tracker:", v6, v7, v9, v10, v11, 0);

  if (!v8->_harvestStore)
  {
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "SGDSuggestManager has no entity store and cannot continue", v15, 2u);
    }

    v12 = 0;
  }
  else
  {
LABEL_3:
    v12 = v8;
  }

  return v12;
}

- (void)setupManagerWithConnection:(id)a3 store:(id)a4 ctsManager:(id)a5 ekStoreProvider:(id)a6 contactStore:(id)a7 pet2Tracker:(id)a8
{
  id v15;
  PETEventTracker2 *v16;
  PETEventTracker2 *pet2Tracker;
  SGSqlEntityStore *v18;
  SGSqlEntityStore *harvestStore;
  SGServiceContext *v20;
  SGServiceContext *context;
  SGSuggestHistory *v22;
  SGSuggestHistory *history;
  void *v24;
  _PASNotificationToken *v25;
  _PASNotificationToken *assetUpdateToken;
  NSOperationQueue *v27;
  NSOperationQueue *messageHarvestQueue;
  NSString *v29;
  NSString *clientName;
  NSLock *v31;
  NSLock *dirtyLock;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSDictionary *v46;
  NSDictionary *bundleIdToPET;
  NSLock *v48;
  NSLock *lastSuggestionsFromMessageLock;
  void *v50;
  id v51;
  void *v52;
  _PASLock *v53;
  _PASLock *recentlyHarvestedDetailLock;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  _PASLock *v59;
  _PASLock *bufferedInteractionsForBundleLock;
  SGCoalescingDropBox *v61;
  SGCoalescingDropBox *v62;
  SGCoalescingDropBox *purgeDeletionDropBox;
  id v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  id location;
  _QWORD v91[20];
  _QWORD v92[22];

  v92[20] = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v81 = a4;
  v64 = a5;
  v65 = a6;
  v66 = a7;
  v15 = a8;
  v67 = v15;
  if (v15)
  {
    v16 = (PETEventTracker2 *)v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance", v64, v65, v66, 0);
    v16 = (PETEventTracker2 *)objc_claimAutoreleasedReturnValue();
  }
  pet2Tracker = self->_pet2Tracker;
  self->_pet2Tracker = v16;

  if (v81)
  {
    v18 = (SGSqlEntityStore *)v81;
  }
  else
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v18 = (SGSqlEntityStore *)objc_claimAutoreleasedReturnValue();
  }
  harvestStore = self->_harvestStore;
  self->_harvestStore = v18;

  v20 = -[SGServiceContext initWithStore:]([SGServiceContext alloc], "initWithStore:", self->_harvestStore);
  context = self->_context;
  self->_context = v20;

  objc_storeStrong((id *)&self->_connection, a3);
  +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
  v22 = (SGSuggestHistory *)objc_claimAutoreleasedReturnValue();
  history = self->_history;
  self->_history = v22;

  if (!-[SGSqlEntityStore isEphemeral](self->_harvestStore, "isEphemeral"))
    -[SGDSuggestManager _setupHistoryObserver:](self, "_setupHistoryObserver:", self->_harvestStore);
  location = 0;
  objc_initWeak(&location, self);
  +[SGAsset asset](SGAsset, "asset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke;
  v88[3] = &unk_1E7DA8970;
  objc_copyWeak(&v89, &location);
  objc_msgSend(v24, "registerUpdateHandler:", v88);
  v25 = (_PASNotificationToken *)objc_claimAutoreleasedReturnValue();
  assetUpdateToken = self->_assetUpdateToken;
  self->_assetUpdateToken = v25;

  objc_storeStrong((id *)&self->_ctsManager, a5);
  objc_storeStrong((id *)&self->_ekStoreProvider, a6);
  objc_storeStrong((id *)&self->_contactStore, a7);
  v27 = (NSOperationQueue *)objc_opt_new();
  messageHarvestQueue = self->_messageHarvestQueue;
  self->_messageHarvestQueue = v27;

  -[NSOperationQueue setQualityOfService:](self->_messageHarvestQueue, "setQualityOfService:", 17);
  -[NSOperationQueue setMaxConcurrentOperationCount:](self->_messageHarvestQueue, "setMaxConcurrentOperationCount:", 2);
  objc_msgSend(v72, "sgd_clientName");
  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  self->_clientName = v29;

  v31 = (NSLock *)objc_opt_new();
  dirtyLock = self->_dirtyLock;
  self->_dirtyLock = v31;

  v91[0] = *MEMORY[0x1E0D19A28];
  v33 = *MEMORY[0x1E0D19BD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19BD8]);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v80;
  v91[1] = *MEMORY[0x1E0D19A50];
  v34 = *MEMORY[0x1E0D19BF8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19BF8]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v79;
  v91[2] = *MEMORY[0x1E0D19A08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19BB8]);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v92[2] = v78;
  v91[3] = *MEMORY[0x1E0D19A38];
  v35 = *MEMORY[0x1E0D19BE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19BE8]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v92[3] = v77;
  v91[4] = *MEMORY[0x1E0D19A10];
  v36 = *MEMORY[0x1E0D19BC0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19BC0]);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v92[4] = v76;
  v91[5] = *MEMORY[0x1E0D19A00];
  v37 = *MEMORY[0x1E0D19BB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19BB0]);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v92[5] = v75;
  v91[6] = *MEMORY[0x1E0D19A68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19C08]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v92[6] = v74;
  v91[7] = *MEMORY[0x1E0D19A30];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19BE0]);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v92[7] = v73;
  v91[8] = *MEMORY[0x1E0D19A58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19C00]);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v92[8] = v71;
  v91[9] = *MEMORY[0x1E0D19A20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19BD0]);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v92[9] = v70;
  v91[10] = *MEMORY[0x1E0D19A18];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0D19BC8]);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v92[10] = v69;
  v91[11] = CFSTR("com.apple.MailCompositionService");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v92[11] = v68;
  v91[12] = CFSTR("com.apple.MobileAddressBook.ContactsViewService");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v92[12] = v38;
  v91[13] = CFSTR("com.apple.MobileAddressBook.ContactViewViewService");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v92[13] = v39;
  v91[14] = CFSTR("com.apple.mobilesms.compose");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v92[14] = v40;
  v91[15] = CFSTR("FaceTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v92[15] = v41;
  v91[16] = CFSTR("com.apple.FaceTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v92[16] = v42;
  v91[17] = CFSTR("InCallService");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v92[17] = v43;
  v91[18] = CFSTR("com.apple.telephonyutilities.callservicesd");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v92[18] = v44;
  v91[19] = CFSTR("MobilePhone");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v92[19] = v45;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 20);
  v46 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  bundleIdToPET = self->_bundleIdToPET;
  self->_bundleIdToPET = v46;

  v48 = (NSLock *)objc_opt_new();
  lastSuggestionsFromMessageLock = self->_lastSuggestionsFromMessageLock;
  self->_lastSuggestionsFromMessageLock = v48;

  v50 = (void *)MEMORY[0x1E0D198F0];
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_239;
  v86[3] = &unk_1E7DB7010;
  objc_copyWeak(&v87, &location);
  self->_settingsChangeToken = objc_msgSend(v50, "registerBlockOnSuggestionsSettingsChange:", v86);
  v51 = objc_alloc(MEMORY[0x1E0D815F0]);
  v52 = (void *)objc_opt_new();
  v53 = (_PASLock *)objc_msgSend(v51, "initWithGuardedData:", v52);
  recentlyHarvestedDetailLock = self->_recentlyHarvestedDetailLock;
  self->_recentlyHarvestedDetailLock = v53;

  v55 = (void *)MEMORY[0x1E0D81598];
  dispatch_get_global_queue(5, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_241;
  v84[3] = &unk_1E7DB7010;
  objc_copyWeak(&v85, &location);
  objc_msgSend(v55, "runAsyncOnQueue:afterDelaySeconds:block:", v56, v84, 5.0);

  self->_keepRealtimeAsLost = 0;
  v57 = objc_alloc(MEMORY[0x1E0D815F0]);
  v58 = (void *)objc_opt_new();
  v59 = (_PASLock *)objc_msgSend(v57, "initWithGuardedData:", v58);
  bufferedInteractionsForBundleLock = self->_bufferedInteractionsForBundleLock;
  self->_bufferedInteractionsForBundleLock = v59;

  v61 = [SGCoalescingDropBox alloc];
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_3;
  v82[3] = &unk_1E7DA89D8;
  objc_copyWeak(&v83, &location);
  v62 = -[SGCoalescingDropBox initWithName:boxMaker:handler:qos:](v61, "initWithName:boxMaker:handler:qos:", "SGDSuggestManager-purgeDeletionDropBox", &__block_literal_global_246, v82, 17);
  purgeDeletionDropBox = self->_purgeDeletionDropBox;
  self->_purgeDeletionDropBox = v62;

  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&v89);
  objc_destroyWeak(&location);

}

- (void)_setupHistoryObserver:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SGDSuggestManager__setupHistoryObserver___block_invoke;
  block[3] = &unk_1E7DB56F0;
  v9 = v3;
  v4 = _setupHistoryObserver__onceToken;
  v5 = v3;
  v7 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(&_setupHistoryObserver__onceToken, block);
    v6 = v9;
  }

}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_4;
  v10[3] = &unk_1E7DA9378;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "updateBox:", v10);

}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v6, "addDeletion:domainSelection:", v4, v5);
  LOBYTE(v4) = objc_msgSend(v6, "shouldRunHandlerImmediately");

  *a3 = v4;
}

- (void)contactMatchesWithContact:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 978, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contact"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 979, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "contactsFromContact: %@", buf, 0xCu);
  }

  v13 = (void *)MEMORY[0x1E0D19990];
  -[SGSqlEntityStore suggestContactMatchesWithContact:limitTo:](self->_harvestStore, "suggestContactMatchesWithContact:limitTo:", v9, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "responseWith:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, v15);

}

- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 containingSubstring:(id)a6 flagFilter:(unsigned __int8)a7 limit:(unsigned int)a8 withCompletion:(id)a9
{
  uint64_t v10;
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, void *);
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  __int16 v37;
  unsigned int v38;
  uint64_t v39;

  v10 = a7;
  v39 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = (void (**)(id, void *))a9;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 4593, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  sgLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    v28 = (uint64_t)v16;
    v29 = 2112;
    v30 = v17;
    v31 = 2112;
    v32 = v18;
    v33 = 2112;
    v34 = v19;
    v35 = 1024;
    v36 = v10;
    v37 = 1024;
    v38 = a8;
    _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-urlsFoundBetweenStartDate:%@ endDate:%@ excludingBundleIdentifiers:%@ containingSubstring:%@ flagFilter:%d limit:%u called", buf, 0x36u);
  }

  -[SGSqlEntityStore urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:containingSubstring:flagFilter:limit:](self->_harvestStore, "urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:containingSubstring:flagFilter:limit:", v16, v17, v18, v19, v10, a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134217984;
    v28 = v24;
    _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:containingSubstring:flagFilter:limit returning %tu URLs", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2](v20, v25);

}

- (void)contactMatchesWithContactIdentifier:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[9];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 986, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactIdentifier"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 987, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_debug_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEBUG, "contactsFromContactIdentifier: %@", buf, 0xCu);
  }

  v24 = 0;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C966D0];
  v25[0] = v13;
  v25[1] = v14;
  v15 = *MEMORY[0x1E0C966C0];
  v25[2] = *MEMORY[0x1E0C96780];
  v25[3] = v15;
  v16 = *MEMORY[0x1E0C967C0];
  v25[4] = *MEMORY[0x1E0C966A8];
  v25[5] = v16;
  v17 = *MEMORY[0x1E0C96868];
  v25[6] = *MEMORY[0x1E0C967F0];
  v25[7] = v17;
  v25[8] = *MEMORY[0x1E0C96670];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGContactsInterface unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:", v9, v18, self->_contactStore, &v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SGDSuggestManager contactMatchesWithContact:limitTo:withCompletion:](self, "contactMatchesWithContact:limitTo:withCompletion:", v19, a4, v11);
  }
  else
  {
    if (v24)
      objc_msgSend(MEMORY[0x1E0D19990], "responseWithError:");
    else
      objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", MEMORY[0x1E0C9AA60]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v20);

  }
  if (v24)
  {
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v24;
      _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "Error from CNContactStore contactWithIdentifier: %@", buf, 0xCu);
    }

  }
}

- (id)getPet2Tracker
{
  return self->_pet2Tracker;
}

- (void)_executeBoxTasks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "deleteUniqueIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v35 = v4;
  objc_msgSend(v4, "setDeleteUniqueIds:", v6);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v36 = v5;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGDSuggestManager deleteSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:completion:](self, "deleteSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:completion:", v12, v14, &__block_literal_global_249);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v9);
  }

  objc_msgSend(v35, "deleteDomainIds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  objc_msgSend(v35, "setDeleteDomainIds:", v16);

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v15, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v42 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v15, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGDSuggestManager deleteSpotlightReferencesWithBundleIdentifier:domainIdentifiers:completion:](self, "deleteSpotlightReferencesWithBundleIdentifier:domainIdentifiers:completion:", v22, v23, &__block_literal_global_250);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v19);
  }
  v34 = v15;

  objc_msgSend(v35, "purgeUniqueIds");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_opt_new();
  objc_msgSend(v35, "setPurgeUniqueIds:", v25);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v24, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
        objc_msgSend(v24, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "allObjects");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGDSuggestManager purgeSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:completion:](self, "purgeSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:completion:", v31, v33, &__block_literal_global_251);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v28);
  }

}

- (id)harvestStore
{
  return self->_harvestStore;
}

- (BOOL)keepRealtimeAsLost
{
  return self->_keepRealtimeAsLost;
}

- (id)recentlyHarvestedDetailLock
{
  return self->_recentlyHarvestedDetailLock;
}

- (id)lastSuggestionsFromMessageLock
{
  return self->_lastSuggestionsFromMessageLock;
}

- (id)lastSuggestionsFromMessageRequest
{
  return self->_lastSuggestionsFromMessageRequest;
}

- (void)setLastSuggestionsFromMessageRequest:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuggestionsFromMessageRequest, a3);
}

- (id)lastSuggestionsFromMessageResponse
{
  return self->_lastSuggestionsFromMessageResponse;
}

- (void)setLastSuggestionsFromMessageResponse:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuggestionsFromMessageResponse, a3);
}

- (id)messageHarvestQueue
{
  return self->_messageHarvestQueue;
}

- (void)contentAdmissionBlocklistDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v17 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: contentAdmissionBlocklistDidChange: called with %tu bundles", buf, 0xCu);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SGDSuggestManager deleteSpotlightReferencesWithBundleIdentifier:completion:](self, "deleteSpotlightReferencesWithBundleIdentifier:completion:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), &__block_literal_global_253, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (SGDSuggestManager)initWithMessagesConnection:(id)a3 store:(id)a4
{
  id v6;
  id v7;
  SGDSuggestManager *v8;
  void *v9;
  void *v10;
  void *v11;
  SGDSuggestManager *v12;
  NSObject *v13;
  uint8_t v15[16];
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGDSuggestManager;
  v8 = -[SGDSuggestManager init](&v16, sel_init);
  if (!v8)
    goto LABEL_3;
  +[SGDManagerForCTS sharedSingletonInstance](SGDManagerForCTS, "sharedSingletonInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEKEventStoreProvider defaultEKStoreProvider](SGEKEventStoreProvider, "defaultEKStoreProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSuggestManager setupManagerWithConnection:store:ctsManager:ekStoreProvider:contactStore:pet2Tracker:](v8, "setupManagerWithConnection:store:ctsManager:ekStoreProvider:contactStore:pet2Tracker:", v6, v7, v9, v10, v11, 0);

  if (!v8->_harvestStore)
  {
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "SGDSuggestManager has no entity store and cannot continue", v15, 2u);
    }

    v12 = 0;
  }
  else
  {
LABEL_3:
    v12 = v8;
  }

  return v12;
}

- (SGDSuggestManager)initWithStore:(id)a3 ctsManager:(id)a4 ekStoreProvider:(id)a5 contactStore:(id)a6 pet2Tracker:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SGDSuggestManager *v17;
  SGDSuggestManager *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SGDSuggestManager;
  v17 = -[SGDSuggestManager init](&v20, sel_init);
  v18 = v17;
  if (v17)
    -[SGDSuggestManager setupManagerWithConnection:store:ctsManager:ekStoreProvider:contactStore:pet2Tracker:](v17, "setupManagerWithConnection:store:ctsManager:ekStoreProvider:contactStore:pet2Tracker:", 0, v12, v13, v14, v15, v16);

  return v18;
}

- (SGDSuggestManager)initWithStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SGDSuggestManager *v8;

  v4 = a3;
  +[SGDManagerForCTS sharedSingletonInstance](SGDManagerForCTS, "sharedSingletonInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEKEventStoreProvider defaultEKStoreProvider](SGEKEventStoreProvider, "defaultEKStoreProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SGDSuggestManager initWithStore:ctsManager:ekStoreProvider:contactStore:pet2Tracker:](self, "initWithStore:ctsManager:ekStoreProvider:contactStore:pet2Tracker:", v4, v5, v6, v7, 0);

  return v8;
}

- (void)dealloc
{
  int settingsChangeToken;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  -[SGCoalescingDropBox wait](self->_purgeDeletionDropBox, "wait");
  settingsChangeToken = self->_settingsChangeToken;
  if (settingsChangeToken)
    notify_cancel(settingsChangeToken);
  +[SGAsset asset](SGAsset, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterUpdateHandlerAsyncWithToken:", self->_assetUpdateToken);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "SGDSuggestionsManager going away now, bye!", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)SGDSuggestManager;
  -[SGDSuggestManager dealloc](&v7, sel_dealloc);
}

- (id)_pmlTraining
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D81080];
  +[SGPaths suggestionsDirectory](SGPaths, "suggestionsDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedSingletonWithDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)clientIsMail
{
  void *v2;
  Protocol *v3;
  BOOL isEqual;

  -[NSXPCConnection exportedInterface](self->_connection, "exportedInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protocol");
  v3 = (Protocol *)objc_claimAutoreleasedReturnValue();
  isEqual = protocol_isEqual(v3, (Protocol *)&unk_1EF8EC640);

  return isEqual;
}

- (BOOL)clientIsMessages
{
  void *v2;
  Protocol *v3;
  BOOL isEqual;

  -[NSXPCConnection exportedInterface](self->_connection, "exportedInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protocol");
  v3 = (Protocol *)objc_claimAutoreleasedReturnValue();
  isEqual = protocol_isEqual(v3, (Protocol *)&unk_1EF8EE5E8);

  return isEqual;
}

- (void)prepareForRealtimeExtraction:(id)a3
{
  void (**v4)(id, void *);
  double Current;
  double v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  void (**v12)(id, void *);
  double v13;
  uint8_t buf[4];
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  Current = CFAbsoluteTimeGetCurrent();
  v6 = Current - *(double *)&prepareForRealtimeExtraction__lastWarmTime;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6 <= 300.0)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v15 = Current - *(double *)&prepareForRealtimeExtraction__lastWarmTime;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "Suggestions is already warmed up (as of %0.1f seconds ago)", buf, 0xCu);
    }

    v10 = (void *)objc_opt_new();
    v4[2](v4, v10);

  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "Warming up suggestions...", buf, 2u);
    }

    +[SGDPowerLog logPrewarmWithLastPrewarmTime:](SGDPowerLog, "logPrewarmWithLastPrewarmTime:", *(double *)&prepareForRealtimeExtraction__lastWarmTime);
    prepareForRealtimeExtraction__lastWarmTime = *(_QWORD *)&Current;
    dispatch_get_global_queue(17, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__SGDSuggestManager_prepareForRealtimeExtraction___block_invoke;
    block[3] = &unk_1E7DA8E60;
    block[4] = self;
    v13 = Current;
    v12 = v4;
    dispatch_async(v9, block);

  }
}

- (void)clearCachesFully:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v5)(id, void *);
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v4 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "clearCachesFully: %i", (uint8_t *)v8, 8u);
  }

  +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
  if (v4)
  {
    +[SGPatterns clearAllRegexCaches](SGPatterns, "clearAllRegexCaches");
    _PASSimpleICUClearCache();
    +[SGSqlEntityStore deletePreparedSqlStoreInMemory](SGSqlEntityStore, "deletePreparedSqlStoreInMemory");
    SGDataNormalizationClearCaches();
    objc_msgSend(MEMORY[0x1E0D1CF38], "resetSharedCachesAndModels");
  }
  if (v5)
  {
    v7 = (void *)objc_opt_new();
    v5[2](v5, v7);

  }
}

- (void)isEnabledWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D19990];
  v5 = a3;
  objc_msgSend(v4, "responseWith:", MEMORY[0x1E0C9AAB0]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)contactMatchesWithContactIdentifiers:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  SGDSuggestManager *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD);
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[9];
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1018, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactIdentifiers"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1019, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v32 = v10;
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v50 = objc_msgSend(v8, "count");
    _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "contactsFromContactIdentifiers (%lu ids)", buf, 0xCu);
  }

  v12 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v14)
  {
    v15 = v14;
    v41 = *(_QWORD *)v44;
    v40 = *MEMORY[0x1E0C966D0];
    v39 = *MEMORY[0x1E0C96780];
    v38 = *MEMORY[0x1E0C966C0];
    v37 = *MEMORY[0x1E0C966A8];
    v36 = *MEMORY[0x1E0C967C0];
    v35 = *MEMORY[0x1E0C967F0];
    v16 = *MEMORY[0x1E0C96868];
    v17 = *MEMORY[0x1E0C96670];
    obj = v13;
    while (2)
    {
      v18 = 0;
      do
      {
        v19 = v12;
        v20 = self;
        if (*(_QWORD *)v44 != v41)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v18);
        v42 = 0;
        objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v22;
        v47[1] = v40;
        v47[2] = v39;
        v47[3] = v38;
        v47[4] = v37;
        v47[5] = v36;
        v47[6] = v35;
        v47[7] = v16;
        v47[8] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGContactsInterface unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:", v21, v23, v20->_contactStore, &v42);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          v12 = v19;
          if (v42)
          {
            sgLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            v27 = (void (**)(_QWORD, _QWORD))v32;
            v13 = obj;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v42;
              _os_log_error_impl(&dword_1C3607000, v28, OS_LOG_TYPE_ERROR, "Error from CNContactStore contactWithIdentifier: %@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0D19990], "responseWithError:", v42);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", MEMORY[0x1E0C9AA60]);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void (**)(_QWORD, _QWORD))v32;
            v13 = obj;
          }
          ((void (**)(_QWORD, void *))v27)[2](v27, v29);

          v26 = v13;
          goto LABEL_20;
        }
        -[SGSqlEntityStore suggestContactMatchesWithContact:limitTo:](v20->_harvestStore, "suggestContactMatchesWithContact:limitTo:", v24, a4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v19;
        objc_msgSend(v19, "addObject:", v25);

        ++v18;
        self = v20;
      }
      while (v15 != v18);
      v13 = obj;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v15)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void (**)(_QWORD, _QWORD))v32;
  (*((void (**)(id, void *))v32 + 2))(v32, v26);
LABEL_20:

}

- (void)emailAddressIsSignificant:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
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
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1055, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1056, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-emailAddressIsSignificant:%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D19920], "recordIdForContactWithRowId:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D197E0];
  objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "emailAddress:label:extractionInfo:withRecordId:", v7, CFSTR("none"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D197B0];
  v23 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contactWithId:name:emailAddresses:phones:postalAddresses:socialProfiles:", v11, 0, v16, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D19990];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SGSqlEntityStore contactIsSignificantOrSignificanceIsDisabled:](self->_harvestStore, "contactIsSignificantOrSignificanceIsDisabled:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "responseWith:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v9)[2](v9, v20);

}

- (void)contactFromRecordId:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "contactFromRecordId: %@", (uint8_t *)&v11, 0xCu);
  }

  -[SGSqlEntityStore suggestContactByRecordId:](self->_harvestStore, "suggestContactByRecordId:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10);

}

- (void)cnContactMatchesForRecordId:(id)a3 withCompletion:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v15[0] = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__SGDSuggestManager_cnContactMatchesForRecordId_withCompletion___block_invoke;
  v12[3] = &unk_1E7DA8A80;
  v13 = v7;
  v14 = a2;
  v12[4] = self;
  v11 = v7;
  -[SGDSuggestManager cnContactMatchesForRecordIds:withCompletion:](self, "cnContactMatchesForRecordIds:withCompletion:", v10, v12);

}

- (void)cnContactMatchesForRecordIds:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[3];
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v6, "count");
    _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "cnContactMatchesForRecordIds (%lu ids)", (uint8_t *)&buf, 0xCu);
  }

  v13[2] = 0;
  v13[0] = CFSTR("cnContactMatchesForRecordIds");
  v13[1] = mach_absolute_time();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3446;
  v17 = __Block_byref_object_dispose__3447;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__SGDSuggestManager_cnContactMatchesForRecordIds_withCompletion___block_invoke;
  v12[3] = &unk_1E7DA8AA8;
  v12[4] = self;
  v12[5] = &buf;
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    goto LABEL_7;

  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
LABEL_7:
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0D19990], "responseWithError:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v11);
  v10 = (void *)MEMORY[0x1E0C9AA60];
LABEL_8:

  _Block_object_dispose(&buf, 8);
  SGRecordMeasurementState(v13);

}

- (id)storageContactFromRecordId:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "storageContactFromRecordId: %@", (uint8_t *)&v8, 0xCu);
  }

  -[SGSqlEntityStore storageContactByRecordId:withSnippets:](self->_harvestStore, "storageContactByRecordId:withSnippets:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)contactMatchesWithFullTextSearch:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    v20 = 2048;
    v21 = a4;
    _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_INFO, "SGDSuggestManager-contactMatchesWithFullTextSearch:%@ limitTo:%lu", buf, 0x16u);
  }

  v13 = (void *)MEMORY[0x1E0D19990];
  -[SGSqlEntityStore suggestContactMatchesWithFullTextSearch:limitTo:](self->_harvestStore, "suggestContactMatchesWithFullTextSearch:limitTo:", v9, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "responseWith:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, v15);

}

- (void)contactMatchesWithMessagingPrefix:(id)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefix"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    v20 = 2048;
    v21 = a4;
    _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_INFO, "SGDSuggestManager-contactMatchesWithMessagingPrefix:%@ limitTo:%lu", buf, 0x16u);
  }

  v13 = (void *)MEMORY[0x1E0D19990];
  -[SGSqlEntityStore suggestContactMatchesWithMessagingPrefix:limitTo:](self->_harvestStore, "suggestContactMatchesWithMessagingPrefix:limitTo:", v9, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "responseWith:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v11)[2](v11, v15);

}

- (void)allContactsWithSnippets:(BOOL)a3 limitTo:(unint64_t)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  void (**v9)(id, void *);
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  size_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  SGDSuggestManager *v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v6 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = (void (**)(id, void *))a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("NO");
    if (v6)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    v22 = 2048;
    v23 = a4;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-allContactsWithSnippets:%@ limitTo:%lu", buf, 0x16u);
  }

  -[SGSqlEntityStore allContactsWithSnippets:limitTo:](self->_harvestStore, "allContactsWithSnippets:limitTo:", v6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SGDSuggestManager_allContactsWithSnippets_limitTo_withCompletion___block_invoke;
  block[3] = &unk_1E7DA8AD0;
  v18 = v12;
  v19 = self;
  v14 = v12;
  dispatch_apply(v13, 0, block);
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v15);

}

- (id)_mapToPseudoEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "convertToEvent:", self->_harvestStore, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)eventsStartingAt:(id)a3 endingAt:(id)a4 limitTo:(unint64_t)a5 options:(unsigned int)a6 withCompletion:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  void (**v14)(id, void *);
  NSObject *v15;
  SGSqlEntityStore *harvestStore;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v8 = *(_QWORD *)&a6;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, void *))a7;
  sgLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v24 = 138412802;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    v28 = 2048;
    v29 = a5;
    _os_log_impl(&dword_1C3607000, v15, OS_LOG_TYPE_INFO, "SGDSuggestManager-suggestEventsStartingAt:%@ endingAt:%@ limitTo:%lu", (uint8_t *)&v24, 0x20u);
  }

  harvestStore = self->_harvestStore;
  objc_msgSend(v12, "timeIntervalSince1970");
  v18 = v17;
  objc_msgSend(v13, "timeIntervalSince1970");
  -[SGSqlEntityStore suggestEventsStartingAt:endingAt:limitTo:options:](harvestStore, "suggestEventsStartingAt:endingAt:limitTo:options:", a5, v8, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0D19990];
  -[SGDSuggestManager _mapToPseudoEvents:](self, "_mapToPseudoEvents:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "responseWith:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v23);

}

- (void)eventFromRecordId:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412290;
    v15 = v6;
    _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "eventFromRecordId: %@", (uint8_t *)&v14, 0xCu);
  }

  -[SGSqlEntityStore loadEventByRecordId:](self->_harvestStore, "loadEventByRecordId:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0D19990];
  if (v9)
  {
    objc_msgSend(v9, "convertToEvent:", self->_harvestStore);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "responseWith:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], 4, &unk_1E7E11400);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "responseWithError:", v12);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v13);

}

- (void)eventsStartingAt:(id)a3 endingAt:(id)a4 prefix:(id)a5 limitTo:(unint64_t)a6 options:(unsigned int)a7 withCompletion:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *);
  NSObject *v18;
  SGSqlEntityStore *harvestStore;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v9 = *(_QWORD *)&a7;
  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = (void (**)(id, void *))a8;
  sgLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v27 = 138413058;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2048;
    v34 = a6;
    _os_log_impl(&dword_1C3607000, v18, OS_LOG_TYPE_INFO, "SGDSuggestManager-suggestEventsStartingAt:%@ endingAt:%@ prefix:%@ limitTo:%lu", (uint8_t *)&v27, 0x2Au);
  }

  harvestStore = self->_harvestStore;
  objc_msgSend(v14, "timeIntervalSince1970");
  v21 = v20;
  objc_msgSend(v15, "timeIntervalSince1970");
  -[SGSqlEntityStore suggestEventsStartingAt:endingAt:prefix:limitTo:options:](harvestStore, "suggestEventsStartingAt:endingAt:prefix:limitTo:options:", v16, a6, v9, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0D19990];
  -[SGDSuggestManager _mapToPseudoEvents:](self, "_mapToPseudoEvents:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "responseWith:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2](v17, v26);

}

- (void)eventsInFutureLimitTo:(unint64_t)a3 options:(unsigned int)a4 withCompletion:(id)a5
{
  uint64_t v5;
  void (**v8)(id, void *);
  NSObject *v9;
  SGSqlEntityStore *harvestStore;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  uint64_t v18;

  v5 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *))a5;
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = 134217984;
    v17 = a3;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-suggestEventsInFutureLimitTo:%lu", (uint8_t *)&v16, 0xCu);
  }

  harvestStore = self->_harvestStore;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "timeIntervalSince1970");
  -[SGSqlEntityStore suggestEventsStartingAt:endingAt:limitTo:options:](harvestStore, "suggestEventsStartingAt:endingAt:limitTo:options:", a3, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D19990];
  -[SGDSuggestManager _mapToPseudoEvents:](self, "_mapToPseudoEvents:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "responseWith:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v15);

}

- (void)allEventsLimitedTo:(unint64_t)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  objc_msgSend(v6, "dateWithTimeIntervalSince1970:", 0.0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSuggestManager eventsStartingAt:endingAt:limitTo:options:withCompletion:](self, "eventsStartingAt:endingAt:limitTo:options:withCompletion:", v9, v8, a3, 2, v7);

}

- (void)confirmReminderByRecordId:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  sgRemindersLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmReminderByRecordId: %@", buf, 0xCu);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  -[SGDSuggestManager logSuggestionInteractionForRecordId:interface:actionType:](self, "logSuggestionInteractionForRecordId:interface:actionType:", v7, 21, 6);
  -[SGDSuggestManager _confirmReminderByRecordId:completion:](self, "_confirmReminderByRecordId:completion:", v7, v8);

}

- (void)confirmRealtimeReminder:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  SGSqlEntityStore *harvestStore;
  SGDuplicateKey *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  sgRemindersLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmRealtimeReminder", buf, 2u);
  }

  objc_msgSend(v7, "uniqueKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && +[SGDuplicateKey serializationPassesBasicScrutiny:](SGDuplicateKey, "serializationPassesBasicScrutiny:", v10))
  {
    harvestStore = self->_harvestStore;
    v12 = -[SGDuplicateKey initWithSerialized:]([SGDuplicateKey alloc], "initWithSerialized:", v10);
    -[SGSqlEntityStore loadReminderByKey:](harvestStore, "loadReminderByKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "recordId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGDSuggestManager _confirmReminderByRecordId:completion:](self, "_confirmReminderByRecordId:completion:", v14, v8);

      objc_msgSend(v13, "recordId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storageReminder.recordId"));

      }
      objc_msgSend(v13, "recordId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGDSuggestManager logSuggestionInteractionForRecordId:interface:actionType:](self, "logSuggestionInteractionForRecordId:interface:actionType:", v16, -[SGDSuggestManager interfaceForRealtimeReminder:](self, "interfaceForRealtimeReminder:", v7), 6);
    }
    else
    {
      sgRemindersLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager - Confirmation: Unable to retrieve reminder from the harvest store. Computing and storing hashes only.", v22, 2u);
      }

      +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "confirmReminder:", v7);

      v16 = (void *)objc_opt_new();
      v8[2](v8, v16);
    }

    +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logReminderInteractionFromReminder:interface:actionType:", v7, -[SGDSuggestManager interfaceForRealtimeReminder:](self, "interfaceForRealtimeReminder:", v7), 6);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D19988];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], 4, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "responseWithError:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v18);
  }

}

- (void)_confirmReminderByRecordId:(id)a3 completion:(id)a4
{
  SGSqlEntityStore *harvestStore;
  void (**v6)(id, uint64_t);
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  harvestStore = self->_harvestStore;
  v10 = 0;
  v6 = (void (**)(id, uint64_t))a4;
  -[SGSqlEntityStore confirmReminderByRecordId:error:](harvestStore, "confirmReminderByRecordId:error:", a3, &v10);
  v7 = v10;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v6[2](v6, v8);

}

- (void)rejectReminderByRecordId:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  sgRemindersLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectReminderByRecordId: %@", buf, 0xCu);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

  }
  -[SGDSuggestManager logSuggestionInteractionForRecordId:interface:actionType:](self, "logSuggestionInteractionForRecordId:interface:actionType:", v7, 21, 7);
  -[SGDSuggestManager _rejectReminderByRecordId:completion:](self, "_rejectReminderByRecordId:completion:", v7, v8);

}

- (void)rejectRealtimeReminder:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  SGSqlEntityStore *harvestStore;
  SGDuplicateKey *v12;
  void *v13;
  SGDuplicateKey *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint8_t v24[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  sgRemindersLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectRealtimeReminer", buf, 2u);
  }

  objc_msgSend(v7, "uniqueKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SGDuplicateKey serializationPassesBasicScrutiny:](SGDuplicateKey, "serializationPassesBasicScrutiny:", v10))
  {
    harvestStore = self->_harvestStore;
    v12 = [SGDuplicateKey alloc];
    objc_msgSend(v7, "uniqueKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SGDuplicateKey initWithSerialized:](v12, "initWithSerialized:", v13);
    -[SGSqlEntityStore loadReminderByKey:](harvestStore, "loadReminderByKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "recordId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGDSuggestManager _rejectReminderByRecordId:completion:](self, "_rejectReminderByRecordId:completion:", v16, v8);

      objc_msgSend(v15, "recordId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 1303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storageReminder.recordId"));

      }
      objc_msgSend(v15, "recordId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGDSuggestManager logSuggestionInteractionForRecordId:interface:actionType:](self, "logSuggestionInteractionForRecordId:interface:actionType:", v18, -[SGDSuggestManager interfaceForRealtimeReminder:](self, "interfaceForRealtimeReminder:", v7), 7);
    }
    else
    {
      sgRemindersLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager - Rejection: Unable to retrieve reminder from the harvest store. Computing and storing hashes only.", v24, 2u);
      }

      +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rejectReminder:", v7);

      v18 = (void *)objc_opt_new();
      v8[2](v8, v18);
    }

    +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logReminderInteractionFromReminder:interface:actionType:", v7, -[SGDSuggestManager interfaceForRealtimeReminder:](self, "interfaceForRealtimeReminder:", v7), 7);
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0D19988];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], 4, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "responseWithError:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v20);
  }

}

- (void)_rejectReminderByRecordId:(id)a3 completion:(id)a4
{
  SGSqlEntityStore *harvestStore;
  void (**v6)(id, uint64_t);
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  harvestStore = self->_harvestStore;
  v10 = 0;
  v6 = (void (**)(id, uint64_t))a4;
  -[SGSqlEntityStore rejectReminderByRecordId:error:](harvestStore, "rejectReminderByRecordId:error:", a3, &v10);
  v7 = v10;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v6[2](v6, v8);

}

- (unsigned)interfaceForRealtimeReminder:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 1)
    return 1;
  else
    return 4;
}

- (void)reminderAlarmTriggeredForRecordId:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  SGSqlEntityStore *harvestStore;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  sgRemindersLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-alarmTriggeredForRecordId: %@", buf, 0xCu);
  }

  harvestStore = self->_harvestStore;
  v13 = 0;
  -[SGSqlEntityStore reminderAlarmTriggeredForRecordId:error:](harvestStore, "reminderAlarmTriggeredForRecordId:error:", v6, &v13);
  v10 = v13;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v7[2](v7, v11);

}

- (void)allRemindersLimitedTo:(unint64_t)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v6 = (void (**)(id, void *))a4;
  sgRemindersLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SuggestionsManager getting all Reminders", v11, 2u);
  }

  v8 = (void *)MEMORY[0x1E0D19990];
  -[SGSqlEntityStore allRemindersLimitedTo:](self->_harvestStore, "allRemindersLimitedTo:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "responseWith:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v10);

}

- (void)reminderTitleForContent:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  sgRemindersLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SuggestionsManager getting reminder title for content", v12, 2u);
  }

  v8 = (void *)MEMORY[0x1E0D19990];
  +[SGReminderDissector sharedInstance](SGReminderDissector, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reminderTitleForContent:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "responseWith:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v11);

}

- (void)logUserCreatedReminderTitle:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  sgRemindersLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SuggestionsManager logging user created reminder title", v9, 2u);
  }

  +[SGDPLogging logUserCreatedReminderTitle:](SGDPLogging, "logUserCreatedReminderTitle:", v6);
  v8 = (void *)objc_opt_new();
  v5[2](v5, v8);

}

- (void)allDeliveriesWithLimit:(unint64_t)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v6 = (void (**)(id, void *))a4;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "SuggestionsManager getting all Deliveries", v11, 2u);
  }

  v8 = (void *)MEMORY[0x1E0D19990];
  -[SGSqlEntityStore allDeliveriesWithLimit:](self->_harvestStore, "allDeliveriesWithLimit:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "responseWith:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v10);

}

- (void)suggestionsFromRFC822Data:(id)a3 source:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  +[SGPatterns useAllLanguagesAtOnce:](SGPatterns, "useAllLanguagesAtOnce:", objc_msgSend(v11, "isEqualToString:", CFSTR("suggest_tool")));
  +[SGSimpleMailMessage parseRfc822:](SGSimpleMailMessage, "parseRfc822:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "htmlBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSuggestManager suggestionsFromEmailContent:headers:source:options:withCompletion:](self, "suggestionsFromEmailContent:headers:source:options:withCompletion:", v13, v12, v11, a5, v10);

}

- (id)cachedResultForKey:(id)a3 generateResult:(id)a4 validateResults:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v33;
  int v34;
  uint64_t v35;
  _QWORD v36[4];
  NSObject *v37;
  uint64_t *v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  _BYTE v49[10];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = (void *)objc_msgSend(v7, "mutableCopy");
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  +[SGAsset asset](SGAsset, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%lu"), objc_msgSend(v12, "assetVersion"));
  objc_msgSend(v13, "dataUsingEncoding:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendData:", v14);

  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3446;
  v46 = __Block_byref_object_dispose__3447;
  v47 = 0;
  +[SGDSuggestManager requestCache](SGDSuggestManager, "requestCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resultIfAvailable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __71__SGDSuggestManager_cachedResultForKey_generateResult_validateResults___block_invoke;
  v39[3] = &unk_1E7DB1180;
  v41 = &v42;
  v18 = v10;
  v40 = v18;
  objc_msgSend(v16, "runWithLockAcquired:", v39);

  if (v43[5])
  {
    sgLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v33 = v43[5];
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v49 = v33;
      _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, "Suggestions Cache hit: %@", buf, 0xCu);
    }

    sgLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v20, OS_LOG_TYPE_INFO, "Suggestions Cache hit", buf, 2u);
    }
  }
  else
  {
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v35 = v43[5];
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v49 = v35;
      _os_log_debug_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEBUG, "Suggestions Cache miss: %@", buf, 0xCu);
    }

    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v22, OS_LOG_TYPE_INFO, "Suggestions Cache miss", buf, 2u);
    }

    v8[2](v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    v25 = (void *)v43[5];
    v43[5] = v24;

    v26 = (void *)v43[5];
    if (!v26)
    {
      v30 = 0;
      goto LABEL_17;
    }
    objc_setAssociatedObject(v26, &kAssociatedCacheObjectKey, v18, (void *)1);
    +[SGDSuggestManager requestCache](SGDSuggestManager, "requestCache");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "result");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v17;
    v36[1] = 3221225472;
    v36[2] = __71__SGDSuggestManager_cachedResultForKey_generateResult_validateResults___block_invoke_473;
    v36[3] = &unk_1E7DB1180;
    v37 = v18;
    v38 = &v42;
    objc_msgSend(v28, "runWithLockAcquired:", v36);

    v20 = v37;
  }

  v29 = objc_msgSend((id)v43[5], "suggestionsCount");
  v9[2](v9, v43[5]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "suggestionsCount") != v29)
  {
    sgLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v34 = objc_msgSend(v30, "suggestionsCount");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v49 = v29;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v34;
      _os_log_debug_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEBUG, "Went from %d to %d suggestions after filtering out already acted-on suggestions", buf, 0xEu);
    }

  }
LABEL_17:

  _Block_object_dispose(&v42, 8);
  return v30;
}

- (id)filterPastEvents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");

  objc_msgSend(MEMORY[0x1E0D198F0], "showPastEvents");
  sgMapAndFilter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)bumptTTLForNLEvent:(id)a3
{
  id v4;
  SGEKEventStoreProvider *v5;
  SGEKEventStoreProvider *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SGEKEventStoreProvider *v12;
  id v13;

  v4 = a3;
  if (objc_msgSend(v4, "isNaturalLanguageEvent"))
  {
    v5 = self->_ekStoreProvider;
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __40__SGDSuggestManager_bumptTTLForNLEvent___block_invoke;
    v11 = &unk_1E7DB6A30;
    v12 = v5;
    v13 = v4;
    v6 = v5;
    v7 = (void *)MEMORY[0x1C3BD5158](&v8);
    if (bumptTTLForNLEvent___pasOnceToken51 != -1)
      dispatch_once(&bumptTTLForNLEvent___pasOnceToken51, &__block_literal_global_477);
    objc_msgSend(MEMORY[0x1E0D81598], "runAsyncOnQueue:afterDelaySeconds:block:", bumptTTLForNLEvent___pasExprOnceResult, v7, 2.0, v8, v9, v10, v11);

  }
}

- (id)shortNamesAndRealtimeEventsFromEntity:(id)a3 enrichments:(id)a4 store:(id)a5
{
  return -[SGDSuggestManager shortNamesAndRealtimeEventsFromEntity:message:enrichments:store:](self, "shortNamesAndRealtimeEventsFromEntity:message:enrichments:store:", a3, 0, a4, a5);
}

- (id)shortNamesAndRealtimeEventsFromEntity:(id)a3 message:(id)a4 enrichments:(id)a5 store:(id)a6
{
  id v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  SGEKEventStoreProvider *ekStoreProvider;
  SGEKEventStoreProvider *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  int v30;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  SGDSuggestManager *v36;
  id v37;
  id v38;
  id v39;
  _BYTE *v40;
  SEL v41;
  char v42;
  uint8_t buf[4];
  int v44;
  _BYTE v45[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v33 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(MEMORY[0x1E0D198F0], "alwaysShowCancelledEvents");
  -[SGDSuggestManager filterPastEvents:](self, "filterPastEvents:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sgEventsLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "loggingIdentifier", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v45 = 138543618;
    *(_QWORD *)&v45[4] = v32;
    *(_WORD *)&v45[12] = 1024;
    *(_DWORD *)&v45[14] = objc_msgSend(v15, "count");
    _os_log_debug_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEBUG, "SGDSuggestManager - For [SGEntity %{public}@], Found %d extracted event candidates.", v45, 0x12u);

  }
  *(_QWORD *)v45 = 0;
  *(_QWORD *)&v45[8] = v45;
  *(_QWORD *)&v45[16] = 0x3032000000;
  v46 = __Block_byref_object_copy__3446;
  v47 = __Block_byref_object_dispose__3447;
  v48 = 0;
  v17 = objc_msgSend(v15, "count");
  v18 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    ekStoreProvider = self->_ekStoreProvider;
    if (ekStoreProvider)
      ekStoreProvider = (SGEKEventStoreProvider *)ekStoreProvider->_callBlockWithEKEventStoreForReading;
    v20 = ekStoreProvider;
    v34[0] = v18;
    v34[1] = 3221225472;
    v34[2] = __85__SGDSuggestManager_shortNamesAndRealtimeEventsFromEntity_message_enrichments_store___block_invoke;
    v34[3] = &unk_1E7DA8B60;
    v40 = v45;
    v35 = v15;
    v36 = self;
    v41 = a2;
    v37 = v13;
    v42 = v14;
    v38 = v33;
    v39 = v11;
    ((void (*)(SGEKEventStoreProvider *, _QWORD *))v20->_callBlockWithEKEventStoreForReading)(v20, v34);

    v21 = v35;
  }
  else
  {
    v21 = *(void **)(*(_QWORD *)&v45[8] + 40);
    *(_QWORD *)(*(_QWORD *)&v45[8] + 40) = MEMORY[0x1E0C9AA60];
  }

  if (os_variant_has_internal_diagnostics() && objc_msgSend(v11, "hasExtractionException"))
  {
    v22 = -[SGRealtimeEventResponse initExtractionExceptionWithEntity:]([SGRealtimeEventResponse alloc], "initExtractionExceptionWithEntity:", v11);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)&v45[8] + 40));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v22);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(*(_QWORD *)&v45[8] + 40);
    *(_QWORD *)(*(_QWORD *)&v45[8] + 40) = v24;

  }
  v26 = v13;
  v27 = v11;
  sgMapAndFilter();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = objc_msgSend(v28, "count");
    *(_DWORD *)buf = 67109120;
    v44 = v30;
    _os_log_impl(&dword_1C3607000, v29, OS_LOG_TYPE_INFO, "Returning %d realtime events.", buf, 8u);
  }

  _Block_object_dispose(v45, 8);
  return v28;
}

- (id)curatedEventKeyForExactMatchOfPseudoEvent:(id)a3 candidates:(id)a4
{
  id v5;
  id v6;
  SGDuplicateKey *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  SGCuratedEventKey *v12;
  uint64_t v13;
  SGCuratedEventKey *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  SGDuplicateKey *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  uint64_t v31;
  SGCuratedEventKey *v32;
  void *v33;
  id v35;
  SGDuplicateKey *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = [SGDuplicateKey alloc];
  objc_msgSend(v5, "duplicateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[SGDuplicateKey initWithSerialized:](v7, "initWithSerialized:", v10);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v6;
  v12 = (SGCuratedEventKey *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v12)
  {
    v35 = v5;
    v13 = *(_QWORD *)v38;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v14);
        objc_msgSend(v15, "suggestionInfo");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v15, "calendar");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isSuggestedEventCalendar") & 1) != 0)
            goto LABEL_8;
          objc_msgSend(v15, "calendar");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isNaturalLanguageSuggestedEventCalendar");

          if ((v20 & 1) != 0)
            goto LABEL_23;
          objc_msgSend(v15, "suggestionInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "uniqueKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            if (+[SGDuplicateKey serializationPassesBasicScrutiny:](SGDuplicateKey, "serializationPassesBasicScrutiny:", v17))
            {
              v22 = -[SGDuplicateKey initWithSerialized:]([SGDuplicateKey alloc], "initWithSerialized:", v17);
              v18 = v22;
              if (v22)
              {
                -[SGDuplicateKey parentKey](v22, "parentKey");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "isEqualToDuplicateKey:", v36);

                if (v24)
                {
                  objc_msgSend(v15, "eventIdentifier");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v25)
                  {
                    v32 = [SGCuratedEventKey alloc];
                    objc_msgSend(v15, "eventIdentifier");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v12 = -[SGCuratedEventKey initWithExternalId:](v32, "initWithExternalId:", v33);

                    goto LABEL_30;
                  }
                  sgLogHandle();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_debug_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEBUG, "EKEvent exact match with the same duplicate key found, but eventIdentifier is nil.", buf, 2u);
                  }

                }
              }
LABEL_8:

LABEL_22:
              goto LABEL_23;
            }
            sgLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
LABEL_21:

              if (_PASEvaluateLogFaultAndProbCrashCriteria())
                abort();
              goto LABEL_22;
            }
            *(_DWORD *)buf = 138477827;
            v42 = v17;
            v28 = v27;
            v29 = "Skipping event with dupKeyString that does not pass basic scrutiny: %{private}@";
            v30 = 12;
          }
          else
          {
            sgLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
              goto LABEL_21;
            *(_WORD *)buf = 0;
            v28 = v27;
            v29 = "Skipping event with nonnull suggestionInfo but null suggestionInfo.uniqueKey";
            v30 = 2;
          }
          _os_log_fault_impl(&dword_1C3607000, v28, OS_LOG_TYPE_FAULT, v29, buf, v30);
          goto LABEL_21;
        }
LABEL_23:
        v14 = (SGCuratedEventKey *)((char *)v14 + 1);
      }
      while (v12 != v14);
      v31 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      v12 = (SGCuratedEventKey *)v31;
      if (!v31)
      {
LABEL_30:
        v5 = v35;
        break;
      }
    }
  }

  return v12;
}

- (BOOL)isSGEntity:(id)a3 duplicateOfEKEvent:(id)a4 withStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  SGEKEventStoreProvider *ekStoreProvider;
  SGEKEventStoreProvider *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "duplicateKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadEventByDuplicateKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertToEvent:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  ekStoreProvider = self->_ekStoreProvider;
  if (ekStoreProvider)
    ekStoreProvider = (SGEKEventStoreProvider *)ekStoreProvider->_callBlockWithEKEventStoreForReading;
  v15 = ekStoreProvider;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__SGDSuggestManager_isSGEntity_duplicateOfEKEvent_withStore___block_invoke;
  v19[3] = &unk_1E7DA8BB0;
  v16 = v13;
  v20 = v16;
  v17 = v9;
  v21 = v17;
  v22 = &v23;
  ((void (*)(SGEKEventStoreProvider *, _QWORD *))v15->_callBlockWithEKEventStoreForReading)(v15, v19);

  LOBYTE(v15) = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return (char)v15;
}

- (BOOL)containsNonCuratedData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "origin", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "type");

        if (v8 != 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)realtimeWalletOrdersFromEntity:(id)a3 enrichments:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  sgMapAndFilter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)MEMORY[0x1E0C9AA60];

  return v6;
}

- (BOOL)_isContactInteresting:(id)a3 emailEntity:(id)a4 enrichments:(id)a5 hasContactCard:(unint64_t)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  int IsContact;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  char v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  int v53;
  char v54;
  void *v55;
  char v56;
  BOOL v57;
  char v58;
  void *v60;
  void *v61;
  id v62;
  int v63;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D197F0], "isSent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "hasTag:", v11);

  v65 = v9;
  if ((v12 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v9, "author");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sg_emailAddress");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = &stru_1E7DB83A8;
    if (v15)
      v17 = (__CFString *)v15;
    v18 = v17;

    SGNormalizeEmailAddress();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(v8, "emailAddresses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    if (v21)
    {
      v22 = v21;
      v62 = v10;
      v23 = *(_QWORD *)v75;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v75 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "emailAddress");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          SGNormalizeEmailAddress();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", v19);

          if (!v27)
          {
            v13 = 1;
            goto LABEL_15;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
        if (v22)
          continue;
        break;
      }
      v13 = 0;
LABEL_15:
      v10 = v62;
    }
    else
    {
      v13 = 0;
    }

  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v28 = v10;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
  if (v29)
  {
    v30 = v29;
    v63 = v13;
    v31 = *(_QWORD *)v71;
    while (2)
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v71 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
        objc_msgSend(v33, "duplicateKey");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "entityType");
        IsContact = SGEntityTypeIsContact();

        if (IsContact)
        {
          objc_msgSend(v8, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "fullName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "title");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v37, "isEqual:", v38);

          if (v39)
          {
            objc_msgSend(v33, "extractionInfo");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "extractionType");

            if (v41 == 2)
            {
              v42 = 1;
              goto LABEL_30;
            }
          }
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      if (v30)
        continue;
      break;
    }
    v42 = 0;
LABEL_30:
    v13 = v63;
  }
  else
  {
    v42 = 0;
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v43 = v28;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v67;
LABEL_34:
    v47 = 0;
    while (1)
    {
      if (*(_QWORD *)v67 != v46)
        objc_enumerationMutation(v43);
      v48 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v47);
      objc_msgSend(v48, "extractionInfo");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "extractionType");

      if (v50 == 64)
        break;
      objc_msgSend(v48, "extractionInfo");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "extractionType");

      if (v52 == 128)
      {

        v53 = 0;
        v54 = 0;
        if (objc_msgSend(v43, "count") != 1)
          goto LABEL_48;
        goto LABEL_61;
      }
      if (v45 == ++v47)
      {
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
        if (v45)
          goto LABEL_34;
        goto LABEL_41;
      }
    }

    if (objc_msgSend(v43, "count") != 1)
    {
      v53 = 1;
      goto LABEL_48;
    }
    if (a6 == 2)
    {
      v54 = 0;
    }
    else
    {
      objc_msgSend(v8, "name");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "fullName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v61, "length") == 0;

    }
  }
  else
  {
LABEL_41:

    v53 = 0;
LABEL_48:
    objc_msgSend(v8, "birthday");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6 == 2)
      v56 = 0;
    else
      v56 = v42;
    if (a6)
      v57 = v55 == 0;
    else
      v57 = 1;
    v58 = !v57;
    v54 = 1;
    if ((v56 & 1) == 0 && ((v13 | v53) & 1) == 0 && (v58 & 1) == 0)
      v54 = objc_msgSend(v8, "hasNonTrivialInfo");
  }
LABEL_61:

  return v54;
}

- (id)realtimeWalletPassesFromEntity:(id)a3 enrichments:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  sgMapAndFilter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (id)realtimeContactsFromEntity:(id)a3 enrichments:(id)a4 sourceTextMessage:(id)a5 store:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  uint64_t v82;
  NSObject *v83;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  id v99;
  id v100;
  uint64_t v101;
  void *v102;
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, void *);
  void *v120;
  NSObject *v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  uint64_t v127;
  id (*v128)(uint64_t, void *);
  void *v129;
  id v130;
  SGDSuggestManager *v131;
  id v132;
  id v133;
  id v134;
  id v135;
  SEL v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  void *v141;
  _QWORD v142[3];
  _BYTE v143[128];
  _QWORD v144[3];
  _BYTE v145[128];
  _BYTE v146[128];
  uint8_t v147[128];
  uint8_t buf[4];
  uint64_t v149;
  _BYTE v150[128];
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v94 = a4;
  v95 = a5;
  v11 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    SGFeatureVectorLog(objc_msgSend(v10, "inhumanFeatures"));
  if (objc_msgSend(v10, "isInhuman"))
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_INFO, "Entity is from inhuman sender", buf, 2u);
    }
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_98;
  }
  v92 = v11;
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  objc_msgSend(v10, "tags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v137, v150, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v138;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v138 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
        if (objc_msgSend(v19, "isMailingListId"))
        {
          objc_msgSend(v19, "value");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v137, v150, 16);
      if (v16)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_17:

  v20 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  v126 = MEMORY[0x1E0C809B0];
  v127 = 3221225472;
  v128 = __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke;
  v129 = &unk_1E7DA8C50;
  v90 = v10;
  v136 = a2;
  v88 = v10;
  v130 = v88;
  v131 = self;
  v89 = v20;
  v132 = v89;
  v133 = v92;
  v91 = v21;
  v134 = v91;
  v135 = v94;
  v87 = v135;
  sgMapAndFilter();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v149 = (uint64_t)v22;
    _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "Contacts after filter, before realtiming, %{private}@", buf, 0xCu);
  }

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v122, v147, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v123;
    v98 = v12;
    v99 = v24;
    v96 = *(_QWORD *)v123;
    do
    {
      v28 = 0;
      v101 = v26;
      do
      {
        if (*(_QWORD *)v123 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v28);
        if (v12)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * v28), "emailAddresses");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = MEMORY[0x1E0C809B0];
          v118 = 3221225472;
          v119 = __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke_514;
          v120 = &unk_1E7DA8C78;
          v121 = v12;
          sgFilter();
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "setEmailAddresses:", v31);
        }
        objc_msgSend(v29, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          objc_msgSend(v29, "emailAddresses");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v113, v146, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v114;
            while (2)
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v114 != v36)
                  objc_enumerationMutation(v33);
                v38 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
                objc_msgSend(v38, "emailAddress");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "length");

                if (v40)
                {
                  objc_msgSend(v38, "emailAddress");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  +[SGNames nameStringFromEmailAddress:](SGNames, "nameStringFromEmailAddress:", v41);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v42)
                  {
                    objc_msgSend(v38, "origin");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "recordId");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0D19820], "extractionInfoWithExtractionType:modelVersion:confidence:", 0, 0, 0);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    +[SGNames sgNameFromString:origin:recordId:extractionInfo:](SGNames, "sgNameFromString:origin:recordId:extractionInfo:", v42, v43, v44, v45);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setName:", v46);

                    goto LABEL_38;
                  }
                }
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v113, v146, 16);
              if (v35)
                continue;
              break;
            }
          }
LABEL_38:

          v12 = v98;
          v24 = v99;
          v27 = v96;
          v26 = v101;
        }
        ++v28;
      }
      while (v28 != v26);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v122, v147, 16);
    }
    while (v26);
  }

  v47 = v95;
  objc_msgSend(v95, "conversationIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v48, "length"))
    goto LABEL_92;
  v49 = objc_msgSend(v24, "count");

  if (v49 <= 1)
  {
    if (objc_msgSend(v24, "count") == 1)
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = 0;
    }
    objc_msgSend(v95, "author");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handles");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = v52;
    if (!v48)
    {
      v63 = 0;
LABEL_78:
      if (objc_msgSend(v52, "containsString:", CFSTR("@"), v85))
        SGNormalizeEmailAddress();
      else
        SGNormalizePhoneNumber();
      v74 = objc_claimAutoreleasedReturnValue();

      v48 = 0;
      v63 = (void *)v74;
LABEL_82:
      if (v63)
      {
        +[SGDSuggestManager contactAggregator](SGDSuggestManager, "contactAggregator");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "conversationIdentifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "augmentSuggestedContactWithContact:conversationId:store:handle:", v48, v76, self->_harvestStore, v63);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (v77)
        {
          v141 = v77;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
          v78 = objc_claimAutoreleasedReturnValue();
LABEL_87:

          sgLogHandle();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v149 = (uint64_t)v48;
            _os_log_debug_impl(&dword_1C3607000, v79, OS_LOG_TYPE_DEBUG, "Contact pre-aggregation: %@", buf, 0xCu);
          }

          sgLogHandle();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v149 = (uint64_t)v77;
            _os_log_debug_impl(&dword_1C3607000, v80, OS_LOG_TYPE_DEBUG, "Contact post-aggregation: %@", buf, 0xCu);
          }

          v24 = (id)v78;
LABEL_92:

          goto LABEL_93;
        }
      }
      else
      {
        v77 = 0;
      }
      v78 = MEMORY[0x1E0C9AA60];
      goto LABEL_87;
    }
    +[SGIdentityKey keyForPersonHandle:](SGIdentityKey, "keyForPersonHandle:", v50);
    v86 = v50;
    v97 = objc_claimAutoreleasedReturnValue();
    SGNormalizePhoneNumber();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGIdentityKey keyForNormalizedPhone:](SGIdentityKey, "keyForNormalizedPhone:", v53);
    v54 = objc_claimAutoreleasedReturnValue();

    SGNormalizeEmailAddress();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGIdentityKey keyForNormalizedEmail:](SGIdentityKey, "keyForNormalizedEmail:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = (void *)v54;
    if (objc_msgSend(v95, "senderIsAccountOwner"))
    {
      v111 = 0u;
      v112 = 0u;
      v110 = 0u;
      v109 = 0u;
      v144[0] = v97;
      v144[1] = v56;
      v144[2] = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 3);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v109, v145, 16);
      v50 = v86;
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v110;
        while (2)
        {
          for (k = 0; k != v59; ++k)
          {
            if (*(_QWORD *)v110 != v60)
              objc_enumerationMutation(v57);
            if ((objc_msgSend(v91, "containsObject:", *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * k), v85) & 1) != 0)
            {

              sgLogHandle();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v149 = (uint64_t)v48;
                _os_log_impl(&dword_1C3607000, v70, OS_LOG_TYPE_DEFAULT, "Extracted Realtime contact details about the user and tried to show them in a banner: %@", buf, 0xCu);
              }

              v63 = 0;
              v62 = v48;
              v48 = 0;
              goto LABEL_70;
            }
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v109, v145, 16);
          if (v59)
            continue;
          break;
        }
      }

      objc_msgSend(v91, "anyObject");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "uniqueIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_70:
      v52 = v102;
      v71 = (void *)v97;
      v72 = v85;
    }
    else
    {
      v100 = v24;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v142[0] = v97;
      v142[1] = v56;
      v142[2] = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 3);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v105, v143, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v106;
LABEL_60:
        v68 = 0;
        while (1)
        {
          if (*(_QWORD *)v106 != v67)
            objc_enumerationMutation(v64);
          v69 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v68);
          if ((objc_msgSend(v91, "containsObject:", v69, v85) & 1) != 0)
            break;
          if (v66 == ++v68)
          {
            v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v105, v143, 16);
            if (v66)
              goto LABEL_60;
            goto LABEL_66;
          }
        }
        objc_msgSend(v69, "uniqueIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v63)
          goto LABEL_73;
        v24 = v100;
        v52 = v102;
        v72 = v85;
        v50 = v86;
        v71 = (void *)v97;
LABEL_77:

        v47 = v95;
        if (v48)
          goto LABEL_82;
        goto LABEL_78;
      }
LABEL_66:

LABEL_73:
      sgLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      v52 = v102;
      v72 = v85;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v149 = (uint64_t)v48;
        _os_log_impl(&dword_1C3607000, v73, OS_LOG_TYPE_DEFAULT, "Extracted a contact with a different handle to the sender: %@", buf, 0xCu);
      }

      v63 = 0;
      v62 = v48;
      v48 = 0;
      v24 = v100;
      v50 = v86;
      v71 = (void *)v97;
    }

    goto LABEL_77;
  }
LABEL_93:
  v103 = v88;
  v104 = v87;
  sgMapAndFilter();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v81 = objc_claimAutoreleasedReturnValue();
  v10 = v90;
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
  {
    v82 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 134217984;
    v149 = v82;
    _os_log_impl(&dword_1C3607000, v81, OS_LOG_TYPE_DEFAULT, "Returning %tu realtime contacts", buf, 0xCu);
  }

  sgLogHandle();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v149 = (uint64_t)v13;
    _os_log_debug_impl(&dword_1C3607000, v83, OS_LOG_TYPE_DEBUG, "Realtime contacts: %@", buf, 0xCu);
  }

  v11 = v92;
LABEL_98:

  return v13;
}

- (void)contactMatchesByPhoneNumber:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v6 = (void (**)(id, void *))a4;
  v7 = a3;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-contactMatchesByPhoneNumber", v12, 2u);
  }

  v9 = (void *)MEMORY[0x1E0D19990];
  -[SGSqlEntityStore suggestContactMatchesByPhoneNumber:](self->_harvestStore, "suggestContactMatchesByPhoneNumber:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "responseWith:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v11);

}

- (void)interactionStoreLookupForDetail:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  SGPSInteractionLookup *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138478083;
    v17 = v5;
    v18 = 2050;
    v19 = objc_msgSend(v5, "length");
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-interactionStoreLookupForDetail:%{private}@ (length %{public}tu)", (uint8_t *)&v16, 0x16u);
  }

  v8 = -[SGPSInteractionLookup initWithDetail:]([SGPSInteractionLookup alloc], "initWithDetail:", v5);
  -[SGPSInteractionLookup interactionString](v8, "interactionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v5, "length");
    v12 = objc_msgSend(v9, "length");
    v16 = 138478595;
    v17 = v5;
    v18 = 2050;
    v19 = v11;
    v20 = 2113;
    v21 = v9;
    v22 = 2050;
    v23 = v12;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-interactionStoreLookupForDetail:%{private}@ (length %{public}tu) -> result: %{private}@ (length %{public}tu)", (uint8_t *)&v16, 0x2Au);
  }

  v13 = (void *)MEMORY[0x1E0D19990];
  if (objc_msgSend(v9, "length"))
    v14 = v9;
  else
    v14 = 0;
  objc_msgSend(v13, "responseWith:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v15);

}

- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 supportsInfoLookup:(BOOL)a7 withCompletion:(id)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  void (**v15)(id, void *);
  NSObject *v16;
  dispatch_semaphore_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[4];
  id v37;
  NSObject *v38;
  uint8_t *v39;
  unint64_t v40;
  uint8_t buf[8];
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;

  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = (void (**)(id, void *))a8;
  if (a7)
  {
    sgLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_INFO, "SGDSuggestManager-namesForDetail with additional information lookup", buf, 2u);
    }

    v17 = dispatch_semaphore_create(0);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    *(_QWORD *)buf = 0;
    v42 = buf;
    v43 = 0x2020000000;
    v44 = 0;
    v19 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __107__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke;
    v36[3] = &unk_1E7DA8CC8;
    v20 = v18;
    v37 = v20;
    v39 = buf;
    v40 = a4;
    v21 = v17;
    v38 = v21;
    -[SGDSuggestManager namesForDetail:limitTo:prependMaybe:onlySignificant:withCompletion:](self, "namesForDetail:limitTo:prependMaybe:onlySignificant:withCompletion:", v14, a4, v11, v10, v36);
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    if (*((_QWORD *)v42 + 3) < a4)
    {
      v29[0] = v19;
      v29[1] = 3221225472;
      v29[2] = __107__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_523;
      v29[3] = &unk_1E7DA8CF0;
      v30 = v20;
      v31 = &v32;
      -[SGDSuggestManager interactionStoreLookupForDetail:withCompletion:](self, "interactionStoreLookupForDetail:withCompletion:", v14, v29);

    }
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setApp:", -[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", 0));
    objc_msgSend(v22, "setDidInteractionLookup:", *((unsigned __int8 *)v33 + 24));
    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trackScalarForMessage:", v22);

    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v22, "key");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%@.%@"), *MEMORY[0x1E0D19D98], v25);

    objc_msgSend(v22, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v28);

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    -[SGDSuggestManager namesForDetail:limitTo:prependMaybe:onlySignificant:withCompletion:](self, "namesForDetail:limitTo:prependMaybe:onlySignificant:withCompletion:", v14, a4, v11, v10, v15);
  }

}

- (void)namesForDetail:(id)a3 limitTo:(unint64_t)a4 prependMaybe:(BOOL)a5 onlySignificant:(BOOL)a6 withCompletion:(id)a7
{
  _BOOL8 v8;
  id v11;
  NSObject *v12;
  int v13;
  SGSqlEntityStore *harvestStore;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  SGDSuggestManager *v56;
  void (**v57)(id, void *);
  void *v58;
  _BOOL4 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD block[5];
  uint8_t buf[16];
  _BYTE v66[128];
  uint64_t v67;

  v8 = a6;
  v59 = a5;
  v67 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v57 = (void (**)(id, void *))a7;
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_INFO, "SGDSuggestManager-namesForDetail", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion___block_invoke;
  block[3] = &unk_1E7DB56F0;
  block[4] = self;
  if (namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion__once != -1)
    dispatch_once(&namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion__once, block);
  v13 = objc_msgSend(v11, "containsString:", CFSTR("@"));
  harvestStore = self->_harvestStore;
  v58 = v11;
  v56 = self;
  if (v13)
    -[SGSqlEntityStore suggestContactMatchesByEmailAddress:isMaybe:onlySignificant:](harvestStore, "suggestContactMatchesByEmailAddress:isMaybe:onlySignificant:", v11, v59, v8);
  else
    -[SGSqlEntityStore suggestContactMatchesByPhoneNumber:isMaybe:onlySignificant:](harvestStore, "suggestContactMatchesByPhoneNumber:isMaybe:onlySignificant:", v11, v59, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_528);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v18 = objc_msgSend(v16, "count");
  if (v18 >= a4)
    v19 = a4;
  else
    v19 = v18;
  v20 = (void *)objc_msgSend(v17, "initWithCapacity:", v19);
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contact");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "extractionInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "extractionType");

    v26 = (void *)MEMORY[0x1E0D19950];
    objc_msgSend(v21, "contact");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extractionInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "modelVersion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "recordMaybeContactFrom:withVersion:", v25, v30);

  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v31 = v16;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    v35 = *(_QWORD *)v61;
LABEL_15:
    v36 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v35)
        objc_enumerationMutation(v31);
      objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v36), "contact");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "name");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "fullName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v39, "length"))
      {
        if (v59)
        {
          _PASValidatedFormat((void *)namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion__maybeFormat, v40, v41, v42, v43, v44, v45, v46, (uint64_t)v39);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v47);

        }
        else
        {
          objc_msgSend(v20, "addObject:", v39);
        }
        ++v34;
      }

      if (v34 >= a4)
        break;
      if (v33 == ++v36)
      {
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        if (v33)
          goto LABEL_15;
        break;
      }
    }
  }

  v48 = (void *)objc_opt_new();
  objc_msgSend(v48, "setApp:", -[SGDSuggestManager _appEnumForBundleId:](v56, "_appEnumForBundleId:", 0));
  objc_msgSend(v48, "setWasSuggestedContact:", objc_msgSend(v20, "count") != 0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trackScalarForMessage:", v48);

  v50 = objc_alloc(MEMORY[0x1E0CB3940]);
  v51 = *MEMORY[0x1E0D19D98];
  objc_msgSend(v48, "key");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v50, "initWithFormat:", CFSTR("%@.%@"), v51, v52);

  objc_msgSend(v48, "dictionaryRepresentation");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v20);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2](v57, v55);

}

- (void)contactMatchesByEmailAddress:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[16];

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-contactsByEmailAddress", buf, 2u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 2309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("emailAddress"));

  }
  v10 = (void *)MEMORY[0x1E0D19990];
  -[SGSqlEntityStore suggestContactMatchesByEmailAddress:](self->_harvestStore, "suggestContactMatchesByEmailAddress:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "responseWith:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v12);

}

- (void)contactMatchesBySocialProfile:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[16];

  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-contactsBySocialProfile", buf, 2u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 2317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("socialProfile"));

  }
  v10 = (void *)MEMORY[0x1E0D19990];
  -[SGSqlEntityStore suggestContactMatchesBySocialProfile:](self->_harvestStore, "suggestContactMatchesBySocialProfile:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "responseWith:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v12);

}

- (void)celebrationExtractionsForInterval:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-celebrationExtractionsForInterval", buf, 2u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 2325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interval"));

  }
  -[SGDSuggestManager birthdayExtractionsForInterval:withCompletion:](self, "birthdayExtractionsForInterval:withCompletion:", v7, v8);

}

- (void)birthdayExtractionsForInterval:(id)a3 withCompletion:(id)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  SGSqlEntityStore *harvestStore;
  void *v17;
  void *v18;
  SGMessageKey *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SGMessageKey *v24;
  CNContactStore *contactStore;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  double v35;
  double v36;
  SGDSuggestManager *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void (**v45)(id, void *);
  void *v46;
  uint64_t v47;
  void *v48;
  id obj;
  id v50;
  SGMessageKey *v51;
  uint64_t v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD block[4];
  id v60;
  SGDSuggestManager *v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v45 = (void (**)(id, void *))a4;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-birthdayExtractionsForInterval", buf, 2u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 2333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interval"));

  }
  objc_msgSend(v7, "startDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v46 = v7;
  objc_msgSend(v7, "endDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v9;
  -[SGSqlEntityStore allContactsWithExtractionStartDate:extractionEndDate:](self->_harvestStore, "allContactsWithExtractionStartDate:extractionEndDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SGDSuggestManager_birthdayExtractionsForInterval_withCompletion___block_invoke;
  block[3] = &unk_1E7DA8AD0;
  v12 = v10;
  v60 = v12;
  v61 = self;
  dispatch_apply(v11, 0, block);
  v48 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v12;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
  if (v52)
  {
    v13 = *(_QWORD *)v56;
    v47 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        harvestStore = self->_harvestStore;
        objc_msgSend(v15, "recordId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGSqlEntityStore loadEntityByRecordId:](harvestStore, "loadEntityByRecordId:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = [SGMessageKey alloc];
          objc_msgSend(v18, "duplicateKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "parentKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "entityKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "serialize");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[SGMessageKey initWithSerialized:](v19, "initWithSerialized:", v23);

          contactStore = self->_contactStore;
          v54 = 0;
          +[SGCuratedContactMatcher realtimeContactWithContactStore:forPseudoContact:fromEntity:error:](SGCuratedContactMatcher, "realtimeContactWithContactStore:forPseudoContact:fromEntity:error:", contactStore, v15, v18, &v54);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v54;
          if (v27)
          {
            sgLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v63 = v15;
              v64 = 2112;
              v65 = v27;
              _os_log_debug_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEBUG, "birthdayExtractionsForInterval: Error getting realtime contact for %@: %@", buf, 0x16u);
            }

          }
          if (v26)
          {
            v50 = objc_alloc(MEMORY[0x1E0D197E8]);
            -[SGMessageKey uniqueIdentifier](v24, "uniqueIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGMessageKey source](v24, "source");
            v51 = v24;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "duplicateKey");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "parentKey");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v26;
            v33 = v27;
            v34 = objc_msgSend(v32, "entityType");
            objc_msgSend(v18, "creationTimestamp");
            v36 = v35;
            objc_msgSend(v53, "cnContactIdentifier");
            v37 = self;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v34;
            v27 = v33;
            v40 = (void *)objc_msgSend(v50, "initWithSpotlightIdentifier:source:entityType:creationTimestamp:extractionType:contactIdentifier:", v29, v30, v39, 1, v38, v36);

            self = v37;
            v13 = v47;

            v24 = v51;
            objc_msgSend(v48, "addObject:", v40);

            v26 = v53;
          }

        }
      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v66, 16);
    }
    while (v52);
  }

  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v48);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2](v45, v41);

}

- (void)messagesToRefreshWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__SGDSuggestManager_messagesToRefreshWithCompletion___block_invoke;
  v6[3] = &unk_1E7DB7578;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  SGNotUserInitiated(CFSTR("messagesToRefreshWithCompletion"), 2, v6);

}

- (void)updateMessages:(id)a3 state:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SGDSuggestManager *v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__SGDSuggestManager_updateMessages_state_completion___block_invoke;
  v12[3] = &unk_1E7DA8DD8;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v16 = a4;
  v10 = v9;
  v11 = v8;
  SGNotUserInitiated(CFSTR("updateMessages"), 2, v12);

}

- (void)reportMessagesFound:(id)a3 lost:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SGDSuggestManager *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__SGDSuggestManager_reportMessagesFound_lost_withCompletion___block_invoke;
  v14[3] = &unk_1E7DACA98;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  SGNotUserInitiated(CFSTR("reportMessagesFound"), 2, v14);

}

- (void)fullDownloadRequestBatch:(unint64_t)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  unint64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SGDSuggestManager_fullDownloadRequestBatch_withCompletion___block_invoke;
  v8[3] = &unk_1E7DA8E60;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  SGNotUserInitiated(CFSTR("fullDownloadRequestBatch"), 2, v8);

}

- (void)resolveFullDownloadRequests:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SGDSuggestManager_resolveFullDownloadRequests_withCompletion___block_invoke;
  v10[3] = &unk_1E7DB6F48;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  SGNotUserInitiated(CFSTR("resolveFullDownloadRequests"), 2, v10);

}

- (void)eventFromUniqueId:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  SGDuplicateKey *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  SGDuplicateKey *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 2434, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

  }
  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-eventFromUniqueId: %@", buf, 0xCu);
  }

  if (+[SGDuplicateKey serializationPassesBasicScrutiny:](SGDuplicateKey, "serializationPassesBasicScrutiny:", v7))
  {
    v10 = -[SGDuplicateKey initWithSerialized:]([SGDuplicateKey alloc], "initWithSerialized:", v7);
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "dupKey: %@", buf, 0xCu);
    }

    -[SGSqlEntityStore loadEventByDuplicateKey:](self->_harvestStore, "loadEventByDuplicateKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertToEvent:", self->_harvestStore);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "uniqueKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v7;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v17;
      _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "eventFromUniqueId: %@ resulted in dupKey: %@ and event: %@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v15);

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D19990];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], 4, 0);
    v10 = (SGDuplicateKey *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "responseWithError:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v13);
  }

}

- (id)createLaunchIntentForStorageEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "duplicateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v3, "tags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
  if (v7)
  {
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    *(_QWORD *)&v8 = 138412290;
    v21 = v8;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
      if (objc_msgSend(v13, "isReservationItemReferences", v21))
      {
        objc_msgSend(v13, "reservationItemReferences");
        v14 = objc_claimAutoreleasedReturnValue();
        if (!-[NSObject count](v14, "count"))
        {
          sgLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v28 = v5;
            _os_log_error_impl(&dword_1C3607000, v19, OS_LOG_TYPE_ERROR, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Found no item references for event with unique id '%@'", buf, 0xCu);
          }

          v7 = 0;
          goto LABEL_25;
        }
        -[NSObject firstObject](v14, "firstObject");
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v15;
      }
      else
      {
        if (!objc_msgSend(v13, "isReservationContainerReference"))
          goto LABEL_13;
        objc_msgSend(v13, "reservationContainerReference");
        v16 = objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v9 = (void *)v16;
          goto LABEL_13;
        }
        sgLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v21;
          v28 = v5;
          _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Found no container reference for event with unique id '%@'", buf, 0xCu);
        }
        v9 = 0;
      }

LABEL_13:
      if (v7 == (void *)++v12)
      {
        v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
        v7 = (void *)v17;
        if (v17)
          goto LABEL_3;

        if (v10)
        {
          v18 = objc_alloc(MEMORY[0x1E0CBD8F8]);
          v26 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)objc_msgSend(v18, "initWithReservationContainerReference:reservationItemReferences:", v9, v6);
          goto LABEL_25;
        }
        v7 = 0;
        goto LABEL_26;
      }
    }
  }
  v10 = 0;
  v9 = 0;
LABEL_25:

LABEL_26:
  return v7;
}

- (void)launchInfoForSuggestedEventWithUniqueIdentifier:(id)a3 sourceURL:(id)a4 clientLocale:(id)a5 ignoreUserActivitySupport:(BOOL)a6 ignoreMailCheck:(BOOL)a7 completion:(id)a8
{
  id v13;
  NSObject *v14;
  SGDuplicateKey *v15;
  SGSqlEntityStore *harvestStore;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  SGEKEventStoreProvider *ekStoreProvider;
  SGEKEventStoreProvider *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  char v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  BOOL v63;
  uint64_t v64;
  void *v65;
  char v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v91;
  void *v92;
  id v93;
  unint64_t v94;
  SGDuplicateKey *v96;
  void (**v97)(id, id);
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _QWORD v103[4];
  SGDuplicateKey *v104;
  SGDSuggestManager *v105;
  __int128 *p_buf;
  void *v107;
  uint8_t v108[4];
  uint64_t v109;
  uint8_t v110[128];
  __int128 buf;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v94 = (unint64_t)a4;
  v93 = a5;
  v97 = (void (**)(id, id))a8;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 2485, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueId"));

  }
  sgEventsLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: %@", (uint8_t *)&buf, 0xCu);
  }

  if (!+[SGDuplicateKey serializationPassesBasicScrutiny:](SGDuplicateKey, "serializationPassesBasicScrutiny:", v13))
  {
    v20 = (void *)MEMORY[0x1E0D19990];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], 4, 0);
    v98 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "responseWithError:", v98);
    v96 = (SGDuplicateKey *)objc_claimAutoreleasedReturnValue();
    v97[2](v97, v96);
    goto LABEL_106;
  }
  v15 = -[SGDuplicateKey initWithSerialized:]([SGDuplicateKey alloc], "initWithSerialized:", v13);
  harvestStore = self->_harvestStore;
  -[SGDuplicateKey entityKey](v15, "entityKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSqlEntityStore loadEntitiesByEntityKey:entityType:resolveDuplicates:](harvestStore, "loadEntitiesByEntityKey:entityType:resolveDuplicates:", v17, 2, &__block_literal_global_571);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v92, "count"))
  {
    objc_msgSend(v92, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGStorageEvent storageEventFromEntity:](SGStorageEvent, "storageEventFromEntity:", v18);
    v98 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v98, "duplicateKey");
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (SGDuplicateKey *)v19;
  }
  else
  {
    v98 = 0;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__3446;
  v114 = __Block_byref_object_dispose__3447;
  v115 = 0;
  ekStoreProvider = self->_ekStoreProvider;
  if (ekStoreProvider)
    ekStoreProvider = (SGEKEventStoreProvider *)ekStoreProvider->_callBlockWithEKEventStoreForReading;
  v22 = ekStoreProvider;
  v103[0] = MEMORY[0x1E0C809B0];
  v103[1] = 3221225472;
  v103[2] = __145__SGDSuggestManager_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_ignoreUserActivitySupport_ignoreMailCheck_completion___block_invoke_2;
  v103[3] = &unk_1E7DA8BB0;
  v96 = v15;
  v104 = v96;
  v105 = self;
  p_buf = &buf;
  ((void (*)(SGEKEventStoreProvider *, _QWORD *))v22->_callBlockWithEKEventStoreForReading)(v22, v103);

  if (!(v94 | v98) && !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    sgEventsLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v108 = 0;
      _os_log_impl(&dword_1C3607000, v33, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Event was not found and no fallback URL provided.", v108, 2u);
    }
    goto LABEL_112;
  }
  -[SGDuplicateKey parentKey](v96, "parentKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v23, "entityType");

  if (!v89)
  {
    sgEventsLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v108 = 0;
      _os_log_impl(&dword_1C3607000, v33, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Could not get the entity type.", v108, 2u);
    }
    goto LABEL_112;
  }
  if (v89 != 16)
  {
    switch(v89)
    {
      case 18:
        if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
        {
          objc_msgSend(MEMORY[0x1E0CA5870], "sg_preferredApplicationRecordForURL:");
          v55 = objc_claimAutoreleasedReturnValue();
LABEL_79:
          v50 = (void *)v55;
          v60 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          goto LABEL_80;
        }
        break;
      case 13:
        if (!v94
          || (objc_msgSend((id)v94, "scheme"),
              v56 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v56, "lowercaseString"),
              v57 = (void *)objc_claimAutoreleasedReturnValue(),
              v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("sms")),
              v57,
              v56,
              !v58))
        {
          v50 = 0;
          v26 = 0;
          v53 = 0;
          goto LABEL_87;
        }
        if (!a7)
        {
          -[NSXPCConnection sgd_clientName](self->_connection, "sgd_clientName");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "isEqualToString:", *MEMORY[0x1E0D19A38]);

        }
        sgEventsLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v108 = 0;
          _os_log_impl(&dword_1C3607000, v41, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Found message for Event Found in Messages on device.", v108, 2u);
        }
        goto LABEL_71;
      case 5:
        if (v94)
        {
          objc_msgSend((id)v94, "scheme");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lowercaseString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("message"));

          if (v36)
          {
            if (a7)
              goto LABEL_42;
            -[NSXPCConnection sgd_clientName](self->_connection, "sgd_clientName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0D19A28]);

            if ((v38 & 1) != 0
              || (+[SGMailClientUtil sharedInstance](SGMailClientUtil, "sharedInstance"),
                  v39 = (void *)objc_claimAutoreleasedReturnValue(),
                  v40 = objc_msgSend(v39, "isMessageAvailable:", v94),
                  v39,
                  v40))
            {
LABEL_42:
              sgEventsLogHandle();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v108 = 0;
                _os_log_impl(&dword_1C3607000, v41, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Found e-mail for Event Found in Mail on device.", v108, 2u);
              }
LABEL_71:

              objc_msgSend(MEMORY[0x1E0CA5870], "sg_preferredApplicationRecordForURL:", v94);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = (void *)v94;
LABEL_80:
              v53 = v60;
              v26 = 0;
              goto LABEL_87;
            }
          }
        }
        if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
        {
          sgEventsLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v108 = 0;
            _os_log_impl(&dword_1C3607000, v62, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Could not find e-mail for Event Found in Mail on device but did find fallback URL", v108, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CA5870], "sg_preferredApplicationRecordForURL:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
          v55 = objc_claimAutoreleasedReturnValue();
          goto LABEL_79;
        }
        sgEventsLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v108 = 0;
          _os_log_impl(&dword_1C3607000, v33, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Could not find e-mail for Event Found in Mail on device or fallback URL.", v108, 2u);
        }
LABEL_112:

        objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v97[2](v97, v50);
        goto LABEL_105;
    }
    sgEventsLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v108 = 134217984;
      v109 = v89;
      _os_log_impl(&dword_1C3607000, v33, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Can't find a bundleId for entity type: '%lld'", v108, 0xCu);
    }
    goto LABEL_112;
  }
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  objc_msgSend((id)v98, "tags");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
  if (!v25)
  {

    v27 = 0;
    goto LABEL_49;
  }
  v26 = 0;
  v27 = 0;
  v28 = *(_QWORD *)v100;
  do
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v100 != v28)
        objc_enumerationMutation(v24);
      v30 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
      if (objc_msgSend(v30, "isIntentResponseUserActivityString"))
      {
        objc_msgSend(v30, "intentResponseUserActivityString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(MEMORY[0x1E0CA5920], "sg_userActivityWithRequiredString:", v31);
          v32 = objc_claimAutoreleasedReturnValue();

          v26 = (void *)v32;
        }
      }
      else
      {
        if (!objc_msgSend(v30, "isInteractionTeamId"))
          continue;
        objc_msgSend(v30, "value");
        v31 = v27;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
  }
  while (v25);

  if (!v26)
LABEL_49:
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("INGetReservationDetailsIntent"));
  if (a6)
  {
    objc_msgSend((id)v98, "duplicateKey");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "parentKey");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bundleId");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44 == 0;

    if (!v45)
    {
      v46 = objc_alloc(MEMORY[0x1E0CA5870]);
      objc_msgSend((id)v98, "duplicateKey");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "parentKey");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "bundleId");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(v46, "initWithBundleIdentifier:allowPlaceholder:error:", v49, 0, 0);
      goto LABEL_54;
    }
    v50 = 0;
  }
  else
  {
    v51 = (void *)MEMORY[0x1E0CA5870];
    objc_msgSend(v26, "activityType");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v98, "duplicateKey");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "parentKey");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bundleId");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "sg_preferredApplicationRecordForUserActivityType:withTeamIdentifier:preferredBundleIdentifier:", v47, v27, v52);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_54:
  }
  if ((objc_msgSend(v50, "sg_isAppleBundleIdentifier") & 1) != 0)
  {
LABEL_56:
    v53 = 0;
    goto LABEL_86;
  }
  if (!v50)
  {
    v61 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    if (!v61)
    {
      v50 = 0;
      goto LABEL_56;
    }
LABEL_84:
    objc_msgSend(MEMORY[0x1E0CA5870], "sg_preferredApplicationRecordForURL:", v61);
    v64 = objc_claimAutoreleasedReturnValue();

    v53 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    v54 = v26;
    v50 = (void *)v64;
    v26 = 0;
    goto LABEL_85;
  }
  objc_msgSend(v50, "applicationState");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v54, "isInstalled") & 1) == 0)
  {
    v63 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;

    if (v63)
      goto LABEL_56;
    v61 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    goto LABEL_84;
  }
  v53 = 0;
LABEL_85:

LABEL_86:
LABEL_87:
  if ((objc_msgSend(v50, "sg_isAppleBundleIdentifier") & 1) == 0)
  {
    if (!v50
      || (objc_msgSend(v50, "applicationState"),
          v65 = (void *)objc_claimAutoreleasedReturnValue(),
          v66 = objc_msgSend(v65, "isInstalled"),
          v65,
          (v66 & 1) == 0))
    {
      sgEventsLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v108 = 0;
        _os_log_impl(&dword_1C3607000, v68, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Could not find an installed bundle id.", v108, 2u);
      }
      goto LABEL_97;
    }
  }
  v67 = 0;
  if (v89 == 16)
  {
    if (v26)
    {
      -[SGDSuggestManager createLaunchIntentForStorageEvent:](self, "createLaunchIntentForStorageEvent:", v98);
      v67 = objc_claimAutoreleasedReturnValue();
      if (!v67)
      {
        sgEventsLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v108 = 0;
          _os_log_impl(&dword_1C3607000, v68, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-launchInfoForSuggestedEventWithUniqueIdentifier: Could not create launch intent for event.", v108, 2u);
        }
LABEL_97:

        objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v97[2](v97, v69);
        goto LABEL_104;
      }
    }
  }
  if (v93)
  {
    objc_msgSend(v93, "localeIdentifier");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "localeIdentifier");
    v91 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v50, "sg_isAppleBundleIdentifier")
    && (objc_msgSend(v50, "applicationState"),
        v71 = (void *)objc_claimAutoreleasedReturnValue(),
        v72 = objc_msgSend(v71, "isInstalled"),
        v71,
        (v72 & 1) == 0))
  {
    objc_msgSend(v50, "bundleIdentifier");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v107 = v91;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedNameWithPreferredLocalizations:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SGDSuggestManager _showInFormatStringWithLocalization:](self, "_showInFormatStringWithLocalization:", v91);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  _PASValidatedFormat(v75, v76, v77, v78, v79, v80, v81, v82, (uint64_t)v74);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_alloc(MEMORY[0x1E0D19958]);
  objc_msgSend(v50, "bundleIdentifier");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v84, "initWithBundleId:localizedShowInString:userActivity:intent:sourceURL:", v85, v83, v26, v67, v53);

  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v97[2](v97, v87);

  v69 = v53;
  v53 = v26;
  v26 = (void *)v67;
LABEL_104:

LABEL_105:
  _Block_object_dispose(&buf, 8);

LABEL_106:
}

- (void)launchAppForSuggestedEventUsingLaunchInfo:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(id, void *);
  _QWORD v22[4];
  void (**v23)(id, void *);
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = objc_alloc(MEMORY[0x1E0CA5870]);
  objc_msgSend(v5, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v9 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, &v24);
  v10 = v24;

  if (v10)
  {
    sgEventsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "SGDSuggestManager-launchAppForSuggestedEventUsingLaunchInfo: Error creating application record: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v5, "userActivity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0CBD9A8]);
        objc_msgSend(v5, "intent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithIntent:response:", v16, 0);

        objc_msgSend(v17, "setIntentHandlingStatus:", 5);
        objc_msgSend(v14, "_setInteraction:donate:", v17, 0);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __74__SGDSuggestManager_launchAppForSuggestedEventUsingLaunchInfo_completion___block_invoke;
        v22[3] = &unk_1E7DA8EC8;
        v23 = v6;
        objc_msgSend(v12, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v14, v9, 0, v22);

        v10 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], -1, &unk_1E7E11428);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v17);
      }

    }
    else
    {
      objc_msgSend(v5, "sourceURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v5, "sourceURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __74__SGDSuggestManager_launchAppForSuggestedEventUsingLaunchInfo_completion___block_invoke_589;
        v20[3] = &unk_1E7DA8EF0;
        v21 = v6;
        objc_msgSend(v12, "openURL:configuration:completionHandler:", v19, 0, v20);

        v10 = 0;
        v14 = v21;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], -1, &unk_1E7E11450);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v14);
      }
    }

  }
}

- (void)originFromRecordId:(id)a3 completion:(id)a4
{
  SGSqlEntityStore *harvestStore;
  void (**v6)(id, void *);
  void *v7;
  id v8;

  harvestStore = self->_harvestStore;
  v6 = (void (**)(id, void *))a4;
  -[SGSqlEntityStore loadOriginByRecordId:](harvestStore, "loadOriginByRecordId:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)confirmEvent:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  SGSqlEntityStore *harvestStore;
  id v11;
  _BOOL4 v12;
  SGEKEventStoreProvider *v13;
  void *v14;
  void *v15;
  SGEKEventStoreProvider *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  SGEKEventStoreProvider *v25;
  id v26;
  BOOL v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "eventIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v9;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmEvent: %@", buf, 0xCu);

  }
  harvestStore = self->_harvestStore;
  v28 = 0;
  -[SGSqlEntityStore confirmRealtimeEvent:error:](harvestStore, "confirmRealtimeEvent:error:", v6, &v28);
  v11 = v28;
  v12 = -[SGDSuggestManager clientIsMail](self, "clientIsMail");
  +[SGAggregateLogging eventConfirmed:inApp:](SGAggregateLogging, "eventConfirmed:inApp:", v6, !v12);
  v13 = self->_ekStoreProvider;
  v14 = (void *)MEMORY[0x1E0D81598];
  dispatch_get_global_queue(9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __45__SGDSuggestManager_confirmEvent_completion___block_invoke;
  v24 = &unk_1E7DA8F18;
  v16 = v13;
  v25 = v16;
  v17 = v6;
  v26 = v17;
  v27 = v12;
  objc_msgSend(v14, "runAsyncOnQueue:afterDelaySeconds:block:", v15, &v21, 60.0);

  if (v12)
    v18 = 1;
  else
    v18 = 4;
  -[SGDSuggestManager logEventInteractionForRealtimeEvent:interface:actionType:](self, "logEventInteractionForRealtimeEvent:interface:actionType:", v17, v18, 6, v21, v22, v23, v24);
  +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v11);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = objc_opt_new();
  }
  v20 = (void *)v19;
  v7[2](v7, v19);

}

- (void)confirmEventByRecordId:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  SGSqlEntityStore *harvestStore;
  id v10;
  void *v11;
  void *v12;
  SGSqlEntityStore *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmEventByRecordId: %@", buf, 0xCu);
  }

  harvestStore = self->_harvestStore;
  v25 = 0;
  -[SGSqlEntityStore confirmEventByRecordId:error:](harvestStore, "confirmEventByRecordId:error:", v6, &v25);
  v10 = v25;
  -[SGSqlEntityStore loadEntityByRecordId:](self->_harvestStore, "loadEntityByRecordId:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = self->_harvestStore;
    objc_msgSend(v11, "duplicateKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSqlEntityStore loadEntityByKey:](v13, "loadEntityByKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v26 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGDSuggestManager shortNamesAndRealtimeEventsFromEntity:enrichments:store:](self, "shortNamesAndRealtimeEventsFromEntity:enrichments:store:", v16, v17, self->_harvestStore);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "second");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGAggregateLogging eventConfirmedByRecord:](SGAggregateLogging, "eventConfirmedByRecord:", v20);

        objc_msgSend(v12, "duplicateKey");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "serialize");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGDSuggestManager logEventInteractionForEventWithUniqueKey:interface:actionType:](self, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v22, 7, 6);

      }
    }

  }
  +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v10);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = objc_opt_new();
  }
  v24 = (void *)v23;
  v7[2](v7, v23);

}

- (void)rejectEvent:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  SGSqlEntityStore *harvestStore;
  id v11;
  void *v12;
  _BOOL4 v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "eventIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectEvent: %@", buf, 0xCu);

  }
  harvestStore = self->_harvestStore;
  v18 = 0;
  -[SGSqlEntityStore rejectRealtimeEvent:error:](harvestStore, "rejectRealtimeEvent:error:", v6, &v18);
  v11 = v18;
  +[SGAggregateLogging eventRejected:inApp:](SGAggregateLogging, "eventRejected:inApp:", v6, -[SGDSuggestManager clientIsMail](self, "clientIsMail") ^ 1);
  v12 = (void *)MEMORY[0x1E0D19950];
  v13 = -[SGDSuggestManager clientIsMail](self, "clientIsMail");
  v14 = (_QWORD *)MEMORY[0x1E0D19AF8];
  if (!v13)
    v14 = (_QWORD *)MEMORY[0x1E0D19B00];
  objc_msgSend(v12, "recordBannerRejectedWithEvent:inApp:", v6, *v14);
  if (-[SGDSuggestManager clientIsMail](self, "clientIsMail"))
    v15 = 1;
  else
    v15 = 4;
  -[SGDSuggestManager logEventInteractionForRealtimeEvent:interface:actionType:](self, "logEventInteractionForRealtimeEvent:interface:actionType:", v6, v15, 7);
  +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = objc_opt_new();
  }
  v17 = (void *)v16;
  v7[2](v7, v16);

}

- (void)rejectEventByRecordId:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  SGSqlEntityStore *harvestStore;
  id v10;
  void *v11;
  void *v12;
  SGSqlEntityStore *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectEventByRecordId: %@", buf, 0xCu);
  }

  harvestStore = self->_harvestStore;
  v25 = 0;
  -[SGSqlEntityStore rejectEventByRecordId:error:](harvestStore, "rejectEventByRecordId:error:", v6, &v25);
  v10 = v25;
  -[SGSqlEntityStore loadEntityByRecordId:](self->_harvestStore, "loadEntityByRecordId:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = self->_harvestStore;
    objc_msgSend(v11, "duplicateKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSqlEntityStore loadEntityByKey:](v13, "loadEntityByKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v26 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGDSuggestManager shortNamesAndRealtimeEventsFromEntity:enrichments:store:](self, "shortNamesAndRealtimeEventsFromEntity:enrichments:store:", v16, v17, self->_harvestStore);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "second");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGAggregateLogging eventRejectedByRecord:](SGAggregateLogging, "eventRejectedByRecord:", v20);

        objc_msgSend(v12, "duplicateKey");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "serialize");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGDSuggestManager logEventInteractionForEventWithUniqueKey:interface:actionType:](self, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v22, 7, 7);

      }
    }

  }
  +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v10);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = objc_opt_new();
  }
  v24 = (void *)v23;
  v7[2](v7, v23);

}

- (void)deleteEventByRecordId:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  SGSqlEntityStore *harvestStore;
  id v10;
  void *v11;
  void *v12;
  SGSqlEntityStore *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  sgEventsLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v6;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager - deleteEventByRecordId: event Id: (%{public}@)", buf, 0xCu);
  }

  harvestStore = self->_harvestStore;
  v25 = 0;
  -[SGSqlEntityStore rejectEventByRecordId:error:](harvestStore, "rejectEventByRecordId:error:", v6, &v25);
  v10 = v25;
  -[SGSqlEntityStore loadEntityByRecordId:](self->_harvestStore, "loadEntityByRecordId:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = self->_harvestStore;
    objc_msgSend(v11, "duplicateKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parentKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSqlEntityStore loadEntityByKey:](v13, "loadEntityByKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v26 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGDSuggestManager shortNamesAndRealtimeEventsFromEntity:enrichments:store:](self, "shortNamesAndRealtimeEventsFromEntity:enrichments:store:", v16, v17, self->_harvestStore);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "second");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[SGAggregateLogging eventRejectedByRecord:](SGAggregateLogging, "eventRejectedByRecord:", v20);

        objc_msgSend(v12, "duplicateKey");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "serialize");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGDSuggestManager logEventInteractionForEventWithUniqueKey:interface:actionType:](self, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v22, 7, 9);

      }
    }

  }
  +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v10);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = objc_opt_new();
  }
  v24 = (void *)v23;
  v7[2](v7, v23);

}

- (void)confirmContact:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  NSObject *v10;
  void *v11;
  SGSqlEntityStore *harvestStore;
  id v13;
  void *v14;
  _BOOL4 v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "cnContactIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmContact: %@", buf, 0xCu);

  }
  harvestStore = self->_harvestStore;
  v22 = 0;
  -[SGSqlEntityStore confirmRealtimeContact:error:](harvestStore, "confirmRealtimeContact:error:", v8, &v22);
  v13 = v22;
  +[SGAggregateLogging contactConfirmed:inApp:](SGAggregateLogging, "contactConfirmed:inApp:", v8, -[SGDSuggestManager clientIsMail](self, "clientIsMail") ^ 1);
  v14 = (void *)MEMORY[0x1E0D19950];
  v15 = -[SGDSuggestManager clientIsMail](self, "clientIsMail");
  v16 = (_QWORD *)MEMORY[0x1E0D19AF8];
  if (!v15)
    v16 = (_QWORD *)MEMORY[0x1E0D19B00];
  if (a4 > 4)
    v17 = 2;
  else
    v17 = dword_1C3853568[a4];
  objc_msgSend(v14, "recordBannerConfirmedWithContact:proposedCNContact:confirmedCNContact:inApp:confirmationUI:pet2Tracker:", v8, 0, 0, *v16, v17, self->_pet2Tracker);
  +[SGDSuggestManager contactAggregator](SGDSuggestManager, "contactAggregator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contact");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeContact:", v19);

  +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v13);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = objc_opt_new();
  }
  v21 = (void *)v20;
  v9[2](v9, v20);

}

- (void)_performAction:(id)a3 onContactDetailRecord:(id)a4 confirmRejectUI:(int)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int IsContactDetail;
  SGSuggestHistory *history;
  void *v23;
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a6;
  -[SGSqlEntityStore loadEntityByRecordId:](self->_harvestStore, "loadEntityByRecordId:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "groupId") < 1)
  {
    if (objc_msgSend(v12, "masterEntityId") < 1)
      v13 = objc_msgSend(v10, "rowId");
    else
      v13 = objc_msgSend(v12, "masterEntityId");
  }
  else
  {
    v13 = objc_msgSend(v12, "groupId");
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D19920], "recordIdForContactWithRowId:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSqlEntityStore suggestContactByRecordId:withSnippets:filterConfirmRejectDetails:](self->_harvestStore, "suggestContactByRecordId:withSnippets:filterConfirmRejectDetails:", v14, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "detailForRecordId:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      sgLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v10;
        _os_log_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEFAULT, "While confirming/rejecting contact detail, requested detail not in loaded contract for record id: %@", buf, 0xCu);
      }

      +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
      v19 = (void *)objc_opt_new();
      v11[2](v11, v19);

      goto LABEL_31;
    }
    -[SGSuggestHistory confirmOrRejectDetail:forContact:](self->_history, "confirmOrRejectDetail:forContact:", v16, v15);
    v38 = v9;
    v39 = v15;
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("confirm")))
    {
      -[SGSqlEntityStore confirmContactDetailByRecordID:error:](self->_harvestStore, "confirmContactDetailByRecordID:error:", v10, 0);
      +[SGAggregateLogging detail:confirmedForContact:](SGAggregateLogging, "detail:confirmedForContact:", v16, v15);
      v36 = 0;
    }
    else
    {
      objc_msgSend(v12, "duplicateKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "entityType");
      IsContactDetail = SGEntityTypeIsContactDetail();

      if (IsContactDetail)
      {
        history = self->_history;
        objc_msgSend(v12, "duplicateKey");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "contactDetailKey");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGSuggestHistory rejectContactDetailKey:](history, "rejectContactDetailKey:", v24);

        v15 = v39;
      }
      -[SGSqlEntityStore rejectContactDetailByRecordID:error:](self->_harvestStore, "rejectContactDetailByRecordID:error:", v10, 0);
      +[SGAggregateLogging detail:rejectedForContact:](SGAggregateLogging, "detail:rejectedForContact:", v16, v15);
      v36 = 1;
    }
    v35 = (void *)MEMORY[0x1E0D19950];
    v25 = v16;
    objc_opt_class();
    v37 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = (uint64_t *)MEMORY[0x1E0D19BA8];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = *MEMORY[0x1E0D19BA0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v27 = *MEMORY[0x1E0D19B90];
        else
          v27 = v28;
LABEL_27:

        objc_msgSend(v25, "extractionInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "extractionType");
        objc_msgSend(v25, "extractionInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "modelVersion");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (a5 > 4)
          v33 = 2;
        else
          v33 = dword_1C3853568[a5];
        objc_msgSend(v35, "recordContactDetailEngagementWithResolution:detailType:extractionType:modelVersion:confirmRejectUI:pet2Tracker:", v36, v27, v30, v32, v33, self->_pet2Tracker, v35);

        +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
        v34 = (void *)objc_opt_new();
        v11[2](v11, v34);

        v14 = v37;
        v9 = v38;
        v15 = v39;
LABEL_31:

        goto LABEL_32;
      }
      v26 = (uint64_t *)MEMORY[0x1E0D19B98];
    }
    v27 = *v26;
    goto LABEL_27;
  }
  sgLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v10;
    _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEFAULT, "While confirming/rejecting contact detail, failed to load detail for record id: %@", buf, 0xCu);
  }

  +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
  v14 = (void *)objc_opt_new();
  v11[2](v11, v14);
LABEL_32:

}

- (void)_performAction:(id)a3 onRecord:(id)a4 confirmRejectUI:(int)a5 completion:(id)a6
{
  -[SGDSuggestManager _performAction:onRecord:withParentConfirmation:confirmRejectUI:completion:](self, "_performAction:onRecord:withParentConfirmation:confirmRejectUI:completion:", a3, a4, 1, *(_QWORD *)&a5, a6);
}

- (void)_performAction:(id)a3 onRecord:(id)a4 withParentConfirmation:(BOOL)a5 confirmRejectUI:(int)a6 completion:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  _QWORD *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void *v35;
  SGDSuggestManager *v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, void *))a7;
  -[SGSqlEntityStore suggestContactByRecordId:withSnippets:filterConfirmRejectDetails:](self->_harvestStore, "suggestContactByRecordId:withSnippets:filterConfirmRejectDetails:", v12, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recordId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v12);

  if (v16)
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("confirm")))
    {
      sgLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v14;
        _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "Confirming details as workaround for Contacts search for contact %@", buf, 0xCu);
      }

      v32 = MEMORY[0x1E0C809B0];
      v33 = 3221225472;
      v34 = __95__SGDSuggestManager__performAction_onRecord_withParentConfirmation_confirmRejectUI_completion___block_invoke;
      v35 = &unk_1E7DB0810;
      v36 = self;
      v18 = v14;
      v37 = v18;
      objc_msgSend(v18, "enumerateDetailsWithBlock:", &v32);
      -[SGSqlEntityStore confirmContactByRecordID:error:](self->_harvestStore, "confirmContactByRecordID:error:", v12, 0, v32, v33, v34, v35, v36);
      +[SGAggregateLogging recordConfirmedForContact:](SGAggregateLogging, "recordConfirmedForContact:", v18);
      v19 = (void *)MEMORY[0x1E0D19950];
      objc_msgSend(MEMORY[0x1E0D198F8], "realtimeContactForNewContact:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[SGDSuggestManager clientIsMail](self, "clientIsMail");
      v22 = (_QWORD *)MEMORY[0x1E0D19AF8];
      if (!v21)
        v22 = (_QWORD *)MEMORY[0x1E0D19B00];
      if (a6 > 4)
        v23 = 2;
      else
        v23 = dword_1C3853568[a6];
      objc_msgSend(v19, "recordBannerConfirmedWithContact:proposedCNContact:confirmedCNContact:inApp:confirmationUI:pet2Tracker:", v20, 0, 0, *v22, v23, self->_pet2Tracker);

    }
    else
    {
      -[SGSuggestHistory rejectContact:](self->_history, "rejectContact:", v14);
      -[SGSqlEntityStore rejectContactByRecordID:error:](self->_harvestStore, "rejectContactByRecordID:error:", v12, 0);
      +[SGAggregateLogging recordRejectedForContact:](SGAggregateLogging, "recordRejectedForContact:", v14);
      v26 = (void *)MEMORY[0x1E0D19950];
      objc_msgSend(MEMORY[0x1E0D198F8], "realtimeContactForNewContact:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[SGDSuggestManager clientIsMail](self, "clientIsMail");
      v29 = (_QWORD *)MEMORY[0x1E0D19AF8];
      if (!v28)
        v29 = (_QWORD *)MEMORY[0x1E0D19B00];
      if (a6 > 4)
        v30 = 2;
      else
        v30 = dword_1C3853568[a6];
      objc_msgSend(v26, "recordRejectedContact:inApp:rejectionUI:pet2Tracker:", v27, *v29, v30, self->_pet2Tracker);

    }
  }
  else
  {
    sgLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "recordId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v12;
      v40 = 2112;
      v41 = v25;
      _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, "While confirming/rejecting contact, provided recordId was not contactId: %@ %@", buf, 0x16u);

    }
  }
  +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
  if (v13)
  {
    v31 = (void *)objc_opt_new();
    v13[2](v13, v31);

  }
}

- (void)confirmRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v8;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmRecord: %@ %td", (uint8_t *)&v11, 0x16u);
  }

  -[SGDSuggestManager _performAction:onRecord:confirmRejectUI:completion:](self, "_performAction:onRecord:confirmRejectUI:completion:", CFSTR("confirm"), v8, v6, v9);
}

- (void)rejectRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v8;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectRecord: %@ %td", (uint8_t *)&v11, 0x16u);
  }

  -[SGDSuggestManager _performAction:onRecord:confirmRejectUI:completion:](self, "_performAction:onRecord:confirmRejectUI:completion:", CFSTR("reject"), v8, v6, v9);
}

- (void)confirmContactDetailRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v8;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-confirmContactDetailRecord: %@ %td", (uint8_t *)&v11, 0x16u);
  }

  -[SGDSuggestManager _performAction:onContactDetailRecord:confirmRejectUI:completion:](self, "_performAction:onContactDetailRecord:confirmRejectUI:completion:", CFSTR("confirm"), v8, v6, v9);
}

- (void)rejectContactDetailRecord:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_QWORD *)&a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = v8;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "SGDSuggestManager-rejectContactDetailRecord: %@ %td", (uint8_t *)&v11, 0x16u);
  }

  -[SGDSuggestManager _performAction:onContactDetailRecord:confirmRejectUI:completion:](self, "_performAction:onContactDetailRecord:confirmRejectUI:completion:", CFSTR("reject"), v8, v6, v9);
}

- (void)rejectContact:(id)a3 confirmRejectUI:(int)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  SGSqlEntityStore *harvestStore;
  id v11;
  void *v12;
  _BOOL4 v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v8 = a3;
  v9 = (void (**)(id, uint64_t))a5;
  harvestStore = self->_harvestStore;
  v20 = 0;
  -[SGSqlEntityStore rejectRealtimeContact:error:](harvestStore, "rejectRealtimeContact:error:", v8, &v20);
  v11 = v20;
  +[SGAggregateLogging contactRejected:inApp:](SGAggregateLogging, "contactRejected:inApp:", v8, -[SGDSuggestManager clientIsMail](self, "clientIsMail") ^ 1);
  v12 = (void *)MEMORY[0x1E0D19950];
  v13 = -[SGDSuggestManager clientIsMail](self, "clientIsMail");
  v14 = (_QWORD *)MEMORY[0x1E0D19AF8];
  if (!v13)
    v14 = (_QWORD *)MEMORY[0x1E0D19B00];
  if (a4 > 4)
    v15 = 2;
  else
    v15 = dword_1C3853568[a4];
  objc_msgSend(v12, "recordRejectedContact:inApp:rejectionUI:pet2Tracker:", v8, *v14, v15, self->_pet2Tracker);
  +[SGDSuggestManager contactAggregator](SGDSuggestManager, "contactAggregator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contact");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeContact:", v17);

  +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v11);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_opt_new();
  }
  v19 = (void *)v18;
  v9[2](v9, v18);

}

- (void)resetConfirmationAndRejectionHistory:(id)a3
{
  SGSuggestHistory *history;
  void (**v4)(id, id);
  id v5;

  history = self->_history;
  v4 = (void (**)(id, id))a3;
  -[SGSuggestHistory reset](history, "reset");
  v5 = (id)objc_opt_new();
  v4[2](v4, v5);

}

- (void)rebuildNamesForDetailCache:(id)a3
{
  SGSqlEntityStore *harvestStore;
  void (**v4)(id, id);
  id v5;

  harvestStore = self->_harvestStore;
  v4 = (void (**)(id, id))a3;
  -[SGSqlEntityStore rebuildContactDetailsCacheWithShouldContinueBlock:](harvestStore, "rebuildContactDetailsCacheWithShouldContinueBlock:", &__block_literal_global_604);
  v5 = (id)objc_opt_new();
  v4[2](v4, v5);

}

- (void)predictedToEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 completion:(id)a8
{
  void *v9;
  id v10;
  id v11;

  v9 = (void *)MEMORY[0x1E0D19990];
  v10 = a8;
  objc_msgSend(v9, "responseWith:", MEMORY[0x1E0C9AA60]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a8 + 2))(v10, v11);

}

- (void)predictedCCEmailAddressesWithToAddresses:(id)a3 ccAddresses:(id)a4 fromAddress:(id)a5 date:(double)a6 bounds:(id)a7 completion:(id)a8
{
  void *v9;
  id v10;
  id v11;

  v9 = (void *)MEMORY[0x1E0D19990];
  v10 = a8;
  objc_msgSend(v9, "responseWith:", MEMORY[0x1E0C9AA60]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a8 + 2))(v10, v11);

}

- (void)sendRTCLogsWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SGDSuggestManager_sendRTCLogsWithCompletion___block_invoke;
  v6[3] = &unk_1E7DA8EC8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "sendRTCLogsWithCompletion:", v6);

}

- (void)planReceivedFromServerWithPayload:(id)a3 completion:(id)a4
{
  void *v5;
  void (**v6)(id, void *);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0D81080];
  v6 = (void (**)(id, void *))a4;
  v7 = a3;
  +[SGPaths suggestionsDirectory](SGPaths, "suggestionsDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedSingletonWithDirectory:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v9, "planReceivedWithPayload:error:", v7, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v11)
    objc_msgSend(MEMORY[0x1E0D19990], "responseWithError:", v11);
  else
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v12);

}

- (void)evaluateRecipe:(id)a3 attachments:(id)a4 completion:(id)a5
{
  void *v7;
  void (**v8)(id, void *);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v7 = (void *)MEMORY[0x1E0D81080];
  v8 = (void (**)(id, void *))a5;
  v9 = a4;
  v10 = a3;
  +[SGPaths suggestionsDirectory](SGPaths, "suggestionsDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharedSingletonWithDirectory:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  objc_msgSend(v12, "planReceivedWithRecipe:attachments:error:", v10, v9, &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (v14)
    objc_msgSend(MEMORY[0x1E0D19990], "responseWithError:", v14);
  else
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v15);

}

- (void)saliencyFromRFC822Data:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  SGMIFeatureVector *v7;
  void *v8;
  void *v9;
  SGMIFeatureVector *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  +[SGSimpleMailMessage parseRfc822:](SGSimpleMailMessage, "parseRfc822:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [SGMIFeatureVector alloc];
  objc_msgSend(v6, "messageId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SGMIFeatureVector initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:](v7, "initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:", v8, 0, v6, &unk_1E7E0C920, 0, v9, MEMORY[0x1E0C9AA60]);

  +[SGMISaliencyModelConfig defaultConfig](SGMISaliencyModelConfig, "defaultConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  +[SGMISaliencyInference evaluate:enablePreFiltering:config:error:](SGMISaliencyInference, "evaluate:enablePreFiltering:config:error:", v10, 1, v11, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  if (v13)
  {
    sgMailIntelligenceLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, "SGMISaliencyInference: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v15);

}

- (void)saliencyFromEmailHeaders:(id)a3 withCompletion:(id)a4
{
  id v5;
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  SGSimpleMailHeaderKeyValue *v23;
  void *v24;
  SGMIFeatureVector *v25;
  void *v26;
  void *v27;
  SGMIFeatureVector *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void (**v34)(id, void *);
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  id v41;
  _BYTE v42[128];
  _QWORD v43[5];
  _QWORD v44[7];

  v44[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34 = (void (**)(id, void *))a4;
  v43[0] = CFSTR("message-id");
  objc_msgSend(v5, "messageId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v6;
  v43[1] = CFSTR("subject");
  objc_msgSend(v5, "subject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v7;
  v43[2] = CFSTR("from");
  objc_msgSend(v5, "from");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_pas_componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v9;
  v43[3] = CFSTR("to");
  objc_msgSend(v5, "to");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pas_componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v11;
  v43[4] = CFSTR("cc");
  objc_msgSend(v5, "cc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = -[SGSimpleMailHeaderKeyValue initWithKey:value:]([SGSimpleMailHeaderKeyValue alloc], "initWithKey:value:", v21, v22);
          objc_msgSend(v15, "addObject:", v23);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v18);
  }

  +[SGSimpleMailMessage simpleMailMessageFromHeaders:](SGSimpleMailMessage, "simpleMailMessageFromHeaders:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = [SGMIFeatureVector alloc];
  objc_msgSend(v24, "messageId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[SGMIFeatureVector initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:](v25, "initWithMessageId:hasHashedMessageId:simpleMailMessage:senderConnectionScore:biomeMessageSummary:store:preLoadedFeatureNames:", v26, 0, v24, &unk_1E7E0C920, 0, v27, MEMORY[0x1E0C9AA60]);

  +[SGMISaliencyModelConfig defaultConfig](SGMISaliencyModelConfig, "defaultConfig");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  +[SGMISaliencyInference evaluate:enablePreFiltering:config:error:](SGMISaliencyInference, "evaluate:enablePreFiltering:config:error:", v28, 1, v29, &v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v35;

  if (v31)
  {
    sgMailIntelligenceLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v31;
      _os_log_error_impl(&dword_1C3607000, v32, OS_LOG_TYPE_ERROR, "SGMISaliencyInference: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2](v34, v33);

}

- (void)topSalienciesForMailboxId:(id)a3 limit:(int64_t)a4 withCompletion:(id)a5
{
  SGSqlEntityStore *harvestStore;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  harvestStore = self->_harvestStore;
  v9 = (void (**)(id, void *))a5;
  -[SGSqlEntityStore topSalienciesForMailboxId:limit:](harvestStore, "topSalienciesForMailboxId:limit:", v15, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNSString:forKey:", v15, CFSTR("lastMailboxCheckedForTopSGMISaliency"));

    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInt64NSNumber:forKey:", v13, CFSTR("lastLimitCheckedForTopSGMISaliency"));

  }
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v14);

}

- (void)sortedSaliencyResultsRestrictedToMailboxTypes:(id)a3 mailboxIds:(id)a4 receivedOnOrAfter:(id)a5 ascending:(BOOL)a6 limit:(unint64_t)a7 withCompletion:(id)a8
{
  _BOOL8 v9;
  SGSqlEntityStore *harvestStore;
  void (**v14)(id, void *);
  void *v15;
  id v16;

  v9 = a6;
  harvestStore = self->_harvestStore;
  v14 = (void (**)(id, void *))a8;
  -[SGSqlEntityStore sortedSaliencyResultsRestrictedToMailboxTypes:mailboxIds:receivedOnOrAfter:ascending:limit:](harvestStore, "sortedSaliencyResultsRestrictedToMailboxTypes:mailboxIds:receivedOnOrAfter:ascending:limit:", a3, a4, a5, v9, a7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v15);

}

- (void)preventUnsubscriptionOpportunitiesSuggestionsForField:(int64_t)a3 toValues:(id)a4 withCompletion:(id)a5
{
  SGSqlEntityStore *harvestStore;
  void (**v8)(id, id);
  id v9;

  harvestStore = self->_harvestStore;
  v8 = (void (**)(id, id))a5;
  -[SGSqlEntityStore preventUnsubscriptionOpportunitiesSuggestionsForField:toValues:](harvestStore, "preventUnsubscriptionOpportunitiesSuggestionsForField:toValues:", a3, a4);
  v9 = (id)objc_opt_new();
  v8[2](v8, v9);

}

- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 minCount:(unint64_t)a4 minScore:(double)a5 limit:(unint64_t)a6 withCompletion:(id)a7
{
  SGSqlEntityStore *harvestStore;
  void (**v12)(id, void *);
  void *v13;
  id v14;

  harvestStore = self->_harvestStore;
  v12 = (void (**)(id, void *))a7;
  -[SGSqlEntityStore sortedUnsubscriptionOpportunitiesForField:minCount:minScore:limit:](harvestStore, "sortedUnsubscriptionOpportunitiesForField:minCount:minScore:limit:", a3, a4, a6, a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, v13);

}

- (void)sortedUnsubscriptionOpportunitiesForField:(int64_t)a3 limit:(unint64_t)a4 withCompletion:(id)a5
{
  SGSqlEntityStore *harvestStore;
  void (**v8)(id, void *);
  void *v9;
  id v10;

  harvestStore = self->_harvestStore;
  v8 = (void (**)(id, void *))a5;
  -[SGSqlEntityStore sortedUnsubscriptionOpportunitiesForField:limit:](harvestStore, "sortedUnsubscriptionOpportunitiesForField:limit:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v9);

}

- (void)identifyComposeWarningsFromSubject:(id)a3 content:(id)a4 attributes:(id)a5 toRecipients:(id)a6 ccRecipients:(id)a7 bccRecipients:(id)a8 originalToRecipients:(id)a9 originalCcRecipients:(id)a10 attachments:(id)a11 withCompletion:(id)a12
{
  void (**v18)(id, void *);
  void *v19;
  void *v20;

  v18 = (void (**)(id, void *))a12;
  +[SGMIOmissionAnalyzer identifyComposeWarningsFromSubject:content:attributes:toRecipients:ccRecipients:bccRecipients:originalToRecipients:originalCcRecipients:attachments:](SGMIOmissionAnalyzer, "identifyComposeWarningsFromSubject:content:attributes:toRecipients:ccRecipients:bccRecipients:originalToRecipients:originalCcRecipients:attachments:", a3, a4, a5, a6, a7, a8, a9, a10, a11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, v19);

}

- (void)identifyFollowUpWarningFromSubject:(id)a3 body:(id)a4 date:(id)a5 withCompletion:(id)a6
{
  void (**v9)(id, void *);
  void *v10;
  id v11;

  v9 = (void (**)(id, void *))a6;
  +[SGMIFollowUpAnalyzer identifyFollowUpWarningFromSubject:body:date:](SGMIFollowUpAnalyzer, "identifyFollowUpWarningFromSubject:body:date:", a3, a4, a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v10);

}

- (void)reportUserEngagement:(BOOL)a3 forWarning:(id)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = (void (**)(id, void *))a5;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[SGMIFollowUpAnalyzer reportUserEngagement:forWarning:](SGMIFollowUpAnalyzer, "reportUserEngagement:forWarning:", v6, v8);
    v10 = 0;
  }
  else
  {
    +[SGMIOmissionAnalyzer reportUserEngagement:forWarning:](SGMIOmissionAnalyzer, "reportUserEngagement:forWarning:", v6, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9);

}

- (void)reportValue:(BOOL)a3 forFeatureSetting:(int64_t)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v6 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *))a5;
  sgMailIntelligenceLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v9;
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "Suggestions received value %@ for feature setting %ld. Processing of the information not implemented yet.", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", &unk_1E7E0BE58);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10);

}

- (void)reportMailIntelligenceFollowUpUserEngagement:(int64_t)a3 forStringFromFollowUpWarning:(id)a4 withCompletion:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, void *))a5;
  sgMailIntelligenceLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412547;
    v15 = v10;
    v16 = 2117;
    v17 = v7;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "Suggestions received feedback %@ for StringFromFollowUpWarning %{sensitive}@.", (uint8_t *)&v14, 0x16u);

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19868]), "initWithString:", v7);
  sgMailIntelligenceLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138740227;
    v15 = v7;
    v16 = 2117;
    v17 = v11;
    _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "FollowUpFeedback: for StringFromFollowUpWarning %{sensitive}@ for warning %{sensitive}@", (uint8_t *)&v14, 0x16u);
  }

  +[SGMIFollowUpAnalyzer reportUserEngagement:forWarning:](SGMIFollowUpAnalyzer, "reportUserEngagement:forWarning:", a3, v11);
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", &unk_1E7E0BE58);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v13);

}

- (BOOL)isSearchableItemPartOfReimport:(id)a3
{
  SGSqlEntityStore *harvestStore;
  id v4;
  void *v5;
  void *v6;

  harvestStore = self->_harvestStore;
  v4 = a3;
  objc_msgSend(v4, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(harvestStore) = -[SGSqlEntityStore reimportRequestsContainBundleIdentifier:uniqueIdentifier:](harvestStore, "reimportRequestsContainBundleIdentifier:uniqueIdentifier:", v5, v6);
  return (char)harvestStore;
}

- (BOOL)isSearchableItemPartOfReimportWithGetterBlock:(id)a3 bundleIdentifier:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  SGSqlEntityStore *harvestStore;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if (-[SGSqlEntityStore reimportRequestsContainBundleIdentifier:uniqueIdentifier:](self->_harvestStore, "reimportRequestsContainBundleIdentifier:uniqueIdentifier:", v7, 0))
  {
    harvestStore = self->_harvestStore;
    v6[2](v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SGSqlEntityStore reimportRequestsContainBundleIdentifier:uniqueIdentifier:](harvestStore, "reimportRequestsContainBundleIdentifier:uniqueIdentifier:", v7, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)enqueueSearchableItems:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  SGRequestContext *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  SGDManagerForCTS *ctsManager;
  void *v17;
  void *v18;
  unint64_t v19;
  void (**v20)(id, void *);
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    v19 = v8;
    v20 = v7;
    +[SGDPowerLog startIngestOfMessages:](SGDPowerLog, "startIngestOfMessages:", v8);
    v9 = -[SGRequestContext initWithServiceContext:concurrencyBehavior:backpressureHazard:]([SGRequestContext alloc], "initWithServiceContext:concurrencyBehavior:backpressureHazard:", self->_context, 1, 0);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v6;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1C3BD4F6C]();
          ctsManager = self->_ctsManager;
          +[SGPipeline fullPipeline](SGPipeline, "fullPipeline");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGDManagerForCTS processSearchableItem:pipeline:context:](ctsManager, "processSearchableItem:pipeline:context:", v14, v17, v9);

          objc_autoreleasePoolPop(v15);
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    -[SGSqlEntityStore incStatsCounterWithKey:byValue:](self->_harvestStore, "incStatsCounterWithKey:byValue:", CFSTR("enqueued_items"), (double)v19);
    +[SGDPowerLog endIngestOfMessages:](SGDPowerLog, "endIngestOfMessages:", v19);

    v7 = v20;
  }
  v18 = (void *)objc_opt_new();
  v7[2](v7, v18);

}

- (void)addSearchableItemMetadata:(id)a3 htmlData:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0D80FB0], "deserializeAttributes:andBody:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_msgSend(MEMORY[0x1E0D80F90], "searchableItemIsEligibleForHarvesting:eligibleExceptForAge:", v9, 0);
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v13;
        _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_INFO, "SGDSuggestManager: addSearchableItemMetadata: %@ is eligible for harvesting.", buf, 0xCu);

      }
      v19 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGDSuggestManager addSearchableItems:completion:](self, "addSearchableItems:completion:", v14, v8);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v18;
        _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: addSearchableItemMetadata: %@ is NOT eligible for harvesting.", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0D19988], "response");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v14);
    }
  }
  else
  {
    sgLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, "SGDSuggestManager: addSearchableItemMetadata: failed to deserialize item data.", buf, 2u);
    }

    v16 = (void *)MEMORY[0x1E0D19988];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], 12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "responseWithError:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v17);

  }
}

- (void)addSearchableItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SGDSuggestManager_addSearchableItems_completion___block_invoke;
  v8[3] = &unk_1E7DA8F60;
  v9 = v6;
  v7 = v6;
  -[SGDSuggestManager enqueueSearchableItems:completion:](self, "enqueueSearchableItems:completion:", a3, v8);

}

- (void)addInteractions:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  SGDSuggestManager *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (addInteractions_bundleId_completion___pasOnceToken148 != -1)
    dispatch_once(&addInteractions_bundleId_completion___pasOnceToken148, &__block_literal_global_622);
  v11 = (id)addInteractions_bundleId_completion___pasExprOnceResult;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SGDSuggestManager_addInteractions_bundleId_completion___block_invoke_2;
  block[3] = &unk_1E7DACA48;
  v17 = v9;
  v18 = v8;
  v20 = v11;
  v21 = v10;
  v19 = self;
  v12 = v11;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  dispatch_async(v12, block);

}

- (BOOL)_harvestPeopleFromInteractions:(id)a3 bundleId:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = a4;
  if ((objc_msgSend(v31, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v26 = v6;
    obj = v6;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (!v29)
      goto LABEL_32;
    v7 = 0;
    v28 = *(_QWORD *)v37;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(obj);
        v30 = v8;
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v8);
        sgLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v42 = (uint64_t)v11;
          v43 = 2112;
          v44 = v31;
          _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: _harvestPeopleFromInteractions: harvesting from %@ %@", buf, 0x16u);

        }
        +[SGParsedPersonFromInteraction parseInteraction:bundleId:](SGParsedPersonFromInteraction, "parseInteraction:bundleId:", v9, v31);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v33;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v33 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v16);
              objc_msgSend(v17, "grabNameIfNeededFromContactStore:", self->_contactStore);
              objc_msgSend(v17, "socialProfile");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                goto LABEL_15;
              objc_msgSend(v17, "displayName");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v19)
                goto LABEL_16;
              objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789@"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "displayName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "rangeOfCharacterFromSet:", v18);

              if (v21 == 0x7FFFFFFFFFFFFFFFLL)
              {
LABEL_15:

LABEL_16:
                objc_msgSend(v17, "pipelineEntity");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  -[SGSqlEntityStore writeEntity:](self->_harvestStore, "writeEntity:", v18);
                  ++v7;
                }
                goto LABEL_18;
              }
              sgLogHandle();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v42 = (uint64_t)v31;
                _os_log_impl(&dword_1C3607000, v22, OS_LOG_TYPE_INFO, "Interaction from %@ rejected. Display name is very likely a phone-number or email address.", buf, 0xCu);
              }

LABEL_18:
              ++v16;
            }
            while (v14 != v16);
            v23 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            v14 = v23;
          }
          while (v23);
        }
        if (v7 >= 1)
        {
          sgLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v42 = v7;
            _os_log_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: _harvestPeopleFromInteractions: harevsted %tu entities", buf, 0xCu);
          }

          -[SGSqlEntityStore syncNewBlobsIfChanged](self->_harvestStore, "syncNewBlobsIfChanged");
        }

        v8 = v30 + 1;
      }
      while (v30 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      if (!v29)
      {
LABEL_32:

        v6 = v26;
        break;
      }
    }
  }

  return 1;
}

- (void)_harvestReservationsFromInteractions:(id)a3 bundleId:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  _PASLock *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  _PASLock *v20;
  SGDSuggestManager *v21;
  void (**v22)(_QWORD);
  uint64_t *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  v14 = self->_bufferedInteractionsForBundleLock;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke;
  v24[3] = &unk_1E7DB0C48;
  v16 = v10;
  v25 = v16;
  v17 = v11;
  v26 = v17;
  v27 = &v28;
  -[_PASLock runWithLockAcquired:](v14, "runWithLockAcquired:", v24);
  if (v29[3])
  {
    v18 = (void *)MEMORY[0x1E0D81598];
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke_2;
    v19[3] = &unk_1E7DB74C8;
    v23 = &v28;
    v20 = v14;
    v21 = self;
    v22 = v13;
    objc_msgSend(v18, "runAsyncOnQueue:afterDelaySeconds:block:", v12, v19, 0.2);

  }
  else
  {
    v13[2](v13);
  }

  _Block_object_dispose(&v28, 8);
}

- (void)_processReservationInteractions:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SGDSuggestManager *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_processReservationInteractions_bundleId_completion___pasOnceToken158 != -1)
    dispatch_once(&_processReservationInteractions_bundleId_completion___pasOnceToken158, &__block_literal_global_634);
  v11 = (void *)_processReservationInteractions_bundleId_completion___pasExprOnceResult;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__SGDSuggestManager__processReservationInteractions_bundleId_completion___block_invoke_2;
  v16[3] = &unk_1E7DACA98;
  v17 = v8;
  v18 = v9;
  v19 = self;
  v20 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v11;
  dispatch_async(v15, v16);

}

- (void)registerForCoreSpotlightIndexing
{
  SGSqlEntityStore *harvestStore;
  id v3;

  harvestStore = self->_harvestStore;
  +[SGSpotlightContactsAdapter searchableIndex](SGSpotlightContactsAdapter, "searchableIndex");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIndexDelegate:", harvestStore);

}

- (void)spotlightReimportFromIdentifier:(id)a3 forPersonHandle:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7
{
  void (**v11)(id, id);
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v11 = (void (**)(id, id))a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[SGDSpotlightCommander sharedInstance](SGDSpotlightCommander, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "requestReimportFromIdentifier:forPersonHandle:startDate:endDate:", v15, v14, v13, v12);

  v17 = (id)objc_opt_new();
  v11[2](v11, v17);

}

- (void)purgeSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0D80F80], "shouldAdmitContentFromBundleIdentifier:", v8))
    -[SGSqlEntityStore markLostSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:](self->_harvestStore, "markLostSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:", v8, v9);
  +[SGDPluginManager sharedInstance](SGDPluginManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__SGDSuggestManager_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v15[3] = &unk_1E7DA8FE8;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v11, "purgeSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:completion:", v13, v14, v15);

}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SGSqlEntityStore deleteSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:](self->_harvestStore, "deleteSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:", v8, v9);
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D19A38]))
    -[SGDSuggestManager clearContactAggregator](self, "clearContactAggregator");
  -[SGDSuggestManager _pmlTraining](self, "_pmlTraining");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteSessionsWithIdentifiers:bundleID:", v9, v8);

  +[SGDPluginManager sharedInstance](SGDPluginManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke;
  v16[3] = &unk_1E7DA8FE8;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v12, "deleteSpotlightReferencesWithBundleIdentifier:uniqueIdentifiers:completion:", v14, v15, v16);

}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 domainIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(a4, "copy");
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v8;
    v35 = 2112;
    v36 = v10;
    _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: deleting spotlight references: %@ : %@", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0D80F80], "shouldAdmitContentFromBundleIdentifier:", v8))
  {
    -[SGSqlEntityStore deleteSpotlightReferencesWithBundleIdentifier:domainIdentifiers:](self->_harvestStore, "deleteSpotlightReferencesWithBundleIdentifier:domainIdentifiers:", v8, v10);
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D19A38]))
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v10, "allDomains");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v29;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v29 != v15)
              objc_enumerationMutation(v12);
            -[SGDSuggestManager clearContactAggregatorConversation:](self, "clearContactAggregatorConversation:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16++));
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v14);
      }

    }
  }
  objc_msgSend(v10, "allDomains");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGDSuggestManager _pmlTraining](self, "_pmlTraining");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deleteSessionsWithDomainIdentifiers:bundleID:", v18, v8);

  +[SGDPluginManager sharedInstance](SGDPluginManager, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __96__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke;
  v24[3] = &unk_1E7DA8FE8;
  v25 = v10;
  v26 = v8;
  v27 = v9;
  v21 = v9;
  v22 = v8;
  v23 = v10;
  objc_msgSend(v20, "deleteSpotlightReferencesWithBundleIdentifier:domainIdentifiers:completion:", v22, v18, v24);

}

- (void)deleteSpotlightReferencesWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke;
  v10[3] = &unk_1E7DB6F48;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  SGNotUserInitiated(CFSTR("deleteSpotlightReferencesWithBundleIdentifier"), 2, v10);

}

- (void)deleteInteractionsWithBundleId:(id)a3 completion:(id)a4
{
  SGSqlEntityStore *harvestStore;
  void (**v6)(id, id);
  id v7;

  harvestStore = self->_harvestStore;
  v6 = (void (**)(id, id))a4;
  -[SGSqlEntityStore deleteInteractionsWithBundleId:](harvestStore, "deleteInteractionsWithBundleId:", a3);
  v7 = (id)objc_opt_new();
  v6[2](v6, v7);

}

- (void)deleteInteractionsWithBundleId:(id)a3 identifiers:(id)a4 completion:(id)a5
{
  SGSqlEntityStore *harvestStore;
  void (**v8)(id, id);
  id v9;

  harvestStore = self->_harvestStore;
  v8 = (void (**)(id, id))a5;
  -[SGSqlEntityStore deleteInteractionsWithBundleId:identifiers:](harvestStore, "deleteInteractionsWithBundleId:identifiers:", a3, a4);
  v9 = (id)objc_opt_new();
  v8[2](v8, v9);

}

- (void)deleteInteractionsWithBundleId:(id)a3 groupIdentifiers:(id)a4 completion:(id)a5
{
  SGSqlEntityStore *harvestStore;
  void (**v8)(id, id);
  id v9;

  harvestStore = self->_harvestStore;
  v8 = (void (**)(id, id))a5;
  -[SGSqlEntityStore deleteInteractionsWithBundleId:groupIdentifiers:](harvestStore, "deleteInteractionsWithBundleId:groupIdentifiers:", a3, a4);
  v9 = (id)objc_opt_new();
  v8[2](v8, v9);

}

- (void)schemaOrgToEvents:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = (void (**)(id, void *))a4;
  v6 = a3;
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "SGDSuggestManager-schemaOrgToEvents", v11, 2u);
  }

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "eventsFromSchemaOrgItems:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v10);

}

- (void)isEventCandidateForURL:(id)a3 andTitle:(id)a4 containsSchemaOrg:(BOOL)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  _BOOL8 v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  sgPrivateLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138740227;
    v25 = v21;
    v26 = 2117;
    v27 = v11;
    _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "isEventCandidateForURL: %{sensitive}@ -title: %{sensitive}@", buf, 0x16u);

  }
  if (v10 && v11)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = (objc_msgSend(MEMORY[0x1E0D198F0], "allowAnyDomainForMarkup") & 1) != 0
       || +[SGDomainWhitelistChecker isStructuredEventCandidateForURL:title:](SGDomainWhitelistChecker, "isStructuredEventCandidateForURL:title:", v10, v11);
    objc_msgSend(v14, "numberWithInt:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && !a5)
    {
      sgEventsLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v20, OS_LOG_TYPE_INFO, "SGSuggestionsService isEventCandidateForURL: Based on whitelist check, URL is candidate", buf, 2u);
      }

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __86__SGDSuggestManager_isEventCandidateForURL_andTitle_containsSchemaOrg_withCompletion___block_invoke;
      v22[3] = &unk_1E7DA9038;
      v23 = v12;
      -[SGDSuggestManager isEventCandidateForURL:title:withCompletion:](self, "isEventCandidateForURL:title:withCompletion:", v10, v11, v22);
      v19 = v23;
      goto LABEL_20;
    }
  }
  else
  {
    sgEventsLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v16, OS_LOG_TYPE_ERROR, "SGSuggestionsService isEventCandidateForURL: method called with nil arguments", buf, 2u);
    }

    v17 = 0;
  }
  sgEventsLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEBUG, "SGSuggestionsService isEventCandidateForURL: eventCandidate is nil, domain appears not to be whitelisted.", buf, 2u);
  }

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v12 + 2))(v12, v19);
LABEL_20:

  }
}

- (void)isEventCandidateForURL:(id)a3 title:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__SGDSuggestManager_isEventCandidateForURL_title_withCompletion___block_invoke;
  v13[3] = &unk_1E7DB6F48;
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  SGNotUserInitiated(CFSTR("isEventCandidateForURL"), 2, v13);

}

- (void)suggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  SGDSuggestManager *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  sgEventsLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_INFO, "SGDSuggestManager suggestionsFromURL - Start processing webpage", buf, 2u);
  }

  sgPrivateLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "host");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v12, "length");
    *(_DWORD *)buf = 138740483;
    v27 = v18;
    v28 = 2117;
    v29 = v11;
    v30 = 2048;
    v31 = v19;
    _os_log_debug_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEBUG, "SGDSuggestManager-suggestionsFromURL: %{sensitive}@ -title: %{sensitive}@ -HTMLPayload length: %lu ", buf, 0x20u);

  }
  if ((objc_msgSend(MEMORY[0x1E0D80F80], "shouldAdmitContentFromBundleIdentifier:", *MEMORY[0x1E0D19A60]) & 1) != 0)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__SGDSuggestManager_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke;
    v20[3] = &unk_1E7DACA48;
    v21 = v11;
    v22 = v10;
    v23 = v12;
    v24 = self;
    v25 = v13;
    SGNotUserInitiated(CFSTR("suggestionsFromURL"), 2, v20);

    v16 = v21;
  }
  else
  {
    sgEventsLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "suggestionsFromURL ignoring item since Safari is disallowed by user's settings", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v13 + 2))(v13, v16);
  }

}

- (void)geocodeEnrichmentsInPipelineEntity:(id)a3 withCompletion:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  qos_class_t v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD block[4];
  id v27;
  _QWORD v28[4];
  id v29;
  void *v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = a4;
  v6 = *MEMORY[0x1E0D19A08];
  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  LODWORD(v6) = objc_msgSend(v7, "containsObject:", v6);

  if ((_DWORD)v6)
  {
    sgDeveloperLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – \"Show Siri Suggestions\" disabled in Calendar.", buf, 2u);
    }

  }
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "allowGeocode", v23) & 1) == 0)
  {
    sgDeveloperLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – you must acknowledge \"What's new in Calendar\" screen in the Calendar app.", buf, 2u);
    }

  }
  v10 = dispatch_group_create();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v25 = v5;
  objc_msgSend(v5, "enrichments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
        if (objc_msgSend(MEMORY[0x1E0D198F0], "allowGeocode"))
        {
          +[SGStorageEvent storageEventFromEntity:](SGStorageEvent, "storageEventFromEntity:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v10);
          v18 = (void *)MEMORY[0x1E0D19810];
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __71__SGDSuggestManager_geocodeEnrichmentsInPipelineEntity_withCompletion___block_invoke;
          v28[3] = &unk_1E7DB19E8;
          v29 = v17;
          v30 = v16;
          v31 = v10;
          v19 = v17;
          objc_msgSend(v18, "geocodeEvent:withCallback:", v19, v28);

        }
        else
        {
          objc_msgSend(v16, "setPendingGeocode:", 1);
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v13);
  }

  v20 = qos_class_self();
  dispatch_get_global_queue(v20, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SGDSuggestManager_geocodeEnrichmentsInPipelineEntity_withCompletion___block_invoke_2;
  block[3] = &unk_1E7DADAD8;
  v27 = v24;
  v22 = v24;
  dispatch_group_notify(v10, v21, block);

}

- (void)realtimeSuggestionsFromURL:(id)a3 title:(id)a4 HTMLPayload:(id)a5 extractionDate:(id)a6 withCompletion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  uint64_t v16;
  void *v17;
  SGPipelineEntity *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[16];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, void *))a7;
  v16 = *MEMORY[0x1E0D19A60];
  if ((objc_msgSend(MEMORY[0x1E0D80F80], "shouldAdmitContentFromBundleIdentifier:", *MEMORY[0x1E0D19A60]) & 1) != 0)
  {
    +[SGDuplicateKey duplicateKeyForWebPageFromSource:](SGDuplicateKey, "duplicateKeyForWebPageFromSource:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SGPipelineEntity initWithDuplicateKey:title:]([SGPipelineEntity alloc], "initWithDuplicateKey:title:", v17, v12);
    objc_msgSend(v14, "timeIntervalSince1970");
    -[SGPipelineEntity setCreationTimestamp:](v18, "setCreationTimestamp:");
    objc_msgSend(v14, "timeIntervalSince1970");
    -[SGPipelineEntity setLastModifiedTimestamp:](v18, "setLastModifiedTimestamp:");
    v30 = (void *)objc_opt_new();
    v31 = v13;
    v32 = v11;
    objc_msgSend(v30, "dissectURL:title:htmlPayload:entity:", v11, v12, v13, v18);
    +[SGSqlEntityStore sqlStoreInMemory](SGSqlEntityStore, "sqlStoreInMemory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[SGPipelineEntity enrichments](v18, "enrichments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v19, "writeEnrichment:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v22);
    }

    -[SGPipelineEntity enrichments](v18, "enrichments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v19;
    v26 = v19;
    sgMapAndFilter();
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v28);

    v13 = v31;
    v11 = v32;
  }
  else
  {
    sgLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v29, OS_LOG_TYPE_INFO, "realtimeSuggestionsFromURL ignoring item since Safari is disallowed by user's settings", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v17);
  }

}

- (void)keepDirty:(BOOL)a3
{
  _BOOL4 v3;
  SGXpcTransaction *dirtyTransaction;
  SGXpcTransaction *v6;

  v3 = a3;
  -[NSLock lock](self->_dirtyLock, "lock");
  dirtyTransaction = self->_dirtyTransaction;
  if (!v3)
  {
    v6 = 0;
    goto LABEL_5;
  }
  if (!dirtyTransaction)
  {
    +[SGXpcTransaction transactionWithName:](SGXpcTransaction, "transactionWithName:", "com.apple.suggestions.suggestManagerKeepDirty");
    v6 = (SGXpcTransaction *)objc_claimAutoreleasedReturnValue();
    dirtyTransaction = self->_dirtyTransaction;
LABEL_5:
    self->_dirtyTransaction = v6;

  }
  -[NSLock unlock](self->_dirtyLock, "unlock");
}

- (void)noopWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  (*((void (**)(id, id))a3 + 2))(v4, v5);

}

- (void)waitForEventWithIdentifier:(id)a3 toAppearInEventStoreWithLastModificationDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  unsigned int (**v14)(_QWORD, _QWORD);
  SGEKEventStoreProvider *ekStoreProvider;
  void (*callBlockWithEKEventStoreForReading)(void);
  SGEKEventStoreProvider *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD block[4];
  id v23;
  id v24;
  unsigned int (**v25)(_QWORD, _QWORD);
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_INFO, "SGDSuggestManager-waitForEventWithIdentifier: %@ -toAppearInEventStoreWithLastModificationDate: %@", buf, 0x16u);
  }

  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke;
  v27[3] = &unk_1E7DA9060;
  v13 = v9;
  v28 = v13;
  v14 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1C3BD5158](v27);
  ekStoreProvider = self->_ekStoreProvider;
  if (ekStoreProvider)
    ekStoreProvider = (SGEKEventStoreProvider *)ekStoreProvider->_newEKEventStoreGetter;
  callBlockWithEKEventStoreForReading = (void (*)(void))ekStoreProvider->_callBlockWithEKEventStoreForReading;
  v17 = ekStoreProvider;
  callBlockWithEKEventStoreForReading();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "eventWithIdentifier:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!((unsigned int (**)(_QWORD, void *))v14)[2](v14, v19))
  {
    dispatch_get_global_queue(9, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke_2;
    block[3] = &unk_1E7DA90B0;
    v23 = v18;
    v24 = v8;
    v25 = v14;
    v26 = v10;
    dispatch_async(v21, block);

    v20 = v23;
    goto LABEL_9;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", MEMORY[0x1E0C9AAB0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v20);
LABEL_9:

  }
}

- (SGMContactDetailUsedApp_)_appEnumForBundleId:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  SGMContactDetailUsedApp_ v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (NSString *)a3;
  if (!v4)
  {
    v4 = self->_clientName;
    if (!v4)
    {
LABEL_7:
      v7.var0 = *MEMORY[0x1E0D19BF0];
      goto LABEL_9;
    }
  }
  -[NSDictionary objectForKey:](self->_bundleIdToPET, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    -[NSString stringByReplacingOccurrencesOfString:withString:](v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v4) & 1) == 0)
    {
      v7.var0 = (unint64_t)-[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", v9);

      objc_autoreleasePoolPop(v8);
      goto LABEL_9;
    }

    objc_autoreleasePoolPop(v8);
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setBundleId:", v4);
    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trackScalarForMessage:", v10);

    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    v13 = *MEMORY[0x1E0D19D98];
    objc_msgSend(v10, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@.%@"), v13, v14);

    objc_msgSend(v10, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    goto LABEL_7;
  }
  v6 = v5;
  v7.var0 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_9:
  return v7;
}

- (void)logUnknownContactInformationShownCount:(unint64_t)a3 notShownCount:(unint64_t)a4 bundleId:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD v11[5];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__SGDSuggestManager_logUnknownContactInformationShownCount_notShownCount_bundleId___block_invoke;
  v11[3] = &unk_1E7DA90D8;
  v11[4] = self;
  v12 = v8;
  v9 = v8;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BD5158](v11);
  v10[2](v10, 1, a3);
  v10[2](v10, 0, a4);

}

- (void)logMetricAutocompleteResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  id v9;
  SGMContactDetailUsedApp_ v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = (a3 >> 3) & 1;
  v8 = a4 != 0;
  v9 = a6;
  v17 = (id)objc_opt_new();
  objc_msgSend(v17, "setWasSuggestedContact:", v8);
  objc_msgSend(v17, "setWasKnownContact:", v7);
  v10.var0 = (unint64_t)-[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", v9);

  objc_msgSend(v17, "setApp:", v10.var0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackScalarForMessage:", v17);

  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = *MEMORY[0x1E0D19D98];
  objc_msgSend(v17, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@.%@"), v13, v14);

  objc_msgSend(v17, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logMetricContactSearchResult:(int)a3 recordId:(id)a4 contactIdentifier:(id)a5 bundleId:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  id v9;
  SGMContactDetailUsedApp_ v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = (a3 >> 3) & 1;
  v8 = a4 != 0;
  v9 = a6;
  v17 = (id)objc_opt_new();
  objc_msgSend(v17, "setWasSuggestedContact:", v8);
  objc_msgSend(v17, "setWasKnownContact:", v7);
  v10.var0 = (unint64_t)-[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", v9);

  objc_msgSend(v17, "setApp:", v10.var0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackScalarForMessage:", v17);

  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13 = *MEMORY[0x1E0D19D98];
  objc_msgSend(v17, "key");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@.%@"), v13, v14);

  objc_msgSend(v17, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logMetricAutocompleteUserSelectedRecordId:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v7;
  SGMContactDetailUsedApp_ v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a5;
  v15 = (id)objc_opt_new();
  objc_msgSend(v15, "setWasSuggestedContact:", a3 != 0);
  objc_msgSend(v15, "setWasKnownContact:", *MEMORY[0x1E0D19CF8] != 0);
  v8.var0 = (unint64_t)-[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", v7);

  objc_msgSend(v15, "setApp:", v8.var0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trackScalarForMessage:", v15);

  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = *MEMORY[0x1E0D19D98];
  objc_msgSend(v15, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@.%@"), v11, v12);

  objc_msgSend(v15, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logMetricContactSearchResultSelected:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v7;
  SGMContactDetailUsedApp_ v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a5;
  v15 = (id)objc_opt_new();
  objc_msgSend(v15, "setWasSuggestedContact:", a3 != 0);
  objc_msgSend(v15, "setWasKnownContact:", 0);
  v8.var0 = (unint64_t)-[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", v7);

  objc_msgSend(v15, "setApp:", v8.var0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trackScalarForMessage:", v15);

  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = *MEMORY[0x1E0D19D98];
  objc_msgSend(v15, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@.%@"), v11, v12);

  objc_msgSend(v15, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logMetricSuggestedContactDetailUsed:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v6;
  SGMContactDetailUsedApp_ v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a5;
  v14 = (id)objc_opt_new();
  v7.var0 = (unint64_t)-[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", v6);

  objc_msgSend(v14, "setApp:", v7.var0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackScalarForMessage:", v14);

  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = *MEMORY[0x1E0D19D98];
  objc_msgSend(v14, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@.%@"), v10, v11);

  objc_msgSend(v14, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logMetricSuggestedContactDetailShown:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v6;
  SGMContactDetailUsedApp_ v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a5;
  v14 = (id)objc_opt_new();
  v7.var0 = (unint64_t)-[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", v6);

  objc_msgSend(v14, "setApp:", v7.var0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackScalarForMessage:", v14);

  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = *MEMORY[0x1E0D19D98];
  objc_msgSend(v14, "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@.%@"), v10, v11);

  objc_msgSend(v14, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logMetricContactCreated:(id)a3 contactIdentifier:(id)a4 bundleId:(id)a5
{
  id v7;
  SGMContactDetailUsedApp_ v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a5;
  v15 = (id)objc_opt_new();
  objc_msgSend(v15, "setWasSuggestedContact:", a3 != 0);
  v8.var0 = (unint64_t)-[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", v7);

  objc_msgSend(v15, "setApp:", v8.var0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trackScalarForMessage:", v15);

  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = *MEMORY[0x1E0D19D98];
  objc_msgSend(v15, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@.%@"), v11, v12);

  objc_msgSend(v15, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logMetricSearchResultsIncludedPureSuggestionWithBundleId:(id)a3
{
  id v4;
  SGMContactDetailUsedApp_ v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = (id)objc_opt_new();
  v5.var0 = (unint64_t)-[SGDSuggestManager _appEnumForBundleId:](self, "_appEnumForBundleId:", v4);

  objc_msgSend(v12, "setApp:", v5.var0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackScalarForMessage:", v12);

  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = *MEMORY[0x1E0D19D98];
  objc_msgSend(v12, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@.%@"), v8, v9);

  objc_msgSend(v12, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logEventInteractionForEventWithExternalIdentifier:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  SGDSuggestManager *v17;
  __CFString *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (logEventInteractionForEventWithExternalIdentifier_interface_actionType___pasOnceToken185 != -1)
    dispatch_once(&logEventInteractionForEventWithExternalIdentifier_interface_actionType___pasOnceToken185, &__block_literal_global_677);
  objc_msgSend((id)logEventInteractionForEventWithExternalIdentifier_interface_actionType___pasExprOnceResult, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3446;
  v24 = __Block_byref_object_dispose__3447;
  v25 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke_3;
  v15 = &unk_1E7DA9168;
  v19 = &v20;
  v10 = v8;
  v16 = v10;
  v17 = self;
  v18 = CFSTR("notFromSuggestions");
  objc_msgSend(v9, "runWithLockAcquired:", &v12);
  v11 = (void *)v21[5];
  if (v11 && (objc_msgSend(v11, "isEqualToString:", CFSTR("notFromSuggestions"), v12, v13, v14, v15) & 1) == 0)
    -[SGDSuggestManager logEventInteractionForEventWithUniqueKey:interface:actionType:](self, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v21[5], v6, v5);

  _Block_object_dispose(&v20, 8);
}

- (void)logEventInteractionForRealtimeEvent:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  SGDuplicateKey *v9;
  SGEmailKey *v10;
  SGDuplicateKey *v11;
  SGEmailKey *v12;
  uint64_t v13;
  SGDuplicateKey *v14;
  void *v15;
  id v16;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v16 = (id)objc_opt_new();
  LODWORD(self) = -[SGDSuggestManager clientIsMail](self, "clientIsMail");
  v9 = [SGDuplicateKey alloc];
  if ((_DWORD)self)
  {
    v10 = -[SGEmailKey initWithSource:messageId:]([SGEmailKey alloc], "initWithSource:messageId:", &stru_1E7DB83A8, &stru_1E7DB83A8);
    v11 = v9;
    v12 = v10;
    v13 = 5;
  }
  else
  {
    v10 = -[SGMessageKey initWithSource:uniqueIdentifier:]([SGTextMessageKey alloc], "initWithSource:uniqueIdentifier:", &stru_1E7DB83A8, &stru_1E7DB83A8);
    v11 = v9;
    v12 = v10;
    v13 = 13;
  }
  v14 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v11, "initWithEntityKey:entityType:parentKey:", v12, v13, 0);
  objc_msgSend(v16, "setDuplicateKey:", v14);

  +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logEventInteractionForRealtimeEvent:parentEntity:interface:actionType:", v8, v16, v6, v5);

}

- (void)logSuggestionInteractionForRecordId:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  -[SGSqlEntityStore loadEntityByRecordId:](self->_harvestStore, "loadEntityByRecordId:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "duplicateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "entityType");

  if (v9 == 22)
  {
    +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logReminderInteractionFromEntity:usingStore:interface:actionType:", v11, self->_harvestStore, v6, v5);

  }
  else if (v9 == 2)
  {
    -[SGDSuggestManager logEventInteractionForEntity:interface:actionType:](self, "logEventInteractionForEntity:interface:actionType:", v11, v6, v5);
  }

}

- (id)entityFromUniqueKey:(id)a3
{
  id v5;
  SGDuplicateKey *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("x-apple-eventkit:///SuggestedEventInfo/")))
  {
    sgLogHandle();
    v6 = (SGDuplicateKey *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      v7 = "Not logging event interaction for bogus uniqueKey: %@";
LABEL_13:
      _os_log_impl(&dword_1C3607000, &v6->super, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 4228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueKey"));

  }
  if (!+[SGDuplicateKey serializationPassesBasicScrutiny:](SGDuplicateKey, "serializationPassesBasicScrutiny:", v5))
  {
    sgLogHandle();
    v6 = (SGDuplicateKey *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      v7 = "Not logging event interaction for uniqueKey with bad serialization: %@";
      goto LABEL_13;
    }
LABEL_14:
    v10 = 0;
    goto LABEL_19;
  }
  v6 = -[SGDuplicateKey initWithSerialized:]([SGDuplicateKey alloc], "initWithSerialized:", v5);
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "Attempting to retrieve entity from harvestStore for uniqueKey = %@", buf, 0xCu);
  }

  -[SGSqlEntityStore loadEntityByKey:](self->_harvestStore, "loadEntityByKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "Couldn't find Entity with uniqueKey = %@", buf, 0xCu);
    }

  }
LABEL_19:

  return v10;
}

- (void)logEventInteractionForEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  char IsEvent;
  SGSqlEntityStore *harvestStore;
  void *v12;
  void *v13;
  void *v14;
  SGEKEventStoreProvider *ekStoreProvider;
  void (**callBlockWithEKEventStoreForReading)(id, _QWORD *);
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  __int16 v25;
  __int16 v26;
  uint8_t buf[16];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "duplicateKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entityType");
  IsEvent = SGEntityTypeIsEvent();

  if ((IsEvent & 1) != 0)
  {
    if (objc_msgSend(v8, "isNaturalLanguageEvent"))
    {
      harvestStore = self->_harvestStore;
      objc_msgSend(v8, "duplicateKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGSqlEntityStore loadEventByDuplicateKey:](harvestStore, "loadEventByDuplicateKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "convertToEvent:", self->_harvestStore);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ekStoreProvider = self->_ekStoreProvider;
      if (ekStoreProvider)
        callBlockWithEKEventStoreForReading = (void (**)(id, _QWORD *))ekStoreProvider->_callBlockWithEKEventStoreForReading;
      else
        callBlockWithEKEventStoreForReading = 0;
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __71__SGDSuggestManager_logEventInteractionForEntity_interface_actionType___block_invoke;
      v23 = &unk_1E7DA9190;
      v17 = v14;
      v24 = v17;
      v25 = v6;
      v26 = v5;
      callBlockWithEKEventStoreForReading[2](callBlockWithEKEventStoreForReading, &v20);
      if ((_DWORD)v6 == 2 && (_DWORD)v5 == 4)
        -[SGDSuggestManager bumptTTLForNLEvent:](self, "bumptTTLForNLEvent:", v17, v20, v21, v22, v23);

    }
    else
    {
      +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logEventInteractionForEntity:interface:actionType:", v8, v6, v5);

    }
  }
  else
  {
    sgLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, "Entity is not a pseudo event", buf, 2u);
    }

  }
}

- (void)logEventInteractionForEventWithUniqueKey:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  unsigned __int16 v13;
  unsigned __int16 v14;

  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__SGDSuggestManager_logEventInteractionForEventWithUniqueKey_interface_actionType___block_invoke;
  v11[3] = &unk_1E7DABCB0;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v9 = v8;
  v10 = (void *)MEMORY[0x1C3BD5158](v11);
  if (logEventInteractionForEventWithUniqueKey_interface_actionType___pasOnceToken193 != -1)
    dispatch_once(&logEventInteractionForEventWithUniqueKey_interface_actionType___pasOnceToken193, &__block_literal_global_689);
  objc_msgSend(MEMORY[0x1E0D81598], "runAsyncOnQueue:afterDelaySeconds:block:", logEventInteractionForEventWithUniqueKey_interface_actionType___pasExprOnceResult, v10, 5.0);

}

- (void)removeAllStoredPseudoContactsWithCompletion:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  id v5;

  v3 = (void (**)(id, void *))a3;
  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "removeAllStoredPseudoContacts");
  v4 = (void *)objc_opt_new();
  v3[2](v3, v4);

}

- (void)daemonExitWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "exiting due to daemonExitWithCompletion request", v5, 2u);
  }

  _exit(0);
}

- (void)sleepWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SGDSuggestManager_sleepWithCompletion___block_invoke;
  block[3] = &unk_1E7DADAD8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

- (void)pingWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_opt_new();
  (*((void (**)(id, id))a3 + 2))(v4, v5);

}

- (void)clearContactAggregator
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: Dropping all aggregated contacts", v4, 2u);
  }

  +[SGDSuggestManager contactAggregator](SGDSuggestManager, "contactAggregator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clear");

}

- (void)clearContactAggregatorConversation:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: Dropping aggregated contact for conversation: %@", (uint8_t *)&v6, 0xCu);
  }

  +[SGDSuggestManager contactAggregator](SGDSuggestManager, "contactAggregator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearContactsWithConversationIdentifier:", v3);

}

- (void)deleteCloudKitZoneWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[SGDCloudKitSync sharedInstance](SGDCloudKitSync, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SGDSuggestManager_deleteCloudKitZoneWithCompletion___block_invoke;
  v6[3] = &unk_1E7DA91D8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "deleteZoneWithCompletion:", v6);

}

- (void)powerStateWithCompletion:(id)a3
{
  void *v3;
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0D80FA8];
  v4 = (void (**)(id, void *))a3;
  objc_msgSend(v3, "defaultBudget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "throttlingState");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6);

}

- (id)_showInFormatStringWithLocalization:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SGDSuggestManager__showInFormatStringWithLocalization___block_invoke;
  block[3] = &unk_1E7DB56F0;
  v11 = v3;
  v4 = _showInFormatStringWithLocalization__once;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&_showInFormatStringWithLocalization__once, block);
    v7 = v11;
  }
  v8 = (id)_showInFormatStringWithLocalization__localizedString;

  return v8;
}

- (void)ipsosMessagesFromSearchableItems:(id)a3 withCompletion:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(id, void *);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21 = (void (**)(id, void *))a4;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 4426, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "SGDSuggestManager-ipsosMessagesFromSearchableItems", buf, 2u);
  }

  v9 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1C3BD4F6C]();
        +[SGThreadParser ipsosMessageWithSearchableItem:](SGThreadParser, "ipsosMessageWithSearchableItem:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0D19838], "messageWithIPMessage:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v18);

        }
        objc_autoreleasePoolPop(v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2](v21, v19);

}

- (void)titleSuggestionForMessage:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint8_t *v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t v30[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (objc_msgSend((id)objc_opt_class(), "titleSuggestionForMessageFeatureEnabled"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager-titleSuggestionForMessage", buf, 2u);
    }

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 4455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    }
    if (titleSuggestionForMessage_withCompletion___pasOnceToken200 != -1)
      dispatch_once(&titleSuggestionForMessage_withCompletion___pasOnceToken200, &__block_literal_global_703);
    v10 = (id)titleSuggestionForMessage_withCompletion___pasExprOnceResult;
    *(_QWORD *)buf = 0;
    v25 = buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__3446;
    v28 = __Block_byref_object_dispose__3447;
    v29 = 0;
    if (_serialQueueForTitleGeneration__pasOnceToken198 != -1)
      dispatch_once(&_serialQueueForTitleGeneration__pasOnceToken198, &__block_literal_global_1059);
    v11 = _serialQueueForTitleGeneration__pasExprOnceResult;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SGDSuggestManager_titleSuggestionForMessage_withCompletion___block_invoke_2;
    block[3] = &unk_1E7DB7878;
    v21 = v7;
    v23 = buf;
    v12 = v10;
    v22 = v12;
    dispatch_async_and_wait(v11, block);
    v13 = (void *)*((_QWORD *)v25 + 5);
    if (v13 && (objc_msgSend(v13, "isEqualToString:", &stru_1E7DB83A8) & 1) == 0)
    {
      sgLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = *((_QWORD *)v25 + 5);
        *(_DWORD *)v30 = 138477827;
        v31 = v18;
        _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: Returning title '%{private}@'", v30, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", *((_QWORD *)v25 + 5));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v15);
    }
    else
    {
      sgLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v30 = 0;
        _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: No Title generated from plugin", v30, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v15);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v16);

  }
}

- (void)recentURLsWithLimit:(unsigned int)a3 withCompletion:(id)a4
{
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 4563, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = a3;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-recentURLsWithLimit:%u called", buf, 8u);
  }

  -[SGSqlEntityStore recentURLsWithLimit:](self->_harvestStore, "recentURLsWithLimit:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v15 = v11;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-recentURLsWithLimit returning %tu URLs", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v12);

}

- (void)urlsFoundBetweenStartDate:(id)a3 endDate:(id)a4 excludingBundleIdentifiers:(id)a5 limit:(unsigned int)a6 withCompletion:(id)a7
{
  -[SGDSuggestManager urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:containingSubstring:flagFilter:limit:withCompletion:](self, "urlsFoundBetweenStartDate:endDate:excludingBundleIdentifiers:containingSubstring:flagFilter:limit:withCompletion:", a3, a4, a5, 0, 0, *(_QWORD *)&a6, a7);
}

- (void)registerURLFeedback:(unsigned __int8)a3 absoluteURL:(id)a4 withCompletion:(id)a5
{
  uint64_t v6;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  _BOOL4 v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 4610, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v17 = v6;
    v18 = 2048;
    v19 = objc_msgSend(v9, "length");
    _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-registerURLFeedback:%d url.length:%tu called", buf, 0x12u);
  }

  v12 = -[SGSqlEntityStore registerURLFeedback:absoluteURL:](self->_harvestStore, "registerURLFeedback:absoluteURL:", v6, v9);
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v17 = v12;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager-registerURLFeedback returning %d", buf, 8u);
  }

  v14 = (void *)objc_opt_new();
  v10[2](v10, v14);

}

- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  -[SGDSuggestManager suggestionsFromSearchableItem:options:processingType:withCompletion:](self, "suggestionsFromSearchableItem:options:processingType:withCompletion:", a3, a4, 2, a5);
}

- (void)suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 processingType:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  NSObject *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, void *))a6;
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("SGDSuggestManagerProcessingTypeUnspecified");
    if (!a5)
      v15 = CFSTR("SGDSuggestManagerProcessingTypeRealtime");
    if (a5 == 1)
      v15 = CFSTR("SGDSuggestManagerProcessingTypeForced");
    v16 = v15;
    v28 = 138413058;
    v29 = v13;
    v30 = 2112;
    v31 = v14;
    v32 = 2048;
    v33 = a4;
    v34 = 2112;
    v35 = v16;
    _os_log_impl(&dword_1C3607000, v12, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: suggestionsFromSearchableItem: %@ : %@ options: %tu, processingType: %@", (uint8_t *)&v28, 0x2Au);

  }
  if ((objc_msgSend(MEMORY[0x1E0D80FB0], "mailItemIsValid:", v10) & 1) != 0)
  {
    v17 = (void *)MEMORY[0x1E0D80F80];
    objc_msgSend(v10, "bundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v17, "shouldAdmitContentFromBundleIdentifier:", v18);

    if ((v17 & 1) != 0)
    {
      objc_msgSend(v10, "protection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        objc_msgSend(v10, "bundleID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HVDataSourceForBundleIdentifier();

        HVDataSourceFileProtection();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setProtection:", v21);

      }
      -[SGDSuggestManager _suggestionsFromSearchableItem:options:dissectIfNecessary:processingType:withCompletion:](self, "_suggestionsFromSearchableItem:options:dissectIfNecessary:processingType:withCompletion:", v10, a4, 1, a5, v11);
    }
    else
    {
      sgLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEFAULT, "suggestionsFromSearchableItem ignoring item since the bundle is disallowed by user's settings", (uint8_t *)&v28, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v27);

    }
  }
  else
  {
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28) = 0;
      _os_log_error_impl(&dword_1C3607000, v22, OS_LOG_TYPE_ERROR, "SGDSuggestManager: Mail: suggestionsFromSearchableItem was called with an invalid item", (uint8_t *)&v28, 2u);
    }

    v23 = (void *)MEMORY[0x1E0D19990];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], 6, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "responseWithError:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v25);

  }
}

- (void)harvestedSuggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2048;
    v22 = a4;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: harvestedSuggestionsFromSearchableItem: %@ : %@ options: %tu", (uint8_t *)&v17, 0x20u);

  }
  v13 = (void *)MEMORY[0x1E0D80F80];
  objc_msgSend(v8, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v13, "shouldAdmitContentFromBundleIdentifier:", v14);

  if ((v13 & 1) != 0)
  {
    -[SGDSuggestManager _suggestionsFromSearchableItem:options:dissectIfNecessary:withCompletion:](self, "_suggestionsFromSearchableItem:options:dissectIfNecessary:withCompletion:", v8, a4, 0, v9);
  }
  else
  {
    sgLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEFAULT, "harvestedSuggestionsFromSearchableItem ignoring item since the bundle is disallowed by user's settings", (uint8_t *)&v17, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v16);

  }
}

- (void)suggestionsFromEmailContent:(id)a3 headers:(id)a4 source:(id)a5 options:(unint64_t)a6 withCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  sgLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v14;
    v32 = 2048;
    v33 = a6;
    _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: suggestionsFromEmailContent: %@ options: %tu", buf, 0x16u);
  }

  -[SGDSuggestManager _emailContentCacheSalt](self, "_emailContentCacheSalt");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SGSha256Data(v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __87__SGDSuggestManager_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke;
  v28[3] = &unk_1E7DAE138;
  v29 = v15;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __87__SGDSuggestManager_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke_2;
  v24[3] = &unk_1E7DA9240;
  v25 = v13;
  v26 = v12;
  v27 = v14;
  v19 = v14;
  v20 = v12;
  v21 = v13;
  v22 = v15;
  LOWORD(v23) = 1;
  -[SGDSuggestManager realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:](self, "realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:", v18, a6, v28, 0, v24, 0, v23);

}

- (void)suggestionsFromSimpleMailMessage:(id)a3 headers:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a4;
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "spotlightBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spotlightUniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2048;
    v30 = a5;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: suggestionsFromSimpleMailMessage: %@ : %@ options: %tu", buf, 0x20u);

  }
  -[SGDSuggestManager _emailContentCacheSalt](self, "_emailContentCacheSalt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SGSha256Data(v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v10;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __85__SGDSuggestManager_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke;
  v23[3] = &unk_1E7DAE138;
  v24 = v11;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __85__SGDSuggestManager_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke_2;
  v21[3] = &unk_1E7DAE160;
  v18 = v10;
  v19 = v11;
  LOWORD(v20) = 1;
  -[SGDSuggestManager realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:](self, "realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:", v17, a5, v23, 0, v21, 0, v20);

}

- (void)dissectAttachmentsFromSearchableItem:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _BYTE buf[12];
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v11;
    v25 = 2048;
    v26 = a4;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: dissectAttachmentsFromSearchableItem: %@ options: %tu", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  v12 = objc_initWeak((id *)buf, self);
  -[SGDSuggestManager clearCachesFully:withCompletion:](self, "clearCachesFully:withCompletion:", 1, &__block_literal_global_728);

  objc_msgSend(v8, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __81__SGDSuggestManager_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke_729;
  v22[3] = &unk_1E7DAE138;
  v16 = v9;
  v23 = v16;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __81__SGDSuggestManager_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke_2;
  v20[3] = &unk_1E7DAE160;
  v17 = v8;
  v21 = v17;
  LOBYTE(v19) = 0;
  LOBYTE(v18) = 1;
  -[SGDSuggestManager realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:processingType:isTextMessage:](self, "realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:processingType:isTextMessage:", v14, a4, v22, 0, v20, v17, v18, 1, v19);

  objc_destroyWeak((id *)buf);
}

- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  SGSqlEntityStore *harvestStore;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  void (**v24)(id, void *);
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2048;
    v30 = a5;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Messages: harvestedSuggestionsFromMessage: %@ : %@ options: %tu", buf, 0x20u);

  }
  if ((objc_msgSend(MEMORY[0x1E0D80F80], "shouldAdmitContentFromBundleIdentifier:", v11) & 1) == 0)
  {
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEFAULT, "harvestedSuggestionsFromMessage ignoring item since the bundle is disallowed by user's settings", buf, 2u);
    }

    goto LABEL_11;
  }
  objc_msgSend(v10, "domainIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    harvestStore = self->_harvestStore;
    objc_msgSend(v10, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSqlEntityStore domainIdentifierForSpotlightReferenceForBundleIdentifier:uniqueIdentifier:](harvestStore, "domainIdentifierForSpotlightReferenceForBundleIdentifier:uniqueIdentifier:", v11, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDomainIdentifier:", v19);

  }
  objc_msgSend(v10, "domainIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v21);
    goto LABEL_12;
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __93__SGDSuggestManager_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke;
  v23[3] = &unk_1E7DAE138;
  v24 = v12;
  -[SGDSuggestManager _suggestionsFromMessage:options:dissectIfNecessary:completionDelivery:completionHandler:](self, "_suggestionsFromMessage:options:dissectIfNecessary:completionDelivery:completionHandler:", v10, a5, 0, 0, v23);
  v21 = v24;
LABEL_12:

}

- (void)harvestedSuggestionsFromMessage:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  SGSqlEntityStore *harvestStore;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  void (**v24)(id, void *);
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  sgLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2048;
    v30 = a5;
    _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Messages: harvestedSuggestionsFromMessage (deprecated): %@ : %@ options: %tu", buf, 0x20u);

  }
  if ((objc_msgSend(MEMORY[0x1E0D80F80], "shouldAdmitContentFromBundleIdentifier:", v11) & 1) == 0)
  {
    sgLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v22, OS_LOG_TYPE_DEFAULT, "harvestedSuggestionsFromMessage ignoring item since the bundle is disallowed by user's settings", buf, 2u);
    }

    goto LABEL_11;
  }
  objc_msgSend(v10, "domainIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    harvestStore = self->_harvestStore;
    objc_msgSend(v10, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSqlEntityStore domainIdentifierForSpotlightReferenceForBundleIdentifier:uniqueIdentifier:](harvestStore, "domainIdentifierForSpotlightReferenceForBundleIdentifier:uniqueIdentifier:", v11, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDomainIdentifier:", v19);

  }
  objc_msgSend(v10, "domainIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0D19998], "responseWith:also:also:", 0, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v21);
    goto LABEL_12;
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __96__SGDSuggestManager_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke;
  v23[3] = &unk_1E7DAE138;
  v24 = v12;
  -[SGDSuggestManager _suggestionsFromMessage:options:dissectIfNecessary:completionDelivery:completionHandler:](self, "_suggestionsFromMessage:options:dissectIfNecessary:completionDelivery:completionHandler:", v10, a5, 0, 0, v23);
  v21 = v24;
LABEL_12:

}

- (void)harvestedSuggestionsFromMessages:(id)a3 bundleIdentifier:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  _BOOL4 v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  uint64_t v29;
  SGDSuggestManager *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  uint64_t v41;
  NSObject *queue;
  void *v43;
  NSObject *v44;
  id v46;
  _QWORD block[4];
  NSObject *v48;
  id v49;
  id v50;
  SGDSuggestManager *v51;
  id v52;
  _BYTE *v53;
  _QWORD v54[4];
  NSObject *v55;
  void *v56;
  NSObject *v57;
  id v58;
  id v59;
  NSObject *v60;
  _BYTE *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  void *v66;
  uint8_t v67[128];
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v39 = a4;
  v40 = a6;
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = objc_msgSend(v46, "count");
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a5;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Messages: harvestedSuggestionsFromMessages: %tu messages (options %tu)", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0D80F80], "shouldAdmitContentFromBundleIdentifier:", v39) & 1) != 0)
  {
    if (objc_msgSend(v46, "count"))
    {
      v44 = objc_opt_new();
      v43 = (void *)objc_opt_new();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v69 = __Block_byref_object_copy__3446;
      v70 = __Block_byref_object_dispose__3447;
      v71 = 0;
      NSStringFromSelector(a2);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      queue = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);

      v12 = dispatch_group_create();
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      objc_msgSend(v46, "reverseObjectEnumerator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v63;
        v41 = *MEMORY[0x1E0CB2AC0];
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v63 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            objc_msgSend(v17, "protection");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18 == 0;

            if (v19)
              objc_msgSend(v17, "setProtection:", v41);
            dispatch_group_enter(v12);
            objc_msgSend(v17, "attributeSet");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "contentCreationDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21
              && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v22, "timeIntervalSinceDate:", v21),
                  v24 = v23 < 10.0,
                  v22,
                  !v24))
            {
              v29 = 0;
            }
            else
            {
              objc_msgSend(v17, "uniqueIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v25 == 0;

              if (!v26)
              {
                objc_msgSend(MEMORY[0x1E0D19978], "sharedInstance");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "uniqueIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "waitForUniqueIdentifierToProcess:", v28);

              }
              v29 = 1;
            }
            v54[0] = MEMORY[0x1E0C809B0];
            v54[1] = 3221225472;
            v54[2] = __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke;
            v54[3] = &unk_1E7DA92C8;
            v55 = queue;
            v56 = v17;
            v57 = v44;
            v58 = v43;
            v59 = v46;
            v61 = buf;
            v60 = v12;
            -[SGDSuggestManager _suggestionsFromMessage:options:dissectIfNecessary:completionDelivery:completionHandler:](self, "_suggestionsFromMessage:options:dissectIfNecessary:completionDelivery:completionHandler:", v17, a5, v29, 0, v54);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        }
        while (v14);
      }

      v30 = self;
      if ((unint64_t)-[NSObject count](v44, "count") < 2)
      {
        v32 = v44;
      }
      else
      {
        -[NSObject lastObject](v44, "lastObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
        v32 = objc_claimAutoreleasedReturnValue();

        v30 = self;
      }
      -[SGDSuggestManager filterRealtimeEvents:](v30, "filterRealtimeEvents:", v43);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_737;
      block[3] = &unk_1E7DA92F0;
      v48 = v32;
      v49 = v36;
      v52 = v40;
      v53 = buf;
      v50 = v46;
      v51 = v30;
      v37 = v36;
      v38 = v32;
      dispatch_group_notify(v12, queue, block);

      _Block_object_dispose(buf, 8);
      v34 = v44;
    }
    else
    {
      if (v40)
      {
        objc_msgSend(MEMORY[0x1E0D19998], "responseWith:also:also:", 0, 0, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v40 + 2))(v40, v35);

      }
      sgLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v34, OS_LOG_TYPE_INFO, "harvestedSuggestionsFromMessages called with no inputs", buf, 2u);
      }
    }
    goto LABEL_32;
  }
  sgLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v33, OS_LOG_TYPE_DEFAULT, "harvestedSuggestionsFromMessages ignoring item since the bundle is disallowed by user's settings", buf, 2u);
  }

  if (v40)
  {
    objc_msgSend(MEMORY[0x1E0D19998], "responseWith:also:also:", 0, 0, 0);
    v34 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, NSObject *))v40 + 2))(v40, v34);
LABEL_32:

  }
}

- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SGDSuggestManager_suggestionsFromMessage_options_completionHandler___block_invoke;
  v10[3] = &unk_1E7DAE1A8;
  v11 = v8;
  v9 = v8;
  -[SGDSuggestManager suggestionsFromMessage:options:completionDelivery:completionHandler:fullCompletionHandler:](self, "suggestionsFromMessage:options:completionDelivery:completionHandler:fullCompletionHandler:", a3, a4, 0, v10, 0);

}

- (id)filterRealtimeEvents:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v24 = (id)objc_opt_new();
    v4 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v29;
      v25 = v4;
      v26 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v9, "event");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "opaqueKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (!v12)
              goto LABEL_10;
            objc_msgSend(v12, "event");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "creationDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "event");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "creationDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v15, "compare:", v17);

            v7 = v26;
            v19 = v18 == 1;
            v4 = v25;
            if (!v19)
LABEL_10:
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v11);

          }
          else
          {
            objc_msgSend(v24, "addObject:", v9);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v6);
    }

    v20 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v4, "allValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v24, "addObjectsFromArray:", v21);

    objc_msgSend(v24, "sortUsingComparator:", &__block_literal_global_741);
    v3 = v23;
  }
  else
  {
    v24 = v3;
  }

  return v24;
}

- (void)_sendChatChangedNotificationWithDomainIdentifier:(id)a3
{
  void *v3;
  const __CFString *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v6;

  v6 = a3;
  v3 = (void *)MEMORY[0x1C3BD4F6C]();
  v4 = (const __CFString *)objc_msgSend(CFSTR("com.apple.suggestions.internal.messages.processed."), "stringByAppendingString:", v6);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, v4, 0, 0);
  objc_autoreleasePoolPop(v3);

}

- (void)foundInStringForRecordId:(id)a3 style:(unsigned __int8)a4 withCompletion:(id)a5
{
  int v6;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  CNContactStore *contactStore;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  int v44;
  void *v45;
  id v46;
  void *v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v6 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *))a5;
  if (v10)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 5009, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 5010, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

LABEL_3:
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v49 = v9;
    v50 = 1024;
    LODWORD(v51) = v6;
    _os_log_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEFAULT, "SGSuggestManager-foundInStringForRecordId:%@ style:%u called", buf, 0x12u);
  }

  -[SGSqlEntityStore loadEntityByRecordId:](self->_harvestStore, "loadEntityByRecordId:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "loadOrigin:", self->_harvestStore);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedApplicationName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], -1, &unk_1E7E114A0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D19990], "responseWithError:", v32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v29);
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v13, "duplicateKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "entityType");

    if (v17 == 22)
    {
      +[SGStorageReminder storageReminderFromEntity:origin:](SGStorageReminder, "storageReminderFromEntity:origin:", v13, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      sgRemindersLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "loggingIdentifier");
        v44 = v6;
        v20 = v18;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "loggingIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v21;
        v50 = 2114;
        v51 = v22;
        _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "Entity %{public}@ -> SGStorageReminder %{public}@", buf, 0x16u);

        v18 = v20;
        v6 = v44;
      }

      objc_msgSend(v18, "contactIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      if (v24)
      {
        v45 = v18;
        objc_msgSend(v18, "contactIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        contactStore = self->_contactStore;
        v46 = 0;
        +[SGContactsInterface unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedContactWithIdentifier:keysToFetch:usingContactStore:error:", v25, v27, contactStore, &v46);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v46;

        if (v29)
        {
          objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v29, 1000);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v31 = v43;
            if (v6 == 1)
            {
              +[SGFoundInAppsStrings foundInAppsStringCompactVersionWithContactName:](SGFoundInAppsStrings, "foundInAppsStringCompactVersionWithContactName:", v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = v33;
              v35 = v45;
              v36 = 24;
            }
            else
            {
              if (v6)
              {
                v32 = 0;
LABEL_37:

                if (v32)
                  goto LABEL_27;
                goto LABEL_26;
              }
              +[SGFoundInAppsStrings foundInAppsStringLongVersionForAppName:contactName:](SGFoundInAppsStrings, "foundInAppsStringLongVersionForAppName:contactName:", v15, v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = v33;
              v35 = v45;
              v36 = 23;
            }
            -[NSObject logReminderInteractionFromReminder:interface:actionType:](v33, "logReminderInteractionFromReminder:interface:actionType:", v35, v36, 4);
          }
          else
          {
            sgLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            v31 = v43;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1C3607000, v34, OS_LOG_TYPE_ERROR, "SGDSuggestManager-foundInStringForRecordId: unable to format contact name.", buf, 2u);
            }
            v32 = 0;
          }

          goto LABEL_37;
        }
        sgLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        v38 = v43;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v43;
          _os_log_error_impl(&dword_1C3607000, v39, OS_LOG_TYPE_ERROR, "SGDSuggestManager-foundInStringForRecordId: error when fetching contact: %@", buf, 0xCu);
        }

        v18 = v45;
      }
      else
      {
        +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logReminderInteractionFromReminder:interface:actionType:", v18, 23, 4);
      }

    }
    v29 = 0;
LABEL_26:
    +[SGFoundInAppsStrings foundInAppsStringWithoutContactForAppName:](SGFoundInAppsStrings, "foundInAppsStringWithoutContactForAppName:", v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v32);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v40);

    goto LABEL_28;
  }
  sgLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v9;
    _os_log_error_impl(&dword_1C3607000, v37, OS_LOG_TYPE_ERROR, "No entity found for recordId: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], 4, &unk_1E7E11478);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19990], "responseWithError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v15);
LABEL_29:

}

- (void)registerForProactiveHarvesting
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D80F70], "defaultCoordinator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerMailConsumer:levelOfService:", self, 2);
  objc_msgSend(v3, "registerInteractionConsumer:levelOfService:", self, 3);

}

- (id)consumeMailContentWithContext:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SGSimpleMailMessage *v11;
  void *v12;
  void *v13;
  SGSimpleMailMessage *v14;
  SGRequestContext *v15;
  void *v16;
  SGRequestContext *v17;
  SGHarvestQueueMetrics *v18;
  SGHarvestQueueMetrics *v19;
  SGDManagerForCTS *ctsManager;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412547;
    v28 = v8;
    v29 = 2117;
    v30 = v9;
    _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: consumeMailContentWithContext %@: %{sensitive}@", buf, 0x16u);

  }
  objc_msgSend(v5, "htmlParser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager.m"), 5124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("htmlParserNonNull != nil"));

  }
  v11 = [SGSimpleMailMessage alloc];
  objc_msgSend(v5, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentProtection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SGSimpleMailMessage initWithMailContentEvent:contentProtection:htmlParser:](v11, "initWithMailContentEvent:contentProtection:htmlParser:", v12, v13, v10);

  v15 = [SGRequestContext alloc];
  -[SGDManagerForCTS serviceContext](self->_ctsManager, "serviceContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SGRequestContext initWithServiceContext:concurrencyBehavior:backpressureHazard:](v15, "initWithServiceContext:concurrencyBehavior:backpressureHazard:", v16, 1, 0);

  v18 = [SGHarvestQueueMetrics alloc];
  v19 = -[SGHarvestQueueMetrics initWithBundleIdentifier:highPriority:harvestedOnBattery:receivedOnBattery:harvestSource:](v18, "initWithBundleIdentifier:highPriority:harvestedOnBattery:receivedOnBattery:harvestSource:", *MEMORY[0x1E0D80FD0], 0, 0, 0, 8);
  ctsManager = self->_ctsManager;
  objc_msgSend(v5, "content");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "headers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPipeline fullPipeline](SGPipeline, "fullPipeline");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDManagerForCTS processMailMessage:headers:pipeline:context:harvestMetrics:](ctsManager, "processMailMessage:headers:pipeline:context:harvestMetrics:", v14, v22, v23, v17, v19);

  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  SGTextMessage *v9;
  void *v10;
  void *v11;
  SGTextMessage *v12;
  SGRequestContext *v13;
  void *v14;
  SGRequestContext *v15;
  SGHarvestQueueMetrics *v16;
  SGHarvestQueueMetrics *v17;
  SGDManagerForCTS *ctsManager;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412547;
    v23 = v7;
    v24 = 2117;
    v25 = v8;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: consumeMessagesContentWithContext %@: %{sensitive}@", (uint8_t *)&v22, 0x16u);

  }
  v9 = [SGTextMessage alloc];
  objc_msgSend(v4, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentProtection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SGTextMessage initWithMessagesContentEvent:contentProtection:](v9, "initWithMessagesContentEvent:contentProtection:", v10, v11);

  v13 = [SGRequestContext alloc];
  -[SGDManagerForCTS serviceContext](self->_ctsManager, "serviceContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SGRequestContext initWithServiceContext:concurrencyBehavior:backpressureHazard:](v13, "initWithServiceContext:concurrencyBehavior:backpressureHazard:", v14, 1, 0);

  v16 = [SGHarvestQueueMetrics alloc];
  v17 = -[SGHarvestQueueMetrics initWithBundleIdentifier:highPriority:harvestedOnBattery:receivedOnBattery:harvestSource:](v16, "initWithBundleIdentifier:highPriority:harvestedOnBattery:receivedOnBattery:harvestSource:", *MEMORY[0x1E0D80FE0], 0, 0, 0, 8);
  ctsManager = self->_ctsManager;
  +[SGPipeline fullPipeline](SGPipeline, "fullPipeline");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDManagerForCTS processTextMessage:pipeline:context:harvestMetrics:](ctsManager, "processTextMessage:pipeline:context:harvestMetrics:", v12, v19, v15, v17);

  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)consumeInteractionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: consumeInteractionWithContext: %@", buf, 0xCu);
  }

  v17 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSuggestManager _harvestPeopleFromInteractions:bundleId:](self, "_harvestPeopleFromInteractions:bundleId:", v10, v8);

  if (consumeInteractionWithContext___pasOnceToken243 != -1)
    dispatch_once(&consumeInteractionWithContext___pasOnceToken243, &__block_literal_global_767);
  v16 = v6;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = (id)consumeInteractionWithContext___pasExprOnceResult;
  objc_msgSend(v11, "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDSuggestManager _harvestReservationsFromInteractions:bundleId:queue:completion:](self, "_harvestReservationsFromInteractions:bundleId:queue:completion:", v13, v8, v12, &__block_literal_global_769, v16);

  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (SGServiceContext)context
{
  return self->_context;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bufferedInteractionsForBundleLock, 0);
  objc_storeStrong((id *)&self->_recentlyHarvestedDetailLock, 0);
  objc_storeStrong((id *)&self->_purgeDeletionDropBox, 0);
  objc_storeStrong((id *)&self->_pet2Tracker, 0);
  objc_storeStrong((id *)&self->_lastSuggestionsFromMessageLock, 0);
  objc_storeStrong((id *)&self->_lastSuggestionsFromMessageResponse, 0);
  objc_storeStrong((id *)&self->_lastSuggestionsFromMessageRequest, 0);
  objc_storeStrong((id *)&self->_dirtyTransaction, 0);
  objc_storeStrong((id *)&self->_dirtyLock, 0);
  objc_storeStrong((id *)&self->_bundleIdToPET, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_ekStoreProvider, 0);
  objc_storeStrong((id *)&self->_ctsManager, 0);
  objc_storeStrong((id *)&self->_messageHarvestQueue, 0);
  objc_storeStrong((id *)&self->_assetUpdateToken, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_harvestStore, 0);
}

void __51__SGDSuggestManager_consumeInteractionWithContext___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "SGSuggestManager-consumeInteractionWithContext", 25);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)consumeInteractionWithContext___pasExprOnceResult;
  consumeInteractionWithContext___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteSpotlightReferencesWithBundleIdentifier:completion:", a2, &__block_literal_global_758);
}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_6;
  v10[3] = &unk_1E7DA9378;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "updateBox:", v10);

}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_8;
  v10[3] = &unk_1E7DA9378;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "updateBox:", v10);

}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_8(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v5 = (void *)*MEMORY[0x1E0D19A28];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  v8 = objc_msgSend(v5, "isEqualToString:", v6);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  if (v8)
    objc_msgSend(v7, "addPurge:uniqueIds:", v9, v10);
  else
    objc_msgSend(v7, "addDeletion:uniqueIds:", v9, v10);
  v11 = objc_msgSend(v7, "shouldRunHandlerImmediately");

  *a3 = v11;
}

void __65__SGDSuggestManager_deleteDataDerivedFromContentMatchingRequest___block_invoke_6(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v6, "addDeletion:uniqueIds:", v4, v5);
  LOBYTE(v4) = objc_msgSend(v6, "shouldRunHandlerImmediately");

  *a3 = v4;
}

uint64_t __42__SGDSuggestManager_filterRealtimeEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

void __70__SGDSuggestManager_suggestionsFromMessage_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    objc_msgSend(MEMORY[0x1E0D19998], "responseWithError:", a2);
  else
    objc_msgSend(MEMORY[0x1E0D19998], "responseWith:also:also:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

void __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_2;
  block[3] = &unk_1E7DAE890;
  v5 = *(NSObject **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 80);
  v14 = v6;
  v15 = v7;
  v8 = v3;
  dispatch_sync(v5, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));

}

void __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_737(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v2 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0D19998], "responseWith:also:also:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  objc_msgSend(*(id *)(a1 + 48), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D81598];
  dispatch_get_global_queue(9, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_2_738;
  v9[3] = &unk_1E7DB6A30;
  v9[4] = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "runAsyncOnQueue:afterDelaySeconds:block:", v7, v9, 0.1);

}

uint64_t __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_2_738(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendChatChangedNotificationWithDomainIdentifier:", *(_QWORD *)(a1 + 40));
}

void __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "contacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = +[SGTextMessage isSent:](SGTextMessage, "isSent:", *(_QWORD *)(a1 + 40));
    v4 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_735);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v7);

    }
    else
    {
      objc_msgSend(v4, "addObjectsFromArray:", v5);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "events");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = +[SGTextMessage isSent:](SGTextMessage, "isSent:", *(_QWORD *)(a1 + 40));

    if (!v10)
    {
      v11 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "events");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObjectsFromArray:", v12);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "reminders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "reminders");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15 == 1)
    {
      +[SGReminderTrialClientWrapper sharedInstance](SGReminderTrialClientWrapper, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "messagesBannerLimit");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

      if (objc_msgSend(*(id *)(a1 + 64), "indexOfObject:", *(_QWORD *)(a1 + 40)) < v18)
      {
        sgRemindersLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "reminders");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "reminder");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "recordId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138412290;
          v32 = v30;
          _os_log_debug_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: harvestedSuggestionsFromMessages: Suggesting reminder with recordId: %@", (uint8_t *)&v31, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 32), "reminders");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

        +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "reminders");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "reminder");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logReminderInteractionFromReminder:interface:actionType:", v26, 5, 4);

      }
    }
  }
}

BOOL __97__SGDSuggestManager_harvestedSuggestionsFromMessages_bundleIdentifier_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "birthday");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

void __96__SGDSuggestManager_harvestedSuggestionsFromMessage_bundleIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D19998];
    v4 = a2;
    objc_msgSend(v4, "contacts");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "events");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reminders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "responseWith:also:also:", v8, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v7);

  }
}

void __93__SGDSuggestManager_harvestedSuggestionsFromMessage_bundleIdentifier_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (objc_class *)MEMORY[0x1E0D19960];
    v4 = a2;
    v5 = [v3 alloc];
    objc_msgSend(v4, "contacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "events");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reminders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "walletOrders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "walletPasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (id)objc_msgSend(v5, "initWithContacts:events:reminders:walletOrders:walletPasses:", v6, v7, v8, v9, v10);
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
}

void __81__SGDSuggestManager_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke_729(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v11 = v3;
    objc_msgSend(v3, "walletOrders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("com.apple.coresuggestions.SGDissectOrderSuggestion"), 0);

    }
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0D19990];
    objc_msgSend(v11, "combinedSuggestions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "responseWith:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v10);

    v3 = v11;
  }

}

SGSimpleMailMessage *__81__SGDSuggestManager_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke_2(uint64_t a1)
{
  return +[SGMessage messageWithSearchableItem:](SGSimpleMailMessage, "messageWithSearchableItem:", *(_QWORD *)(a1 + 32));
}

void __81__SGDSuggestManager_dissectAttachmentsFromSearchableItem_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGDSuggestManager: Failed to clear caches in dissectAttachmentsFromSearchableItem, error: %@", (uint8_t *)&v6, 0xCu);

    }
  }

}

void __85__SGDSuggestManager_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D19990];
    objc_msgSend(a2, "combinedSuggestions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "responseWith:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

id __85__SGDSuggestManager_suggestionsFromSimpleMailMessage_headers_options_withCompletion___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __87__SGDSuggestManager_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D19990];
    objc_msgSend(a2, "combinedSuggestions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "responseWith:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

id __87__SGDSuggestManager_suggestionsFromEmailContent_headers_source_options_withCompletion___block_invoke_2(_QWORD *a1)
{
  return +[SGSimpleMailMessage parseRfc822Headers:htmlContent:source:](SGSimpleMailMessage, "parseRfc822Headers:htmlContent:source:", a1[4], a1[5], a1[6]);
}

void __62__SGDSuggestManager_titleSuggestionForMessage_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  dispatch_semaphore_t v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint8_t v43[16];
  _QWORD v44[4];
  NSObject *v45;
  uint8_t *v46;
  uint8_t buf[8];
  uint8_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[5];
  _QWORD v54[7];

  v54[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messageUnits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messageUnits");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (id *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 32), "messageUnits");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "subject");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = (__CFString *)v8;
      else
        v10 = &stru_1E7DB83A8;
      v11 = v10;

      objc_msgSend(*v5, "type");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (__CFString *)v12;
      else
        v14 = &stru_1E7DB83A8;
      v15 = v14;

      objc_msgSend(*v5, "messageId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v17 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[__CFString sg_md5Hash](v11, "sg_md5Hash");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject sg_md5Hash](v7, "sg_md5Hash");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@-%@-%@"), v15, v18, v19);

      }
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v16);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(_QWORD *)(v21 + 40) = v20;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        goto LABEL_34;
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: No title found in cache", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isLowPowerModeEnabled");

      if (v25)
      {
        sgLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: Skipping running Title Generation model since Low Power Mode is Active", buf, 2u);
        }
        goto LABEL_33;
      }
      +[SGAsset localeAsset](SGAsset, "localeAsset");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "filesystemPathForAssetDataRelativePath:", CFSTR("MLTitleGenerationModel.assets"));
      v26 = objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        sgLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v28, OS_LOG_TYPE_ERROR, "SGDSuggestManager: Assets not found for title suggestion", buf, 2u);
        }
        goto LABEL_32;
      }
      v28 = (id)*MEMORY[0x1E0D19DB0];
      v29 = *MEMORY[0x1E0D19DB8];
      v53[0] = CFSTR("TaskName");
      v53[1] = CFSTR("InputMessage");
      v54[0] = v29;
      v54[1] = v7;
      v53[2] = CFSTR("InputMessageSubject");
      v53[3] = CFSTR("InputMessageType");
      v54[2] = v11;
      v54[3] = v15;
      v53[4] = CFSTR("AssetFolderPath");
      v54[4] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 5);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46588]), "initWithParametersDict:", v42);
      *(_QWORD *)buf = 0;
      v48 = buf;
      v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__3446;
      v51 = __Block_byref_object_dispose__3447;
      v52 = 0;
      v30 = dispatch_semaphore_create(0);
      v31 = (void *)MEMORY[0x1E0D46580];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __62__SGDSuggestManager_titleSuggestionForMessage_withCompletion___block_invoke_722;
      v44[3] = &unk_1E7DAE598;
      v46 = buf;
      v32 = v30;
      v45 = v32;
      objc_msgSend(v31, "performTask:forPluginID:completionHandler:", v41, v28, v44);
      if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v32, 2.0) == 1)
      {
        sgLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v43 = 0;
          _os_log_error_impl(&dword_1C3607000, v33, OS_LOG_TYPE_ERROR, "SGDSuggestManager: MLRuntime Plugin task timeout", v43, 2u);
        }
      }
      else
      {
        v34 = (void *)*((_QWORD *)v48 + 5);
        if (!v34)
          goto LABEL_29;
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("title"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35 == 0;

        if (v36)
          goto LABEL_29;
        objc_msgSend(*((id *)v48 + 5), "objectForKeyedSubscript:", CFSTR("title"));
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v33 = *(NSObject **)(v38 + 40);
        *(_QWORD *)(v38 + 40) = v37;
      }

LABEL_29:
      v39 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v40 = *(_QWORD *)(v39 + 40);
      if (!v40)
      {
        *(_QWORD *)(v39 + 40) = &stru_1E7DB83A8;
        v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v40, v16);

      _Block_object_dispose(buf, 8);
LABEL_32:

LABEL_33:
LABEL_34:

      goto LABEL_35;
    }
  }
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "SGDSuggestManager: Found empty input message for title suggestion", buf, 2u);
  }
LABEL_35:

}

void __62__SGDSuggestManager_titleSuggestionForMessage_withCompletion___block_invoke_722(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "JSONResult");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGDSuggestManager: MLRuntime Plugin Task failed with error: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __62__SGDSuggestManager_titleSuggestionForMessage_withCompletion___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 5);
  v2 = (void *)titleSuggestionForMessage_withCompletion___pasExprOnceResult;
  titleSuggestionForMessage_withCompletion___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __57__SGDSuggestManager__showInFormatStringWithLocalization___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[SGFoundInAppsStrings localizedStringForKey:preferredLocalization:](SGFoundInAppsStrings, "localizedStringForKey:preferredLocalization:", CFSTR("Show in %@"), *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_showInFormatStringWithLocalization__localizedString;
  _showInFormatStringWithLocalization__localizedString = v1;

  if (!_showInFormatStringWithLocalization__localizedString)
  {
    +[SGFoundInAppsStrings resourceBundle](SGFoundInAppsStrings, "resourceBundle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Show in %@"), &stru_1E7DB83A8, *MEMORY[0x1E0D19DF0]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_showInFormatStringWithLocalization__localizedString;
    _showInFormatStringWithLocalization__localizedString = v3;

  }
}

void __39__SGDSuggestManager__maybeFormatString__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[SGFoundInAppsStrings localizedStringForKey:preferredLocalization:](SGFoundInAppsStrings, "localizedStringForKey:preferredLocalization:", CFSTR("Maybe: %@"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_maybeFormatString_localizedString;
  _maybeFormatString_localizedString = v0;

  if (!_maybeFormatString_localizedString)
  {
    +[SGFoundInAppsStrings resourceBundle](SGFoundInAppsStrings, "resourceBundle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Maybe: %@"), &stru_1E7DB83A8, *MEMORY[0x1E0D19DF0]);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_maybeFormatString_localizedString;
    _maybeFormatString_localizedString = v2;

  }
}

void __54__SGDSuggestManager_deleteCloudKitZoneWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v4 = (id)v3;
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

void __41__SGDSuggestManager_sleepWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  usleep(0xAAE60u);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __83__SGDSuggestManager_logEventInteractionForEventWithUniqueKey_interface_actionType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "entityFromUniqueKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logEventInteractionForEntity:interface:actionType:", v2, *(unsigned __int16 *)(a1 + 48), *(unsigned __int16 *)(a1 + 50));

}

void __83__SGDSuggestManager_logEventInteractionForEventWithUniqueKey_interface_actionType___block_invoke_2()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.suggestd.event-metrics-queue", v1);
  v3 = (void *)logEventInteractionForEventWithUniqueKey_interface_actionType___pasExprOnceResult;
  logEventInteractionForEventWithUniqueKey_interface_actionType___pasExprOnceResult = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

void __71__SGDSuggestManager_logEventInteractionForEntity_interface_actionType___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "sg_confirmedEKEventForSGEvent:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D198B8], "recordInteractionForEventWithInterface:actionType:harvestedSGEvent:curatedEKEvent:", *(unsigned __int16 *)(a1 + 40), *(unsigned __int16 *)(a1 + 42), *(_QWORD *)(a1 + 32), v3);

}

void __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if ((unint64_t)objc_msgSend(v10, "count") >= 0x64)
      objc_msgSend(v10, "removeAllObjects");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
    if (v6)
      v7 = *(_QWORD *)(v6 + 16);
    else
      v7 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke_4;
    v11[3] = &unk_1E7DA9140;
    v8 = *(id *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 56);
    v12 = v8;
    v15 = v9;
    v13 = v10;
    v14 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, _QWORD *))(v7 + 16))(v7, v11);

  }
}

void __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "calendarItemsWithExternalIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "suggestionInfo");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_6;
    v6 = (void *)v5;
    objc_msgSend(v4, "suggestionInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "suggestionInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueKey");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 32));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v17 = 138412290;
        v18 = v13;
        v14 = MEMORY[0x1E0C81028];
        v15 = "Caching event from with external identifer = %@.";
        v16 = 12;
LABEL_9:
        _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v17, v16);
      }
    }
    else
    {
LABEL_6:
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v17) = 0;
        v14 = MEMORY[0x1E0C81028];
        v15 = "Event found for Spotlight interaction, but not from Suggestions.";
        v16 = 2;
        goto LABEL_9;
      }
    }
  }

}

void __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:", &__block_literal_global_678);
  v2 = (void *)logEventInteractionForEventWithExternalIdentifier_interface_actionType___pasExprOnceResult;
  logEventInteractionForEventWithExternalIdentifier_interface_actionType___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __92__SGDSuggestManager_logEventInteractionForEventWithExternalIdentifier_interface_actionType___block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0D815F0]);
  v1 = (void *)objc_opt_new();
  v2 = (void *)objc_msgSend(v0, "initWithGuardedData:", v1);

  return v2;
}

void __83__SGDSuggestManager_logUnknownContactInformationShownCount_notShownCount_bundleId___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v14 = CFSTR("misses");
      if ((_DWORD)a2)
        v14 = CFSTR("hits");
      *(_DWORD *)buf = 138412546;
      v16 = v14;
      v17 = 2048;
      v18 = a3;
      _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "#logUnknownContactInformationShownCount names for detail %@: %lu", buf, 0x16u);
    }

    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setApp:", objc_msgSend(*(id *)(a1 + 32), "_appEnumForBundleId:", *(_QWORD *)(a1 + 40)));
    objc_msgSend(v7, "setWasSuggestedContact:", a2);
    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackScalarForMessage:", v7);

    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v10 = *MEMORY[0x1E0D19D98];
    objc_msgSend(v7, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@.%@"), v10, v11);

    objc_msgSend(v7, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

BOOL __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v3, "lastModifiedDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceReferenceDate");
      v7 = v6;
      objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
      v9 = v7 >= v8;

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;

  v2 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CA9F88];
  v5 = (void *)objc_opt_new();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke_3;
  v18 = &unk_1E7DA9088;
  v19 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 40);
  v22 = *(id *)(a1 + 48);
  v6 = v2;
  v21 = v6;
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "eventWithIdentifier:", *(_QWORD *)(a1 + 40), v15, v16, v17, v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
    dispatch_semaphore_signal(v6);
  v9 = objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v6, 5.0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", v7);

  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0D19990];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9 == 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "responseWith:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

  }
}

void __104__SGDSuggestManager_waitForEventWithIdentifier_toAppearInEventStoreWithLastModificationDate_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "eventWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

id __96__SGDSuggestManager_realtimeSuggestionsFromURL_title_HTMLPayload_extractionDate_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "duplicateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "entityType");

  if (v5 != 2)
    goto LABEL_4;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v3, "duplicateKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadEventByDuplicateKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertToEvent:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D19900], "realtimeEventForNewEvent:harvested:", v9, objc_msgSend(*(id *)(a1 + 32), "isEphemeral") ^ 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v10 = 0;
  }

  return v10;
}

void __71__SGDSuggestManager_geocodeEnrichmentsInPipelineEntity_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint8_t v13[16];

  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    sgEventsLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "Geocode modified locations, updating enrichment", v13, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "locations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 40), "locations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(v3, "when");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setTimeRange:", v8);

    objc_msgSend(*(id *)(a1 + 40), "tags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "timeRange");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isValidAllDayRange") & 1) == 0)
        __assert_rtn("-[SGDSuggestManager geocodeEnrichmentsInPipelineEntity:withCompletion:]_block_invoke", "SGDSuggestManager.m", 3862, "[enrichment.timeRange isValidAllDayRange]");

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __71__SGDSuggestManager_geocodeEnrichmentsInPipelineEntity_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__SGDSuggestManager_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  SGPipelineEntity *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  NSObject *v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEvents"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGDuplicateKey duplicateKeyForWebPageFromSource:](SGDuplicateKey, "duplicateKeyForWebPageFromSource:", *MEMORY[0x1E0D19A60]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SGPipelineEntity initWithDuplicateKey:title:]([SGPipelineEntity alloc], "initWithDuplicateKey:title:", v3, a1[4]);
    objc_msgSend(v2, "timeIntervalSince1970");
    -[SGPipelineEntity setCreationTimestamp:](v4, "setCreationTimestamp:");
    objc_msgSend(v2, "timeIntervalSince1970");
    -[SGPipelineEntity setLastModifiedTimestamp:](v4, "setLastModifiedTimestamp:");
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "dissectURL:title:htmlPayload:entity:", a1[5], a1[4], a1[6], v4);
    v6 = (void *)a1[7];
    -[SGPipelineEntity enrichments](v4, "enrichments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filterPastEvents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGPipelineEntity setEnrichments:](v4, "setEnrichments:", v8);

    sgEventsLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[SGPipelineEntity enrichments](v4, "enrichments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v40 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager suggestionsFromURL: parent entity has %lu enrichment(s) after dissection", buf, 0xCu);

    }
    v11 = dispatch_semaphore_create(0);
    v12 = (void *)a1[7];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __73__SGDSuggestManager_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke_652;
    v36[3] = &unk_1E7DB56F0;
    v13 = v11;
    v37 = v13;
    objc_msgSend(v12, "geocodeEnrichmentsInPipelineEntity:withCompletion:", v4, v36);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    -[SGPipelineEntity enrichments](v4, "enrichments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v29 = v3;
      v30 = v2;
      sgEventsLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[SGPipelineEntity enrichments](v4, "enrichments");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");
        *(_DWORD *)buf = 134217984;
        v40 = v18;
        _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_INFO, "Parents entity has %lu enrichements", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1[7] + 8), "writeEntity:", v4);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[SGPipelineEntity enrichments](v4, "enrichments");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            +[SGDCloudKitSync sharedInstance](SGDCloudKitSync, "sharedInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addEnrichment:withParentEntity:", v24, v4);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v21);
      }

      v3 = v29;
      v2 = v30;
    }
    v26 = a1[8];
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);

  }
  else
  {
    v28 = a1[8];
    objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v28 + 16))(v28);

  }
}

intptr_t __73__SGDSuggestManager_suggestionsFromURL_title_HTMLPayload_withCompletion___block_invoke_652(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__SGDSuggestManager_isEventCandidateForURL_title_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  sgEventsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager isEventCandidateForURL: Checking classifier output for webpage", (uint8_t *)&v10, 2u);
  }

  sgPrivateLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 138740227;
    v11 = v8;
    v12 = 2117;
    v13 = v9;
    _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "SGDSuggestManager-isEventCandidateForURL: %{sensitive}@ -title: %{sensitive}@", (uint8_t *)&v10, 0x16u);

  }
  if (objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEvents"))
  {
    v4 = objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSObject isStructuredEventCandidateForURL:title:](v4, "isStructuredEventCandidateForURL:title:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sgEventsLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "SGDSuggestManager isEventCandidateForURL: end processing because detectStructuredEvents is OFF.", (uint8_t *)&v10, 2u);
    }
    v5 = 0;
  }

  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

void __86__SGDSuggestManager_isEventCandidateForURL_andTitle_containsSchemaOrg_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D19990];
    objc_msgSend(a2, "response1");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "responseWith:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

void __78__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteSpotlightReferencesWithBundleIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_pmlTraining");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteSessionsWithBundleID:", *(_QWORD *)(a1 + 40));

  +[SGDPluginManager sharedInstance](SGDPluginManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke_2;
  v5[3] = &unk_1E7DA9010;
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "deleteSpotlightReferencesWithBundleIdentifier:completion:", v6, v5);

}

void __78__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "Plugins finished deleting bundle: %@", (uint8_t *)&v6, 0xCu);
  }

  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

void __96__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_domainIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "Plugins finished deleting %lu domains from bundle: %@", (uint8_t *)&v7, 0x16u);
  }

  v3 = *(_QWORD *)(a1 + 48);
  v4 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

void __96__SGDSuggestManager_deleteSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "SGDSuggestManager: Plugins finished deleting %lu items from bundle: %@", (uint8_t *)&v7, 0x16u);
  }

  v3 = *(_QWORD *)(a1 + 48);
  v4 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

void __95__SGDSuggestManager_purgeSpotlightReferencesWithBundleIdentifier_uniqueIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "Plugins finished purging %lu items from bundle: %@", (uint8_t *)&v7, 0x16u);
  }

  v3 = *(_QWORD *)(a1 + 48);
  v4 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

void __73__SGDSuggestManager__processReservationInteractions_bundleId_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SGPipelineEntity *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  dispatch_semaphore_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id obj;
  id obja;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  dispatch_semaphore_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[5];
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = a1;
  obj = (id)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  v36 = a1;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v53;
    v40 = *MEMORY[0x1E0D19C78];
    v34 = 138543362;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v53 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", v34);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          if (objc_msgSend(v10, "canConvertToSchemaOrg"))
          {
            if (!v7)
            {
              v12 = (void *)objc_opt_new();
              v60 = v12;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v3 = v36;
              +[SGPipeline customPipeline:](SGPipeline, "customPipeline:", v13);
              v7 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v14 = -[SGPipelineEntity initWithInteraction:identifier:fromBundleIdentifier:]([SGPipelineEntity alloc], "initWithInteraction:identifier:fromBundleIdentifier:", v10, v37, *(_QWORD *)(v3 + 40));
            v15 = v7;
            objc_msgSend(v7, "dissect:", v14);
            -[SGPipelineEntity enrichments](v14, "enrichments");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "count");

            if (v17)
            {
              v18 = dispatch_semaphore_create(0);
              v19 = *(void **)(v3 + 48);
              v50[0] = MEMORY[0x1E0C809B0];
              v50[1] = 3221225472;
              v50[2] = __73__SGDSuggestManager__processReservationInteractions_bundleId_completion___block_invoke_638;
              v50[3] = &unk_1E7DB56F0;
              v51 = v18;
              v20 = v18;
              objc_msgSend(v19, "geocodeEnrichmentsInPipelineEntity:withCompletion:", v14, v50);
              dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
              objc_msgSend(obj, "addObject:", v14);

            }
            else
            {
              sgEventsLogHandle();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v10, "sg_LoggingIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v34;
                v59 = v22;
                _os_log_impl(&dword_1C3607000, v20, OS_LOG_TYPE_INFO, "SGDSuggestManager addInteractions: Didn't find any enrichment after dissection of the INInteraction (%{public}@).", buf, 0xCu);

              }
            }
            v7 = v15;

          }
        }
        else
        {
          sgEventsLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "SGDSuggestManager addInteractions: Encountered INInteraction with nil identifier.", buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0D197F8], "recordInteractionIgnoredWithReason:", v40);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v35 = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(v3 + 48) + 8), "writeInteractionEventEntities:", obj);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obja = obj;
  v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
  if (v23)
  {
    v24 = v23;
    v41 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v47 != v41)
          objc_enumerationMutation(obja);
        v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v26, "enrichments", v35);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v43;
          do
          {
            for (k = 0; k != v29; ++k)
            {
              if (*(_QWORD *)v43 != v30)
                objc_enumerationMutation(v27);
              v32 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k);
              +[SGDCloudKitSync sharedInstance](SGDCloudKitSync, "sharedInstance");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addEnrichment:withParentEntity:", v32, v26);

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
          }
          while (v29);
        }

      }
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    }
    while (v24);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v36 + 48) + 8), "syncNewBlobsIfChanged");
  (*(void (**)(void))(*(_QWORD *)(v36 + 56) + 16))();

}

intptr_t __73__SGDSuggestManager__processReservationInteractions_bundleId_completion___block_invoke_638(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __73__SGDSuggestManager__processReservationInteractions_bundleId_completion___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "processReservationInteractions", 25);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_processReservationInteractions_bundleId_completion___pasExprOnceResult;
  _processReservationInteractions_bundleId_completion___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v9, "canConvertToSchemaOrg"))
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            v11 = (void *)objc_opt_new();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *(_QWORD *)(a1 + 40));

          }
          objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "allValues", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "count");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

uint64_t __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke_3;
  v5[3] = &unk_1E7DB1180;
  v2 = a1[7];
  v3 = (void *)a1[4];
  v5[4] = a1[5];
  v5[5] = v2;
  objc_msgSend(v3, "runWithLockAcquired:", v5);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __84__SGDSuggestManager__harvestReservationsFromInteractions_bundleId_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  dispatch_block_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "count");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  sgEventsLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    *(_DWORD *)buf = 134218240;
    v35 = v11;
    v36 = 2048;
    v37 = v7;
    _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "Buffered interactions when block was scheduled: %tu, now: %tu", buf, 0x16u);
  }

  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  sgEventsLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12 == v7)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "Processing all buffered interactions", buf, 2u);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = v3;
    v15 = v3;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
          v21 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(v15, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_633);
          objc_msgSend(*(id *)(a1 + 32), "_processReservationInteractions:bundleId:completion:", v22, v20, v23);
          dispatch_block_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

          objc_autoreleasePoolPop(v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v17);
    }

    objc_msgSend(v15, "removeAllObjects");
    v3 = v24;
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEFAULT, "Waiting for more interactions to be donated before processing.", buf, 2u);
    }

  }
}

void __57__SGDSuggestManager_addInteractions_bundleId_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager addInteractions: bundleId: %{public}@", buf, 0xCu);
  }

  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDSuggestManager addInteractions: Can't add 0 interaction from bundleId: %@", buf, 0xCu);
    }

    goto LABEL_12;
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(*(id *)(a1 + 40), "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v13;
      _os_log_error_impl(&dword_1C3607000, v11, OS_LOG_TYPE_ERROR, "SGDSuggestManager addInteractions: Got %i interactions from nil bundleId! Ignoring.", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0D197F8], "recordInteractionIgnoredWithReason:", *MEMORY[0x1E0D19C70]);
LABEL_12:
    v12 = *(_QWORD *)(a1 + 64);
    v8 = (void *)objc_opt_new();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v8);
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 48), "_harvestPeopleFromInteractions:bundleId:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__SGDSuggestManager_addInteractions_bundleId_completion___block_invoke_625;
  v14[3] = &unk_1E7DADAD8;
  v15 = *(id *)(a1 + 64);
  objc_msgSend(v6, "_harvestReservationsFromInteractions:bundleId:queue:completion:", v4, v5, v7, v14);
  v8 = v15;
LABEL_13:

}

void __57__SGDSuggestManager_addInteractions_bundleId_completion___block_invoke_625(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __57__SGDSuggestManager_addInteractions_bundleId_completion___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "SGSuggestManager-addInteractions", 25);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)addInteractions_bundleId_completion___pasExprOnceResult;
  addInteractions_bundleId_completion___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __51__SGDSuggestManager_addSearchableItems_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __47__SGDSuggestManager_sendRTCLogsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0D19990];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D19990], "responseWithError:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseWith:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  }
}

uint64_t __48__SGDSuggestManager_rebuildNamesForDetailCache___block_invoke()
{
  return 1;
}

uint64_t __95__SGDSuggestManager__performAction_onRecord_withParentConfirmation_confirmRejectUI_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "confirmOrRejectDetail:forContact:", a2, *(_QWORD *)(a1 + 40));
}

void __45__SGDSuggestManager_confirmEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 8);
  else
    v3 = 0;
  (*(void (**)(void))(v3 + 16))();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sg_confirmedEKEventForSGEvent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toEKEventWithStore:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  v8 = (_QWORD *)MEMORY[0x1E0D19B00];
  if (*(_BYTE *)(a1 + 48))
    v8 = (_QWORD *)MEMORY[0x1E0D19AF8];
  objc_msgSend(MEMORY[0x1E0D19950], "recordBannerConfirmedWithEvent:proposedEKEvent:confirmedEKEvent:inApp:", *(_QWORD *)(a1 + 40), v7, v5, *v8);

}

void __74__SGDSuggestManager_launchAppForSuggestedEventUsingLaunchInfo_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    sgEventsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SGDSuggestManager-launchAppForSuggestedEventUsingLaunchInfo: Error opening user activity: %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);

}

void __74__SGDSuggestManager_launchAppForSuggestedEventUsingLaunchInfo_completion___block_invoke_589(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D19988], "responseWithError:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (id)v4;
  (*(void (**)(uint64_t))(v3 + 16))(v3);

}

void __145__SGDSuggestManager_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_ignoreUserActivitySupport_ignoreMailCheck_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "eventsWithSameOpaqueKeyAsDuplicateKey:extraKey:harvestStore:", a1[4], 0, *(_QWORD *)(a1[5] + 8));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sg_fallbackURL");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[6] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

id __145__SGDSuggestManager_launchInfoForSuggestedEventWithUniqueIdentifier_sourceURL_clientLocale_ignoreUserActivitySupport_ignoreMailCheck_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void **v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((unint64_t)objc_msgSend(v2, "count") > 1)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v2, "reverseObjectEnumerator", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v9, "duplicateKey");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "parentKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "entityType");

          if (v12 == 16)
          {
            v21 = v9;
            v13 = (void *)MEMORY[0x1E0C99D20];
            v14 = &v21;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v6)
          continue;
        break;
      }
    }

    objc_msgSend(v2, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v4;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = &v20;
LABEL_13:
    objc_msgSend(v13, "arrayWithObjects:count:", v14, 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = v2;
  }

  return v3;
}

void __64__SGDSuggestManager_resolveFullDownloadRequests_withCompletion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGDSuggestManager-resolveFullDownloadRequests", v7, 2u);
  }

  v3 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0D19828], "map:f:", a1[5], &__block_literal_global_566);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveFullDownloadRequests:", v4);

  v5 = a1[6];
  v6 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

SGEmailKey *__64__SGDSuggestManager_resolveFullDownloadRequests_withCompletion___block_invoke_565(uint64_t a1, void *a2)
{
  id v2;
  SGEmailKey *v3;

  v2 = a2;
  v3 = -[SGEmailKey initWithMailMessageKey:]([SGEmailKey alloc], "initWithMailMessageKey:", v2);

  return v3;
}

void __61__SGDSuggestManager_fullDownloadRequestBatch_withCompletion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGDSuggestManager-fullDownloadRequestBatch", v9, 2u);
  }

  v3 = (void *)MEMORY[0x1E0D19990];
  v4 = (void *)MEMORY[0x1E0D19828];
  v5 = a1[5];
  objc_msgSend(*(id *)(a1[4] + 8), "loadFullDownloadRequestBatch:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "map:f:", v6, &__block_literal_global_562);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseWith:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

}

uint64_t __61__SGDSuggestManager_fullDownloadRequestBatch_withCompletion___block_invoke_561(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toMailMessageKey");
}

void __61__SGDSuggestManager_reportMessagesFound_lost_withCompletion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGDSuggestManager-reportMessagesFound", v11, 2u);
  }

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0D19828], "map:f:", a1[4], &__block_literal_global_557);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  objc_msgSend(*(id *)(a1[5] + 8), "markMessagesFound:", v5);
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0D19828], "map:f:", a1[6], &__block_literal_global_558);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(*(id *)(a1[5] + 8), "updateMessages:state:", v8, 3);
  v9 = a1[7];
  v10 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

SGEmailKey *__61__SGDSuggestManager_reportMessagesFound_lost_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SGEmailKey *v3;

  v2 = a2;
  v3 = -[SGEmailKey initWithMailMessageKey:]([SGEmailKey alloc], "initWithMailMessageKey:", v2);

  return v3;
}

SGEmailKey *__61__SGDSuggestManager_reportMessagesFound_lost_withCompletion___block_invoke_556(uint64_t a1, void *a2)
{
  id v2;
  SGEmailKey *v3;

  v2 = a2;
  v3 = -[SGEmailKey initWithMailMessageKey:]([SGEmailKey alloc], "initWithMailMessageKey:", v2);

  return v3;
}

void __53__SGDSuggestManager_updateMessages_state_completion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGDSuggestManager-updateMessages", v8, 2u);
  }

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0D19828], "map:f:", a1[4], &__block_literal_global_552);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  objc_msgSend(*(id *)(a1[5] + 8), "updateMessages:state:", v5, a1[7]);
  v6 = a1[6];
  v7 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

SGEmailKey *__53__SGDSuggestManager_updateMessages_state_completion___block_invoke_550(uint64_t a1, void *a2)
{
  id v2;
  SGEmailKey *v3;

  v2 = a2;
  v3 = -[SGEmailKey initWithMailMessageKey:]([SGEmailKey alloc], "initWithMailMessageKey:", v2);

  return v3;
}

void __53__SGDSuggestManager_messagesToRefreshWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGDSuggestManager-messagesToRefreshWithCompletion", buf, 2u);
  }

  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "Loading messages to refresh.", v10, 2u);
  }

  v4 = (void *)MEMORY[0x1E0D19990];
  v5 = (void *)MEMORY[0x1E0D19828];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "loadMessagesToRefresh");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "map:f:", v7, &__block_literal_global_546);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseWith:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v9);

}

uint64_t __53__SGDSuggestManager_messagesToRefreshWithCompletion___block_invoke_544(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toMailMessageKey");
}

void __67__SGDSuggestManager_birthdayExtractionsForInterval_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "significance"))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "contactIsSignificantOrSignificanceIsDisabled:", v4))v3 = 1;
    else
      v3 = 2;
    objc_msgSend(v4, "setSignificance:", v3);
  }

}

void __88__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_maybeFormatString");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion__maybeFormat;
  namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion__maybeFormat = v1;

}

uint64_t __88__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rowId");

  objc_msgSend(v4, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "recordId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rowId");

  if (v7 <= v10)
    v11 = 0;
  else
    v11 = -1;
  if (v7 < v10)
    return 1;
  else
    return v11;
}

void __107__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "Error encountered: %@", buf, 0xCu);

    }
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v3, "response1", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
LABEL_7:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "count");
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > *(_QWORD *)(a1 + 56))
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
          if (v8)
            goto LABEL_7;
          break;
        }
      }
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

void __107__SGDSuggestManager_namesForDetail_limitTo_prependMaybe_onlySignificant_supportsInfoLookup_withCompletion___block_invoke_523(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(v7, "response1");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v7, "response1");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

id __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  id (*v57)(uint64_t, void *);
  void *v58;
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "duplicateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityType");
  if (SGEntityTypeIsContactDetail())
  {
    objc_msgSend(v3, "tags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "fromReply");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6) ^ 1;

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v3, "duplicateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "entityType") != 4)
  {
    v12 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v3, "extractionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "extractionType");
  if (v10 == 2)
  {
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "extractionInfo");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v49, "extractionType") == 64)
  {
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "extractionInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "extractionType") == 128)
  {
    v47 = v16;
    v11 = 1;
LABEL_10:
    v13 = a1;
    objc_msgSend(*(id *)(a1 + 32), "tags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D197F0], "fromTextMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "containsObject:", v15);

    if (v11)
    a1 = v13;
    if (v10 == 2)
      goto LABEL_18;
    goto LABEL_17;
  }

  v12 = 0;
LABEL_17:

LABEL_18:
LABEL_19:

  if ((v7 | v12) != 1)
  {
LABEL_28:
    v23 = 0;
    goto LABEL_40;
  }
  objc_msgSend(v3, "duplicateKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v7 & 1) != 0)
    objc_msgSend(v17, "contactDetailKey");
  else
    objc_msgSend(v17, "pseudoContactKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identityKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "duplicateKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "parentKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
    __assert_rtn("-[SGDSuggestManager realtimeContactsFromEntity:enrichments:sourceTextMessage:store:]_block_invoke", "SGDSuggestManager.m", 1998, "enrichment.duplicateKey.parentKey");

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), CFSTR("SGDSuggestManager.m"), 1999, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v20))
  {

    goto LABEL_28;
  }
  v24 = (void *)MEMORY[0x1C3BD4F6C](objc_msgSend(*(id *)(a1 + 48), "addObject:", v20));
  v25 = *(void **)(a1 + 56);
  objc_msgSend(v3, "duplicateKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "storageContactByKey:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v24);
  v28 = (void *)MEMORY[0x1C3BD4F6C]();
  v50 = v27;
  objc_msgSend(v27, "profiles");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = MEMORY[0x1E0C809B0];
  v56 = 3221225472;
  v57 = __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke_2;
  v58 = &unk_1E7DA8C28;
  v46 = a1;
  v59 = *(id *)(a1 + 32);
  sgMapAndFilter();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGStorageContact mergeAll:](SGStorageContact, "mergeAll:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "anyObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v28);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v48 = v33;
  objc_msgSend(v33, "profiles");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v52 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "tags");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D197F0], "hardName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "containsObject:", v40);

        if ((v41 & 1) != 0)
        {

          v23 = 0;
          v42 = v48;
          v43 = v50;
          goto LABEL_39;
        }
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v36)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(v46 + 64), "addObject:", v20);
  v42 = v48;
  objc_msgSend(v48, "convertToContact:sourceEntity:enrichments:", *(_QWORD *)(v46 + 56), *(_QWORD *)(v46 + 32), *(_QWORD *)(v46 + 72));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v50;
LABEL_39:

LABEL_40:
  return v23;
}

uint64_t __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke_514(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeEmailAddress();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v5;
}

id __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke_520(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isContactInteresting:emailEntity:enrichments:hasContactCard:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v3;
    v24 = 1024;
    LODWORD(v25) = v4;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Contact: %@, interesting: %i", buf, 0x12u);
  }

  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v21 = 0;
    +[SGCuratedContactMatcher realtimeContactWithContactStore:forPseudoContact:fromEntity:error:](SGCuratedContactMatcher, "realtimeContactWithContactStore:forPseudoContact:fromEntity:error:", v7, v3, v6, &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;
    if (v9)
    {
      sgLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v3;
        v24 = 2112;
        v25 = v9;
        _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "Error getting realtime contact for %@: %@", buf, 0x16u);
      }

    }
    v11 = objc_msgSend(v8, "state") == 2;
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v8, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "_isContactInteresting:emailEntity:enrichments:hasContactCard:", v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 2 * v11);

    if ((v14 & 1) == 0)
    {
      sgLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEFAULT, "Contact deemed uninteresting. Suggestion suppressed", buf, 2u);
      }

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v8, "contact");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "recordId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "rowId");

  if (v18 >= 1
    && !+[SGSqlEntityStore isEphemeralIdentifier:](SGSqlEntityStore, "isEphemeralIdentifier:", v18))
  {
    objc_msgSend(v8, "markedAsHarvested");
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v19;
  }

  return v8;
}

id __84__SGDSuggestManager_realtimeContactsFromEntity_enrichments_sourceTextMessage_store___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v3, "duplicateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "duplicateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    +[SGStorageContact contactFromContactEntity:](SGStorageContact, "contactFromContactEntity:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_autoreleasePoolPop(v4);

  return v11;
}

id __64__SGDSuggestManager_realtimeWalletPassesFromEntity_enrichments___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  objc_class *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "duplicateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "entityType");

  if (v4 == 26)
  {
    objc_msgSend(v2, "duplicateKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "walletPassKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v2, "tags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = v6;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v15, "isWalletPassData"))
          {
            objc_msgSend(v15, "walletPassData");
            v16 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v16;
          }
          if (objc_msgSend(v15, "isWalletPassDictionary"))
          {
            objc_msgSend(v15, "walletPassDictionary");
            v17 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v17;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v9);

      v6 = v10;
      if (v11 && v12)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("passState"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = stateForWalletPassStateString(v18);

        v20 = objc_alloc(MEMORY[0x1E0D19918]);
        objc_msgSend(v6, "identifier");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initRealtimeWalletPassForState:identifier:walletPassDictionary:walletPassData:", v19, v21, v12, v11);
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {

      v12 = 0;
      v11 = 0;
    }
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v25;
      _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "%@: Wallet Pass Data or Dictionary cannot be empty", buf, 0xCu);

    }
    v22 = 0;
    goto LABEL_21;
  }
  v22 = 0;
LABEL_22:

  return v22;
}

id __64__SGDSuggestManager_realtimeWalletOrdersFromEntity_enrichments___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  objc_class *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "duplicateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "entityType");

  if (v4 == 25)
  {
    objc_msgSend(v2, "duplicateKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "walletOrderKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v2, "tags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = v6;
      v11 = 0;
      v12 = 0;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v15, "isWalletOrderData"))
          {
            objc_msgSend(v15, "walletOrderData");
            v16 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v16;
          }
          if (objc_msgSend(v15, "isWalletOrderDictionary"))
          {
            objc_msgSend(v15, "walletOrderDictionary");
            v17 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v17;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v9);

      v6 = v10;
      if (v11 && v12)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("orderState"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = stateForWalletOrderString(v18);

        v20 = objc_alloc(MEMORY[0x1E0D19910]);
        objc_msgSend(v6, "serialize");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initRealtimeWalletOrderForState:identifier:walletOrderDictionary:walletOrderData:", v19, v21, v12, v11);
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {

      v12 = 0;
      v11 = 0;
    }
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v31 = v25;
      _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "%@: Wallet Order Data or Dictionary cannot be empty", buf, 0xCu);

    }
    v22 = 0;
    goto LABEL_21;
  }
  v22 = 0;
LABEL_22:

  return v22;
}

void __61__SGDSuggestManager_isSGEntity_duplicateOfEKEvent_withStore___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
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
  id v23;

  objc_msgSend(*(id *)(a1 + 32), "toEKEventWithStore:", a2);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  objc_msgSend(v23, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v5);

  objc_msgSend(v23, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v10);

  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToDate:", v16) && objc_msgSend(v7, "isEqualToString:", v12))
  {
    objc_msgSend(v23, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToDate:", v18)
      && objc_msgSend(v9, "isEqualToString:", v14))
    {
      objc_msgSend(v23, "locationWithoutPrediction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "locationWithoutPrediction");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqualToString:"))
      {
        objc_msgSend(v23, "title");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v20, "isEqualToString:", v19);

      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      }

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void __85__SGDSuggestManager_shortNamesAndRealtimeEventsFromEntity_message_enrichments_store___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v3 = v7;
  sgMapAndFilter();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __85__SGDSuggestManager_shortNamesAndRealtimeEventsFromEntity_message_enrichments_store___block_invoke_487(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t v48[16];
  uint8_t v49[16];
  uint8_t v50[16];
  uint8_t v51[16];
  uint8_t buf[16];

  v3 = a2;
  switch(objc_msgSend(v3, "state"))
  {
    case 1u:
      sgLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "New realtime event", buf, 2u);
      }

      objc_msgSend(v3, "entity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "duplicateKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "entityType") == 18)
        v8 = (id *)(*(_QWORD *)(a1 + 32) + 8);
      else
        v8 = (id *)(a1 + 40);
      v14 = *v8;

      objc_msgSend(v3, "entity");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "duplicateKey");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "loadEventByDuplicateKey:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "convertToEvent:", v14);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0D19900], "realtimeEventForNewEvent:harvested:", v39, objc_msgSend(v14, "isEphemeral") ^ 1);
        v40 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      v31 = 0;
      goto LABEL_31;
    case 2u:
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v50 = 0;
        _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "Update realtime event", v50, 2u);
      }

      v10 = *(void **)(a1 + 40);
      objc_msgSend(v3, "entity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "duplicateKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loadEventByDuplicateKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "convertToEvent:", *(_QWORD *)(a1 + 40));
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_19;
      v15 = (void *)MEMORY[0x1E0D19900];
      objc_msgSend(v3, "duplicateEventKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "externalId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "realtimeEventUpdateToEvent:withNewValues:harvested:", v17, v14, objc_msgSend(*(id *)(a1 + 40), "isEphemeral") ^ 1);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 3u:
      sgLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v49 = 0;
        _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_INFO, "Cancellation realtime event", v49, 2u);
      }

      v20 = *(void **)(a1 + 40);
      objc_msgSend(v3, "entity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "duplicateKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "loadEventByDuplicateKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "convertToEvent:", *(_QWORD *)(a1 + 40));
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_19;
      v24 = (void *)MEMORY[0x1E0D19900];
      objc_msgSend(v3, "duplicateEventKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "externalId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "realtimeEventForCanceledEvent:eventIdentifier:harvested:", v14, v17, objc_msgSend(*(id *)(a1 + 40), "isEphemeral") ^ 1);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 4u:
      sgLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_1C3607000, v25, OS_LOG_TYPE_INFO, "Duplicate realtime event", v51, 2u);
      }

      v26 = *(void **)(a1 + 40);
      objc_msgSend(v3, "entity");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "duplicateKey");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "loadEventByDuplicateKey:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "convertToEvent:", *(_QWORD *)(a1 + 40));
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v30 = (void *)MEMORY[0x1E0D19900];
        objc_msgSend(v3, "duplicateEventKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "externalId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "realtimeEventForDuplicateEvent:eventIdentifier:harvested:", v14, v17, objc_msgSend(*(id *)(a1 + 40), "isEphemeral") ^ 1);
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v31 = (void *)v18;

      }
      else
      {
LABEL_19:
        v31 = 0;
      }
      break;
    case 5u:
      sgLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v48 = 0;
        _os_log_impl(&dword_1C3607000, v32, OS_LOG_TYPE_INFO, "Near duplicate realtime event", v48, 2u);
      }

      v33 = (void *)MEMORY[0x1E0D19900];
      objc_msgSend(v3, "duplicateEventKey");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "externalId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "realtimeEventForNearDuplicateEvent:harvested:", v35, objc_msgSend(*(id *)(a1 + 40), "isEphemeral") ^ 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
        goto LABEL_34;
      goto LABEL_33;
    case 6u:
      objc_msgSend(*(id *)(a1 + 48), "duplicateKey");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "entityType");

      if (v37 != 5)
        goto LABEL_34;
      objc_msgSend(*(id *)(a1 + 48), "duplicateKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "entityKey");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "messageId");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D19900], "realtimeEventForExtractionExceptionWithSourceMessageId:", v39);
      v40 = objc_claimAutoreleasedReturnValue();
LABEL_29:
      v31 = (void *)v40;
LABEL_31:

      break;
    default:
      goto LABEL_34;
  }

  if (v31)
  {
LABEL_33:
    v44 = (void *)MEMORY[0x1E0D81638];
    objc_msgSend(v3, "templateShortName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "tupleWithFirst:second:", v45, v31);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_34:
    v46 = 0;
  }

  return v46;
}

id __85__SGDSuggestManager_shortNamesAndRealtimeEventsFromEntity_message_enrichments_store___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  SGPseudoEventKey *v13;
  void *v14;
  void *v15;
  SGPseudoEventKey *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v28;
  void *v29;
  SGCuratedEventKey *v30;
  void *v31;
  NSObject *v32;
  SGRealtimeEventResponse *v33;
  void *v34;
  void *v35;
  SGCuratedEventKey *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  SGDuplicateKey *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  double v56;
  NSObject *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  int v62;
  NSObject *v63;
  const char *v64;
  const char *v65;
  const char *v66;
  void *v67;
  void *v68;
  SGCuratedEventKey *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  SGRealtimeEventResponse *v74;
  int v75;
  uint64_t v76;
  void *v77;
  uint8_t buf[16];
  _QWORD v79[2];

  v79[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "eventsWithSameOpaqueKeyAsPseudoEvent:harvestStore:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventsWithSameAlternativeOpaqueKeyAsPseudoEvent:harvestStore:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      if ((unint64_t)objc_msgSend(v5, "count") >= 2)
      {
        sgLogHandle();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "More than one event found using alternative keys", buf, 2u);
        }

      }
      objc_msgSend(v3, "duplicateKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pseudoEventKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isDropoff");

      if ((v9 & 1) == 0)
      {
        objc_msgSend(v5, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "suggestionInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "opaqueKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("SGDSuggestManager.m"), 1549, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("foundEvent.suggestionInfo.opaqueKey"));

        }
        v13 = [SGPseudoEventKey alloc];
        objc_msgSend(v10, "suggestionInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "opaqueKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[SGPseudoEventKey initWithSerialized:](v13, "initWithSerialized:", v15);

        if (!-[SGPseudoEventKey isDropoff](v16, "isDropoff"))
        {
          v79[0] = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
          v17 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v17;
        }

      }
    }

  }
  if (!objc_msgSend(v4, "count"))
  {
    v18 = *(void **)(a1 + 32);
    objc_msgSend(v3, "duplicateKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pseudoEventKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "groupId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "eventWithExternalID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "suggestionInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_msgSend(v22, "eventIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = [SGCuratedEventKey alloc];
          objc_msgSend(v22, "eventIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[SGCuratedEventKey initWithExternalId:](v36, "initWithExternalId:", v37);

          v26 = -[SGRealtimeEventResponse initDuplicateOfCuratedEvent:withEntity:]([SGRealtimeEventResponse alloc], "initDuplicateOfCuratedEvent:withEntity:", v38, v3);
        }
        else
        {
          sgLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C3607000, v38, OS_LOG_TYPE_DEBUG, "EKEvent with the same externalIdentifier found, but eventIdentifier is nil.", buf, 2u);
          }
          v26 = 0;
        }

        goto LABEL_21;
      }
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "curatedEventKeyForExactMatchOfPseudoEvent:candidates:", v3, v4);
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v22 = (void *)v24;
    v25 = -[SGRealtimeEventResponse initDuplicateOfCuratedEvent:withEntity:]([SGRealtimeEventResponse alloc], "initDuplicateOfCuratedEvent:withEntity:", v24, v3);
LABEL_20:
    v26 = v25;
LABEL_21:

    goto LABEL_22;
  }
  if (objc_msgSend(v4, "count"))
  {
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      sgLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEFAULT, "More than one EKEvent with the same opaque key detected.", buf, 2u);
      }

    }
    objc_msgSend(v4, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "eventIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = [SGCuratedEventKey alloc];
      objc_msgSend(v22, "eventIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[SGCuratedEventKey initWithExternalId:](v30, "initWithExternalId:", v31);

      if ((objc_msgSend(v3, "isCancelled") & 1) != 0)
      {
        if (v32)
        {
          v33 = [SGRealtimeEventResponse alloc];
          objc_msgSend(v3, "templateShortName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[SGRealtimeEventResponse initCancellationOfCuratedEvent:templateShortName:entity:](v33, "initCancellationOfCuratedEvent:templateShortName:entity:", v32, v34, v3);
LABEL_50:

          goto LABEL_51;
        }
        goto LABEL_40;
      }
    }
    else
    {
      sgLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v39, OS_LOG_TYPE_DEBUG, "EKEvent with the same opaque key found, but eventIdentifier is nil.", buf, 2u);
      }

      if ((objc_msgSend(v3, "isCancelled") & 1) != 0)
      {
LABEL_40:
        sgLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
LABEL_41:
          v26 = 0;
LABEL_51:

          goto LABEL_21;
        }
        *(_WORD *)buf = 0;
        v66 = "EKEvent for cancellation found, but eventIdentifier is nil.";
LABEL_94:
        _os_log_debug_impl(&dword_1C3607000, v32, OS_LOG_TYPE_DEBUG, v66, buf, 2u);
        goto LABEL_41;
      }
      v32 = 0;
    }
    objc_msgSend(v22, "calendar");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "isSuggestedEventCalendar"))
    {

      goto LABEL_46;
    }
    objc_msgSend(v22, "calendar");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isNaturalLanguageSuggestedEventCalendar");

    if (v42)
    {
LABEL_46:
      if (objc_msgSend(*(id *)(a1 + 40), "isSGEntity:duplicateOfEKEvent:withStore:", v3, v22, *(_QWORD *)(a1 + 48)))
      {
        objc_msgSend(v22, "suggestionInfo");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "uniqueKey");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          objc_msgSend(v22, "suggestionInfo");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "uniqueKey");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (+[SGDuplicateKey serializationPassesBasicScrutiny:](SGDuplicateKey, "serializationPassesBasicScrutiny:", v34))
          {
            v46 = -[SGDuplicateKey initWithSerialized:]([SGDuplicateKey alloc], "initWithSerialized:", v34);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "loadEntityByKey:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[SGRealtimeEventResponse initNewEventWithEntity:]([SGRealtimeEventResponse alloc], "initNewEventWithEntity:", v47);

            goto LABEL_50;
          }

        }
      }

      v22 = v32;
LABEL_63:
      v49 = *(void **)(a1 + 32);
      if (*(_QWORD *)(a1 + 56))
        objc_msgSend(v49, "sg_fetchEKEventsForPseudoNLEvent:message:", v3);
      else
        objc_msgSend(v49, "sg_fetchEKEventsForPseudoNLEvent:entity:", v3, *(_QWORD *)(a1 + 64));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        objc_msgSend(*(id *)(a1 + 32), "sg_fetchEKEventsForPseudoEventBySimilarTitleAndStartTime:", v3);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v50)
        {
          v25 = -[SGRealtimeEventResponse initNewEventWithEntity:]([SGRealtimeEventResponse alloc], "initNewEventWithEntity:", v3);
          goto LABEL_20;
        }
      }
      if (objc_msgSend(v50, "count") == 1)
      {
        objc_msgSend(v3, "tags");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D197F0], "naturalLanguageEvent");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v51, "containsObject:", v52);

        if (v53)
        {
          objc_msgSend(v3, "timeRange");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "absoluteRange");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "start");
          v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v56);

          objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "startDate");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "isEqualToDate:", v57);

          if ((v60 & 1) == 0)
          {
            sgLogHandle();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              v64 = "Suppressing NL event because it looks like a near-duplicate of a curated event.";
              goto LABEL_98;
            }
LABEL_79:

            goto LABEL_86;
          }
          objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "hasRecurrenceRules");

          if (v62)
          {
            sgLogHandle();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              v64 = "Suppressing NL event because it looks like a duplicate of a recurring curated event.";
LABEL_98:
              _os_log_debug_impl(&dword_1C3607000, v63, OS_LOG_TYPE_DEBUG, v64, buf, 2u);
              goto LABEL_79;
            }
            goto LABEL_79;
          }

        }
        objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "eventIdentifier");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          v69 = [SGCuratedEventKey alloc];
          objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "eventIdentifier");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = -[SGCuratedEventKey initWithExternalId:](v69, "initWithExternalId:", v71);

          v26 = -[SGRealtimeEventResponse initDuplicateOfCuratedEvent:withEntity:]([SGRealtimeEventResponse alloc], "initDuplicateOfCuratedEvent:withEntity:", v72, v3);
          v22 = (void *)v72;
          goto LABEL_21;
        }
        sgLogHandle();
        v57 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
LABEL_86:

          v26 = 0;
          goto LABEL_21;
        }
        *(_WORD *)buf = 0;
        v65 = "Suppressing NL event because eventIdentifier is nil.";
      }
      else
      {
        sgLogHandle();
        v57 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          goto LABEL_86;
        *(_WORD *)buf = 0;
        v65 = "Suppressing event because we found more than 1 duplicate.";
      }
      _os_log_debug_impl(&dword_1C3607000, v57, OS_LOG_TYPE_DEBUG, v65, buf, 2u);
      goto LABEL_86;
    }
    if (!v32)
    {
      sgEventsLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        goto LABEL_41;
      *(_WORD *)buf = 0;
      v66 = "Suppressing update or view duplicate of EKEvent because eventIdentifier is nil.";
      goto LABEL_94;
    }
    if (objc_msgSend(v22, "status") == 3)
    {
      sgEventsLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v48, OS_LOG_TYPE_DEBUG, "Suppressing update or view duplicate of EKEvent because event status is canceled.", buf, 2u);
      }

      goto LABEL_41;
    }
    objc_msgSend(v3, "creationTimestamp");
    if (objc_msgSend(v22, "sg_isCuratedEventFromSuggestionNewerThan:"))
    {
      sgEventsLogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v73, OS_LOG_TYPE_DEBUG, "Newer EKEvent from Suggestions has been found. Showing the updated event insead of this one.", buf, 2u);
      }

      v74 = [SGRealtimeEventResponse alloc];
    }
    else
    {
      v75 = objc_msgSend(*(id *)(a1 + 40), "isSGEntity:duplicateOfEKEvent:withStore:", v3, v22, *(_QWORD *)(a1 + 48));
      v74 = [SGRealtimeEventResponse alloc];
      if (!v75)
      {
        v76 = -[SGRealtimeEventResponse initUpdatedEventWithEntity:curatedEventKey:](v74, "initUpdatedEventWithEntity:curatedEventKey:", v3, v32);
        goto LABEL_96;
      }
    }
    v76 = -[SGRealtimeEventResponse initDuplicateOfCuratedEvent:withEntity:](v74, "initDuplicateOfCuratedEvent:withEntity:", v32, v3);
LABEL_96:
    v26 = (id)v76;
    goto LABEL_51;
  }
  v22 = 0;
  if (!objc_msgSend(v3, "isCancelled"))
    goto LABEL_63;
  v26 = 0;
  if (*(_BYTE *)(a1 + 80))
    goto LABEL_63;
LABEL_22:

  return v26;
}

void __40__SGDSuggestManager_bumptTTLForNLEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void (*v4)(void);
  _QWORD *v5;
  void *v6;
  uint8_t v7[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "NaturalLanguageEvent Found: Bumping TTL", v7, 2u);
  }

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[1];
  v4 = (void (*)(void))v3[2];
  v5 = v3;
  v4();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sg_bumpTimeToLiveForZeroKeywordNLEventOnInteraction:", *(_QWORD *)(a1 + 40));

}

void __40__SGDSuggestManager_bumptTTLForNLEvent___block_invoke_476()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.suggestions.SGEKCalendarWrite", 17);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)bumptTTLForNLEvent___pasExprOnceResult;
  bumptTTLForNLEvent___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __38__SGDSuggestManager_filterPastEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  id v12;
  uint8_t v14[16];

  v3 = a2;
  objc_msgSend(v3, "duplicateKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "entityType");

  if (v5 == 2)
  {
    if (*(_BYTE *)(a1 + 40))
      goto LABEL_8;
    v6 = *(double *)(a1 + 32);
    objc_msgSend(v3, "timeRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "end");
    v10 = v9;

    if (v6 <= v10)
    {
LABEL_8:
      v12 = v3;
      goto LABEL_9;
    }
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "Skipping extracted event that has already passed.", v14, 2u);
    }

  }
  v12 = 0;
LABEL_9:

  return v12;
}

void __71__SGDSuggestManager_cachedResultForKey_generateResult_validateResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __71__SGDSuggestManager_cachedResultForKey_generateResult_validateResults___block_invoke_473(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "count") >= 0xA)
    objc_msgSend(v3, "removeAllObjects");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));

}

void __68__SGDSuggestManager_allContactsWithSnippets_limitTo_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "significance"))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "contactIsSignificantOrSignificanceIsDisabled:", v4))v3 = 1;
    else
      v3 = 2;
    objc_msgSend(v4, "setSignificance:", v3);
  }

}

id __65__SGDSuggestManager_cnContactMatchesForRecordIds_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  char v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v30 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cnContactMatchesForRecordId:found:", v3, &v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v30)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "suggestContactByRecordId:withSnippets:filterConfirmRejectDetails:", v3, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_22:
      v6 = v5;

      goto LABEL_23;
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v29 = 0;
    +[SGCuratedContactMatcher curatedContactsFromContactStore:matchingPseudoContact:error:](SGCuratedContactMatcher, "curatedContactsFromContactStore:matchingPseudoContact:error:", v8, v7, &v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v29;
    v11 = v10;
    if (v10)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (!*(_QWORD *)(v12 + 40))
      {
        v13 = v10;
        v14 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v13;
LABEL_20:

      }
    }
    else if (v9)
    {
      v15 = (void *)objc_opt_new();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v24 = v9;
      v16 = v9;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            if (v21)
            {
              objc_msgSend(v21, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v22);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v18);
      }

      if (!objc_msgSend(v16, "count"))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "writeCNContactMissForRecordId:", v3);
      v14 = v5;
      v5 = v15;
      v11 = 0;
      v9 = v24;
      goto LABEL_20;
    }

    goto LABEL_22;
  }
  v6 = v4;
LABEL_23:

  return v6;
}

void __64__SGDSuggestManager_cnContactMatchesForRecordId_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "response1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("SGDSuggestManager.m"), 1078, CFSTR("Unexpected number of matches"));

  }
  objc_msgSend(v10, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = a1[5];
  v6 = (void *)MEMORY[0x1E0D19990];
  if (v4)
  {
    objc_msgSend(v10, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseWithError:", v7);
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "responseWith:", v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

}

void __50__SGDSuggestManager_prepareForRealtimeExtraction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  SGPipelineEntity *v5;
  void *v6;
  id v7;
  NSObject *v8;
  CFAbsoluteTime v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  CFAbsoluteTime v14;
  __int16 v15;
  int v16;
  _QWORD v17[8];
  _QWORD v18[9];

  v18[8] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("htmlBody");
  v17[1] = CFSTR("body");
  v18[0] = CFSTR("My phone is 515-555-5555. My address is 1234 Hey Street.");
  v18[1] = CFSTR("My phone is 515-555-5555. My address is 1234 Hey Street.");
  v17[2] = CFSTR("from");
  v17[3] = CFSTR("to");
  v18[2] = CFSTR("Warm Up <warm@up.com>");
  v18[3] = &unk_1E7E105D8;
  v18[4] = CFSTR("Warm up! Awaken!");
  v17[4] = CFSTR("subject");
  v17[5] = CFSTR("date");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&prepareForRealtimeExtraction__lastWarmTime);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v2;
  v18[6] = CFSTR("<hey@example.com>");
  v17[6] = CFSTR("messageId");
  v17[7] = CFSTR("sourceId");
  v18[7] = CFSTR("warmUpSuggestions");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGMessage fromDictionary:](SGSimpleMailMessage, "fromDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SGPipelineEntity initWithEmailMessage:]([SGPipelineEntity alloc], "initWithEmailMessage:", v4);
  +[SGPipeline fullPipeline](SGPipeline, "fullPipeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dissect:", v5);

  v7 = +[SGCuratedContactMatcher fetchMeContactFromContactStore:](SGCuratedContactMatcher, "fetchMeContactFromContactStore:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  +[SGSqlEntityStore prepareSqlStoreInMemory](SGSqlEntityStore, "prepareSqlStoreInMemory");
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48)) * 1000.0;
    -[SGPipelineEntity enrichments](v5, "enrichments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218240;
    v14 = v9;
    v15 = 1024;
    v16 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "Warmed up suggestions in %0.2f ms and found %i enrichments", (uint8_t *)&v13, 0x12u);

  }
  v11 = *(_QWORD *)(a1 + 40);
  v12 = (void *)objc_opt_new();
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

}

void __43__SGDSuggestManager__setupHistoryObserver___block_invoke(uint64_t a1)
{
  void *v1;
  SGHistoryObserver *v2;

  v2 = -[SGHistoryObserver initWithStore:]([SGHistoryObserver alloc], "initWithStore:", *(_QWORD *)(a1 + 32));
  +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addSuggestHistoryObserver:", v2);

}

void __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke(uint64_t a1)
{
  id WeakRetained;

  notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0D19E00], "UTF8String"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clearCachesFully:withCompletion:", 1, &__block_literal_global_214);

}

void __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_239(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  id v3;
  id v4;
  __int16 v5[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    sgLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v5[0] = 0;
      _os_log_debug_impl(&dword_1C3607000, v2, OS_LOG_TYPE_DEBUG, "clearing lastSuggestionsFromMessage cache due to settings change", (uint8_t *)v5, 2u);
    }

    objc_msgSend(WeakRetained[14], "lock");
    v3 = WeakRetained[12];
    WeakRetained[12] = 0;

    v4 = WeakRetained[13];
    WeakRetained[13] = 0;

    objc_msgSend(WeakRetained[14], "unlock");
  }

}

void __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_241(uint64_t a1)
{
  id WeakRetained;
  id v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = (id)objc_msgSend(WeakRetained, "_pmlTraining");
    WeakRetained = v3;
  }

}

void __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_executeBoxTasks:", v3);

}

id __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_2_244()
{
  return (id)objc_opt_new();
}

void __106__SGDSuggestManager_setupManagerWithConnection_store_ctsManager_ekStoreProvider_contactStore_pet2Tracker___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "SGDSuggestManager failed to clear caches following an asset update: %@", (uint8_t *)&v6, 0xCu);

    }
  }

}

+ (id)requestCache
{
  if (requestCache__pasOnceToken5 != -1)
    dispatch_once(&requestCache__pasOnceToken5, &__block_literal_global_196);
  return (id)requestCache__pasExprOnceResult;
}

+ (id)contactAggregator
{
  if (contactAggregator__pasOnceToken6 != -1)
    dispatch_once(&contactAggregator__pasOnceToken6, &__block_literal_global_205);
  return (id)contactAggregator__pasExprOnceResult;
}

+ (void)clearRequestCache
{
  void *v2;
  id v3;

  objc_msgSend(a1, "requestCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultIfAvailable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runWithLockAcquired:", &__block_literal_global_207);

}

+ (BOOL)titleSuggestionForMessageFeatureEnabled
{
  return _os_feature_enabled_impl();
}

uint64_t __38__SGDSuggestManager_clearRequestCache__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

void __38__SGDSuggestManager_contactAggregator__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)contactAggregator__pasExprOnceResult;
  contactAggregator__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __33__SGDSuggestManager_requestCache__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_199, 5.0);
  v2 = (void *)requestCache__pasExprOnceResult;
  requestCache__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __33__SGDSuggestManager_requestCache__block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v0 = objc_alloc(MEMORY[0x1E0D815F0]);
  v1 = (void *)objc_opt_new();
  v2 = (void *)objc_msgSend(v0, "initWithGuardedData:", v1);

  location = 0;
  objc_initWeak(&location, v2);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__SGDSuggestManager_requestCache__block_invoke_3;
  v7[3] = &unk_1E7DB7010;
  objc_copyWeak(&v8, &location);
  +[SGCuratedChangeNotifications addAddressBookObserver:forObjectLifetime:](SGCuratedChangeNotifications, "addAddressBookObserver:forObjectLifetime:", v7, v2);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __33__SGDSuggestManager_requestCache__block_invoke_5;
  v5[3] = &unk_1E7DB7010;
  objc_copyWeak(&v6, &location);
  +[SGCuratedChangeNotifications addCalendarObserver:forObjectLifetime:](SGCuratedChangeNotifications, "addCalendarObserver:forObjectLifetime:", v5, v2);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v2;
}

void __33__SGDSuggestManager_requestCache__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "runWithLockAcquired:", &__block_literal_global_203);

}

void __33__SGDSuggestManager_requestCache__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "runWithLockAcquired:", &__block_literal_global_204);

}

uint64_t __33__SGDSuggestManager_requestCache__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

uint64_t __33__SGDSuggestManager_requestCache__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

- (void)_suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 withCompletion:(id)a6
{
  -[SGDSuggestManager _suggestionsFromSearchableItem:options:dissectIfNecessary:processingType:withCompletion:](self, "_suggestionsFromSearchableItem:options:dissectIfNecessary:processingType:withCompletion:", a3, a4, a5, 2, a6);
}

- (void)_suggestionsFromSearchableItem:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 processingType:(unint64_t)a6 withCompletion:(id)a7
{
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  void (**v33)(id, void *);
  uint8_t buf[16];

  v12 = a3;
  v13 = (void (**)(id, void *))a7;
  objc_msgSend(v12, "attributeSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emailHeaders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "attributeSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && v17)
  {
    if (objc_msgSend(MEMORY[0x1E0D80FB0], "mailItemIsSPAM:", v12))
    {
      sgLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        objc_msgSend(MEMORY[0x1E0D19990], "responseWith:", MEMORY[0x1E0C9AA60]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v22);
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      v19 = "SGDSuggestManager: Mail: Not providing suggestions for searchable item that is spam.";
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D80FB0], "mailItemIsInTrash:", v12))
      {
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, 0);
        v29 = a4;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGDSuggestManager _emailContentCacheSalt](self, "_emailContentCacheSalt");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        SGSha256Data(v24, v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = MEMORY[0x1E0C809B0];
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __128__SGDSuggestManager_RealtimeDonations___suggestionsFromSearchableItem_options_dissectIfNecessary_processingType_withCompletion___block_invoke;
        v32[3] = &unk_1E7DAE138;
        v33 = v13;
        v30[0] = v26;
        v30[1] = 3221225472;
        v30[2] = __128__SGDSuggestManager_RealtimeDonations___suggestionsFromSearchableItem_options_dissectIfNecessary_processingType_withCompletion___block_invoke_2;
        v30[3] = &unk_1E7DAE160;
        v31 = v12;
        LOBYTE(v28) = 0;
        LOBYTE(v27) = a5;
        -[SGDSuggestManager realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:processingType:isTextMessage:](self, "realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:processingType:isTextMessage:", v22, v29, v32, 0, v30, v31, v27, a6, v28);

        goto LABEL_15;
      }
      sgLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v19 = "SGDSuggestManager: Mail: Skipping suggestions for searchable item that is in trash.";
    }
    _os_log_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    goto LABEL_13;
  }
  sgLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Mail: Asked for suggestions for a searchable item without headers dictionary or source, returning 0 suggestions", buf, 2u);
  }

  v21 = (void *)MEMORY[0x1E0D19990];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D19AE8], 4, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "responseWithError:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, v23);

LABEL_15:
}

- (id)_emailContentCacheSalt
{
  if (_emailContentCacheSalt__pasOnceToken6 != -1)
    dispatch_once(&_emailContentCacheSalt__pasOnceToken6, &__block_literal_global_17828);
  return (id)_emailContentCacheSalt__pasExprOnceResult;
}

- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 fullCompletionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_fullCompletionHandler___block_invoke;
  v10[3] = &unk_1E7DAE1A8;
  v11 = v8;
  v9 = v8;
  -[SGDSuggestManager suggestionsFromMessage:options:completionDelivery:completionHandler:fullCompletionHandler:](self, "suggestionsFromMessage:options:completionDelivery:completionHandler:fullCompletionHandler:", a3, a4, 1, 0, v10);

}

- (void)suggestionsFromMessage:(id)a3 options:(unint64_t)a4 completionDelivery:(unint64_t)a5 completionHandler:(id)a6 fullCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  CFAbsoluteTime Current;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  SGSearchableItemIdTriple *v29;
  void *v30;
  void *v31;
  void *v32;
  SGSearchableItemIdTriple *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  SGSearchableItemIdTriple *v56;
  unint64_t v57;
  unint64_t v58;
  CFAbsoluteTime v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  unint64_t v69;
  __int16 v70;
  unint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  sgLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v65 = v16;
    v66 = 2112;
    v67 = v17;
    v68 = 2048;
    v69 = a4;
    v70 = 2048;
    v71 = a5;
    _os_log_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Messages: suggestionsFromMessage: %@ : %@ options: %tu completionDelivery: %tu", buf, 0x2Au);

  }
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v12, "bundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    objc_msgSend(v12, "setBundleID:", *MEMORY[0x1E0D80FE0]);
  objc_msgSend(v12, "protection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    objc_msgSend(v12, "setProtection:", *MEMORY[0x1E0CB2AC0]);
  v21 = (void *)MEMORY[0x1E0D80F80];
  objc_msgSend(v12, "bundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = objc_msgSend(v21, "shouldAdmitContentFromBundleIdentifier:", v22);

  if ((v21 & 1) == 0)
  {
    sgLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v41 = "suggestionsFromMessage ignoring item since the bundle is disallowed by user's settings";
LABEL_22:
    _os_log_impl(&dword_1C3607000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 2u);
    goto LABEL_23;
  }
  objc_msgSend(v12, "domainIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (!v24)
  {
    sgLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v41 = "suggestionsFromMessage ignoring item since the domainIdentifier (conversationIdentifier) is nil";
    goto LABEL_22;
  }
  objc_msgSend(v12, "attributeSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "textContentNoCopy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = (void *)objc_opt_new();
    v28 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __130__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke;
    v60[3] = &unk_1E7DAE1D0;
    v61 = v13;
    v62 = v14;
    v51 = v27;
    objc_msgSend(v27, "wait:", v60);
    if (a4 == 3 && !a5)
    {
      v29 = [SGSearchableItemIdTriple alloc];
      objc_msgSend(v12, "bundleID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "domainIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[SGSearchableItemIdTriple initWithBundleId:domainId:uniqueId:](v29, "initWithBundleId:domainId:uniqueId:", v30, v31, v32);

      -[SGDSuggestManager lastSuggestionsFromMessageLock](self, "lastSuggestionsFromMessageLock");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lock");

      -[SGDSuggestManager lastSuggestionsFromMessageRequest](self, "lastSuggestionsFromMessageRequest");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[SGSearchableItemIdTriple isEqualToSearchableItemIdTriple:](v33, "isEqualToSearchableItemIdTriple:", v35))
      {
        sgLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C3607000, v36, OS_LOG_TYPE_DEBUG, "suggestionsFromMessage consolidating repeated item with previous request", buf, 2u);
        }

        -[SGDSuggestManager lastSuggestionsFromMessageResponse](self, "lastSuggestionsFromMessageResponse");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGDSuggestManager lastSuggestionsFromMessageLock](self, "lastSuggestionsFromMessageLock");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "unlock");

        objc_msgSend(v51, "completer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "wait:", v39);

LABEL_33:
        goto LABEL_34;
      }
      -[SGDSuggestManager setLastSuggestionsFromMessageRequest:](self, "setLastSuggestionsFromMessageRequest:", v33);
      -[SGDSuggestManager setLastSuggestionsFromMessageResponse:](self, "setLastSuggestionsFromMessageResponse:", v51);
      -[SGDSuggestManager lastSuggestionsFromMessageLock](self, "lastSuggestionsFromMessageLock");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "unlock");

      v28 = MEMORY[0x1E0C809B0];
    }
    +[SGXpcTransaction transactionWithName:](SGXpcTransaction, "transactionWithName:", "suggestionsFromMessage message harvest queue");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGDSuggestManager messageHarvestQueue](self, "messageHarvestQueue");
    v44 = objc_claimAutoreleasedReturnValue();
    v53[0] = v28;
    v53[1] = 3221225472;
    v53[2] = __130__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_24;
    v53[3] = &unk_1E7DB62A8;
    v53[4] = self;
    v45 = v12;
    v54 = v45;
    v57 = a4;
    v58 = a5;
    v59 = Current;
    v55 = v51;
    v33 = v43;
    v56 = v33;
    objc_msgSend((id)v44, "addOperationWithBlock:", v53);

    objc_msgSend(MEMORY[0x1E0D80F88], "defaultReceiver");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bundleID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    LOBYTE(v44) = objc_msgSend(v46, "donateSearchableItems:bundleIdentifier:error:", v47, v48, &v52);
    v49 = v52;

    if ((v44 & 1) == 0)
    {
      sgLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v49;
        _os_log_error_impl(&dword_1C3607000, v50, OS_LOG_TYPE_ERROR, "SGDSuggestManager+RealtimeDonations: error donating message to ProactiveHarvesting: %@", buf, 0xCu);
      }

    }
    goto LABEL_33;
  }
  sgLogHandle();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v41 = "suggestionsFromMessage ignoring item since the textContent is nil";
    goto LABEL_22;
  }
LABEL_23:

  if (v13)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, 0, 0, 0);
  if (v14)
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, 0, 0, 0, 0);
LABEL_34:

}

- (void)_suggestionsFromMessage:(id)a3 options:(unint64_t)a4 dissectIfNecessary:(BOOL)a5 completionDelivery:(unint64_t)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[16];

  v9 = a5;
  v12 = a3;
  v13 = (void (**)(id, _QWORD))a7;
  if (!v9)
    goto LABEL_15;
  objc_msgSend(v12, "attributeSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "authors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    objc_msgSend(v12, "domainIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (v18)
    {
      objc_msgSend(v12, "protection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = 1;
LABEL_16:
        -[SGDSuggestManager harvestStore](self, "harvestStore");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uniqueIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "markReimportItemAsSeenByReceiverWithBundleId:uniqueId:", v25, v26);

        objc_msgSend(v12, "uniqueIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "dataUsingEncoding:", 4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __128__SGDSuggestManager_RealtimeDonations___suggestionsFromMessage_options_dissectIfNecessary_completionDelivery_completionHandler___block_invoke;
        v30[3] = &unk_1E7DAE220;
        v31 = v12;
        BYTE1(v29) = 1;
        LOBYTE(v29) = v20;
        -[SGDSuggestManager realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:](self, "realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:isTextMessage:", v28, a4, v13, a6, v30, v31, v29);

        goto LABEL_17;
      }
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: Messages: _suggestionsFromMessage: Got message with no content protection type defined. Will not dissect..", buf, 2u);
      }

LABEL_15:
      v20 = 0;
      goto LABEL_16;
    }
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v22 = "SGDSuggestManager: Messages: _suggestionsFromMessage: Got message with no domainIdentifier (conversationIden"
            "tifier). Ignoring.";
      goto LABEL_10;
    }
  }
  else
  {
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v22 = "SGDSuggestManager: Messages: _suggestionsFromMessage: Got message with no authors. Ignoring.";
LABEL_10:
      _os_log_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    }
  }

  v13[2](v13, 0);
LABEL_17:

}

- (void)realtimeSuggestionsForMailOrMessageWithHash:(id)a3 options:(unint64_t)a4 completion:(id)a5 completionDelivery:(unint64_t)a6 providedBy:(id)a7 searchableItem:(id)a8 dissectIfNecessary:(BOOL)a9 isTextMessage:(BOOL)a10
{
  uint64_t v10;
  uint64_t v11;

  LOBYTE(v11) = a10;
  LOBYTE(v10) = a9;
  -[SGDSuggestManager realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:processingType:isTextMessage:](self, "realtimeSuggestionsForMailOrMessageWithHash:options:completion:completionDelivery:providedBy:searchableItem:dissectIfNecessary:processingType:isTextMessage:", a3, a4, a5, a6, a7, a8, v10, 2, v11);
}

- (void)realtimeSuggestionsForMailOrMessageWithHash:(id)a3 options:(unint64_t)a4 completion:(id)a5 completionDelivery:(unint64_t)a6 providedBy:(id)a7 searchableItem:(id)a8 dissectIfNecessary:(BOOL)a9 processingType:(unint64_t)a10 isTextMessage:(BOOL)a11
{
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  dispatch_semaphore_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  SGDSuggestManager *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  char isKindOfClass;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t n;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t ii;
  void *v83;
  void *v84;
  char v85;
  SGPipelineEntity *v86;
  void *v87;
  void *v88;
  SGPipelineEntity *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  dispatch_semaphore_t dsema;
  id v95;
  dispatch_object_t object;
  id v98;
  void (**v99)(id, void *);
  void (**v100)(_QWORD, _QWORD);
  void (**v101)(void);
  void *v102;
  id obj;
  uint64_t v104;
  uint64_t v105;
  uint64_t i;
  void (**v107)(void);
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[4];
  id v127;
  _BYTE *v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[4];
  id v134;
  _BYTE *v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _QWORD v144[5];
  void (**v145)(void);
  _QWORD *v146;
  __int128 v147;
  uint64_t v148;
  BOOL v149;
  BOOL v150;
  _QWORD v151[5];
  id v152;
  dispatch_object_t v153;
  id v154;
  dispatch_semaphore_t v155;
  id v156;
  id v157;
  _BYTE *v158;
  _QWORD *v159;
  unint64_t v160;
  int8x16_t v161;
  SEL v162;
  unint64_t v163;
  BOOL v164;
  BOOL v165;
  _QWORD v166[3];
  char v167;
  __int128 v168;
  uint64_t v169;
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  uint8_t v173[128];
  _BYTE v174[24];
  char v175;
  _BYTE v176[128];
  uint8_t v177[128];
  _BYTE buf[24];
  char v179;
  uint64_t v180;

  v180 = *MEMORY[0x1E0C80C00];
  v98 = a3;
  v99 = (void (**)(id, void *))a5;
  v16 = a7;
  v17 = a8;
  sgLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v17, "bundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v20;
    _os_log_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: realtimeSuggestionsForMailOrMessageWithHash: %@ : %@", buf, 0x16u);

  }
  v111 = dispatch_queue_create("after banner callback", 0);
  dispatch_suspend(v111);
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDSuggestManager+RealtimeDonations.m"), 355, CFSTR("Passing 0 for options would return nothing"));

  }
  if (realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__initMemoryStoreOneTimeToken != -1)
    dispatch_once(&realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__initMemoryStoreOneTimeToken, &__block_literal_global_40_17771);
  v169 = 0;
  *(_QWORD *)&v168 = CFSTR("suggestionsFromEmailContent");
  *((_QWORD *)&v168 + 1) = mach_absolute_time();
  v109 = (void *)objc_opt_new();
  v21 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v179 = 0;
  v166[0] = 0;
  v166[1] = v166;
  v166[2] = 0x2020000000;
  v167 = 0;
  -[SGDSuggestManager context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = MEMORY[0x1E0C809B0];
  v151[1] = 3221225472;
  v151[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2;
  v151[3] = &unk_1E7DAE288;
  v23 = v16;
  v160 = a10;
  v164 = a11;
  v157 = v23;
  v151[4] = self;
  v161 = vandq_s8((int8x16_t)vdupq_n_s64(a4), (int8x16_t)xmmword_1C385A5A0);
  v165 = a9;
  v95 = v17;
  v152 = v95;
  v158 = buf;
  object = v111;
  v153 = object;
  v93 = v22;
  v154 = v93;
  v159 = v166;
  dsema = v21;
  v155 = dsema;
  v162 = a2;
  v92 = v109;
  v156 = v92;
  v163 = a4 & 1;
  v101 = (void (**)(void))MEMORY[0x1C3BD5158](v151);
  v144[0] = MEMORY[0x1E0C809B0];
  v144[1] = 3221225472;
  v144[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_78;
  v144[3] = &unk_1E7DAE340;
  v147 = v168;
  v144[4] = self;
  v148 = v169;
  v149 = a11;
  v150 = (a4 & 0x40000000) == 0;
  v107 = (void (**)(void))v23;
  v145 = v107;
  v146 = v166;
  v100 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BD5158](v144);
  if (a11)
  {
    v101[2]();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");

    if (v25)
    {
      ((void (**)(_QWORD, void *))v100)[2](v100, v25);
      v102 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v102 = 0;
    }
    v26 = self;
  }
  else
  {
    v26 = self;
    -[SGDSuggestManager cachedResultForKey:generateResult:validateResults:](self, "cachedResultForKey:generateResult:validateResults:", v98, v101, v100);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SGDSuggestManager harvestStore](v26, "harvestStore");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "kvCacheManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "cacheOfType:", 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGDSuggestManager harvestStore](self, "harvestStore");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "kvCacheManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "cacheOfType:", 1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  objc_msgSend(v102, "contacts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v177, 16);
  if (v105)
  {
    v104 = *(_QWORD *)v141;
    do
    {
      for (i = 0; i != v105; ++i)
      {
        if (*(_QWORD *)v141 != v104)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * i), "contact");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        v112 = v31;
        objc_msgSend(v31, "phones");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v136, v176, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v137;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v137 != v34)
                objc_enumerationMutation(v32);
              v36 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * j);
              objc_msgSend(v36, "phoneNumber");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              SGNormalizePhoneNumber();
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              *(_QWORD *)v174 = 0;
              *(_QWORD *)&v174[8] = v174;
              *(_QWORD *)&v174[16] = 0x2020000000;
              v175 = 0;
              -[SGDSuggestManager recentlyHarvestedDetailLock](self, "recentlyHarvestedDetailLock");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v133[0] = MEMORY[0x1E0C809B0];
              v133[1] = 3221225472;
              v133[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2_91;
              v133[3] = &unk_1E7DAE368;
              v40 = v38;
              v134 = v40;
              v135 = v174;
              objc_msgSend(v39, "runWithLockAcquired:", v133);

              if (*(_BYTE *)(*(_QWORD *)&v174[8] + 24))
              {
                v41 = (void *)MEMORY[0x1E0D19840];
                objc_msgSend(v112, "name");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "fullName");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "encodedStringForFullName:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v110, "setValueIfNotPresent:forKey:fromRecordId:", v44, v40, 0);
                objc_msgSend(v36, "recordId");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                +[SGDNotificationBroadcaster emitContactUpdated:](SGDNotificationBroadcaster, "emitContactUpdated:", v45);

              }
              _Block_object_dispose(v174, 8);

            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v136, v176, 16);
          }
          while (v33);
        }

        v131 = 0u;
        v132 = 0u;
        v129 = 0u;
        v130 = 0u;
        objc_msgSend(v112, "emailAddresses");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v129, v173, 16);
        if (v47)
        {
          v48 = *(_QWORD *)v130;
          do
          {
            for (k = 0; k != v47; ++k)
            {
              if (*(_QWORD *)v130 != v48)
                objc_enumerationMutation(v46);
              v50 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * k);
              objc_msgSend(v50, "emailAddress");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              SGNormalizeEmailAddress();
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              *(_QWORD *)v174 = 0;
              *(_QWORD *)&v174[8] = v174;
              *(_QWORD *)&v174[16] = 0x2020000000;
              v175 = 0;
              -[SGDSuggestManager recentlyHarvestedDetailLock](self, "recentlyHarvestedDetailLock");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v126[0] = MEMORY[0x1E0C809B0];
              v126[1] = 3221225472;
              v126[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3_95;
              v126[3] = &unk_1E7DAE368;
              v54 = v52;
              v127 = v54;
              v128 = v174;
              objc_msgSend(v53, "runWithLockAcquired:", v126);

              if (*(_BYTE *)(*(_QWORD *)&v174[8] + 24))
              {
                v55 = (void *)MEMORY[0x1E0D19840];
                objc_msgSend(v112, "name");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "fullName");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "encodedStringForFullName:", v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v108, "setValueIfNotPresent:forKey:fromRecordId:", v58, v54, 0);
                objc_msgSend(v50, "recordId");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                +[SGDNotificationBroadcaster emitContactUpdated:](SGDNotificationBroadcaster, "emitContactUpdated:", v59);

              }
              _Block_object_dispose(v174, 8);

            }
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v129, v173, 16);
          }
          while (v47);
        }

      }
      v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v177, 16);
    }
    while (v105);
  }

  sgLogHandle();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v95, "uniqueIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v174 = 138412546;
    *(_QWORD *)&v174[4] = v61;
    *(_WORD *)&v174[12] = 2112;
    *(_QWORD *)&v174[14] = v102;
    _os_log_impl(&dword_1C3607000, v60, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: realtimeSuggestionsForMailOrMessageWithHash: %@: results: %@", v174, 0x16u);

  }
  if (!a6)
  {
    v99[2](v99, v102);

    v99 = 0;
  }
  dispatch_resume(object);
  dispatch_barrier_sync(object, &__block_literal_global_97);
  SGRecordMeasurementState(&v168);
  objc_msgSend((id)realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__inMemoryStore, "clearAllTables");
  v107[2]();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v124 = 0uLL;
    v125 = 0uLL;
    v122 = 0uLL;
    v123 = 0uLL;
    objc_msgSend(v102, "events");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v122, v172, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v123;
      do
      {
        for (m = 0; m != v65; ++m)
        {
          if (*(_QWORD *)v123 != v66)
            objc_enumerationMutation(v64);
          v68 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * m);
          objc_msgSend(v68, "event");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "isNaturalLanguageEvent");

          if (v70)
          {
            objc_msgSend(v68, "event");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGDSuggestManager bumptTTLForNLEvent:](self, "bumptTTLForNLEvent:", v71);

          }
        }
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v122, v172, 16);
      }
      while (v65);
    }
    v72 = 4;
  }
  else
  {
    v120 = 0uLL;
    v121 = 0uLL;
    v118 = 0uLL;
    v119 = 0uLL;
    objc_msgSend(v102, "reminders");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v118, v171, 16);
    if (v73)
    {
      v74 = *(_QWORD *)v119;
      do
      {
        for (n = 0; n != v73; ++n)
        {
          if (*(_QWORD *)v119 != v74)
            objc_enumerationMutation(v64);
          v76 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * n);
          +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "reminder");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "logReminderInteractionFromReminder:interface:actionType:", v78, 1, 4);

        }
        v73 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v118, v171, 16);
      }
      while (v73);
    }
    v72 = 1;
  }

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  objc_msgSend(v102, "events");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v114, v170, 16);
  if (v80)
  {
    v81 = *(_QWORD *)v115;
    do
    {
      for (ii = 0; ii != v80; ++ii)
      {
        if (*(_QWORD *)v115 != v81)
          objc_enumerationMutation(v79);
        v83 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * ii);
        objc_msgSend(v83, "event");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "isNaturalLanguageEvent");

        if ((v85 & 1) == 0)
        {
          v86 = [SGPipelineEntity alloc];
          v87 = (void *)MEMORY[0x1C3BD4F6C]();
          v107[2]();
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v87);
          v89 = -[SGPipelineEntity initWithMessage:](v86, "initWithMessage:", v88);

          +[SGRTCLogging defaultLogger](SGRTCLogging, "defaultLogger");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "logEventInteractionForRealtimeEvent:parentEntity:interface:actionType:", v83, v89, v72, 4);

        }
      }
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v114, v170, 16);
    }
    while (v80);
  }

  if (a6 == 1)
  {
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    v99[2](v99, v102);
  }

  _Block_object_dispose(v166, 8);
  _Block_object_dispose(buf, 8);

  SGRecordMeasurementState(&v168);
}

- (BOOL)_canBannerUseStoredDissection:(id)a3 options:(unint64_t)a4
{
  if (a3)
    return objc_msgSend(a3, "isPartiallyDownloaded") ^ 1;
  else
    return 0;
}

- (void)_storeAndGeocodeEntity:(id)a3 spotlightBundleIdentifier:(id)a4 spotlightUniqueIdentifier:(id)a5 spotlightDomainIdentifier:(id)a6 store:(id)a7 afterCallbackQueue:(id)a8 finalize:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *queue;
  id v28;
  _QWORD block[4];
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v14 = a9;
  queue = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x1E0D198F0], "shouldHarvestEvents"))
  {
    v20 = v28;
    objc_msgSend(v19, "geocodeOperation:withDependencies:", v28, MEMORY[0x1E0C9AA60]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", &__block_literal_global_100);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v28;
  }
  v31[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "storeOperation:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:withStore:dependencies:", v20, v18, v17, v16, v15, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "addDependency:", v23);
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v25, "setSuspended:", 1);
  objc_msgSend(v25, "addOperation:", v21);
  objc_msgSend(v25, "addOperation:", v23);
  objc_msgSend(v25, "addOperation:", v24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __175__SGDSuggestManager_RealtimeDonations___storeAndGeocodeEntity_spotlightBundleIdentifier_spotlightUniqueIdentifier_spotlightDomainIdentifier_store_afterCallbackQueue_finalize___block_invoke_2;
  block[3] = &unk_1E7DB56F0;
  v30 = v25;
  v26 = v25;
  dispatch_async(queue, block);

}

- (id)filterRealtimeReminders:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_103);
}

id __64__SGDSuggestManager_RealtimeDonations__filterRealtimeReminders___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  __int16 v20;
  __int16 v21;
  uint8_t buf[2];

  v2 = a2;
  +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reminder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isValidNewReminder:", v4);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v2, "reminder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[SGRemindersAdapter reminderHasDuplicate:usingStore:](SGRemindersAdapter, "reminderHasDuplicate:usingStore:", v6, 0);

    if (v7)
    {
      sgRemindersLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v21 = 0;
        v9 = "SGDSuggestManager: Filtering out duplicate reminder";
        v10 = (uint8_t *)&v21;
LABEL_7:
        _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
      }
    }
    else
    {
      objc_msgSend(v2, "reminder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dueDateComponents");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_12;
      objc_msgSend(v2, "reminder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dueDateComponents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "reminder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[SGReminderDissector isReminderDueDateComponentsInPast:givenReferenceDate:allDay:](SGReminderDissector, "isReminderDueDateComponentsInPast:givenReferenceDate:allDay:", v15, v16, objc_msgSend(v17, "isAllDay"));

      if (!v18 || (objc_msgSend(MEMORY[0x1E0D198F0], "showPastEvents") & 1) != 0)
      {
LABEL_12:
        v11 = v2;
        goto LABEL_13;
      }
      sgRemindersLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v20 = 0;
        v9 = "SGDSuggestManager: Filtering past Reminder";
        v10 = (uint8_t *)&v20;
        goto LABEL_7;
      }
    }
  }
  else
  {
    sgRemindersLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "SGDSuggestManager: Filtering out previously engaged reminder";
      v10 = buf;
      goto LABEL_7;
    }
  }

  v11 = 0;
LABEL_13:

  return v11;
}

uint64_t __175__SGDSuggestManager_RealtimeDonations___storeAndGeocodeEntity_spotlightBundleIdentifier_spotlightUniqueIdentifier_spotlightDomainIdentifier_store_afterCallbackQueue_finalize___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSuspended:", 0);
}

id __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  char v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  SGPipelineEntity *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  char v24;
  int v25;
  NSObject *v26;
  SGPipelineEntity *v27;
  void *v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  SGHarvestQueueMetrics *v32;
  void *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  SGRequestContext *v40;
  SGPipelineEntity *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t i;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  NSObject *v80;
  NSObject *v81;
  void *v82;
  NSObject *v83;
  int v84;
  void *v85;
  NSObject *v86;
  NSObject *v87;
  void *v88;
  NSObject *v89;
  int v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  void *v98;
  char v99;
  void *v100;
  int IsDelivery;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  id v109;
  void *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  uint64_t v121;
  void *v122;
  int v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  uint64_t v130;
  SGRequestContext *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  SGPipelineEntity *v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _QWORD v145[4];
  NSObject *v146;
  id v147;
  id v148;
  _QWORD v149[4];
  NSObject *v150;
  _QWORD v151[5];
  SGPipelineEntity *v152;
  NSObject *v153;
  _QWORD block[4];
  id v155;
  id v156;
  NSObject *v157;
  void *v158;
  uint8_t buf[4];
  uint64_t v160;
  __int16 v161;
  void *v162;
  _BYTE v163[128];
  _BYTE v164[128];
  uint64_t v165;

  v165 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C](+[SGPatterns pauseCacheEvictionTemporarily](SGPatterns, "pauseCacheEvictionTemporarily"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v136 = (id)realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__inMemoryStore;
  if (*(_QWORD *)(a1 + 104) != 2)
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v25 = *(unsigned __int8 *)(a1 + 144);
      *(_DWORD *)buf = 67109120;
      LODWORD(v160) = v25;
      _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Using persistent store for realtime harvesting of mail (isTextMessage = %{BOOL}d)", buf, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "harvestStore");
    v6 = objc_claimAutoreleasedReturnValue();

    v136 = (id)v6;
  }
  objc_msgSend(v3, "accountType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SGSqlEntityStore canStoreEventsForAccountType:](SGSqlEntityStore, "canStoreEventsForAccountType:", v7);

  v134 = a1;
  v126 = v3;
  if (v8 && (!*(_QWORD *)(a1 + 112) || objc_msgSend(MEMORY[0x1E0D198F0], "shouldHarvestEvents")))
  {
    objc_msgSend(v3, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGDuplicateKey duplicateKeyForMessage:fromSource:](SGDuplicateKey, "duplicateKeyForMessage:fromSource:", v3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "harvestStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadEntityByKey:", v10);
    v12 = a1;
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(*(id *)(v12 + 32), "_canBannerUseStoredDissection:options:", v13, *(_QWORD *)(v12 + 120));
    v15 = v14;
    if (v14)
    {
      sgLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEBUG, "Existing valid dissection found in store.", buf, 2u);
      }

      objc_msgSend(*(id *)(v134 + 32), "harvestStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "childrenFromParentKey:", v10);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v134 + 32), "harvestStore");
      v18 = objc_claimAutoreleasedReturnValue();

      v19 = v13;
      -[SGEntity tags](v19, "tags");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D197F0], "requiresDeferredDissection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "containsObject:", v21);

      if (!v22)
      {
        v23 = 0;
        v3 = v126;
        goto LABEL_26;
      }
      v3 = v126;
      v23 = *(_QWORD *)(v134 + 104) == 1;
      v136 = (id)v18;
      if (v13)
        goto LABEL_22;
    }
    else
    {
      v23 = 0;
      v128 = 0;
      v19 = 0;
      if (v13)
      {
LABEL_22:
        sgLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C3607000, v26, OS_LOG_TYPE_DEBUG, "Existing dissection found in store, but HTML does not match.", buf, 2u);
        }

        if ((v15 & 1) == 0)
          goto LABEL_25;
LABEL_19:
        v18 = (uint64_t)v136;
LABEL_26:

        v24 = 0;
        v136 = (id)v18;
        a1 = v134;
        goto LABEL_27;
      }
    }
    if ((v15 & 1) == 0)
    {
LABEL_25:
      v27 = -[SGPipelineEntity initWithMessage:]([SGPipelineEntity alloc], "initWithMessage:", v3);

      v18 = (uint64_t)v136;
      v19 = v27;
      goto LABEL_26;
    }
    goto LABEL_19;
  }
  v23 = 0;
  v128 = 0;
  v19 = 0;
  v24 = 1;
LABEL_27:
  v133 = (void *)objc_opt_new();
  v127 = v4;
  if (v23 || !v128)
  {
    v29 = *(unsigned __int8 *)(a1 + 145);
    sgLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (!v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEBUG, "Entity not harvested, but I was told not to dissect.", buf, 2u);
      }

      v118 = 0;
      v119 = v133;
      v91 = v128;
      goto LABEL_99;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v31, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: starting dissection.", buf, 2u);
    }

    v32 = [SGHarvestQueueMetrics alloc];
    objc_msgSend(v3, "spotlightBundleIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[SGHarvestQueueMetrics initRealtime:wasNoBudgetItem:](v32, "initRealtime:wasNoBudgetItem:", v33, 0);

    objc_msgSend(v34, "startHarvest");
    objc_msgSend(v3, "setHarvestMetrics:", v34);
    +[SGDPowerLog startDissectionOfMessage:inContext:](SGDPowerLog, "startDissectionOfMessage:inContext:", v3, 0);
    v35 = dispatch_group_create();
    v36 = v35;
    v37 = MEMORY[0x1E0C809B0];
    if (*(_QWORD *)(a1 + 40))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      dispatch_group_enter(v35);
      block[0] = v37;
      block[1] = 3221225472;
      block[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_52;
      block[3] = &unk_1E7DB7800;
      v38 = *(NSObject **)(a1 + 48);
      v155 = *(id *)(a1 + 40);
      v156 = v34;
      v157 = v36;
      dispatch_async(v38, block);

    }
    v39 = v36;
    v40 = -[SGRequestContext initWithServiceContext:concurrencyBehavior:backpressureHazard:extractionMode:]([SGRequestContext alloc], "initWithServiceContext:concurrencyBehavior:backpressureHazard:extractionMode:", *(_QWORD *)(a1 + 56), 1, 1, 2);
    v41 = -[SGPipelineEntity initWithMessage:]([SGPipelineEntity alloc], "initWithMessage:", v3);

    -[SGPipelineEntity setHarvestMetrics:](v41, "setHarvestMetrics:", v34);
    +[SGPipeline fullPipeline](SGPipeline, "fullPipeline");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v40;
    objc_msgSend(v42, "dissectAndStoreEntity:inContext:destinationStore:", v41, v40, v136);

    -[SGPipelineEntity enrichments](v41, "enrichments");
    v130 = objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = -[SGPipelineEntity needsSourceVerification](v41, "needsSourceVerification");
    v135 = v41;
    -[SGPipelineEntity invalidatedMessageIdentifiers](v41, "invalidatedMessageIdentifiers");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v133;
    objc_msgSend(v133, "setInvalidatedIdentifiers:", v43);

    +[SGDPowerLog endDissectionOfMessage:inContext:](SGDPowerLog, "endDissectionOfMessage:inContext:", v3, 0);
    if (objc_msgSend(*(id *)(a1 + 32), "keepRealtimeAsLost"))
    {
      objc_opt_class();
      if (!(v24 & 1 | ((objc_opt_isKindOfClass() & 1) == 0)))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        dispatch_group_enter(v39);
        v129 = *(void **)(a1 + 32);
        v44 = v3;
        objc_msgSend(v44, "spotlightBundleIdentifier");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "spotlightUniqueIdentifier");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "spotlightDomainIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "harvestStore");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = *(_QWORD *)(a1 + 48);
        v151[0] = MEMORY[0x1E0C809B0];
        v151[1] = 3221225472;
        v151[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_60;
        v151[3] = &unk_1E7DB7800;
        v151[4] = *(_QWORD *)(a1 + 32);
        v152 = v41;
        v153 = v39;
        objc_msgSend(v129, "_storeAndGeocodeEntity:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:store:afterCallbackQueue:finalize:", v152, v125, v124, v45, v46, v47, v151);

        v28 = v133;
      }
    }
    v48 = v39;
    if (v4)
    {
      if (objc_msgSend(v4, "senderIsAccountOwner"))
      {
        objc_msgSend(*(id *)(a1 + 32), "harvestStore");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "registerSentTextMessage:", v4);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      dispatch_group_enter(v39);
      v50 = *(void **)(a1 + 32);
      objc_msgSend(v4, "spotlightBundleIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "spotlightUniqueIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "spotlightDomainIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "harvestStore");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = *(_QWORD *)(a1 + 48);
      v149[0] = MEMORY[0x1E0C809B0];
      v149[1] = 3221225472;
      v149[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2_62;
      v149[3] = &unk_1E7DB56F0;
      v150 = v39;
      v56 = v55;
      v4 = v127;
      objc_msgSend(v50, "_storeAndGeocodeEntity:spotlightBundleIdentifier:spotlightUniqueIdentifier:spotlightDomainIdentifier:store:afterCallbackQueue:finalize:", v135, v51, v52, v53, v54, v56, v149);

      v48 = v39;
      v28 = v133;
    }
    dispatch_get_global_queue(9, 0);
    v57 = objc_claimAutoreleasedReturnValue();
    v145[0] = MEMORY[0x1E0C809B0];
    v145[1] = 3221225472;
    v145[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3_63;
    v145[3] = &unk_1E7DB7800;
    v146 = v48;
    v147 = v34;
    v148 = *(id *)(a1 + 64);
    v58 = v34;
    v59 = v48;
    dispatch_async(v57, v145);

    v128 = (void *)v130;
  }
  else
  {
    v135 = v19;
    v28 = v133;
  }
  if (*(_QWORD *)(a1 + 112))
  {
    sgEventsLogHandle();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      -[SGEntity loggingIdentifier](v135, "loggingIdentifier");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v160 = (uint64_t)v122;
      _os_log_debug_impl(&dword_1C3607000, v60, OS_LOG_TYPE_DEBUG, "SGDSuggestManager - Getting realtime events for dissected entity [SGEntity %{public}@]", buf, 0xCu);

    }
    v61 = (void *)objc_opt_new();
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "shortNamesAndRealtimeEventsFromEntity:message:enrichments:store:", v135, v3, v128, v136);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v141, v164, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v142;
      v66 = 0x1E0C99000uLL;
      do
      {
        for (i = 0; i != v64; ++i)
        {
          if (*(_QWORD *)v142 != v65)
            objc_enumerationMutation(v62);
          v68 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
          objc_msgSend(v68, "first");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "second");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v70)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v134 + 128), *(_QWORD *)(v134 + 32), CFSTR("SGDSuggestManager+RealtimeDonations.m"), 567, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

          }
          objc_msgSend(v61, "addObject:", v70);
          v71 = *(void **)(v134 + 72);
          if (v69)
          {
            objc_msgSend(*(id *)(v134 + 72), "addObject:", v69);
          }
          else
          {
            objc_msgSend(*(id *)(v66 + 3640), "null");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "addObject:", v72);

          }
          sgEventsLogHandle();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v70, "event");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "loggingIdentifier");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v70, "state");
            *(_DWORD *)buf = 138543618;
            v160 = (uint64_t)v76;
            v161 = 1024;
            LODWORD(v162) = v77;
            _os_log_debug_impl(&dword_1C3607000, v73, OS_LOG_TYPE_DEBUG, "  -> Event [SGEvent %{public}@] in state %i", buf, 0x12u);

            v66 = 0x1E0C99000;
          }

          sgEventsLogHandle();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v70, "event");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v160 = (uint64_t)v78;
            _os_log_debug_impl(&dword_1C3607000, v74, OS_LOG_TYPE_DEBUG, "    -> %@", buf, 0xCu);

            v66 = 0x1E0C99000;
          }

        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v141, v164, 16);
      }
      while (v64);
    }

    sgLogHandle();
    v80 = objc_claimAutoreleasedReturnValue();
    v4 = v127;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
    {
      v123 = objc_msgSend(v61, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v160) = v123;
      _os_log_debug_impl(&dword_1C3607000, v80, OS_LOG_TYPE_DEBUG, "Found %i realtime events", buf, 8u);
    }

    v28 = v133;
    objc_msgSend(v133, "setEvents:", v61);

    a1 = v134;
  }
  sgLogHandle();
  v81 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v81, OS_LOG_TYPE_INFO, "Getting realtime wallet orders for dissected entity", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "realtimeWalletOrdersFromEntity:enrichments:", v135, v128);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
  {
    v84 = objc_msgSend(v82, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v160) = v84;
    _os_log_impl(&dword_1C3607000, v83, OS_LOG_TYPE_INFO, "Found %i realtime wallet orders", buf, 8u);
  }

  objc_msgSend(v28, "setWalletOrders:", v82);
  objc_msgSend(*(id *)(a1 + 32), "realtimeWalletPassesFromEntity:enrichments:", v135, v128);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  sgLogHandle();
  v86 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
  {
    v121 = objc_msgSend(v85, "count");
    *(_DWORD *)buf = 134217984;
    v160 = v121;
    _os_log_debug_impl(&dword_1C3607000, v86, OS_LOG_TYPE_DEBUG, "Found %tu realtime wallet passes", buf, 0xCu);
  }

  objc_msgSend(v28, "setWalletPasses:", v85);
  if (*(_QWORD *)(a1 + 136))
  {
    sgLogHandle();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v87, OS_LOG_TYPE_INFO, "Getting realtime contacts for dissected entity", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "realtimeContactsFromEntity:enrichments:sourceTextMessage:store:", v135, v128, v4, v136);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    sgLogHandle();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      v90 = objc_msgSend(v88, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v160) = v90;
      _os_log_impl(&dword_1C3607000, v89, OS_LOG_TYPE_INFO, "Found %i realtime contacts", buf, 8u);
    }

    objc_msgSend(v28, "setContacts:", v88);
  }
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v91 = v128;
  v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v137, v163, 16);
  if (v92)
  {
    v93 = v92;
    v94 = 0;
    v95 = *(_QWORD *)v138;
    v132 = *(_QWORD *)v138;
    do
    {
      for (j = 0; j != v93; ++j)
      {
        if (*(_QWORD *)v138 != v95)
          objc_enumerationMutation(v91);
        v97 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * j);
        objc_msgSend(v97, "duplicateKey");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = (objc_msgSend(v98, "entityType") != 22) | v94;

        if ((v99 & 1) != 0)
        {
          objc_msgSend(v97, "duplicateKey");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "entityType");
          IsDelivery = SGEntityTypeIsDelivery();

          if (!IsDelivery)
            continue;
          objc_msgSend(MEMORY[0x1E0D197D0], "deliveryForEntity:store:", v97, v136);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "deliveries");
          v103 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v103)
            objc_msgSend(v28, "setDeliveries:", MEMORY[0x1E0C9AA60]);
          objc_msgSend(v28, "deliveries");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = (void *)objc_msgSend(v104, "mutableCopy");

          if ((objc_msgSend(v105, "containsObject:", v102) & 1) == 0 && v102)
            objc_msgSend(v105, "addObject:", v102);
          objc_msgSend(v28, "setDeliveries:", v105);
        }
        else
        {
          v106 = (void *)MEMORY[0x1E0D198C8];
          objc_msgSend(v97, "duplicateKey");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "originForDuplicateKey:entity:parent:store:", v107, v97, v135, v136);
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v102)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v134 + 128), *(_QWORD *)(v134 + 32), CFSTR("SGDSuggestManager+RealtimeDonations.m"), 605, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

          }
          v108 = v93;
          v109 = v91;
          +[SGStorageReminder storageReminderFromEntity:origin:](SGStorageReminder, "storageReminderFromEntity:origin:", v97, v102);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "toReminder");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          sgRemindersLogHandle();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            -[SGEntity loggingIdentifier](v135, "loggingIdentifier");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "loggingIdentifier");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v160 = (uint64_t)v112;
            v161 = 2112;
            v162 = v113;
            _os_log_impl(&dword_1C3607000, v111, OS_LOG_TYPE_DEFAULT, "Entity %@ -> SGReminder %@", buf, 0x16u);

          }
          +[SGRemindersAdapter constructNotesForReminder:](SGRemindersAdapter, "constructNotesForReminder:", v105);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19908]), "initWithReminder:notes:", v110, v114);
          v158 = v115;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v158, 1);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v133;
          objc_msgSend(v133, "setReminders:", v116);

          v91 = v109;
          v95 = v132;
          v93 = v108;
          v94 = 1;
        }

      }
      v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v137, v163, 16);
    }
    while (v93);
  }

  v118 = v28;
  v119 = v28;
  v19 = v135;
  v3 = v126;
  v4 = v127;
LABEL_99:

  return v118;
}

id __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  int v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  void *v42;
  id v44[6];
  id v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, void *);
  void *v50;
  uint64_t v51;
  id v52;
  char v53;
  char v54;
  uint8_t buf[4];
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v56 = objc_msgSend(v3, "suggestionsCount");
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEFAULT, "SGDSuggestManager: validating cached results %tu", buf, 0xCu);
  }

  if (!objc_msgSend(v3, "suggestionsCount"))
  {
    v10 = v3;
    goto LABEL_30;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "clientIsMail") ^ 1;
  objc_msgSend(v3, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = mach_absolute_time() - *(_QWORD *)(a1 + 64);
  if (SGMachTimeToNanoseconds_onceToken != -1)
    dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_13797);
  +[SGAggregateLogging contactsSuggested:withElapsedTime:inApp:](SGAggregateLogging, "contactsSuggested:withElapsedTime:inApp:", v6, v7 * SGMachTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_1ED52979C, v5);

  objc_msgSend(v3, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = mach_absolute_time() - *(_QWORD *)(a1 + 64);
  if (SGMachTimeToNanoseconds_onceToken != -1)
    dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_13797);
  +[SGAggregateLogging eventsSuggested:withElapsedTime:inApp:](SGAggregateLogging, "eventsSuggested:withElapsedTime:inApp:", v8, v9 * SGMachTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_1ED52979C, v5);

  v10 = (id)objc_msgSend(v3, "copy");
  objc_msgSend(v3, "contacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C809B0];
  v47 = MEMORY[0x1E0C809B0];
  v48 = 3221225472;
  v49 = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_80;
  v50 = &unk_1E7DAE2B0;
  v53 = *(_BYTE *)(a1 + 80);
  v13 = *(id *)(a1 + 40);
  v54 = *(_BYTE *)(a1 + 81);
  v51 = *(_QWORD *)(a1 + 32);
  v52 = v13;
  sgFilter();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContacts:", v14);

  v15 = (void *)objc_opt_new();
  objc_msgSend(v3, "events");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v12;
  v44[2] = (id)3221225472;
  v44[3] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_83;
  v44[4] = &unk_1E7DAE2D8;
  v46 = *(_BYTE *)(a1 + 81);
  v44[5] = *(id *)(a1 + 32);
  v17 = v15;
  v45 = v17;
  sgFilter();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEvents:", v18);

  objc_msgSend(v10, "events");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "count") || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    goto LABEL_19;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    +[SGMailClientUtil sharedInstance](SGMailClientUtil, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "messageId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = 0;
    v25 = objc_msgSend(v22, "verifyDKIMSignatureForMailWithIdentifier:error:", v24, v44);
    v19 = v44[0];

    if (v25)
    {
      objc_msgSend(v10, "setEvents:", MEMORY[0x1E0C9AA60]);
      sgEventsLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = (uint64_t)v19;
        v27 = "SGSuggestManager validateResultsvalidateResults: DKIM verification resulted in failure: %@";
        v28 = v26;
        v29 = 12;
LABEL_17:
        _os_log_impl(&dword_1C3607000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
      }
    }
    else
    {
      sgEventsLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v27 = "SGSuggestManager validateResultsvalidateResults: Successfully verified DKIM signature.";
        v28 = v26;
        v29 = 2;
        goto LABEL_17;
      }
    }

LABEL_19:
  }
  v30 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v10, "events");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "clientIsMessages"))
  {
    sgFilter();
    v32 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v32;
  }
  +[SGAggregateLogging suggestionImpressionsViaBanner:](SGAggregateLogging, "suggestionImpressionsViaBanner:", objc_msgSend(v3, "suggestionsCount"));
  +[SGAggregateLogging eventSuggestionImpressionsViaBanner:](SGAggregateLogging, "eventSuggestionImpressionsViaBanner:", objc_msgSend(v31, "count"));
  objc_msgSend(v10, "contacts");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGAggregateLogging contactSuggestionImpressionsViaBanner:](SGAggregateLogging, "contactSuggestionImpressionsViaBanner:", objc_msgSend(v33, "count"));

  +[SGAggregateLogging suggestionImpressionsViaBannerSuppressed:](SGAggregateLogging, "suggestionImpressionsViaBannerSuppressed:", objc_msgSend(v3, "suggestionsCount") - objc_msgSend(v10, "suggestionsCount"));
  v34 = (void *)MEMORY[0x1E0D19950];
  objc_msgSend(v10, "contacts");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v35)
    v37 = v35;
  else
    v37 = (uint64_t)v30;
  if (v31)
    v30 = v31;
  v38 = objc_msgSend(*(id *)(a1 + 32), "clientIsMail");
  v39 = (_QWORD *)MEMORY[0x1E0D19AF8];
  if (!v38)
    v39 = (_QWORD *)MEMORY[0x1E0D19B00];
  objc_msgSend(v34, "recordBannerShownWithContacts:events:inApp:", v37, v30, *v39);

  v40 = *(void **)(a1 + 32);
  objc_msgSend(v3, "reminders");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "filterRealtimeReminders:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setReminders:", v42);

LABEL_30:
  return v10;
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2_91(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3_95(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_80(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "senderIsBusinessChat");

  }
  else
  {
    v5 = 0;
  }
  if (*(_BYTE *)(a1 + 49))
  {
    +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isValidSuggestion:", v3) ^ 1;

  }
  else
  {
    v7 = 0;
  }
  if (*(_BYTE *)(a1 + 48)
    || (objc_msgSend(*(id *)(a1 + 32), "harvestStore"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "realtimeContactIsSignificantOrSignificanceIsDisabled:", v3),
        v8,
        v9))
  {
    v9 = 1;
    +[SGAggregateLogging hypotheticalSuggestionImpressionsIncludingActedOn:](SGAggregateLogging, "hypotheticalSuggestionImpressionsIncludingActedOn:", 1);
  }
  if (!v7)
  {
    +[SGAggregateLogging hypotheticalContactSuggestionImpressionsIncludingInsignificant:](SGAggregateLogging, "hypotheticalContactSuggestionImpressionsIncludingInsignificant:", 1);
    if (!v5)
      goto LABEL_19;
    goto LABEL_16;
  }
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "filtering out suggestion that has already been acted on according to history", buf, 2u);
  }

  if (v5)
  {
LABEL_16:
    sgLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v13 = 0;
      _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "filtering out suggestion for business chat text", v13, 2u);
    }

  }
LABEL_19:

  return v9 & ((v7 | v5) ^ 1u);
}

uint64_t __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v22[16];

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    +[SGSuggestHistory sharedSuggestHistory](SGSuggestHistory, "sharedSuggestHistory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isValidSuggestion:", v3) ^ 1;

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isNaturalLanguageEvent")
    && objc_msgSend(MEMORY[0x1E0D198F0], "onlyShowSignificantNLEvents"))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "clientIsMessages");

    if ((v7 & 1) != 0)
    {
      LODWORD(v8) = 1;
      goto LABEL_10;
    }
    objc_msgSend(v3, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = ((unint64_t)objc_msgSend(v6, "naturalLanguageEventAttributes") >> 8) & 1;
  }
  else
  {
    LODWORD(v8) = 1;
  }

LABEL_10:
  objc_msgSend(v3, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v3, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "opaqueKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "containsObject:", v12);

    v13 = *(void **)(a1 + 40);
    objc_msgSend(v3, "event");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "opaqueKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

    v16 = v10 ^ 1;
    if ((_DWORD)v8)
      goto LABEL_12;
  }
  else
  {
    v16 = 1;
    if ((_DWORD)v8)
    {
LABEL_12:
      +[SGAggregateLogging hypotheticalSuggestionImpressionsIncludingActedOn:](SGAggregateLogging, "hypotheticalSuggestionImpressionsIncludingActedOn:", 1);
      if ((v5 & 1) == 0)
        goto LABEL_21;
      goto LABEL_16;
    }
  }
  if (v5)
  {
LABEL_16:
    sgLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v22 = 0;
      _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "filtering out suggestion that has already been acted on according to history", v22, 2u);
    }

    goto LABEL_21;
  }
  objc_msgSend(v3, "event");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0D198B8];
    objc_msgSend(v3, "event");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "recordInteractionForEventWithInterface:actionType:harvestedSGEvent:curatedEKEvent:", 0, 2, v20, 0);

  }
LABEL_21:

  return v8 & ~v5 & v16;
}

uint64_t __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_87(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNaturalLanguageEvent") ^ 1;

  return v3;
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_52(id *a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  if (kSGDPluginNameURLPlugin_block_invoke__pasOnceToken24 != -1)
    dispatch_once(&kSGDPluginNameURLPlugin_block_invoke__pasOnceToken24, &__block_literal_global_54_17808);
  v2 = kSGDPluginNameURLPlugin_block_invoke__pasExprOnceResult;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3;
  block[3] = &unk_1E7DB7800;
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  dispatch_async(v2, block);

}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_60(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "harvestStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1C3BD4F6C]();
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 40), "duplicateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithObjects:", v6, 0);

  objc_autoreleasePoolPop(v3);
  objc_msgSend(v2, "markMessagesLost:", v7);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2_62(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

intptr_t __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3_63(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = *(id *)(a1 + 32);
  v3 = dispatch_time(0, 20000000000);
  v4 = dispatch_group_wait(v2, v3);

  if (v4)
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "Timed out waiting for async realtime harvest work", v7, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "endHarvest");
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[SGDPluginManager sharedInstance](SGDPluginManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "processSearchableItem:harvestMetrics:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "Plugins finished processing message: %@", (uint8_t *)&v6, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke_2_53()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "_suggestionsFromMessage-plugins", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)kSGDPluginNameURLPlugin_block_invoke__pasExprOnceResult;
  kSGDPluginNameURLPlugin_block_invoke__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __196__SGDSuggestManager_RealtimeDonations__realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SGSqlEntityStore sqlStoreInMemory](SGSqlEntityStore, "sqlStoreInMemory");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__inMemoryStore;
  realtimeSuggestionsForMailOrMessageWithHash_options_completion_completionDelivery_providedBy_searchableItem_dissectIfNecessary_processingType_isTextMessage__inMemoryStore = v0;

}

SGTextMessage *__128__SGDSuggestManager_RealtimeDonations___suggestionsFromMessage_options_dissectIfNecessary_completionDelivery_completionHandler___block_invoke(uint64_t a1)
{
  return -[SGTextMessage initWithSearchableItem:]([SGTextMessage alloc], "initWithSearchableItem:", *(_QWORD *)(a1 + 32));
}

void __130__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v14, "contacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "events");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidatedIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, void *, void *))(v6 + 16))(v6, v5, v7, v8, v9);

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    objc_msgSend(v14, "contacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "events");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidatedIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, void *, void *))(v10 + 16))(v10, v5, v11, v12, v13);

  }
}

void __130__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_24(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __130__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E7DAE1F8;
  v16 = *(_QWORD *)(a1 + 80);
  v12 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v7;
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_suggestionsFromMessage:options:dissectIfNecessary:completionDelivery:completionHandler:", v3, v4, 1, v5, v11);
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D19978], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishProcessingForUniqueIdentifier:", v10);

  }
}

void __130__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CFAbsoluteTime v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setMethod:", 0);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackDistributionForMessage:value:", v5, v4);

  if (!v3)
    v3 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "succeed:", v3);
  +[SGChatLengthEstimator sharedInstance](SGChatLengthEstimator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "domainIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordMessageInChat:", v8);

  objc_msgSend(*(id *)(a1 + 48), "messageHarvestQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __130__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E7DB56F0;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v9, "addOperationWithBlock:", v10);

}

uint64_t __130__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_completionDelivery_completionHandler_fullCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "done");
}

void __93__SGDSuggestManager_RealtimeDonations__suggestionsFromMessage_options_fullCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    objc_msgSend(MEMORY[0x1E0D19998], "responseWithError:", a2);
  else
    objc_msgSend(MEMORY[0x1E0D19998], "responseWith:also:also:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

void __62__SGDSuggestManager_RealtimeDonations___emailContentCacheSalt__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(CFSTR("kSuggestionsFromEmailContentCacheSalt"), "dataUsingEncoding:", 4);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_emailContentCacheSalt__pasExprOnceResult;
  _emailContentCacheSalt__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __128__SGDSuggestManager_RealtimeDonations___suggestionsFromSearchableItem_options_dissectIfNecessary_processingType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D19990];
    objc_msgSend(a2, "combinedSuggestions");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "responseWith:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  }
}

SGSimpleMailMessage *__128__SGDSuggestManager_RealtimeDonations___suggestionsFromSearchableItem_options_dissectIfNecessary_processingType_withCompletion___block_invoke_2(uint64_t a1)
{
  return +[SGMessage messageWithSearchableItem:](SGSimpleMailMessage, "messageWithSearchableItem:", *(_QWORD *)(a1 + 32));
}

@end
