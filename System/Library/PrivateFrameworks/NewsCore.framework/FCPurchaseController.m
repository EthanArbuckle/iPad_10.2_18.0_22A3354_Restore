@implementation FCPurchaseController

- (BOOL)isPaidSubscriberFromAppStore
{
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  id *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self)
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  else
    purchaseLookupEntriesManager = 0;
  v3 = purchaseLookupEntriesManager;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__FCPurchaseController_isPaidSubscriberFromAppStore__block_invoke;
  v6[3] = &unk_1E463CC40;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (BOOL)isPaidSubscriberFromWeb
{
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  id *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self)
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  else
    purchaseLookupEntriesManager = 0;
  v3 = purchaseLookupEntriesManager;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__FCPurchaseController_isPaidSubscriberFromWeb__block_invoke;
  v6[3] = &unk_1E463CC40;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (BOOL)isPaidSubscriber
{
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  id *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self)
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  else
    purchaseLookupEntriesManager = 0;
  v3 = purchaseLookupEntriesManager;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__FCPurchaseController_isPaidSubscriber__block_invoke;
  v6[3] = &unk_1E463CC40;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (BOOL)isPaidSubscriberFromNews
{
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  id *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self)
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  else
    purchaseLookupEntriesManager = 0;
  v3 = purchaseLookupEntriesManager;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__FCPurchaseController_isPaidSubscriberFromNews__block_invoke;
  v6[3] = &unk_1E463CC40;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  char v11;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 88);
  else
    v5 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_3;
  v7[3] = &unk_1E463CCE0;
  v7[4] = a2;
  v11 = *(_BYTE *)(a1 + 64);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v6 = a2;
  objc_msgSend(v5, "enqueueBlock:", v7);

}

- (id)_allPurchasedTagIDs
{
  id v1;
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__FCPurchaseController__allPurchasedTagIDs__block_invoke;
    v5[3] = &unk_1E463CC68;
    v6 = v2;
    v3 = v2;
    -[FCPurchaseController _enumerateValidPurchasesUsingBlock:](v1, v5);
    v1 = (id)objc_msgSend(v3, "copy");

  }
  return v1;
}

- (void)_enumerateValidPurchasesUsingBlock:(void *)a1
{
  id v3;
  const char *v4;
  void *v5;
  id Property;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block != nil");
      *(_DWORD *)buf = 136315906;
      v11 = "-[FCPurchaseController _enumerateValidPurchasesUsingBlock:]";
      v12 = 2080;
      v13 = "FCPurchaseController.m";
      v14 = 1024;
      v15 = 1150;
      v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    Property = objc_getProperty(a1, v4, 64, 1);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__FCPurchaseController__enumerateValidPurchasesUsingBlock___block_invoke;
    v8[3] = &unk_1E463D068;
    v9 = v5;
    objc_msgSend(Property, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

- (id)webAccessOptedInTagIDs
{
  void *v2;
  void *v3;

  if (self)
    self = (FCPurchaseController *)self->_cloudContext;
  -[FCPurchaseController tagSettings](self, "tagSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webAccessOptedInTagIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id location;

  v3 = *(unsigned __int8 *)(a1 + 64);
  v5 = *(id **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v4, "paidBundleConfig");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "restorableBundlePurchaseIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 48);
  v9 = *(void **)(a1 + 56);
  v10 = v7;
  v11 = v8;
  v12 = v9;
  v13 = v6;
  if (v5)
  {
    objc_initWeak(&location, v5);
    v14 = v5[12];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke;
    v16[3] = &unk_1E463CFC8;
    v16[4] = v5;
    v17 = v11;
    v19 = v12;
    v20 = v13;
    objc_copyWeak(&v21, &location);
    v18 = v10;
    objc_msgSend(v14, "performEntitlementWithIgnoreCache:completion:", v3 != 0, v16);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

- (FCPurchaseController)initWithCloudContext:(id)a3 entitlementService:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  FCPurchaseController *v12;
  FCPurchaseController *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  FCKeyValueStore *v17;
  FCKeyValueStore *localStore;
  id *v19;
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *accessQueue;
  uint64_t v26;
  FCAsyncSerialQueue *entitlementQueue;
  uint64_t v28;
  NFLazy *session;
  SEL v30;
  uint64_t v31;
  NSMutableDictionary *webAccessEntriesByTagID;
  uint64_t v33;
  NSSet *purchasesDiscoveredTagIDs;
  FCKeyValueStore *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  FCWebAccessEntry *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSSet *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  SEL v62;
  void *v63;
  int v64;
  uint32_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSSet *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  FCKeyValueStore *v81;
  FCPurchaseController *v82;
  uint64_t v83;
  id obj;
  objc_super v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[3];
  _QWORD v91[3];
  uint8_t v92[4];
  const char *v93;
  __int16 v94;
  char *v95;
  __int16 v96;
  int v97;
  __int16 v98;
  void *v99;
  uint8_t buf[4];
  const char *v101;
  __int16 v102;
  char *v103;
  __int16 v104;
  int v105;
  __int16 v106;
  void *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = v7;
    v10 = v8;
    if (!self)
    {
LABEL_51:
      v13 = 0;
      goto LABEL_50;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "cloudContext != nil");
      *(_DWORD *)v92 = 136315906;
      v93 = "-[FCPurchaseController initWithCloudContext:entitlementService:]";
      v94 = 2080;
      v95 = "FCPurchaseController.m";
      v96 = 1024;
      v97 = 168;
      v98 = 2114;
      v99 = v74;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v92, 0x26u);

    }
    v11 = v8;
    if (!self)
      goto LABEL_51;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "cloudContext != nil");
      *(_DWORD *)v92 = 136315906;
      v93 = "-[FCPurchaseController initWithCloudContext:entitlementService:keyValueStoreOption:]";
      v94 = 2080;
      v95 = "FCPurchaseController.m";
      v96 = 1024;
      v97 = 178;
      v98 = 2114;
      v99 = v75;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v92, 0x26u);

    }
  }
  v85.receiver = self;
  v85.super_class = (Class)FCPurchaseController;
  v12 = -[FCPurchaseController init](&v85, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_50;
  v78 = v8;
  objc_storeStrong((id *)&v12->_cloudContext, a3);
  objc_storeStrong((id *)&v13->_entitlementService, a4);
  objc_msgSend(v7, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:", v13);

  v90[0] = CFSTR("newssubscription.subscriptions.metered_count_duration");
  v90[1] = CFSTR("newssubscription.a_la_carte_subscriptions.metered_count_maximum_limit");
  v91[0] = &unk_1E470A3B8;
  v91[1] = &unk_1E470A3B8;
  v90[2] = CFSTR("newssubscription.bundle_subscriptions.metered_count_maximum_limit");
  v91[2] = &unk_1E470A3B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 3);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)v15;
  objc_msgSend(v16, "registerDefaults:", v15);

  objc_msgSend(v7, "privateDataDirectory");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:]([FCKeyValueStore alloc], "initWithName:directory:version:options:classRegistry:", CFSTR("PurchasedChannelList"), v76, 1, 0, 0);
  localStore = v13->_localStore;
  v13->_localStore = v17;

  v19 = -[FCPurchaseLookUpEntriesManager initWithLocalStore:]([FCPurchaseLookUpEntriesManager alloc], v13->_localStore);
  purchaseLookupEntriesManager = v13->_purchaseLookupEntriesManager;
  v13->_purchaseLookupEntriesManager = (FCPurchaseLookUpEntriesManager *)v19;

  v79 = v7;
  objc_msgSend(v7, "appActivityMonitor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:", v13);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_BACKGROUND, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = dispatch_queue_create("FCPurchaseLookUpData.purchasedChannelsAccessQueue", v23);
  accessQueue = v13->_accessQueue;
  v13->_accessQueue = (OS_dispatch_queue *)v24;

  v26 = objc_opt_new();
  entitlementQueue = v13->_entitlementQueue;
  v13->_entitlementQueue = (FCAsyncSerialQueue *)v26;

  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60AD0]), "initWithConstructor:", &__block_literal_global_15);
  session = v13->_session;
  v13->_session = (NFLazy *)v28;

  objc_setProperty_atomic_copy(v13, v30, MEMORY[0x1E0C9AA70], 64);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v31 = objc_claimAutoreleasedReturnValue();
  webAccessEntriesByTagID = v13->_webAccessEntriesByTagID;
  v13->_webAccessEntriesByTagID = (NSMutableDictionary *)v31;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v33 = objc_claimAutoreleasedReturnValue();
  purchasesDiscoveredTagIDs = v13->_purchasesDiscoveredTagIDs;
  v13->_purchasesDiscoveredTagIDs = (NSSet *)v33;

  v35 = v13->_localStore;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  -[FCKeyValueStore allKeys](v35, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
  if (!v36)
    goto LABEL_43;
  v37 = v36;
  v38 = *(_QWORD *)v87;
  v81 = v35;
  v82 = v13;
  v80 = *(_QWORD *)v87;
  do
  {
    v39 = 0;
    v83 = v37;
    do
    {
      if (*(_QWORD *)v87 != v38)
        objc_enumerationMutation(obj);
      v40 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v39);
      objc_opt_class();
      -[FCKeyValueStore objectForKey:](v35, "objectForKey:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v42 = v41;
        else
          v42 = 0;
      }
      else
      {
        v42 = 0;
      }
      v43 = v42;

      if (v43)
      {
        if (!objc_msgSend(v40, "hasPrefix:", CFSTR("wa-")))
          goto LABEL_39;
        v44 = [FCWebAccessEntry alloc];
        v45 = v40;
        v46 = v43;
        v47 = v46;
        if (v44)
        {
          if (!v45 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("web access entry must have an identifier"));
            *(_DWORD *)buf = 136315906;
            v101 = "-[FCWebAccessEntry initWithEntryID:dictionaryRepresentation:]";
            v102 = 2080;
            v103 = "FCPurchaseController.m";
            v104 = 1024;
            v105 = 1829;
            v106 = 2114;
            v107 = v58;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("WebAccessEntryLastRetryAttemptTime"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("WebAccessEntryEmail"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("WebAccessEntryPurchaseReceipt"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("WebAccessEntryTagID"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("WebAccessEntryPurchaseID"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = -[FCWebAccessEntry initWithEntryID:tagID:purchaseID:lastRetryAttemptTime:email:purchaseReceipt:](v44, v45, v51, v52, v48, v49, v50);

          if (!v44)
          {
            v35 = v81;
            v13 = v82;
            v37 = v83;
            v38 = v80;
            goto LABEL_38;
          }
          v13 = v82;
          -[FCPurchaseController webAccessEntriesByTagID](v82, "webAccessEntriesByTagID");
          v45 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "setObject:forKey:", v44, v44->_tagID);
          v38 = v80;
          v35 = v81;
          v37 = v83;
        }
        else
        {

        }
      }
      else
      {
        objc_opt_class();
        -[FCKeyValueStore objectForKey:](v35, "objectForKey:", v40);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v54 = v53;
          else
            v54 = 0;
        }
        else
        {
          v54 = 0;
        }
        v44 = v54;

        if (!v44 || !objc_msgSend(v40, "isEqualToString:", CFSTR("SubscriptionsDiscoveredList")))
          goto LABEL_38;
        v55 = (void *)MEMORY[0x1E0C99E60];
        v45 = (id)-[FCWebAccessEntry copy](v44, "copy");
        objc_msgSend(v55, "setWithArray:", v45);
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = v13->_purchasesDiscoveredTagIDs;
        v13->_purchasesDiscoveredTagIDs = (NSSet *)v56;

      }
LABEL_38:

LABEL_39:
      ++v39;
    }
    while (v37 != v39);
    v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
    v37 = v59;
  }
  while (v59);
LABEL_43:

  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID]((id *)&v13->_purchaseLookupEntriesManager->super.isa);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v60, "copy");
  objc_setProperty_atomic_copy(v13, v62, v61, 64);

  v8 = v78;
  if (NFInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "BOOLForKey:", CFSTR("simulate_subscription_detection_enabled"));

    if (v64)
    {
      v65 = arc4random_uniform(5u);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (v65 <= 0x7FFFFFFE)
      {
        v67 = 0;
        do
        {
          objc_msgSend(&unk_1E470C630, "objectAtIndexedSubscript:", v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObject:", v68);

          ++v67;
        }
        while (v65 + 1 != v67);
      }
      v69 = (void *)MEMORY[0x1E0C99E60];
      v70 = (void *)objc_msgSend(v66, "copy");
      objc_msgSend(v69, "setWithArray:", v70);
      v71 = objc_claimAutoreleasedReturnValue();
      v72 = v13->_purchasesDiscoveredTagIDs;
      v13->_purchasesDiscoveredTagIDs = (NSSet *)v71;

    }
  }

  v7 = v79;
LABEL_50:

  return v13;
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id WeakRetained;
  id *v24;
  id *v25;
  id v26;
  id v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  _QWORD v39[7];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v8 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138412802;
    v41 = objc_opt_class();
    v42 = 2114;
    v43 = v6;
    v44 = 2114;
    v45 = v7;
    _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "%@ Entitlements response received with entitlements:%{public}@ error:%{public}@", buf, 0x20u);

  }
  NewsCoreUserDefaults();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "BOOLForKey:", CFSTR("running_ui_automation")))
  {
    v11 = NFInternalBuild();

    if (v11)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_138;
      v39[3] = &unk_1E463CD80;
      v12 = a1[5];
      v39[4] = v12;
      v13 = a1[7];
      v14 = a1[8];
      v39[5] = v13;
      v39[6] = v14;
      __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_138((uint64_t)v39);
      goto LABEL_19;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_140);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "entitlementsOverrideProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(a1[4], "entitlementsOverrideProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entitlementsOverrideWithDefaultEntitlements:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        objc_msgSend(v17, "entitlements");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = (uint64_t)v20;
        v42 = 2114;
        v43 = v7;
        _os_log_impl(&dword_1A1B90000, v19, OS_LOG_TYPE_DEFAULT, "Overriding entitlements response with entitlements:%{public}@ error:%{public}@", buf, 0x16u);

      }
      objc_msgSend(v17, "entitlements");
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "error");
      v22 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v21;
      v7 = (id)v22;
    }

  }
  if (v12 && (!v7 || objc_msgSend(v12, "count")))
  {
    WeakRetained = objc_loadWeakRetained(a1 + 9);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_143;
    v29[3] = &unk_1E463CFA0;
    v24 = &v30;
    v30 = a1[6];
    v25 = &v31;
    v31 = v12;
    v26 = a1[5];
    v27 = a1[4];
    v32 = v26;
    v33 = v27;
    v34 = a1[7];
    v35 = a1[8];
    FCPerformIfNonNil(WeakRetained, v29);

  }
  else
  {
    v28 = a1[5];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_142;
    block[3] = &unk_1E463CD58;
    v24 = &v37;
    v37 = a1[7];
    v25 = &v38;
    v38 = a1[8];
    dispatch_async(v28, block);
  }

  v13 = *v24;
LABEL_19:

}

- (FCEntitlementsOverrideProviderType)entitlementsOverrideProvider
{
  return self->_entitlementsOverrideProvider;
}

- (void)setEntitlementsOverrideProvider:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementsOverrideProvider, a3);
}

- (void)performEntitlementCheckWithIgnoreCache:(BOOL)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  FCCloudContext *cloudContext;
  FCCloudContext *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  BOOL v19;
  id location;
  _QWORD v21[7];

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.stocks")) & 1) != 0
    || (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0
    || NSClassFromString(CFSTR("XCTest")))
  {
    objc_initWeak(&location, self);
    if (self)
      cloudContext = self->_cloudContext;
    else
      cloudContext = 0;
    v13 = cloudContext;
    -[FCCloudContext configurationManager](v13, "configurationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_134;
    v15[3] = &unk_1E463CD30;
    objc_copyWeak(&v18, &location);
    v15[4] = self;
    v19 = a3;
    v16 = v8;
    v17 = v9;
    objc_msgSend(v14, "fetchConfigurationIfNeededWithCompletion:", v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke;
    v21[3] = &unk_1E463CCB8;
    v21[4] = self;
    v21[5] = v11;
    v21[6] = v9;
    __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke((uint64_t)v21);
  }

}

- (FCPurchaseController)init
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
    v8 = "-[FCPurchaseController init]";
    v9 = 2080;
    v10 = "FCPurchaseController.m";
    v11 = 1024;
    v12 = 162;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPurchaseController init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

id __84__FCPurchaseController_initWithCloudContext_entitlementService_keyValueStoreOption___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setNetworkServiceType:", 0);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setHTTPMaximumConnectionsPerHost:", 2 * objc_msgSend(v1, "processorCount"));

  objc_msgSend(v0, "setTimeoutIntervalForRequest:", 15.0);
  objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD v4[5];

  if (!NSClassFromString(CFSTR("XCTest")))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __31__FCPurchaseController_dealloc__block_invoke_2;
    v4[3] = &unk_1E463AB18;
    v4[4] = self;
    FCPerformBlockOnMainThread(v4);
  }
  v3.receiver = self;
  v3.super_class = (Class)FCPurchaseController;
  -[FCPurchaseController dealloc](&v3, sel_dealloc);
}

void __31__FCPurchaseController_dealloc__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  id v4;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[4];
  v3 = v2;
  objc_msgSend(v3, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (void)setPurchasesDiscoveredTagIDs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)notifyPurchaseAddedWithTagIDs:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __54__FCPurchaseController_notifyPurchaseAddedWithTagIDs___block_invoke_2;
    v5[3] = &unk_1E463AD10;
    v6 = v4;
    v7 = a1;
    FCPerformBlockOnMainThread(v5);

  }
}

void __54__FCPurchaseController_notifyPurchaseAddedWithTagIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v5 = FCPurchaseAddedTagIDsKey;
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", FCPurchaseAddedNotificationName, 0, v3);

  -[FCPurchaseController notifyPurchaseListChanged](*(_QWORD *)(a1 + 40));
}

- (void)notifyPurchaseListChanged
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __49__FCPurchaseController_notifyPurchaseListChanged__block_invoke;
    v1[3] = &unk_1E463AB18;
    v1[4] = a1;
    FCPerformBlockOnMainThread(v1);
  }
}

- (void)notifyPurchaseRemovedWithTagIDs:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (a1 && objc_msgSend(v3, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__FCPurchaseController_notifyPurchaseRemovedWithTagIDs___block_invoke_2;
    v5[3] = &unk_1E463AD10;
    v6 = v4;
    v7 = a1;
    FCPerformBlockOnMainThread(v5);

  }
}

void __56__FCPurchaseController_notifyPurchaseRemovedWithTagIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v5 = FCPurchaseRemovedTagIDsKey;
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", FCPurchaseRemovedNotificationName, 0, v3);

  -[FCPurchaseController notifyPurchaseListChanged](*(_QWORD *)(a1 + 40));
}

void __49__FCPurchaseController_notifyPurchaseListChanged__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[FCPurchaseController _allPurchasedTagIDs](*(id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = FCPurchasedTagIDsKey;
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", FCPurchaseListChangedNotificationName, 0, v2);

}

void __57__FCPurchaseController_notifyWebAccessOptedInListChanged__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", FCWebAccessOptedInListChangedNotificationName, 0);

}

- (void)notifyPurchasesDiscoveredWithTagIDs:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__FCPurchaseController_notifyPurchasesDiscoveredWithTagIDs___block_invoke;
    v5[3] = &unk_1E463AB18;
    v6 = v3;
    FCPerformBlockOnMainThread(v5);

  }
}

void __60__FCPurchaseController_notifyPurchasesDiscoveredWithTagIDs___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v4 = FCPurchasedTagIDsKey;
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", FCPurchasesDiscoveredNotificationName, 0, v2);

}

- (void)addToWebAccessOptedInListWithTagID:(id)a3
{
  FCCloudContext *cloudContext;
  id v4;
  void *v5;
  id v6;
  id v7;

  if (self)
  {
    cloudContext = self->_cloudContext;
    v4 = a3;
    -[FCCloudContext tagSettings](cloudContext, "tagSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWebAccessOptInForTagID:webAccessOptIn:", v4, 1);

    FCPerformBlockOnMainThread(&__block_literal_global_125_0);
  }
  else
  {
    v6 = a3;
    objc_msgSend(0, "tagSettings");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWebAccessOptInForTagID:webAccessOptIn:", v6, 1);

  }
}

- (void)shouldShowSignedInWithDifferentiTunesAccountAlertWithiTunesAccountName:(id)a3 iTunesAccountDSID:(id)a4 isUserSignedIntoiTunes:(BOOL)a5 isBundleSubscriber:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void (**v14)(id, uint64_t, void *, id);
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  FCKeyValueStore *localStore;
  id v22;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, uint64_t, void *, id))a7;
  -[FCPurchaseController lastSignedInItunesAccountName](self, "lastSignedInItunesAccountName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v12;
  v16 = v13;
  -[FCPurchaseController lastSignedInItunesAccountDSID]((id *)&self->super.isa);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 && a5)
  {
    -[FCPurchaseController lastSignedInItunesAccountDSID]((id *)&self->super.isa);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", v16);

    if ((v20 & 1) == 0 && (-[FCPurchaseController atleastOneValidAppStorePurchase]((uint64_t)self) || v8))
    {
      if (self)
      {
        -[FCKeyValueStore setObject:forKey:](self->_localStore, "setObject:forKey:", v16, CFSTR("LastSignedInITunesAccountDSID"));
        localStore = self->_localStore;
      }
      else
      {
        objc_msgSend(0, "setObject:forKey:", v16, CFSTR("LastSignedInITunesAccountDSID"));
        localStore = 0;
      }
      -[FCKeyValueStore setObject:forKey:](localStore, "setObject:forKey:", v22, CFSTR("LastSignedInITunesAccountName"));
      if (v14)
        v14[2](v14, 1, v15, v22);
      goto LABEL_13;
    }
  }
  else
  {

  }
  if (v14)
    v14[2](v14, 0, 0, 0);
LABEL_13:

}

- (id)lastSignedInItunesAccountDSID
{
  if (a1)
  {
    objc_msgSend(a1[6], "objectForKey:", CFSTR("LastSignedInITunesAccountDSID"));
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)atleastOneValidAppStorePurchase
{
  id *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (!a1)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v1 = (id *)*(id *)(a1 + 56);
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__FCPurchaseController_atleastOneValidAppStorePurchase__block_invoke;
  v6[3] = &unk_1E463CC40;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  v4 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)shouldShowiTunesSignedOutAlertWithiTunesAccountName:(id)a3 iTunesAccountDSID:(id)a4 isUserSignedIntoiTunes:(BOOL)a5 isBundleSubscriber:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void (**v14)(id, uint64_t, void *);
  void *v15;
  id v16;
  FCKeyValueStore *localStore;
  id v18;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, uint64_t, void *))a7;
  -[FCPurchaseController lastSignedInItunesAccountName](self, "lastSignedInItunesAccountName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12;
  v16 = v13;
  if (!v15 || a5)
  {
    if (self)
    {
      -[FCKeyValueStore setObject:forKey:](self->_localStore, "setObject:forKey:", v16, CFSTR("LastSignedInITunesAccountDSID"));
      localStore = self->_localStore;
    }
    else
    {
      objc_msgSend(0, "setObject:forKey:", v16, CFSTR("LastSignedInITunesAccountDSID"));
      localStore = 0;
    }
    -[FCKeyValueStore setObject:forKey:](localStore, "setObject:forKey:", v18, CFSTR("LastSignedInITunesAccountName"));
  }
  else if (-[FCPurchaseController atleastOneValidAppStorePurchase]((uint64_t)self) || v8)
  {
    if (v14)
      v14[2](v14, 1, v15);
    goto LABEL_12;
  }
  if (v14)
    v14[2](v14, 0, 0);
LABEL_12:

}

- (void)clearAllAppStorePurchases
{
  void *v3;
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  FCKeyValueStore *localStore;
  FCKeyValueStore *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  FCPurchaseController *v17;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  else
    purchaseLookupEntriesManager = 0;
  v5 = purchaseLookupEntriesManager;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__FCPurchaseController_clearAllAppStorePurchases__block_invoke;
  v15[3] = &unk_1E463CC18;
  v14 = v3;

  v16 = v14;
  v17 = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v15);

  -[FCPurchaseController notifyPurchaseRemovedWithTagIDs:]((uint64_t)self, v14);
  -[FCPurchaseController purchasesDiscoveredTagIDs](self, "purchasesDiscoveredTagIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_setByMinusingSet:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseController setPurchasesDiscoveredTagIDs:]((uint64_t)self, v8);

  if (self)
    localStore = self->_localStore;
  else
    localStore = 0;
  v10 = localStore;
  -[FCPurchaseController purchasesDiscoveredTagIDs](self, "purchasesDiscoveredTagIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCKeyValueStore setObject:forKey:](v10, "setObject:forKey:", v12, CFSTR("SubscriptionsDiscoveredList"));

  -[FCPurchaseController purchasesDiscoveredTagIDs](self, "purchasesDiscoveredTagIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseController notifyPurchasesDiscoveredWithTagIDs:]((uint64_t)self, v13);

}

void __49__FCPurchaseController_clearAllAppStorePurchases__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "purchaseType") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      v7 = *(_QWORD *)(v6 + 56);
    else
      v7 = 0;
    -[FCPurchaseLookUpEntriesManager removeEntry:](v7, v5);
    v8 = *(_QWORD **)(a1 + 40);
    if (v8)
      v8 = (_QWORD *)v8[7];
    v9 = v8;
    -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "copy");
    v13 = *(void **)(a1 + 40);
    if (v13)
      objc_setProperty_atomic_copy(v13, v11, v12, 64);

  }
}

- (NSString)lastSignedInItunesAccountName
{
  if (self)
    self = (FCPurchaseController *)self->_localStore;
  return (NSString *)-[FCPurchaseController objectForKey:](self, "objectForKey:", CFSTR("LastSignedInITunesAccountName"));
}

- (void)addAppStorePurchaseWithTagID:(id)a3 purchaseID:(id)a4
{
  -[FCPurchaseController addToPurchasedChannelsListWithTagID:purchaseID:purchaseType:purchaseValidationState:isNewsAppPurchase:lastVerificationTime:]((uint64_t)self, a3, a4, 1, 1, 0);
}

- (void)addToPurchasedChannelsListWithTagID:(uint64_t)a1 purchaseID:(void *)a2 purchaseType:(void *)a3 purchaseValidationState:(uint64_t)a4 isNewsAppPurchase:(char)a5 lastVerificationTime:(void *)a6
{
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v14 = a2;
  v11 = a3;
  v12 = a6;
  if (a1)
  {
    v13 = *(NSObject **)(a1 + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __147__FCPurchaseController_addToPurchasedChannelsListWithTagID_purchaseID_purchaseType_purchaseValidationState_isNewsAppPurchase_lastVerificationTime___block_invoke;
    block[3] = &unk_1E463D090;
    block[4] = a1;
    v16 = v14;
    v17 = v11;
    v18 = v12;
    v19 = a4;
    v20 = 1;
    v21 = a5;
    dispatch_sync(v13, block);

  }
}

void __40__FCPurchaseController_isPaidSubscriber__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "purchaseValidationState") == 1 || objc_msgSend(v6, "purchaseValidationState") == 3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __48__FCPurchaseController_isPaidSubscriberFromNews__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isNewsAppPurchase")
    && objc_msgSend(v6, "purchaseValidationState") == 1
    && objc_msgSend(v6, "purchaseType") == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __52__FCPurchaseController_isPaidSubscriberFromAppStore__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isNewsAppPurchase") & 1) == 0
    && objc_msgSend(v6, "purchaseValidationState") == 1
    && objc_msgSend(v6, "purchaseType") == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __47__FCPurchaseController_isPaidSubscriberFromWeb__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "purchaseValidationState") == 1 || objc_msgSend(v6, "purchaseValidationState") == 3)
    && objc_msgSend(v6, "purchaseType") == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (BOOL)hasPurchaseTypeAppStore
{
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  id *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self)
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  else
    purchaseLookupEntriesManager = 0;
  v3 = purchaseLookupEntriesManager;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__FCPurchaseController_hasPurchaseTypeAppStore__block_invoke;
  v6[3] = &unk_1E463CC40;
  v6[4] = &v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __47__FCPurchaseController_hasPurchaseTypeAppStore__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "purchaseValidationState") == 1 && objc_msgSend(v6, "purchaseType") == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (BOOL)hasRenewalNoticeShownForTagID:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  void *v7;
  char v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  v18 = 0;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__FCPurchaseController_hasRenewalNoticeShownForTagID___block_invoke;
  block[3] = &unk_1E463AD58;
  v12 = &v13;
  block[4] = self;
  v6 = v4;
  v11 = v6;
  dispatch_sync(accessQueue, block);
  v7 = (void *)v14[5];
  if (v7)
    v8 = objc_msgSend(v7, "hasShownRenewalNotice");
  else
    v8 = 0;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __54__FCPurchaseController_hasRenewalNoticeShownForTagID___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[7];
  v3 = v2;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", a1[5]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)forceExpireAllSubscriptionsIfNeeded
{
  void *v3;
  int v4;
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  void *v6;
  FCPurchaseLookUpEntriesManager *v7;
  id *v8;
  void *v9;
  const char *v10;
  void *v11;
  _QWORD v12[5];

  if (NFInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("force_expire_subscriptions"));

    if (v4)
    {
      if (self)
        purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
      else
        purchaseLookupEntriesManager = 0;
      -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID]((id *)&purchaseLookupEntriesManager->super.isa);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __59__FCPurchaseController_forceExpireAllSubscriptionsIfNeeded__block_invoke_2;
      v12[3] = &unk_1E463CC68;
      v12[4] = self;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

      if (self)
        v7 = self->_purchaseLookupEntriesManager;
      else
        v7 = 0;
      v8 = v7;
      -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "copy");
      if (self)
        objc_setProperty_atomic_copy(self, v10, v11, 64);

    }
  }
}

void __59__FCPurchaseController_forceExpireAllSubscriptionsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "setPurchaseValidationState:", 2);
  objc_msgSend(v7, "setHasShownRenewalNotice:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDateOfExpiration:", v4);

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(_QWORD *)(v5 + 56);
  else
    v6 = 0;
  -[FCPurchaseLookUpEntriesManager updateEntry:](v6, v7);

}

- (void)silentExpireInAppSubscriptions
{
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  id *v4;
  void *v5;
  FCPurchaseLookUpEntriesManager *v6;
  id *v7;
  void *v8;
  const char *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  else
    purchaseLookupEntriesManager = 0;
  v4 = purchaseLookupEntriesManager;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__FCPurchaseController_silentExpireInAppSubscriptions__block_invoke;
  v11[3] = &unk_1E463CC90;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

  if (self)
    v6 = self->_purchaseLookupEntriesManager;
  else
    v6 = 0;
  v7 = v6;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "copy");
  if (self)
    objc_setProperty_atomic_copy(self, v9, v10, 64);

  -[FCPurchaseController notifyPurchaseRemovedWithTagIDs:]((uint64_t)self, (void *)v13[5]);
  _Block_object_dispose(&v12, 8);

}

void __54__FCPurchaseController_silentExpireInAppSubscriptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "purchaseType") == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setPurchaseValidationState:", 2);
    objc_msgSend(v6, "setHasShownRenewalNotice:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDateOfExpiration:", v7);

    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v9 = *(_QWORD *)(v8 + 56);
    else
      v9 = 0;
    -[FCPurchaseLookUpEntriesManager updateEntry:](v9, v6);

  }
}

- (id)expiredPurchaseChannelIDs
{
  void *v3;
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  else
    purchaseLookupEntriesManager = 0;
  v5 = purchaseLookupEntriesManager;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__FCPurchaseController_expiredPurchaseChannelIDs__block_invoke;
  v10[3] = &unk_1E463CC68;

  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

void __49__FCPurchaseController_expiredPurchaseChannelIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "purchaseValidationState") == 2 && (objc_msgSend(v6, "hasShownRenewalNotice") & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "tagID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)subscriptionNotSupportedChannelIDs
{
  void *v3;
  FCPurchaseLookUpEntriesManager *purchaseLookupEntriesManager;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  FCPurchaseController *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    purchaseLookupEntriesManager = self->_purchaseLookupEntriesManager;
  else
    purchaseLookupEntriesManager = 0;
  v5 = purchaseLookupEntriesManager;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __58__FCPurchaseController_subscriptionNotSupportedChannelIDs__block_invoke;
  v13 = &unk_1E463CC18;
  v14 = self;

  v15 = v3;
  v7 = v3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

void __58__FCPurchaseController_subscriptionNotSupportedChannelIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "purchaseValidationState") == 4)
  {
    v5 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      v7 = objc_opt_class();
      objc_msgSend(v4, "tagID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "%@ found a purchaseLookupEntry with not supported validation state for tagID %{public}@", (uint8_t *)&v11, 0x16u);

    }
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v4, "tagID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

uint64_t __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = objc_opt_class();
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v4;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "%@ ignoring alacarte entitlement check for bundleID=%{public}@", (uint8_t *)&v7, 0x16u);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  char v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__FCPurchaseController_performEntitlementCheckWithIgnoreCache_callbackQueue_completion___block_invoke_2;
  v7[3] = &unk_1E463CD08;
  v11 = *(_BYTE *)(a1 + 64);
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  FCPerformIfNonNil(WeakRetained, v7);

}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_138(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2;
  v3[3] = &unk_1E463CD58;
  v2 = *(NSObject **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);

}

uint64_t __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

FCSubscriptionEntitlement *__120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  FCSubscriptionEntitlement *v3;

  v2 = a2;
  v3 = -[FCSubscriptionEntitlement initWithASDEntitlement:]([FCSubscriptionEntitlement alloc], "initWithASDEntitlement:", v2);

  return v3;
}

uint64_t __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_142(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_143(uint64_t a1, void *a2)
{
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD *v17;
  id v18;
  id v19;
  FCPurchaseLookupFetchOperation *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD *v37;
  NSObject *v38;
  __int128 *v39;
  _QWORD *v40;
  _QWORD *v41;
  __int128 *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[4];
  id v54;
  __int128 *p_buf;
  _QWORD v56[4];
  _QWORD *v57;
  __int128 v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  __int128 buf;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  objc_msgSend(v3, "allPurchasedTagIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "allPurchasedTagIDs:%@", (uint8_t *)&buf, 0xCu);
    v6 = FCPurchaseLog;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "restorableBundleIAPs:%@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__10;
  v66 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v67 = (id)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_144;
  v53[3] = &unk_1E463CDE8;
  v8 = *(void **)(a1 + 40);
  v54 = *(id *)(a1 + 32);
  p_buf = &buf;
  objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v53);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v58) = 138412290;
    *(_QWORD *)((char *)&v58 + 4) = v9;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "entitled PurchaseIDs:%@", (uint8_t *)&v58, 0xCu);
  }
  *(_QWORD *)&v58 = 0;
  *((_QWORD *)&v58 + 1) = &v58;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__10;
  v61 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v62 = (id)objc_claimAutoreleasedReturnValue();
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__10;
  v51[4] = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__10;
  v49[4] = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__10;
  v47[4] = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__10;
  v45[4] = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v46 = v11;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_146;
  v34[3] = &unk_1E463CF28;
  v13 = *(void **)(a1 + 48);
  v34[4] = *(_QWORD *)(a1 + 56);
  v39 = &v58;
  v40 = v47;
  v14 = v9;
  v35 = v14;
  v41 = v49;
  v15 = v5;
  v36 = v15;
  v37 = v3;
  v42 = &buf;
  v43 = v45;
  v44 = v51;
  v16 = v4;
  v38 = v16;
  v17 = v34;
  if (v3)
  {
    v18 = v13;
    v19 = v14;
    v20 = -[FCPurchaseLookupFetchOperation initWithPurchaseIDs:contentContext:]([FCPurchaseLookupFetchOperation alloc], "initWithPurchaseIDs:contentContext:", v19, v3[4]);

    -[FCOperation setQualityOfService:](v20, "setQualityOfService:", 25);
    -[FCOperation setRelativePriority:](v20, "setRelativePriority:", 1);
    -[FCFetchOperation setFetchCompletionQueue:](v20, "setFetchCompletionQueue:", v18);

    v56[0] = v12;
    v56[1] = 3221225472;
    v56[2] = __79__FCPurchaseController_fetchChannelIDsForPurchaseIDs_callbackQueue_completion___block_invoke;
    v56[3] = &unk_1E463B608;
    v57 = v17;
    -[FCFetchOperation setFetchCompletionBlock:](v20, "setFetchCompletionBlock:", v56);
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addOperation:", v20);

  }
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_161;
  v23[3] = &unk_1E463CF78;
  v30 = &v58;
  v31 = v51;
  v24 = v15;
  v25 = v3;
  v32 = v49;
  v26 = *(id *)(a1 + 48);
  v28 = *(id *)(a1 + 64);
  v27 = *(id *)(a1 + 40);
  v33 = v45;
  v29 = *(id *)(a1 + 72);
  v22 = v15;
  dispatch_group_notify(v16, MEMORY[0x1E0C80D38], v23);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&buf, 8);

}

id __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_144(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "inAppAdamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", v3, v5);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_146(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SEL v7;
  id Property;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  void *v31;
  __int128 v32;
  void *v33;
  __int128 v34;
  uint64_t v35;
  id v36;
  objc_class *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *log;
  _QWORD v42[5];
  id v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];
  __int128 v53;
  _BYTE buf[24];
  void *v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    Property = objc_getProperty(v4, v7, 64, 1);
    *(_QWORD *)buf = v5;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __62__FCPurchaseController_allAppStorePurchasedTagIDsByPurchaseID__block_invoke;
    v55 = &unk_1E463CC68;
    v56 = v6;
    v9 = v6;
    objc_msgSend(Property, "enumerateKeysAndObjectsUsingBlock:", buf);
    v4 = (void *)objc_msgSend(v9, "copy");

  }
  objc_msgSend(v3, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "error");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v3, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "fc_isOfflineError");

      if (v14)
      {
        v15 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
        {
          log = v15;
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v3, "error");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v39;
          *(_WORD *)&buf[22] = 2114;
          v55 = v40;
          _os_log_error_impl(&dword_1A1B90000, log, OS_LOG_TYPE_ERROR, "<%{public}@ %p> fetchChannelIDsForPurchaseIDs failed with error: %{public}@", buf, 0x20u);

        }
        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        objc_msgSend(*(id *)(a1 + 48), "allObjects", log);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectsFromArray:", v17);

      }
    }
  }
  else
  {
    objc_msgSend(v3, "channelIDsByPurchaseID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v5;
    v52[1] = 3221225472;
    v52[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_147;
    v52[3] = &unk_1E463CE38;
    v53 = *(_OWORD *)(a1 + 72);
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v52);

    v19 = *(void **)(a1 + 40);
    v48[0] = v5;
    v48[1] = 3221225472;
    v48[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_4;
    v48[3] = &unk_1E463CE88;
    v20 = v4;
    v21 = *(_QWORD *)(a1 + 72);
    v49 = v20;
    v50 = v21;
    v51 = *(_QWORD *)(a1 + 88);
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v48);

  }
  v22 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v23;
    _os_log_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_DEFAULT, "subscriptionNotSupportedTagIDs:%@", buf, 0xCu);
    v22 = FCPurchaseLog;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v24;
    _os_log_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_DEFAULT, "entitledTagIDs:%@", buf, 0xCu);
  }
  v25 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "arrayWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObjectsFromArray:", v28);

  v29 = *(_QWORD **)(a1 + 56);
  if (v29)
    v29 = (_QWORD *)v29[4];
  v30 = v29;
  objc_msgSend(v30, "tagController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v5;
  v42[1] = 3221225472;
  v42[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_151;
  v42[3] = &unk_1E463CF00;
  v32 = *(_OWORD *)(a1 + 72);
  v33 = *(void **)(a1 + 64);
  v42[4] = *(_QWORD *)(a1 + 56);
  v34 = *(_OWORD *)(a1 + 96);
  v44 = v32;
  v45 = v34;
  v35 = *(_QWORD *)(a1 + 112);
  v46 = *(_QWORD *)(a1 + 88);
  v47 = v35;
  v36 = v33;

  v43 = v36;
  objc_msgSend(v31, "fetchTagsForTagIDs:maximumCachedAge:qualityOfService:completionHandler:", v27, 9, v42, 0.0);

}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_147(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_3_148;
  v7[3] = &unk_1E463CE10;
  v9 = *(_OWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_3_148(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKey:", a1[4], v4);

}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5[1] = 3221225472;
    v5[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_5;
    v5[3] = &unk_1E463CE60;
    v6 = *(_OWORD *)(a1 + 40);
    v4 = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
    v3 = v4;
  }

}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v3);

}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_151(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_152;
  v9[3] = &unk_1E463CED8;
  v4 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v4;
  v5 = *(_OWORD *)(a1 + 72);
  v13 = *(_OWORD *)(a1 + 56);
  v14 = v5;
  v8 = *(_OWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 88);
  v6 = (id)v8;
  v12 = v8;
  v7 = v3;
  FCPerformBlockOnMainThread(v9);

}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_152(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  void *v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v2 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_3_153;
  v12[3] = &unk_1E463CEB0;
  v3 = *(_OWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v12[4] = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 72);
  v13 = v3;
  v14 = v5;
  v15 = *(_OWORD *)(a1 + 88);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_157;
  v10[3] = &unk_1E463C7A0;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v6, "fc_setOfObjectsPassingTest:", v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_3_153(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  FCRestorePaidSubscriptionItem *v18;
  void *v19;
  _BYTE block[24];
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsObject:", v5))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "containsObject:", v5))
      goto LABEL_20;
    objc_msgSend(v4, "replacementID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsObject:", v6))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", v6);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "removeObject:", v7);
      v8 = *(_QWORD **)(a1 + 32);
      v19 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8)
      {
        v11 = v8[10];
        *(_QWORD *)block = MEMORY[0x1E0C809B0];
        *(_QWORD *)&block[8] = 3221225472;
        *(_QWORD *)&block[16] = __72__FCPurchaseController_silentRemoveFromPurchasedChannelsListWithTagIDs___block_invoke;
        v21 = &unk_1E463AD10;
        v22 = v8;
        v23 = v9;
        dispatch_sync(v11, block);

      }
      goto LABEL_15;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (+[FCTagController isTagAllowedInContentStoreFront:](FCTagController, "isTagAllowedInContentStoreFront:", v4)&& (objc_msgSend(v4, "isDeprecated") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "purchaseLookUpEntryForTagID:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (!v12)
    {
      v16 = FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)block = 138412546;
        *(_QWORD *)&block[4] = v5;
        *(_WORD *)&block[12] = 2112;
        *(_QWORD *)&block[14] = v6;
        _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Adding tagID:%@ and purchaseID:%@ to purchased channels list", block, 0x16u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKey:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPurchaseController addToPurchasedChannelsListWithTagID:purchaseID:purchaseType:purchaseValidationState:isNewsAppPurchase:lastVerificationTime:](*(_QWORD *)(a1 + 32), v5, v6, 1, objc_msgSend(v17, "isNewsAppPurchase"), 0);
      v18 = -[FCRestorePaidSubscriptionItem initWithChannelID:isNewsAppPurchase:]([FCRestorePaidSubscriptionItem alloc], "initWithChannelID:isNewsAppPurchase:", v5, objc_msgSend(v17, "isNewsAppPurchase"));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v18);

      goto LABEL_19;
    }
    if (objc_msgSend(v12, "purchaseValidationState") != 1)
    {
      v13 = *(_QWORD **)(a1 + 32);
      v14 = v7;
      v10 = v14;
      if (v13)
      {
        v15 = v13[10];
        *(_QWORD *)block = MEMORY[0x1E0C809B0];
        *(_QWORD *)&block[8] = 3221225472;
        *(_QWORD *)&block[16] = __64__FCPurchaseController_updatePurchaseEntryToValid_purchaseType___block_invoke;
        v21 = &unk_1E463D0E0;
        v23 = v13;
        v24 = 1;
        v22 = v14;
        dispatch_sync(v15, block);

      }
LABEL_15:

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", v5);
LABEL_20:

}

BOOL __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_157(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_161(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  _QWORD v50[5];
  _QWORD v51[5];
  __int128 buf;
  void (*v53)(uint64_t, void *, void *);
  void *v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayByRemovingObjectsInArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "restoredChannelIDs:%@", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_arrayByRemovingObjectsInArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD **)(a1 + 40);
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = (void *)v8[4];
    v11 = v7;
    objc_msgSend(v10, "tagController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v9;
    *((_QWORD *)&buf + 1) = 3221225472;
    v53 = __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke;
    v54 = &unk_1E463D040;
    v55 = v8;
    objc_msgSend(v12, "fetchTagsForTagIDs:qualityOfService:callbackQueue:completionHandler:", v11, 9, MEMORY[0x1E0C80D38], &buf);

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "purchasesDiscoveredTagIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v15);

  objc_msgSend(v13, "addObjectsFromArray:", v7);
  -[FCPurchaseController setPurchasesDiscoveredTagIDs:](*(_QWORD *)(a1 + 40), v13);
  v16 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(void **)(a1 + 40);
    v18 = v16;
    objc_msgSend(v17, "purchasesDiscoveredTagIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v19;
    _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "purchasesDiscoveredTagIDs:%@", (uint8_t *)&buf, 0xCu);

  }
  v20 = *(_QWORD **)(a1 + 40);
  if (v20)
    v21 = (void *)v20[6];
  else
    v21 = 0;
  v22 = v21;
  objc_msgSend(v20, "purchasesDiscoveredTagIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v24, CFSTR("SubscriptionsDiscoveredList"));

  objc_msgSend(*(id *)(a1 + 40), "purchasesDiscoveredTagIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    v27 = *(void **)(a1 + 40);
    objc_msgSend(v27, "purchasesDiscoveredTagIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPurchaseController notifyPurchasesDiscoveredWithTagIDs:]((uint64_t)v27, v28);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v9;
  v51[1] = 3221225472;
  v51[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_162;
  v51[3] = &unk_1E463C690;
  v51[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v29, "enumerateObjectsUsingBlock:", v51);

  v30 = *(_QWORD *)(a1 + 40);
  if (v30)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id *)*(id *)(v30 + 56);
    -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    *(_QWORD *)&buf = v9;
    *((_QWORD *)&buf + 1) = 3221225472;
    v53 = __50__FCPurchaseController_allAppStorePurchasedTagIDs__block_invoke;
    v54 = &unk_1E463CC68;
    v35 = v31;

    v55 = v35;
    objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", &buf);

  }
  else
  {
    v35 = 0;
  }
  objc_msgSend(v35, "allObjects");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "allObjects");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "fc_arrayByRemovingObjectsInArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "allObjects");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "fc_arrayByRemovingObjectsInArray:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v40;
    _os_log_impl(&dword_1A1B90000, v41, OS_LOG_TYPE_DEFAULT, "expiredPurchaseIDs:%@", (uint8_t *)&buf, 0xCu);
  }
  v50[0] = v9;
  v50[1] = 3221225472;
  v50[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_163;
  v50[3] = &unk_1E463C690;
  v50[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v40, "enumerateObjectsUsingBlock:", v50);
  v42 = *(NSObject **)(a1 + 48);
  v45[0] = v9;
  v45[1] = 3221225472;
  v45[2] = __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_164;
  v45[3] = &unk_1E463CF50;
  v47 = *(id *)(a1 + 64);
  v43 = *(id *)(a1 + 56);
  v44 = *(_QWORD *)(a1 + 104);
  v46 = v43;
  v49 = v44;
  v48 = *(id *)(a1 + 72);
  dispatch_async(v42, v45);

}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_162(uint64_t a1, void *a2)
{
  uint64_t v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(id **)(v3 + 56);
  else
    v4 = 0;
  v5 = a2;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  if (v8)
  {
    v9 = *(NSObject **)(v8 + 80);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__FCPurchaseController_updatePurchaseEntryToSubscriptionNotSupported___block_invoke;
    block[3] = &unk_1E463AD10;
    v12 = v10;
    v13 = v8;
    dispatch_sync(v9, block);

  }
}

void __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_163(uint64_t a1, void *a2)
{
  uint64_t v3;
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(id **)(v3 + 56);
  else
    v4 = 0;
  v5 = a2;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "updatePurchaseEntryToExpired:", v11);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v8 = *(void **)(v7 + 32);
    v9 = v5;
    objc_msgSend(v8, "tagSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWebAccessOptInForTagID:webAccessOptIn:", v9, 0);

    FCPerformBlockOnMainThread(&__block_literal_global_125_0);
  }

}

uint64_t __120__FCPurchaseController__entitlementCheckWithIgnoreCache_restorableBundleIAPs_callbackQueue_completion_serialCompletion___block_invoke_2_164(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1[5];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Couldn't add the subscriptions detected channels to favorites"));
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCPurchaseController addAppStoreDiscoveredChannelsToFavorites:]_block_invoke";
      v11 = 2080;
      v12 = "FCPurchaseController.m";
      v13 = 1024;
      v14 = 1035;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke_168;
    v8[3] = &unk_1E463D018;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  }

}

void __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke_168(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[4];
  v6 = v5;
  objc_msgSend(v6, "subscriptionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke_2;
  v9[3] = &unk_1E463CFF0;
  v9[4] = *(_QWORD *)(a1 + 32);

  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "subscriptionsWithCompletion:", v9);

}

void __65__FCPurchaseController_addAppStoreDiscoveredChannelsToFavorites___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  char v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[4];
  v3 = v2;
  objc_msgSend(v3, "subscriptionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasSubscriptionToTag:", *(_QWORD *)(a1 + 40));

  if ((v5 & 1) == 0)
  {
    v6 = *(_QWORD **)(a1 + 32);
    if (v6)
      v6 = (_QWORD *)v6[4];
    v7 = v6;
    objc_msgSend(v7, "subscriptionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v11 = 0;
    objc_msgSend(v8, "addSubscriptionToTag:error:", v9, &v11);
    v10 = v11;

  }
}

void __79__FCPurchaseController_fetchChannelIDsForPurchaseIDs_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "fetchedObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (NSDictionary)purchaseLookUpEntriesByTagID
{
  if (self)
    self = (FCPurchaseController *)objc_getProperty(self, a2, 64, 1);
  return (NSDictionary *)(id)-[FCPurchaseController copy](self, "copy");
}

- (id)purchaseLookUpEntryForTagID:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  void *v7;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 64, 1);
  else
    Property = 0;
  objc_msgSend(Property, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __62__FCPurchaseController_allAppStorePurchasedTagIDsByPurchaseID__block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v14;

  v14 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "purchaseType") == 1 && objc_msgSend(v5, "purchaseValidationState") == 1)
  {
    objc_msgSend(v5, "purchaseID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v5, "purchaseID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        objc_msgSend(v7, "addObjectsFromArray:", v10);
      v11 = *(void **)(a1 + 32);
      v12 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v5, "purchaseID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, v13);

    }
  }

}

- (NSSet)allTagIDs
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  if (self)
    self = (FCPurchaseController *)objc_getProperty(self, a2, 64, 1);
  -[FCPurchaseController allKeys](self, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

uint64_t __43__FCPurchaseController__allPurchasedTagIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (NSSet)allPurchaseIDs
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__FCPurchaseController_allPurchaseIDs__block_invoke;
  v6[3] = &unk_1E463CC68;
  v4 = v3;
  v7 = v4;
  -[FCPurchaseController _enumerateValidPurchasesUsingBlock:](self, v6);

  return (NSSet *)v4;
}

void __38__FCPurchaseController_allPurchaseIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "purchaseType") == 1 && objc_msgSend(v6, "purchaseValidationState") == 1)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "purchaseID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __59__FCPurchaseController__enumerateValidPurchasesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "purchaseValidationState") == 1 || objc_msgSend(v5, "purchaseValidationState") == 3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__FCPurchaseController_allAppStorePurchasedTagIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "purchaseValidationState") == 1 && objc_msgSend(v5, "purchaseType") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (BOOL)isTagIDPurchased:(id)a3
{
  void *v3;
  BOOL v4;

  -[FCPurchaseController purchaseLookUpEntryForTagID:](self, "purchaseLookUpEntryForTagID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "purchaseValidationState") == 1 || objc_msgSend(v3, "purchaseValidationState") == 3;

  return v4;
}

- (BOOL)isTagPurchased:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "tagType") == 3)
  {
    objc_msgSend(v4, "asSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "parentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v7 = -[FCPurchaseController isTagIDPurchased:](self, "isTagIDPurchased:", v6);
  return v7;
}

void __55__FCPurchaseController_atleastOneValidAppStorePurchase__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  BOOL v7;
  id v8;

  v6 = a3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
    v8 = v6;
    v7 = objc_msgSend(v6, "purchaseType") == 1;
    v6 = v8;
    if (v7)
    {
      v7 = objc_msgSend(v8, "purchaseValidationState") == 1;
      v6 = v8;
      if (v7)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }

}

void __147__FCPurchaseController_addToPurchasedChannelsListWithTagID_purchaseID_purchaseType_purchaseValidationState_isNewsAppPurchase_lastVerificationTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  id *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 56);
  else
    v3 = 0;
  -[FCPurchaseLookUpEntriesManager addEntryWithTagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purchaseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:](v3, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 80), 0, 0);
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[7];
  v5 = v4;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "copy");
  v9 = *(void **)(a1 + 32);
  if (v9)
    objc_setProperty_atomic_copy(v9, v7, v8, 64);

  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *(_QWORD *)(a1 + 40), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseController notifyPurchaseAddedWithTagIDs:](v10, v11);

}

- (void)renewalNoticeShownForPurchasedChannelsListWithTagIDs:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  FCPurchaseController *v9;

  v4 = a3;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__FCPurchaseController_renewalNoticeShownForPurchasedChannelsListWithTagIDs___block_invoke;
  block[3] = &unk_1E463AD10;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

uint64_t __77__FCPurchaseController_renewalNoticeShownForPurchasedChannelsListWithTagIDs___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__FCPurchaseController_renewalNoticeShownForPurchasedChannelsListWithTagIDs___block_invoke_2;
  v3[3] = &unk_1E463D0B8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

void __77__FCPurchaseController_renewalNoticeShownForPurchasedChannelsListWithTagIDs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(id **)(v3 + 56);
  else
    v4 = 0;
  v5 = a2;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v7, "mutableCopy");
  v8 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setHasShownRenewalNotice:", 1);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(_QWORD *)(v9 + 56);
    else
      v10 = 0;
    -[FCPurchaseLookUpEntriesManager updateEntry:](v10, v11);
    v8 = v11;
  }

}

- (void)updatePurchaseEntryToExpiredForTagIDs:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__FCPurchaseController_updatePurchaseEntryToExpiredForTagIDs___block_invoke;
  v3[3] = &unk_1E463D0B8;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

void __62__FCPurchaseController_updatePurchaseEntryToExpiredForTagIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "purchaseLookUpEntryForTagID:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updatePurchaseEntryToExpired:", v3);

}

- (void)updatePurchaseEntryToExpired:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  FCPurchaseController *v9;
  char v10;

  v4 = a3;
  if (self)
  {
    accessQueue = self->_accessQueue;
    block[1] = 3221225472;
    block[2] = __75__FCPurchaseController_updatePurchaseEntryToExpired_hasShownRenewalNotice___block_invoke;
    block[3] = &unk_1E463B200;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v10 = 0;
    v8 = v4;
    v9 = self;
    dispatch_sync(accessQueue, block);

    v4 = v6;
  }

}

void __75__FCPurchaseController_updatePurchaseEntryToExpired_hasShownRenewalNotice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v16 = (id)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v16, "setPurchaseValidationState:", 2);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDateOfExpiration:", v3);

    objc_msgSend(v16, "setHasShownRenewalNotice:", *(unsigned __int8 *)(a1 + 48));
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      v5 = *(_QWORD *)(v4 + 56);
    else
      v5 = 0;
    -[FCPurchaseLookUpEntriesManager updateEntry:](v5, v16);
    v6 = *(_QWORD **)(a1 + 40);
    if (v6)
      v6 = (_QWORD *)v6[7];
    v7 = v6;
    -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "copy");
    v11 = *(void **)(a1 + 40);
    if (v11)
      objc_setProperty_atomic_copy(v11, v9, v10, 64);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "tagID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObjects:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPurchaseController notifyPurchaseRemovedWithTagIDs:](v13, v15);

  }
}

void __70__FCPurchaseController_updatePurchaseEntryToSubscriptionNotSupported___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setPurchaseValidationState:", 4);
  v2 = *(_QWORD **)(a1 + 40);
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = *(void **)(a1 + 32);
  v4 = v2;
  objc_msgSend(v3, "dictionaryRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

void __64__FCPurchaseController_updatePurchaseEntryToValid_purchaseType___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "setPurchaseValidationState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setPurchaseType:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setHasShownRenewalNotice:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDateOfExpiration:", 0);
  v2 = *(_QWORD **)(a1 + 40);
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = *(void **)(a1 + 32);
  v4 = v2;
  objc_msgSend(v3, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "tagID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObjects:", v10, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseController notifyPurchaseAddedWithTagIDs:](v8, v9);

}

- (void)removeFromPurchasedChannelsListWithTagIDs:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__FCPurchaseController_removeFromPurchasedChannelsListWithTagIDs___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __66__FCPurchaseController_removeFromPurchasedChannelsListWithTagIDs___block_invoke(uint64_t a1)
{
  return -[FCPurchaseController _removeFromPurchasedChannelsListWithTagIDs:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (uint64_t)_removeFromPurchasedChannelsListWithTagIDs:(uint64_t)result
{
  _QWORD v2[5];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __67__FCPurchaseController__removeFromPurchasedChannelsListWithTagIDs___block_invoke;
    v2[3] = &unk_1E463D0B8;
    v2[4] = result;
    return objc_msgSend(a2, "enumerateObjectsUsingBlock:", v2);
  }
  return result;
}

uint64_t __72__FCPurchaseController_silentRemoveFromPurchasedChannelsListWithTagIDs___block_invoke(uint64_t a1)
{
  return -[FCPurchaseController _removeFromPurchasedChannelsListWithTagIDs:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __67__FCPurchaseController__removeFromPurchasedChannelsListWithTagIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  id *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(_QWORD *)(v3 + 56);
  else
    v4 = 0;
  v5 = a2;
  -[FCPurchaseLookUpEntriesManager removeEntryForTagID:](v4, v5);
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[7];
  v7 = v6;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "copy");
  v11 = *(void **)(a1 + 32);
  if (v11)
    objc_setProperty_atomic_copy(v11, v9, v10, 64);

  v12 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v5, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[FCPurchaseController notifyPurchaseRemovedWithTagIDs:](v12, v13);
}

- (void)removeFromPurchasesDiscoveredList:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__FCPurchaseController_removeFromPurchasesDiscoveredList_completion___block_invoke;
  block[3] = &unk_1E463CCB8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

uint64_t __69__FCPurchaseController_removeFromPurchasesDiscoveredList_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "purchasesDiscoveredTagIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_setByMinusingSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseController setPurchasesDiscoveredTagIDs:](*(_QWORD *)(a1 + 32), v4);

  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v6 = (void *)v5[6];
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v5, "purchasesDiscoveredTagIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("SubscriptionsDiscoveredList"));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeWebPurchaseForTagID:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  FCCloudContext *cloudContext;
  id v6;
  id v7;

  v4 = a4;
  if (self)
    cloudContext = self->_cloudContext;
  else
    cloudContext = 0;
  v6 = a3;
  -[FCCloudContext tagSettings](cloudContext, "tagSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessTokenForTagID:accessToken:userInitiated:", v6, 0, v4);

}

void __67__FCPurchaseController_cleanupExpiredPurchaseLookupEntriesIfNeeded__block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  uint64_t v4;
  _QWORD *v5;
  id *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  Property = *(id *)(a1 + 32);
  if (Property)
  {
    Property = objc_getProperty(Property, a2, 64, 1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__FCPurchaseController_cleanupExpiredPurchaseLookupEntriesIfNeeded__block_invoke_2;
  v11[3] = &unk_1E463CC68;
  v11[4] = v4;
  objc_msgSend(Property, "enumerateKeysAndObjectsUsingBlock:", v11);
  v5 = *(_QWORD **)(a1 + 32);
  if (v5)
    v5 = (_QWORD *)v5[7];
  v6 = v5;
  -[FCPurchaseLookUpEntriesManager lookupEntriesByTagID](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "copy");
  v10 = *(void **)(a1 + 32);
  if (v10)
    objc_setProperty_atomic_copy(v10, v8, v9, 64);

}

void __67__FCPurchaseController_cleanupExpiredPurchaseLookupEntriesIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "purchaseValidationState") == 2)
  {
    objc_msgSend(v5, "dateOfExpiration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "fc_isWithinTimeInterval:ofDate:", v7, 864000.0);

    if ((v8 & 1) == 0)
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
        v10 = *(_QWORD *)(v9 + 56);
      else
        v10 = 0;
      -[FCPurchaseLookUpEntriesManager removeEntryForTagID:](v10, v11);
    }
  }

}

- (void)activityObservingApplicationDidEnterBackground
{
  NSObject *accessQueue;
  _QWORD block[5];

  if (self)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__FCPurchaseController_cleanupExpiredPurchaseLookupEntriesIfNeeded__block_invoke;
    block[3] = &unk_1E463AB18;
    block[4] = self;
    dispatch_sync(accessQueue, block);
    -[FCKeyValueStore saveWithCompletionHandler:](self->_localStore, "saveWithCompletionHandler:", 0);
  }
}

- (void)userInfo:(id)a3 didRemoveAccessTokenForTagID:(id)a4 userInitiated:(BOOL)a5
{
  -[FCPurchaseController handleAccessTokenChangeWithTagID:userInitiated:]((uint64_t)self, a4);
}

- (void)handleAccessTokenChangeWithTagID:(uint64_t)a1 userInitiated:(void *)a2
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  id v29;
  id location;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 32);
    objc_msgSend(v4, "tagSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessTokenForTagID:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__10;
    v35 = __Block_byref_object_dispose__10;
    objc_msgSend((id)a1, "purchaseLookUpEntryForTagID:", v3);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_initWeak(&location, (id)a1);
      v7 = *(id *)(a1 + 32);
      objc_msgSend(v7, "tagController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C80D38];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke;
      v25[3] = &unk_1E463D130;
      objc_copyWeak(&v29, &location);
      v27 = a1;
      v28 = &v31;
      v26 = v3;
      objc_msgSend(v8, "fetchTagForTagID:qualityOfService:callbackQueue:completionHandler:", v26, 9, MEMORY[0x1E0C80D38], v25);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      v10 = (void *)v32[5];
      if (v10)
      {
        if (objc_msgSend(v10, "purchaseType") == 2)
        {
          v37[0] = v3;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)a1, "removeFromPurchasedChannelsListWithTagIDs:", v11);

          objc_msgSend((id)a1, "purchasesDiscoveredTagIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObject:", v3);

          if (v13)
          {
            objc_msgSend((id)a1, "purchasesDiscoveredTagIDs");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "allObjects");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v15, "mutableCopy");

            objc_msgSend(v16, "removeObject:", v3);
            v17 = (void *)MEMORY[0x1E0C99E60];
            v18 = (void *)objc_msgSend(v16, "copy");
            objc_msgSend(v17, "setWithArray:", v18);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = *(void **)(a1 + 8);
            *(_QWORD *)(a1 + 8) = v19;

            v21 = *(id *)(a1 + 48);
            objc_msgSend((id)a1, "purchasesDiscoveredTagIDs");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "allObjects");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("SubscriptionsDiscoveredList"));

            objc_msgSend((id)a1, "purchasesDiscoveredTagIDs");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCPurchaseController notifyPurchasesDiscoveredWithTagIDs:](a1, v24);

          }
        }
      }
    }
    _Block_object_dispose(&v31, 8);

  }
}

- (void)userInfo:(id)a3 didChangeAccessTokenForTagID:(id)a4
{
  -[FCPurchaseController handleAccessTokenChangeWithTagID:userInitiated:]((uint64_t)self, a4);
}

void __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  __int128 v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke_2;
  v6[3] = &unk_1E463D108;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v5 = v3;
  FCPerformIfNonNil(WeakRetained, v6);

}

void __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;

  v3 = a2;
  v22 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    if (+[FCTagController isTagAllowedInContentStoreFront:](FCTagController, "isTagAllowedInContentStoreFront:")&& (objc_msgSend(*(id *)(a1 + 32), "isDeprecated") & 1) == 0)
    {
      v5 = v22;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        goto LABEL_7;
      v6 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPurchaseController addToPurchasedChannelsListWithTagID:purchaseID:purchaseType:purchaseValidationState:isNewsAppPurchase:lastVerificationTime:]((uint64_t)v22, v6, 0, 2, 1, v7);

      if (v22)
        v8 = (void *)v22[4];
      else
        v8 = 0;
      v9 = v8;
      objc_msgSend(v9, "subscriptionController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubscriptionToTag:error:", *(_QWORD *)(a1 + 32), 0);

      objc_msgSend(*(id *)(a1 + 48), "purchasesDiscoveredTagIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "addObject:", *(_QWORD *)(a1 + 40));
      v14 = (void *)MEMORY[0x1E0C99E60];
      v15 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPurchaseController setPurchasesDiscoveredTagIDs:]((uint64_t)v22, v16);

      if (v22)
        v17 = (void *)v22[6];
      else
        v17 = 0;
      v18 = v17;
      objc_msgSend(v22, "purchasesDiscoveredTagIDs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("SubscriptionsDiscoveredList"));

      objc_msgSend(v22, "purchasesDiscoveredTagIDs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPurchaseController notifyPurchasesDiscoveredWithTagIDs:]((uint64_t)v22, v21);

    }
    else
    {
      objc_msgSend(v22, "removeWebPurchaseForTagID:userInitiated:", *(_QWORD *)(a1 + 40), 0);
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke_3;
    v23[3] = &unk_1E463AD10;
    v24 = *(id *)(a1 + 40);
    v25 = v3;
    v4 = v24;
    __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke_3((uint64_t)v23);

  }
  v5 = v22;
LABEL_7:

}

uint64_t __71__FCPurchaseController_handleAccessTokenChangeWithTagID_userInitiated___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Nil tag returned in handleAccessTokenChange for tagID:%@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "removeWebPurchaseForTagID:userInitiated:", *(_QWORD *)(a1 + 32), 0);
}

void __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  char v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_2;
  v6[3] = &unk_1E463D180;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v10 = *(_BYTE *)(a1 + 56);
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  FCPerformIfNonNil(WeakRetained, v6);

}

void __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  _QWORD block[4];
  id v17;
  _QWORD *v18;
  id v19;
  id v20;
  id v21;
  char v22;
  _QWORD v23[5];

  v3 = a2;
  v15 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "purchaseLookUpEntryForTagID:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (v15)
        v5 = v15[10];
      else
        v5 = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_177;
      block[3] = &unk_1E463D158;
      v6 = v4;
      v22 = *(_BYTE *)(a1 + 56);
      v17 = v6;
      v18 = v15;
      v19 = *(id *)(a1 + 40);
      v20 = *(id *)(a1 + 48);
      v21 = *(id *)(a1 + 32);
      dispatch_sync(v5, block);

      v7 = v17;
    }
    else
    {
      if (!*(_BYTE *)(a1 + 56))
      {
LABEL_14:

        goto LABEL_15;
      }
      if (v15)
        v8 = (void *)v15[4];
      else
        v8 = 0;
      v9 = v8;
      objc_msgSend(v9, "tagSettings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAccessTokenForTagID:accessToken:userInitiated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

      v11 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCPurchaseController addToPurchasedChannelsListWithTagID:purchaseID:purchaseType:purchaseValidationState:isNewsAppPurchase:lastVerificationTime:]((uint64_t)v15, v11, 0, 2, 1, v12);

      if (v15)
        v13 = (void *)v15[4];
      else
        v13 = 0;
      v14 = v13;
      objc_msgSend(v14, "subscriptionController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubscriptionToTag:error:", *(_QWORD *)(a1 + 32), 0);

    }
    goto LABEL_14;
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_3;
  v23[3] = &unk_1E463AB18;
  v23[4] = *(_QWORD *)(a1 + 40);
  __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_3((uint64_t)v23);
LABEL_15:

}

void __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Nil tag returned in handleAccessTokenVerification for tagID:%@", (uint8_t *)&v4, 0xCu);
  }
}

void __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke_177(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  _QWORD *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  id v21;

  v2 = objc_msgSend(*(id *)(a1 + 32), "purchaseValidationState");
  objc_msgSend(*(id *)(a1 + 32), "setPurchaseType:", 2);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastVerificationTime:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setLastVerificationFailureTime:", 0);
  if (*(_BYTE *)(a1 + 72))
    v4 = 1;
  else
    v4 = 2;
  objc_msgSend(*(id *)(a1 + 32), "setPurchaseValidationState:", v4);
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDateOfExpiration:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDateOfExpiration:", v5);

  }
  v6 = v2 != 2 && *(_BYTE *)(a1 + 72) == 0;
  if (v6 || *(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "setHasShownRenewalNotice:", 0);
  v7 = *(_QWORD **)(a1 + 40);
  if (v7)
    v7 = (_QWORD *)v7[6];
  v8 = *(void **)(a1 + 32);
  v9 = v7;
  objc_msgSend(v8, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, v11);

  if (*(_BYTE *)(a1 + 72) && v2 != 1)
  {
    v12 = *(_QWORD **)(a1 + 40);
    if (v12)
      v12 = (_QWORD *)v12[4];
    v13 = v12;
    objc_msgSend(v13, "tagSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessTokenForTagID:accessToken:userInitiated:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "tagID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithObjects:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPurchaseController notifyPurchaseAddedWithTagIDs:](v16, v18);

    v19 = *(_QWORD **)(a1 + 40);
    if (v19)
      v19 = (_QWORD *)v19[4];
    v20 = v19;
    objc_msgSend(v20, "subscriptionController");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubscriptionToTag:error:", *(_QWORD *)(a1 + 64), 0);

  }
}

void __70__FCPurchaseController_handleAccessTokenVerificationFailureWithTagID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastVerificationTime:", v2);

  objc_msgSend(*(id *)(a1 + 32), "lastVerificationFailureTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastVerificationFailureTime:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "setPurchaseValidationState:", 3);
  v5 = *(_QWORD **)(a1 + 40);
  if (v5)
    v5 = (_QWORD *)v5[6];
  v6 = *(void **)(a1 + 32);
  v7 = v5;
  objc_msgSend(v6, "dictionaryRepresentation");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, v8);

}

- (void)verifyAccessTokenWithTagID:(id)a3 accessToken:(id)a4 consumedArticleCount:(unint64_t)a5 serialCompletion:(id)a6 callbackQueue:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  FCCloudContext *cloudContext;
  void *v20;
  int v21;
  FCCloudContext *v22;
  FCCloudContext *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  unint64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  FCPurchaseController *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (self)
    cloudContext = self->_cloudContext;
  else
    cloudContext = 0;
  -[FCCloudContext networkReachability](cloudContext, "networkReachability");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isNetworkReachable");

  if (v21)
  {
    if (self)
      v22 = self->_cloudContext;
    else
      v22 = 0;
    v23 = v22;
    -[FCCloudContext tagController](v23, "tagController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke;
    v37[3] = &unk_1E463D270;
    v37[4] = self;
    v38 = v14;
    v39 = v17;
    v41 = v18;
    v42 = v16;
    v40 = v15;
    v43 = a5;
    v25 = v16;
    v26 = v18;
    objc_msgSend(v24, "fetchTagForTagID:qualityOfService:callbackQueue:completionHandler:", v38, 9, MEMORY[0x1E0C80D38], v37);

    v27 = v38;
  }
  else
  {
    v28 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v31;
      v46 = 2048;
      v47 = self;
      _os_log_impl(&dword_1A1B90000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> verifyAccessTokenWithTagID failed because the network is not reachable", buf, 0x16u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_192;
    block[3] = &unk_1E463CD58;
    v35 = v18;
    v36 = v16;
    v32 = v16;
    v33 = v18;
    dispatch_async(v17, block);

    v27 = v35;
  }

}

void __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
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
  NSObject *v38;
  objc_class *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  objc_class *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  objc_class *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD *v57;
  id v58;
  id v59;
  _QWORD v60[5];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id location;
  _QWORD v69[4];
  id v70;
  id v71;
  _QWORD block[4];
  id v73;
  id v74;
  _BYTE buf[24];
  _BYTE v76[24];
  const __CFString *v77;
  _QWORD v78[4];

  v78[1] = *MEMORY[0x1E0C80C00];
  v59 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)v76 = v11;
      *(_WORD *)&v76[8] = 2114;
      *(_QWORD *)&v76[10] = v5;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> verifyAccessTokenWithTagID failed to fetch tagID: %{public}@ error: %{public}@", buf, 0x2Au);

    }
    v12 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_178;
    block[3] = &unk_1E463CD58;
    v73 = *(id *)(a1 + 64);
    v74 = *(id *)(a1 + 72);
    dispatch_async(v12, block);

    v13 = v73;
  }
  else
  {
    NewsCoreUserDefaults();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringForKey:", CFSTR("web_authentication_local_server_ip_address"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (NFInternalBuild() && v15)
    {
      NewsCoreUserDefaults();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringForKey:", CFSTR("web_authentication_local_server_ip_address"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("http://"), v17, CFSTR(":3000/verify_authorization"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v59, "publisherPaidVerificationURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)v76 = v18;
      _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> verifyAccessTokenWithTagID will use verificationURL: %{public}@", buf, 0x20u);

    }
    if (v18)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(void **)(a1 + 56);
      v26 = *(_QWORD *)(a1 + 80);
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_2;
      v60[3] = &unk_1E463D248;
      objc_copyWeak(&v67, &location);
      v60[4] = *(_QWORD *)(a1 + 32);
      v61 = *(id *)(a1 + 40);
      v62 = *(id *)(a1 + 56);
      v63 = *(id *)(a1 + 48);
      v65 = *(id *)(a1 + 64);
      v64 = v59;
      v66 = *(id *)(a1 + 72);
      v13 = v18;
      v58 = v25;
      v57 = v60;
      if (v24)
      {
        if (!v58 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "accessToken");
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[FCPurchaseController performHTTPRequestForVerifyAccessTokenWithURL:accessToken:consumed"
                               "ArticleCount:completion:]";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "FCPurchaseController.m";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v76 = 1624;
          *(_WORD *)&v76[4] = 2114;
          *(_QWORD *)&v76[6] = v56;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
        v27 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEBUG))
        {
          v50 = v27;
          v51 = (objc_class *)objc_opt_class();
          NSStringFromClass(v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v52;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)v76 = v13;
          _os_log_debug_impl(&dword_1A1B90000, v50, OS_LOG_TYPE_DEBUG, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL: %{public}@", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v13);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "mutableCopy");

        objc_msgSend(v30, "removeCharactersInString:", CFSTR("?=&+/"));
        objc_msgSend(v58, "stringByAddingPercentEncodingWithAllowedCharacters:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@&%@=%lu"), CFSTR("access_token"), v31, CFSTR("read_article_count"), v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setPercentEncodedQuery:", v32);

        v33 = (void *)MEMORY[0x1E0C92C28];
        objc_msgSend(v28, "URL");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "requestWithURL:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v77 = CFSTR("Accept");
        v78[0] = CFSTR("application/json");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setAllHTTPHeaderFields:", v36);
        objc_msgSend(v35, "setHTTPMethod:", CFSTR("GET"));
        v37 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v37;
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v24;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)v76 = v35;
          _os_log_impl(&dword_1A1B90000, v38, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL request: %{public}@", buf, 0x20u);

        }
        v41 = *(id *)(v24 + 40);
        objc_msgSend(v41, "value");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __114__FCPurchaseController_performHTTPRequestForVerifyAccessTokenWithURL_accessToken_consumedArticleCount_completion___block_invoke;
        *(_QWORD *)v76 = &unk_1E463D298;
        *(_QWORD *)&v76[8] = v24;
        *(_QWORD *)&v76[16] = v57;
        objc_msgSend(v42, "dataTaskWithRequest:completionHandler:", v35, buf);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "resume");
      }

      objc_destroyWeak(&v67);
      objc_destroyWeak(&location);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v53 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v59, "identifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)objc_msgSend(v53, "initWithFormat:", CFSTR("Verification URL is nil for publisher : %@"), v54);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[FCPurchaseController verifyAccessTokenWithTagID:accessToken:consumedArticleCount:serialCo"
                             "mpletion:callbackQueue:completion:]_block_invoke";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "FCPurchaseController.m";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)v76 = 1570;
        *(_WORD *)&v76[4] = 2114;
        *(_QWORD *)&v76[6] = v55;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v44 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v45 = v44;
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v48;
        _os_log_impl(&dword_1A1B90000, v45, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> verifyAccessTokenWithTagID failed to get a verificationURL", buf, 0x16u);

      }
      v49 = *(NSObject **)(a1 + 48);
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_188;
      v69[3] = &unk_1E463CD58;
      v70 = *(id *)(a1 + 64);
      v71 = *(id *)(a1 + 72);
      dispatch_async(v49, v69);

      v13 = 0;
    }
  }

}

uint64_t __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_178(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v7 = CFSTR("error_message");
    v8[0] = CFSTR("CloudKit error while fetching channel information");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("FCTokenVerificationErrorDomain"), 5002, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v2 + 16))(v2, 0, 0, v5);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_188(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v7 = CFSTR("error_message");
    v8[0] = CFSTR("URL not found");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("FCTokenVerificationErrorDomain"), 5001, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v2 + 16))(v2, 0, 0, v5);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_3;
  v9[3] = &unk_1E463D220;
  v17 = a2;
  v7 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 80);
  v8 = v5;
  FCPerformIfNonNil(WeakRetained, v9);

}

void __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(unsigned __int8 *)(a1 + 96);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v22 = v7;
    v23 = 2048;
    v24 = v9;
    v25 = 1024;
    v26 = v8;
    v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> verifyAccessTokenWithTagID isSubscribed: %d verificationError: %{public}@", buf, 0x26u);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_189;
  v11[3] = &unk_1E463D1F8;
  v12 = *(id *)(a1 + 40);
  v13 = v3;
  v14 = *(id *)(a1 + 48);
  v20 = *(_BYTE *)(a1 + 96);
  v15 = *(id *)(a1 + 56);
  v16 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 80);
  v17 = *(id *)(a1 + 72);
  v19 = *(id *)(a1 + 88);
  FCPerformBlockOnMainThread(v11);

}

void __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_189(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  char v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  uint64_t block;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id location;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v4 = MEMORY[0x1E0C809B0];
  if (!*(_QWORD *)(a1 + 32))
  {
    v8 = *(_BYTE *)(a1 + 96);
    v9 = *(void **)(a1 + 56);
    v6 = v3;
    v10 = v9;
    if (v2)
    {
      objc_initWeak(&location, (id)v2);
      v11 = *(id *)(v2 + 32);
      objc_msgSend(v11, "tagController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C80D38];
      v14 = MEMORY[0x1E0C80D38];
      block = v4;
      v23 = 3221225472;
      v24 = __93__FCPurchaseController_handleAccessTokenVerificationSuccessWithTagID_subscribed_accessToken___block_invoke;
      v25 = &unk_1E463D1A8;
      objc_copyWeak(&v28, &location);
      v26 = v6;
      v29 = v8;
      v27 = v10;
      objc_msgSend(v12, "fetchTagForTagID:qualityOfService:callbackQueue:completionHandler:", v26, 9, v13, &block);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
      v4 = MEMORY[0x1E0C809B0];
    }

    goto LABEL_8;
  }
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "purchaseLookUpEntryForTagID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = *(NSObject **)(v2 + 80);
      block = v4;
      v23 = 3221225472;
      v24 = __70__FCPurchaseController_handleAccessTokenVerificationFailureWithTagID___block_invoke;
      v25 = &unk_1E463AD10;
      v26 = v5;
      v27 = (id)v2;
      dispatch_async(v7, &block);

    }
LABEL_8:

  }
  v15 = *(NSObject **)(a1 + 64);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_2_190;
  v16[3] = &unk_1E463D1D0;
  v19 = *(id *)(a1 + 80);
  v21 = *(_BYTE *)(a1 + 96);
  v17 = *(id *)(a1 + 72);
  v18 = *(id *)(a1 + 32);
  v20 = *(id *)(a1 + 88);
  dispatch_async(v15, v16);

}

uint64_t __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_2_190(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __126__FCPurchaseController_verifyAccessTokenWithTagID_accessToken_consumedArticleCount_serialCompletion_callbackQueue_completion___block_invoke_192(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v7 = CFSTR("error_message");
    v8[0] = CFSTR("Device in offline");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("FCTokenVerificationErrorDomain"), 5000, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v2 + 16))(v2, 0, 0, v5);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __114__FCPurchaseController_performHTTPRequestForVerifyAccessTokenWithURL_accessToken_consumedArticleCount_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString **v27;
  const __CFString **v28;
  void *v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void (*v43)(uint64_t, uint64_t, id);
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const __CFString **v58;
  const __CFString **v59;
  void *v60;
  NSObject *v61;
  objc_class *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  NSObject *v70;
  objc_class *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  NSObject *v76;
  objc_class *v77;
  void *v78;
  uint64_t v79;
  char loga;
  NSObject *logb;
  os_log_t log;
  id v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  id v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  id v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  id v101;
  __int16 v102;
  id v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138544130;
    v97 = v14;
    v98 = 2048;
    v99 = v15;
    v100 = 2114;
    v101 = v10;
    v102 = 2114;
    v103 = v9;
    _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL response: %{public}@ error: %{public}@", buf, 0x2Au);

  }
  if (!v9)
  {
    v83 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v83);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v83;
    if (v19)
    {
      v22 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
      {
        v76 = v22;
        v77 = (objc_class *)objc_opt_class();
        NSStringFromClass(v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v97 = v78;
        v98 = 2048;
        v99 = v79;
        v100 = 2114;
        v101 = v19;
        _os_log_error_impl(&dword_1A1B90000, v76, OS_LOG_TYPE_ERROR, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL failed to parse with error: %{public}@", buf, 0x20u);

      }
      v23 = *(_QWORD *)(a1 + 40);
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = objc_msgSend(v10, "statusCode");
      v92 = CFSTR("error_message");
      v93 = CFSTR("JSON parsing error");
      v26 = (void *)MEMORY[0x1E0C99D80];
      v27 = &v93;
      v28 = &v92;
LABEL_20:
      objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("FCTokenVerificationErrorDomain"), v25, v21);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v43 = *(void (**)(uint64_t, uint64_t, id))(v23 + 16);
      v44 = v23;
      v45 = 0;
      v46 = v42;
LABEL_21:
      v43(v44, v45, v46);
LABEL_22:

      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v37 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v37;
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v97 = v40;
        v98 = 2048;
        v99 = v41;
        _os_log_impl(&dword_1A1B90000, v38, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL invalid JSON response format", buf, 0x16u);

      }
      v23 = *(_QWORD *)(a1 + 40);
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = objc_msgSend(v10, "statusCode");
      v84 = CFSTR("error_message");
      v85 = CFSTR("Invalid JSON format found");
      v26 = (void *)MEMORY[0x1E0C99D80];
      v27 = &v85;
      v28 = &v84;
      goto LABEL_20;
    }
    v21 = v20;
    v29 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v97 = v32;
      v98 = 2048;
      v99 = v33;
      v100 = 2114;
      v101 = v21;
      _os_log_impl(&dword_1A1B90000, v30, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL validResponseJSON: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v21, "objectForKey:", CFSTR("status"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_opt_class();
      objc_msgSend(v21, "objectForKey:", CFSTR("status"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v36 = v35;
        else
          v36 = 0;
      }
      else
      {
        v36 = 0;
      }
      v42 = v36;

      v69 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v70 = v69;
        v71 = (objc_class *)objc_opt_class();
        NSStringFromClass(v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v97 = v72;
        v98 = 2048;
        v99 = v73;
        v100 = 2114;
        v101 = v42;
        _os_log_impl(&dword_1A1B90000, v70, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL status: %{public}@", buf, 0x20u);

      }
      if (objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("subscribed")))
      {
        v74 = objc_msgSend(v42, "caseInsensitiveCompare:", CFSTR("not_subscribed"));
        v55 = *(_QWORD *)(a1 + 40);
        if (v74)
        {
          log = (os_log_t)MEMORY[0x1E0CB35C8];
          v56 = objc_msgSend(v10, "statusCode");
          v90 = CFSTR("error_message");
          v91 = CFSTR("Invalid response.Response structure did not meet agreement");
          v57 = (void *)MEMORY[0x1E0C99D80];
          v58 = &v91;
          v59 = &v90;
          goto LABEL_38;
        }
        v43 = *(void (**)(uint64_t, uint64_t, id))(v55 + 16);
        v44 = v55;
        v45 = 0;
      }
      else
      {
        v44 = *(_QWORD *)(a1 + 40);
        v43 = *(void (**)(uint64_t, uint64_t, id))(v44 + 16);
        v45 = 1;
      }
      v46 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v21, "objectForKey:", CFSTR("error"));
    v47 = objc_claimAutoreleasedReturnValue();
    if (!v47
      || (v48 = (void *)v47,
          objc_msgSend(v21, "objectForKey:", CFSTR("error")),
          v49 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          loga = objc_opt_isKindOfClass(),
          v49,
          v48,
          (loga & 1) == 0))
    {
      v60 = (void *)FCPurchaseLog;
      if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      {
        v61 = v60;
        v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v97 = v63;
        v98 = 2048;
        v99 = v64;
        _os_log_impl(&dword_1A1B90000, v61, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL missing status and error", buf, 0x16u);

      }
      v65 = *(_QWORD *)(a1 + 40);
      v66 = (void *)MEMORY[0x1E0CB35C8];
      v67 = objc_msgSend(v10, "statusCode");
      v86 = CFSTR("error_message");
      v87 = CFSTR("Invalid response.Response structure did not meet agreement");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("FCTokenVerificationErrorDomain"), v67, v42);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v65 + 16))(v65, 0, v68);
      goto LABEL_39;
    }
    v50 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      logb = v50;
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v21, "objectForKey:", CFSTR("error"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v97 = v52;
      v98 = 2048;
      v99 = v53;
      v100 = 2114;
      v101 = v54;
      _os_log_impl(&dword_1A1B90000, logb, OS_LOG_TYPE_DEFAULT, "<%{public}@ %p> performHTTPRequestForVerifyAccessTokenWithURL error: %{public}@", buf, 0x20u);

    }
    v55 = *(_QWORD *)(a1 + 40);
    log = (os_log_t)MEMORY[0x1E0CB35C8];
    v56 = objc_msgSend(v10, "statusCode");
    v88 = CFSTR("error_message");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v21);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v89 = v42;
    v57 = (void *)MEMORY[0x1E0C99D80];
    v58 = (const __CFString **)&v89;
    v59 = &v88;
LABEL_38:
    objc_msgSend(v57, "dictionaryWithObjects:forKeys:count:", v58, v59, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject errorWithDomain:code:userInfo:](log, "errorWithDomain:code:userInfo:", CFSTR("FCTokenVerificationErrorDomain"), v56, v68);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v55 + 16))(v55, 0, v75);

LABEL_39:
    goto LABEL_22;
  }
  v16 = *(_QWORD *)(a1 + 40);
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v18 = objc_msgSend(v9, "code");
  v94 = CFSTR("error_message");
  objc_msgSend(v9, "localizedDescription");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v95 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("FCTokenVerificationErrorDomain"), v18, v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v16 + 16))(v16, 0, v21);
LABEL_23:

}

- (id)webAccessEntryForTagID:(void *)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(a1, "webAccessEntriesByTagID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)submitWebAccessWithTagID:(id)a3 purchaseID:(id)a4 emailAddress:(id)a5 purchaseReceipt:(id)a6 serialCompletion:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  FCCloudContext *cloudContext;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  FCCloudContext *v23;
  FCCloudContext *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void (**v34)(void);
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void (**v42)(void);
  id v43;
  id location;
  const __CFString *v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v33 = a5;
  v16 = a6;
  v34 = (void (**)(void))a7;
  v35 = a8;
  if (self)
    cloudContext = self->_cloudContext;
  else
    cloudContext = 0;
  -[FCCloudContext networkReachability](cloudContext, "networkReachability");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isNetworkReachable");

  if (v19)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "dataUsingEncoding:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "base64EncodedStringWithOptions:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v23 = self->_cloudContext;
    else
      v23 = 0;
    v24 = v23;
    -[FCCloudContext endpointConnection](v24, "endpointConnection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C80D38];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __117__FCPurchaseController_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_serialCompletion_completion___block_invoke;
    v36[3] = &unk_1E463D2E8;
    objc_copyWeak(&v43, &location);
    v37 = v14;
    v38 = v15;
    v39 = v33;
    v40 = v16;
    v41 = v35;
    v42 = v34;
    objc_msgSend(v25, "submitWebAccessWithTagID:purchaseID:emailAddress:purchaseReceipt:countryCode:languageCode:callbackQueue:completion:", v37, v38, v39, v30, v31, v32, MEMORY[0x1E0C80D38], v36);

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  else
  {
    if (v35)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v45 = CFSTR("error_message");
      v46[0] = CFSTR("Device in offline");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("FCWebAccessErrorDomain"), 5000, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v35 + 2))(v35, 0, v29);

    }
    if (v34)
      v34[2]();
  }

}

void __117__FCPurchaseController_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_serialCompletion_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 10);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __117__FCPurchaseController_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_serialCompletion_completion___block_invoke_2;
  v9[3] = &unk_1E463D2C0;
  v17 = a2;
  v10 = a1[4];
  v11 = a1[5];
  v12 = a1[6];
  v13 = a1[7];
  v7 = a1[8];
  v14 = v5;
  v15 = v7;
  v16 = a1[9];
  v8 = v5;
  FCPerformIfNonNil(WeakRetained, v9);

}

void __117__FCPurchaseController_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_serialCompletion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  FCWebAccessEntry *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id *v36;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v36 = v3;
  if (!*(_BYTE *)(a1 + 88))
  {
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    v5 = v4;
    v8 = v9;
    v12 = v10;
    v13 = v11;
    if (v36)
    {
      -[FCPurchaseController webAccessEntryForTagID:](v36, v5);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (_QWORD *)v14;
        objc_msgSend(v36, "webAccessEntriesByTagID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObjectForKey:", v15[6]);

        v17 = v15[5];
        v18 = v36[6];
        objc_msgSend(v18, "removeObjectForKey:", v17);
      }
      else
      {
        v19 = [FCWebAccessEntry alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("wa-"), v5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[FCWebAccessEntry initWithEntryID:tagID:purchaseID:lastRetryAttemptTime:email:purchaseReceipt:](v19, v20, v5, v8, v21, v12, v13);

        v18 = v22;
        objc_msgSend(v36, "webAccessEntriesByTagID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v18)
          v25 = v18[6];
        else
          v25 = 0;
        objc_msgSend(v23, "setObject:forKey:", v18, v25);

        v26 = v36[6];
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "fc_safelySetObjectAllowingNil:forKey:", v18[6], CFSTR("WebAccessEntryTagID"));
          objc_msgSend(v18, "purchaseID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "fc_safelySetObjectAllowingNil:forKey:", v28, CFSTR("WebAccessEntryPurchaseID"));

          objc_msgSend(v18, "lastRetryAttemptTime");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "fc_safelySetObjectAllowingNil:forKey:", v29, CFSTR("WebAccessEntryLastRetryAttemptTime"));

          objc_msgSend(v18, "email");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "fc_safelySetObjectAllowingNil:forKey:", v30, CFSTR("WebAccessEntryEmail"));

          objc_msgSend(v18, "purchaseReceipt");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "fc_safelySetObjectAllowingNil:forKey:", v31, CFSTR("WebAccessEntryPurchaseReceipt"));

          v32 = (void *)objc_msgSend(v27, "copy");
          v33 = v18[5];
        }
        else
        {
          v32 = 0;
          v33 = 0;
        }
        objc_msgSend(v26, "setObject:forKey:", v32, v33);

        v15 = v18;
      }

    }
    goto LABEL_15;
  }
  if (!v3)
    goto LABEL_17;
  -[FCPurchaseController webAccessEntryForTagID:](v3, v4);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v36, "webAccessEntriesByTagID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v5[6]);

    v7 = v5[5];
    v8 = v36[6];
    objc_msgSend(v8, "removeObjectForKey:", v7);
LABEL_15:

  }
LABEL_17:
  v34 = *(_QWORD *)(a1 + 72);
  if (v34)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v34 + 16))(v34, *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 64));
  v35 = *(_QWORD *)(a1 + 80);
  if (v35)
    (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v4);

}

- (NSSet)purchasesDiscoveredTagIDs
{
  return self->_purchasesDiscoveredTagIDs;
}

- (NSMutableDictionary)webAccessEntriesByTagID
{
  return self->_webAccessEntriesByTagID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementService, 0);
  objc_storeStrong((id *)&self->_entitlementQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_lastEntitlementCheckTime, 0);
  objc_storeStrong((id *)&self->_readOnlyPurchaseLookUpEntriesByTagID, 0);
  objc_storeStrong((id *)&self->_purchaseLookupEntriesManager, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_entitlementsOverrideProvider, 0);
  objc_storeStrong((id *)&self->_webAccessEntriesByTagID, 0);
  objc_storeStrong((id *)&self->_purchasesDiscoveredTagIDs, 0);
}

@end
