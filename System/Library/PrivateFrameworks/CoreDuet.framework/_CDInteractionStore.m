@implementation _CDInteractionStore

+ (id)defaultDatabaseDirectory
{
  return +[_CDPaths peopleDirectory](_CDPaths, "peopleDirectory");
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 objectIDs:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  _DKCoreDataStorage *storage;
  uint64_t v19;
  void *v20;
  _CDMemoryUsageInterval *v21;
  _CDMemoryUsageInterval *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  _CDMemoryUsageInterval *v31;
  id v32;
  id v33;
  id v34;
  _CDInteractionStore *v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v14 = a3;
  v15 = a4;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__10;
  v51 = __Block_byref_object_dispose__10;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__10;
  v45 = __Block_byref_object_dispose__10;
  v46 = 0;
  if (a7)
    v16 = (void *)objc_opt_new();
  else
    v16 = 0;
  v17 = -[_CDInteractionStore readConcurrently](self, "readConcurrently");
  storage = self->_storage;
  v19 = *MEMORY[0x1E0CB2AC0];
  if (v17)
    -[_DKCoreDataStorage privateManagedObjectContextFor:](storage, "privateManagedObjectContextFor:", v19);
  else
    -[_DKCoreDataStorage managedObjectContextFor:](storage, "managedObjectContextFor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("queryInteractionsUsingPredicate"), 0);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __100___CDInteractionStore_queryInteractionsUsingPredicate_sortDescriptors_limit_offset_objectIDs_error___block_invoke;
  v30[3] = &unk_1E26E4900;
  v22 = v21;
  v31 = v22;
  v23 = v20;
  v32 = v23;
  v24 = v14;
  v33 = v24;
  v39 = a5;
  v40 = a6;
  v25 = v15;
  v37 = &v41;
  v34 = v25;
  v35 = self;
  v26 = v16;
  v36 = v26;
  v38 = &v47;
  objc_msgSend(v23, "performWithOptions:andBlock:", 4, v30);
  -[_CDMemoryUsageInterval end](v22, "end");
  if (a8)
  {
    v27 = (void *)v42[5];
    if (v27)
      *a8 = objc_retainAutorelease(v27);
  }
  if (-[_CDInteractionStore readConcurrently](self, "readConcurrently"))
    objc_msgSend(v23, "reset");
  if (a7)
    objc_storeStrong(a7, v16);
  v28 = (id)v48[5];

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v28;
}

- (BOOL)readConcurrently
{
  return self->_readConcurrently;
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  int v16;
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
  id v29;
  void *v30;
  _CDInteractionStore *v31;
  id *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "count"))
  {
    v31 = self;
    v32 = a5;
    v33 = v8;
    v10 = v8;
    +[_CDConstants mobileMessagesBundleId]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if (v12)
    {
      +[_CDConstants shareSheetTargetBundleIdMessages]();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_CDConstants mobileMailBundleId]();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v10, "isEqualToString:", v15);

      v17 = v10;
      if (!v16)
      {
LABEL_8:
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815A0]), "initWithDomainsFromArray:", v9);
        objc_msgSend(v30, "allDomains");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(domainIdentifier == $domainIdentifier) OR (domainIdentifier >= $domainIdentifierDot AND domainIdentifier < $domainIdentifierSlash)"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __78___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifiers_error___block_invoke;
        v34[3] = &unk_1E26E4AF0;
        v35 = v19;
        v29 = v19;
        objc_msgSend(v20, "_pas_mappedArrayWithTransform:", v34);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(noindex(mechanism) != %@ AND noindex(bundleId) == %@) OR (noindex(mechanism) == %@ AND noindex(targetBundleId) == %@)"), &unk_1E272AA38, v10, &unk_1E272AA38, v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0CB3528];
        v36[0] = v22;
        v36[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("deleteInteractionsWithBundleId:%@ domainIdentifiers:(redacted) (bundleId)"), v10);
        v14 = -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](v31, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v26, MEMORY[0x1E0C9AA60], 20000, v27, v32);

        v8 = v33;
        goto LABEL_9;
      }
      +[_CDConstants shareSheetTargetBundleIdMail]();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v13;

    goto LABEL_8;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  return -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](self, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", a3, a4, a5, CFSTR("unspecified reason"), a6);
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 error:(id *)a7
{
  return -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:offset:objectIDs:error:](self, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:objectIDs:error:", a3, a4, a5, a6, 0, a7);
}

+ (_CDInteractionStore)storeWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  _CDInteractionStore *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[_CDInteractionStore initWithDirectory:knowledgeStore:readOnly:]([_CDInteractionStore alloc], "initWithDirectory:knowledgeStore:readOnly:", v5, 0, v4);

  return v6;
}

- (_CDInteractionStore)initWithDirectory:(id)a3 knowledgeStore:(id)a4 readOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _CDInteractionStore *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _DKCoreDataStorage *v15;
  _DKCoreDataStorage *storage;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *workQueue;
  uint64_t v20;
  _CDInteractionStoreNotifier *notifier;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *pendingShareInteractionQueue;
  _CDInteractionStore *v25;
  NSObject *v26;
  NSObject *v27;
  objc_super v29;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_CDInteractionStore;
  v10 = -[_CDInteractionStore init](&v29, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathForResource:ofType:", CFSTR("CDInteractionDataModel"), CFSTR("momd"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = -[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:readOnly:localOnly:]([_DKCoreDataStorage alloc], "initWithDirectory:databaseName:modelURL:readOnly:localOnly:", v8, CFSTR("interaction"), v13, v5, 1);
        storage = v10->_storage;
        v10->_storage = v15;

        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = dispatch_queue_create("com.apple.coreduet.interactionstore.work", v17);
        workQueue = v10->_workQueue;
        v10->_workQueue = (OS_dispatch_queue *)v18;

        +[_CDInteractionStoreNotifier sharedInstance](_CDInteractionStoreNotifier, "sharedInstance");
        v20 = objc_claimAutoreleasedReturnValue();
        notifier = v10->_notifier;
        v10->_notifier = (_CDInteractionStoreNotifier *)v20;

        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = dispatch_queue_create("com.apple.interactionstore.pending-share-queue", v22);
        pendingShareInteractionQueue = v10->_pendingShareInteractionQueue;
        v10->_pendingShareInteractionQueue = (OS_dispatch_queue *)v23;

        v10->_inMaintenanceMode = 0;
        if (v9)
          objc_storeStrong((id *)&v10->_knowledgeStore, a4);

        goto LABEL_7;
      }
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[_CDInteractionStore initWithDirectory:knowledgeStore:readOnly:].cold.2();

    }
    else
    {
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[_CDInteractionStore initWithDirectory:knowledgeStore:readOnly:].cold.1();

    }
    v25 = 0;
    goto LABEL_15;
  }
LABEL_7:
  v25 = v10;
LABEL_15:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingShareSheetInteraction, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_pendingShareInteractionQueue, 0);
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  return -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:](self, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", a3, a4, a5, 0, a6);
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("bundleId == %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("deleteInteractionsWithBundleId:%@"), v7);

  v10 = -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](self, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v8, MEMORY[0x1E0C9AA60], 20000, v9, a4);
  return v10;
}

+ (_CDInteractionStore)storeWithDirectory:(id)a3 knowledgeStore:(id)a4 readOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  _CDInteractionStore *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[_CDInteractionStore initWithDirectory:knowledgeStore:readOnly:]([_CDInteractionStore alloc], "initWithDirectory:knowledgeStore:readOnly:", v8, v7, v5);

  return v9;
}

- (_CDInteractionStore)initWithDatabasePath:(id)a3 inDirectory:(id)a4
{
  return -[_CDInteractionStore initWithDirectory:knowledgeStore:readOnly:](self, "initWithDirectory:knowledgeStore:readOnly:", a4, 0, 0);
}

- (_CDInteractionStore)init
{

  return 0;
}

- (id)fetchOrCreateKeywordRecord:(id)a3 context:(id)a4 error:(id *)a5
{
  return -[_CDInteractionStore fetchOrCreateKeywordRecord:context:cache:error:](self, "fetchOrCreateKeywordRecord:context:cache:error:", a3, a4, 0, a5);
}

- (id)fetchOrCreateKeywordRecord:(id)a3 context:(id)a4 cache:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _CDMemoryUsageInterval *v13;
  _CDMemoryUsageInterval *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  _CDMemoryUsageInterval *v19;
  id v20;
  id v21;
  id v22;
  _CDInteractionStore *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__10;
    v36 = __Block_byref_object_dispose__10;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__10;
    v30 = __Block_byref_object_dispose__10;
    v31 = 0;
    v13 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("fetchOrCreateKeywordRecord"), 0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70___CDInteractionStore_fetchOrCreateKeywordRecord_context_cache_error___block_invoke;
    v18[3] = &unk_1E26E47D0;
    v14 = v13;
    v19 = v14;
    v20 = v12;
    v21 = v10;
    v24 = &v32;
    v22 = v11;
    v23 = self;
    v25 = &v26;
    objc_msgSend(v22, "performWithOptions:andBlock:", 4, v18);
    -[_CDMemoryUsageInterval end](v14, "end");
    if (a6)
    {
      v15 = (void *)v27[5];
      if (v15)
        *a6 = objc_retainAutorelease(v15);
    }
    v16 = (id)v33[5];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)fetchOrCreateAttachmentRecord:(id)a3 context:(id)a4 cache:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _CDMemoryUsageInterval *v13;
  _CDMemoryUsageInterval *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  _CDMemoryUsageInterval *v19;
  id v20;
  id v21;
  id v22;
  _CDInteractionStore *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__10;
    v36 = __Block_byref_object_dispose__10;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__10;
    v30 = __Block_byref_object_dispose__10;
    v31 = 0;
    v13 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("fetchOrCreateAttachmentRecord"), 0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73___CDInteractionStore_fetchOrCreateAttachmentRecord_context_cache_error___block_invoke;
    v18[3] = &unk_1E26E47D0;
    v14 = v13;
    v19 = v14;
    v20 = v12;
    v21 = v10;
    v24 = &v32;
    v22 = v11;
    v23 = self;
    v25 = &v26;
    objc_msgSend(v22, "performWithOptions:andBlock:", 4, v18);
    -[_CDMemoryUsageInterval end](v14, "end");
    if (a6)
    {
      v15 = (void *)v27[5];
      if (v15)
        *a6 = objc_retainAutorelease(v15);
    }
    v16 = (id)v33[5];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)fetchOrCreateContactRecord:(id)a3 context:(id)a4 error:(id *)a5
{
  return -[_CDInteractionStore fetchOrCreateContactRecord:context:cache:error:](self, "fetchOrCreateContactRecord:context:cache:error:", a3, a4, 0, a5);
}

- (id)fetchOrCreateContactRecord:(id)a3 context:(id)a4 cache:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _CDMemoryUsageInterval *v13;
  _CDMemoryUsageInterval *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  _CDMemoryUsageInterval *v19;
  id v20;
  id v21;
  id v22;
  _CDInteractionStore *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__10;
    v36 = __Block_byref_object_dispose__10;
    v37 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__10;
    v30 = __Block_byref_object_dispose__10;
    v31 = 0;
    v13 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("fetchOrCreateContactRecord"), 0);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70___CDInteractionStore_fetchOrCreateContactRecord_context_cache_error___block_invoke;
    v18[3] = &unk_1E26E47D0;
    v14 = v13;
    v19 = v14;
    v20 = v12;
    v21 = v10;
    v24 = &v32;
    v22 = v11;
    v23 = self;
    v25 = &v26;
    objc_msgSend(v22, "performWithOptions:andBlock:", 4, v18);
    -[_CDMemoryUsageInterval end](v14, "end");
    if (a6)
    {
      v15 = (void *)v27[5];
      if (v15)
        *a6 = objc_retainAutorelease(v15);
    }
    v16 = (id)v33[5];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)appendMissingInformationForRecord:(id)a3 fromContact:(id)a4 cacheUpdateRequired:(BOOL *)a5
{
  id v7;
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

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIdentifier:", v11);

      *a5 = 1;
    }
  }
  objc_msgSend(v7, "customIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else
  {
    objc_msgSend(v8, "customIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "customIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCustomIdentifier:", v14);

      *a5 = 1;
    }
  }
  objc_msgSend(v7, "personId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

  }
  else
  {
    objc_msgSend(v8, "personId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v8, "personId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPersonId:", v17);

      *a5 = 1;
    }
  }
  objc_msgSend(v7, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

  }
  else
  {
    objc_msgSend(v8, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v8, "displayName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDisplayName:", v20);

      *a5 = 1;
    }
  }
  objc_msgSend(v7, "displayImageURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {

  }
  else
  {
    objc_msgSend(v8, "displayImageURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v8, "displayImageURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDisplayImageURL:", v23);

      *a5 = 1;
    }
  }

  return v7;
}

- (id)batchFetchExistingKeywordRecords:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _CDMemoryUsageInterval *v10;
  _CDMemoryUsageInterval *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  _CDMemoryUsageInterval *v21;
  id v22;
  id v23;
  _CDInteractionStore *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__10;
  v37 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  v32 = 0;
  v10 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("batchFetchExistingKeywordRecords"), 0);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __70___CDInteractionStore_batchFetchExistingKeywordRecords_context_error___block_invoke;
  v20 = &unk_1E26E47F8;
  v11 = v10;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  v13 = v8;
  v23 = v13;
  v24 = self;
  v25 = &v27;
  v26 = &v33;
  objc_msgSend(v12, "performWithOptions:andBlock:", 4, &v17);
  -[_CDMemoryUsageInterval end](v11, "end", v17, v18, v19, v20);
  if (a5)
  {
    v14 = (void *)v28[5];
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }
  v15 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

- (id)errorForException:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(a3, "reason");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("Exception Caught");
  if (v4)
    v6 = (const __CFString *)v4;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.CDInteractionStore"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)batchFetchExistingAttachmentRecords:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _CDMemoryUsageInterval *v10;
  _CDMemoryUsageInterval *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  _CDMemoryUsageInterval *v21;
  id v22;
  id v23;
  _CDInteractionStore *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__10;
  v37 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  v32 = 0;
  v10 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("batchFetchExistingAttachmentRecords"), 0);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __73___CDInteractionStore_batchFetchExistingAttachmentRecords_context_error___block_invoke;
  v20 = &unk_1E26E47F8;
  v11 = v10;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  v13 = v8;
  v23 = v13;
  v24 = self;
  v25 = &v27;
  v26 = &v33;
  objc_msgSend(v12, "performWithOptions:andBlock:", 4, &v17);
  -[_CDMemoryUsageInterval end](v11, "end", v17, v18, v19, v20);
  if (a5)
  {
    v14 = (void *)v28[5];
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }
  v15 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

- (id)batchFetchExistingContactRecords:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _CDMemoryUsageInterval *v10;
  _CDMemoryUsageInterval *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  _CDMemoryUsageInterval *v21;
  id v22;
  id v23;
  _CDInteractionStore *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__10;
  v37 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  v32 = 0;
  v10 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("batchFetchExistingContactRecords"), 0);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __70___CDInteractionStore_batchFetchExistingContactRecords_context_error___block_invoke;
  v20 = &unk_1E26E47F8;
  v11 = v10;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  v13 = v8;
  v23 = v13;
  v24 = self;
  v25 = &v27;
  v26 = &v33;
  objc_msgSend(v12, "performWithOptions:andBlock:", 4, &v17);
  -[_CDMemoryUsageInterval end](v11, "end", v17, v18, v19, v20);
  if (a5)
  {
    v14 = (void *)v28[5];
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }
  v15 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

- (id)batchFetchExistingInteractionsWithUUIDs:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _CDMemoryUsageInterval *v10;
  _CDMemoryUsageInterval *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  _CDMemoryUsageInterval *v21;
  id v22;
  id v23;
  _CDInteractionStore *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__10;
  v37 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  v32 = 0;
  v10 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("batchFetchExistingInteractionsWithUUIDs"), 0);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __77___CDInteractionStore_batchFetchExistingInteractionsWithUUIDs_context_error___block_invoke;
  v20 = &unk_1E26E47F8;
  v11 = v10;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  v13 = v8;
  v23 = v13;
  v24 = self;
  v25 = &v27;
  v26 = &v33;
  objc_msgSend(v12, "performWithOptions:andBlock:", 4, &v17);
  -[_CDMemoryUsageInterval end](v11, "end", v17, v18, v19, v20);
  if (a5)
  {
    v14 = (void *)v28[5];
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }
  v15 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15;
}

- (void)fillWithoutRelationshipsInteractionRecord:(id)a3 fromInteraction:(id)a4
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v5 = a4;
  v21 = a3;
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v21, "setStartDate:");

  objc_msgSend(v5, "updateDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v21, "setUpdateDate:");

  objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v21, "setEndDate:");

  objc_msgSend(v5, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setUuid:", v9);

  objc_msgSend(v5, "locationUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLocationUUID:", v10);

  objc_msgSend(v21, "setMechanism:", objc_msgSend(v5, "mechanism"));
  objc_msgSend(v21, "setDirection:", objc_msgSend(v5, "direction"));
  objc_msgSend(v21, "setIsResponse:", objc_msgSend(v5, "isResponse"));
  objc_msgSend(v5, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBundleId:", v11);

  objc_msgSend(v5, "targetBundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTargetBundleId:", v12);

  objc_msgSend(v5, "groupName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setGroupName:", v13);

  objc_msgSend(v5, "contentURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentURL:", v15);

  objc_msgSend(v5, "derivedIntentIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDerivedIntentIdentifier:", v16);

  objc_msgSend(v5, "domainIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDomainIdentifier:", v17);

  objc_msgSend(v5, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccount:", v18);

  objc_msgSend(v5, "recipients");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRecipientCount:", objc_msgSend(v19, "count"));

  objc_msgSend(v21, "setMailShareSheetDeletionCandidate:", objc_msgSend(v5, "mailShareSheetDeletionCandidate"));
  v20 = objc_msgSend(v5, "selfParticipantStatus");

  objc_msgSend(v21, "setSelfParticipantStatus:", v20);
}

- (void)updateCachedStatsForContactRecord:(id)a3 isSender:(BOOL)a4 withInteraction:(id)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v6 = a4;
  v20 = a3;
  v7 = a5;
  if (v20 && v7)
  {
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v10 = v9;

    if (objc_msgSend(v7, "direction"))
    {
      if (objc_msgSend(v7, "direction") == 1 && !v6)
      {
        objc_msgSend(v20, "setOutgoingRecipientCount:", objc_msgSend(v20, "outgoingRecipientCount") + 1);
        objc_msgSend(v20, "lastOutgoingRecipientDate");
        if (v11 < v10)
          objc_msgSend(v20, "setLastOutgoingRecipientDate:", v10);
        objc_msgSend(v20, "firstOutgoingRecipientDate");
        if (v12 == 0.0 || (objc_msgSend(v20, "firstOutgoingRecipientDate"), v13 > v10))
          objc_msgSend(v20, "setFirstOutgoingRecipientDate:", v10);
      }
    }
    else if (v6)
    {
      objc_msgSend(v20, "setIncomingSenderCount:", objc_msgSend(v20, "incomingSenderCount") + 1);
      objc_msgSend(v20, "lastIncomingSenderDate");
      if (v14 < v10)
        objc_msgSend(v20, "setLastIncomingSenderDate:", v10);
      objc_msgSend(v20, "firstIncomingSenderDate");
      if (v15 == 0.0 || (objc_msgSend(v20, "firstIncomingSenderDate"), v16 > v10))
        objc_msgSend(v20, "setFirstIncomingSenderDate:", v10);
    }
    else
    {
      objc_msgSend(v20, "setIncomingRecipientCount:", objc_msgSend(v20, "incomingRecipientCount") + 1);
      objc_msgSend(v20, "lastIncomingRecipientDate");
      if (v17 < v10)
        objc_msgSend(v20, "setLastIncomingRecipientDate:", v10);
      objc_msgSend(v20, "firstIncomingRecipientDate");
      if (v18 == 0.0 || (objc_msgSend(v20, "firstIncomingRecipientDate"), v19 > v10))
        objc_msgSend(v20, "setFirstIncomingRecipientDate:", v10);
    }
  }

}

- (id)createInteractionRecord:(id)a3 context:(id)a4 keywordCache:(id)a5 attachmentCache:(id)a6 contactCache:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  _CDInteractionStore *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__10;
  v46 = __Block_byref_object_dispose__10;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__10;
  v40 = __Block_byref_object_dispose__10;
  v41 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __103___CDInteractionStore_createInteractionRecord_context_keywordCache_attachmentCache_contactCache_error___block_invoke;
  v27[3] = &unk_1E26E4898;
  v34 = &v42;
  v19 = v15;
  v28 = v19;
  v29 = self;
  v20 = v14;
  v30 = v20;
  v21 = v18;
  v31 = v21;
  v35 = &v36;
  v22 = v16;
  v32 = v22;
  v23 = v17;
  v33 = v23;
  objc_msgSend(v19, "performWithOptions:andBlock:", 4, v27);
  if (a8)
  {
    v24 = (void *)v37[5];
    if (v24)
      *a8 = objc_retainAutorelease(v24);
  }
  v25 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v25;
}

- (id)dateFromTimeIntervalSinceRef:(double)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 0.0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getContactForRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _CDContact *v15;
  _CDContactStatistics *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _CDContact *v26;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v26 = [_CDContact alloc];
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (int)objc_msgSend(v5, "type");
      objc_msgSend(v5, "customIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (int)objc_msgSend(v5, "displayType");
      objc_msgSend(v5, "personId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (int)objc_msgSend(v5, "personIdType");
      objc_msgSend(v5, "displayImageURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:participantStatus:](v26, "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:displayImageURL:participantStatus:", v7, v8, v9, v10, v11, v12, v13, v14, objc_msgSend(v5, "participantStatus"));
      objc_msgSend(v5, "setContact:", v15);

      v16 = objc_alloc_init(_CDContactStatistics);
      -[_CDContactStatistics setIncomingSenderCount:](v16, "setIncomingSenderCount:", (int)objc_msgSend(v5, "incomingSenderCount"));
      -[_CDContactStatistics setIncomingRecipientCount:](v16, "setIncomingRecipientCount:", (int)objc_msgSend(v5, "incomingRecipientCount"));
      -[_CDContactStatistics setOutgoingRecipientCount:](v16, "setOutgoingRecipientCount:", (int)objc_msgSend(v5, "outgoingRecipientCount"));
      objc_msgSend(v5, "firstIncomingSenderDate");
      -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDContactStatistics setFirstIncomingSenderDate:](v16, "setFirstIncomingSenderDate:", v17);

      objc_msgSend(v5, "firstIncomingRecipientDate");
      -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDContactStatistics setFirstIncomingRecipientDate:](v16, "setFirstIncomingRecipientDate:", v18);

      objc_msgSend(v5, "firstOutgoingRecipientDate");
      -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDContactStatistics setFirstOutgoingRecipientDate:](v16, "setFirstOutgoingRecipientDate:", v19);

      objc_msgSend(v5, "lastIncomingSenderDate");
      -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDContactStatistics setLastIncomingSenderDate:](v16, "setLastIncomingSenderDate:", v20);

      objc_msgSend(v5, "lastIncomingRecipientDate");
      -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDContactStatistics setLastIncomingRecipientDate:](v16, "setLastIncomingRecipientDate:", v21);

      objc_msgSend(v5, "lastOutgoingRecipientDate");
      -[_CDInteractionStore dateFromTimeIntervalSinceRef:](self, "dateFromTimeIntervalSinceRef:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDContactStatistics setLastOutgoingRecipientDate:](v16, "setLastOutgoingRecipientDate:", v22);

      objc_msgSend(v5, "contact");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setStatistics:", v16);

    }
    objc_msgSend(v5, "contact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)createAttachmentFromRecord:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _CDAttachment *v13;
  void *v15;
  void *v16;
  _CDAttachment *v17;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = a3;
    objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "sizeInBytes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", &unk_1E272A9D8))
    {

      v5 = 0;
    }
    v17 = [_CDAttachment alloc];
    objc_msgSend(v4, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLocalIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uti");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoSceneDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personInPhoto");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[_CDAttachment initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:](v17, "initWithIdentifier:cloudIdentifier:photoLocalIdentifier:type:sizeInBytes:creationDate:contentURL:contentText:photoSceneDescriptor:personInPhoto:", v16, v6, v7, v8, v5, v15, v9, v10, v11, v12);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)createKeywordFromRecord:(id)a3
{
  return (id)objc_msgSend(a3, "keyword");
}

- (id)createInteractionFromRecord:(id)a3
{
  id v4;
  _CDInteraction *v5;
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
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
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
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(_CDInteraction);
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "startDate");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setStartDate:](v5, "setStartDate:", v7);

    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "updateDate");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setUpdateDate:](v5, "setUpdateDate:", v9);

    v10 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "endDate");
    objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setEndDate:](v5, "setEndDate:", v11);

    objc_msgSend(v4, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setUuid:](v5, "setUuid:", v12);

    objc_msgSend(v4, "locationUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setLocationUUID:](v5, "setLocationUUID:", v13);

    -[_CDInteraction setMechanism:](v5, "setMechanism:", objc_msgSend(v4, "mechanism"));
    -[_CDInteraction setDirection:](v5, "setDirection:", objc_msgSend(v4, "direction"));
    -[_CDInteraction setIsResponse:](v5, "setIsResponse:", objc_msgSend(v4, "isResponse"));
    objc_msgSend(v4, "bundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setBundleId:](v5, "setBundleId:", v14);

    objc_msgSend(v4, "targetBundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setTargetBundleId:](v5, "setTargetBundleId:", v15);

    objc_msgSend(v4, "groupName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setGroupName:](v5, "setGroupName:", v16);

    v17 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "contentURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByRemovingPercentEncoding");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setContentURL:](v5, "setContentURL:", v20);

    objc_msgSend(v4, "sender");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteractionStore getContactForRecord:](self, "getContactForRecord:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setSender:](v5, "setSender:", v22);

    objc_msgSend(v4, "account");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setAccount:](v5, "setAccount:", v23);

    objc_msgSend(v4, "derivedIntentIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setDerivedIntentIdentifier:](v5, "setDerivedIntentIdentifier:", v24);

    objc_msgSend(v4, "domainIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setDomainIdentifier:](v5, "setDomainIdentifier:", v25);

    -[_CDInteraction setMailShareSheetDeletionCandidate:](v5, "setMailShareSheetDeletionCandidate:", objc_msgSend(v4, "mailShareSheetDeletionCandidate"));
    -[_CDInteraction setSelfParticipantStatus:](v5, "setSelfParticipantStatus:", objc_msgSend(v4, "selfParticipantStatus"));
    objc_msgSend(v4, "recipients");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v27)
    {
      v28 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v4, "recipients");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithCapacity:", objc_msgSend(v29, "count"));

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      objc_msgSend(v4, "recipients");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v76 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
            v37 = (void *)MEMORY[0x193FEE914]();
            -[_CDInteractionStore getContactForRecord:](self, "getContactForRecord:", v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v38);

            objc_autoreleasePoolPop(v37);
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
        }
        while (v33);
      }

      -[_CDInteraction setRecipients:](v5, "setRecipients:", v30);
    }
    objc_msgSend(v4, "keywords");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    if (v40)
    {
      v41 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v4, "keywords");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v41, "initWithCapacity:", objc_msgSend(v42, "count"));

      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      objc_msgSend(v4, "keywords");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v72;
        do
        {
          for (j = 0; j != v46; ++j)
          {
            if (*(_QWORD *)v72 != v47)
              objc_enumerationMutation(v44);
            v49 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
            v50 = (void *)MEMORY[0x193FEE914]();
            -[_CDInteractionStore createKeywordFromRecord:](self, "createKeywordFromRecord:", v49);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
              objc_msgSend(v43, "addObject:", v51);

            objc_autoreleasePoolPop(v50);
          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
        }
        while (v46);
      }

      -[_CDInteraction setKeywords:](v5, "setKeywords:", v43);
    }
    objc_msgSend(v4, "attachments");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "count");

    if (v53)
    {
      v54 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v4, "attachments");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(v54, "initWithCapacity:", objc_msgSend(v55, "count"));

      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      objc_msgSend(v4, "attachments", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v68;
        do
        {
          for (k = 0; k != v59; ++k)
          {
            if (*(_QWORD *)v68 != v60)
              objc_enumerationMutation(v57);
            v62 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k);
            v63 = (void *)MEMORY[0x193FEE914]();
            -[_CDInteractionStore createAttachmentFromRecord:](self, "createAttachmentFromRecord:", v62);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "addObject:", v64);

            objc_autoreleasePoolPop(v63);
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
        }
        while (v59);
      }

      -[_CDInteraction setAttachments:](v5, "setAttachments:", v56);
    }
    objc_msgSend(v4, "nsUserName");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setNsUserName:](v5, "setNsUserName:", v65);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)recordInteraction:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[_CDInteractionStore recordInteractions:](self, "recordInteractions:", v4);

  return (char)self;
}

- (BOOL)recordInteractions:(id)a3
{
  return -[_CDInteractionStore recordInteractionsBatch:error:](self, "recordInteractionsBatch:error:", a3, 0);
}

- (void)recordInteractions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *workQueue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60___CDInteractionStore_recordInteractions_completionHandler___block_invoke;
  v16[3] = &unk_1E26E4248;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v10 = v16;
  v11 = workQueue;
  v12 = v7;
  v13 = v6;
  v14 = (void *)os_transaction_create();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E26E3380;
  v20 = v14;
  v21 = v10;
  v15 = v14;
  dispatch_async(v11, block);

}

- (BOOL)recordInteractionsBatch:(id)a3 error:(id *)a4
{
  _CDMemoryUsageInterval *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *pendingShareInteractionQueue;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
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
  id v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  double v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  _CDMemoryUsageInterval *v66;
  _CDMemoryUsageInterval *v67;
  id v68;
  _CDMemoryUsageInterval *v69;
  uint64_t v70;
  _BOOL4 v71;
  uint64_t j;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v100;
  uint64_t v101;
  id v103;
  id v104;
  void *v105;
  _CDMemoryUsageInterval *oslog;
  id obj;
  uint64_t v108;
  _CDMemoryUsageInterval *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  _CDMemoryUsageInterval *v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  _CDInteractionStore *v126;
  uint8_t v127;
  char v128[15];
  id v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _QWORD v135[4];
  _CDMemoryUsageInterval *v136;
  id v137;
  _CDInteractionStore *v138;
  id v139;
  _BYTE *v140;
  id *v141;
  id v142;
  id *v143;
  uint64_t v144;
  uint64_t (*v145)(uint64_t, uint64_t);
  void (*v146)(uint64_t);
  id v147;
  id v148;
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _QWORD block[4];
  id v159;
  id v160;
  _CDInteractionStore *v161;
  uint8_t v162[4];
  uint64_t v163;
  __int16 v164;
  void *v165;
  void *v166;
  void *v167;
  uint8_t v168[128];
  _BYTE buf[24];
  uint64_t (*v170)(uint64_t, uint64_t);
  void (*v171)(uint64_t);
  id v172;
  void *v173;
  _BYTE v174[128];
  _BYTE v175[128];
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  v104 = a3;
  v126 = self;
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  oslog = (_CDMemoryUsageInterval *)objc_claimAutoreleasedReturnValue();
  if (!v105)
  {
    if (os_log_type_enabled(&oslog->super, OS_LOG_TYPE_ERROR))
      -[_CDInteractionStore recordInteractionsBatch:error:].cold.4();
    goto LABEL_95;
  }
  v5 = oslog;
  if (os_log_type_enabled(&oslog->super, OS_LOG_TYPE_INFO))
  {
    v6 = v104;
    v7 = objc_msgSend(v104, "count");
    v8 = objc_msgSend(v104, "count");
    if (v8 >= 0xB)
    {
      v9 = (void *)MEMORY[0x193FEE914]();
      objc_msgSend(v104, "subarrayWithRange:", 0, 10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v9);
    }
    *(_DWORD *)buf = 134218243;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2117;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_18DDBE000, &oslog->super, OS_LOG_TYPE_INFO, "recordInteractionsBatch - recording: %tu interactions %{sensitive}@", buf, 0x16u);
    if (v8 >= 0xB)

    v5 = oslog;
  }

  oslog = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("recordInteractionsBatchPreprocessing"), 0);
  -[_CDMemoryUsageInterval begin](oslog, "begin");
  v10 = (void *)objc_msgSend(v104, "mutableCopy");
  pendingShareInteractionQueue = v126->_pendingShareInteractionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke;
  block[3] = &unk_1E26E35A8;
  v159 = v104;
  v103 = v10;
  v160 = v103;
  v161 = v126;
  dispatch_sync(pendingShareInteractionQueue, block);
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_CDInteractionStore recordInteractionsBatch:error:].cold.3();

  if (!objc_msgSend(v103, "count"))
  {
    -[_CDMemoryUsageInterval end](oslog, "end");
    goto LABEL_94;
  }
  objc_msgSend(v103, "sortedArrayUsingComparator:", &__block_literal_global_32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[_CDInteractionStore recordInteractionsBatch:error:].cold.2();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  obj = v13;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v175, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v155;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v155 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * v18);
        objc_msgSend(v19, "targetBundleId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDConstants shareSheetTargetBundleIdMail]();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToString:", v21);

        if (v22)
        {
          objc_msgSend(v19, "setMailShareSheetDeletionCandidate:", 1);
          objc_msgSend(v114, "addObject:", v19);
          goto LABEL_30;
        }
        objc_msgSend(v19, "bundleId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDConstants mobileMessagesBundleId]();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v23, "isEqualToString:", v24))
          goto LABEL_28;
        objc_msgSend(v19, "groupName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
          goto LABEL_28;
        objc_msgSend(v19, "domainIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {

LABEL_28:
LABEL_29:
          objc_msgSend(v114, "addObject:", v19);
          goto LABEL_30;
        }
        v27 = objc_msgSend(v19, "mechanism") == 4;

        if (!v27)
          goto LABEL_29;
        v28 = objc_msgSend(v19, "direction") == 0;
        objc_msgSend(v19, "domainIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v29);

        }
        else
        {
          objc_msgSend(v112, "setObject:forKeyedSubscript:", v19, v29);

          objc_msgSend(v19, "domainIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31 == 0;

          if (!v32)
          {
            objc_msgSend(v19, "domainIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeObjectForKey:", v33);

          }
        }
LABEL_30:
        ++v18;
      }
      while (v16 != v18);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v154, v175, 16);
      v16 = v34;
    }
    while (v34);
  }

  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v113 = v15;
  v110 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v150, v174, 16);
  if (!v110)
    goto LABEL_59;
  v108 = *(_QWORD *)v151;
  do
  {
    for (i = 0; i != v110; ++i)
    {
      if (*(_QWORD *)v151 != v108)
        objc_enumerationMutation(v113);
      v36 = *(_QWORD *)(*((_QWORD *)&v150 + 1) + 8 * i);
      objc_msgSend(v113, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "addObject:", v37);
      objc_msgSend(v112, "objectForKeyedSubscript:", v36);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v37, "startDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "predicateWithFormat:", CFSTR("(startDate <= %@)"), v40);
      v124 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "addObject:", v124);
      v41 = (void *)MEMORY[0x1E0CB3880];
      +[_CDConstants mobileMessagesBundleId]();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "predicateWithFormat:", CFSTR("(bundleId == %@)"), v42);
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "addObject:", v122);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(domainIdentifier == %@)"), v36);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v120);
      v43 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E272BCE0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "predicateWithFormat:", CFSTR("(direction IN %@)"), v44);
      v118 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "addObject:", v118);
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v38);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = 0;
      v173 = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v173, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = 0;
      -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:offset:objectIDs:error:](v126, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:objectIDs:error:", v117, v46, 1, 0, &v142, &v149);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v149;
      objc_msgSend(v47, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = (void *)MEMORY[0x193FEE914]();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v142);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v50);
      if (v48)
      {
        +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v48;
          _os_log_error_impl(&dword_18DDBE000, v52, OS_LOG_TYPE_ERROR, "Error retrieving old interaction from store when attempting messages groupName update: %@", buf, 0xCu);
        }
LABEL_42:

        goto LABEL_57;
      }
      if (v49 && v116)
      {
        objc_msgSend(v116, "startDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "startDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "timeIntervalSinceDate:", v54);
        v56 = v55 < 0.0;

        if (!v56)
        {
          objc_msgSend(v37, "groupName");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "setGroupName:", v57);

          objc_msgSend(v37, "contentURL");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "setContentURL:", v58);

          -[_CDInteractionStore recipientArrayWithMostRecentSenderFirstFromIncomingInteraction:outgoingInteraction:](v126, "recipientArrayWithMostRecentSenderFirstFromIncomingInteraction:outgoingInteraction:", v37, v116);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "setRecipients:", v59);

          objc_msgSend(v112, "removeObjectForKey:", v36);
          objc_msgSend(v114, "addObject:", v116);
          goto LABEL_56;
        }
      }
      else if (!v49)
      {
        objc_msgSend(v37, "contentURL");

        goto LABEL_56;
      }
      objc_msgSend(v37, "groupName");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setGroupName:", v60);

      objc_msgSend(v37, "contentURL");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setContentURL:", v61);

      objc_msgSend(v37, "sender");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v61) = v62 == 0;

      if ((_DWORD)v61)
      {
        objc_msgSend(v37, "recipients");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setRecipients:", v63);

      }
      -[_CDInteractionStore recipientArrayWithMostRecentSenderFirstFromIncomingInteraction:outgoingInteraction:](v126, "recipientArrayWithMostRecentSenderFirstFromIncomingInteraction:outgoingInteraction:", v37, v49);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setRecipients:", v64);

      v148 = 0;
      -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](v126, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v51, 0, 1, CFSTR("recordInteractionsBatch upsert (case A)"), &v148);
      v65 = v148;
      if (v65)
      {
        v48 = v65;
        +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v48;
          _os_log_error_impl(&dword_18DDBE000, v52, OS_LOG_TYPE_ERROR, "Error deleting old interaction from store when attempting messages groupName update: %@", buf, 0xCu);
        }
        goto LABEL_42;
      }
      objc_msgSend(v114, "addObject:", v49);
LABEL_56:
      v48 = 0;
LABEL_57:

    }
    v110 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v150, v174, 16);
  }
  while (v110);
LABEL_59:

  objc_msgSend(v112, "allValues");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "addObjectsFromArray:", v111);
  -[_CDMemoryUsageInterval end](oslog, "end");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v170 = __Block_byref_object_copy__10;
  v171 = __Block_byref_object_dispose__10;
  v172 = 0;
  v142 = 0;
  v143 = &v142;
  v144 = 0x3032000000;
  v145 = __Block_byref_object_copy__10;
  v146 = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v147 = (id)objc_claimAutoreleasedReturnValue();
  v66 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("recordInteractionsBatch"), 0);
  v135[0] = MEMORY[0x1E0C809B0];
  v135[1] = 3221225472;
  v135[2] = __53___CDInteractionStore_recordInteractionsBatch_error___block_invoke_198;
  v135[3] = &unk_1E26E47F8;
  v67 = v66;
  v136 = v67;
  v68 = v114;
  v137 = v68;
  v138 = v126;
  v139 = v105;
  v140 = buf;
  v141 = &v142;
  v121 = v139;
  objc_msgSend(v139, "performWithOptions:andBlock:", 4, v135);
  -[_CDMemoryUsageInterval end](v67, "end");
  v109 = v67;
  v69 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("recordInteractionsBatchPostProcessing"), 0);
  -[_CDMemoryUsageInterval begin](v69, "begin");
  v115 = v69;
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v119 = v143[5];
  v70 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v131, v168, 16);
  v123 = v68;
  if (v70)
  {
    LOBYTE(v71) = 0;
    v125 = *(_QWORD *)v132;
    do
    {
      for (j = 0; j != v70; ++j)
      {
        if (*(_QWORD *)v132 != v125)
          objc_enumerationMutation(v119);
        v73 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@"), v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("updateDate"), 0);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v167 = v75;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v167, 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (id *)(*(_QWORD *)&buf[8] + 40);
        v130 = *(id *)(*(_QWORD *)&buf[8] + 40);
        -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:error:](v126, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v74, v76, 1, &v130);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v77, v130);
        objc_msgSend(v78, "firstObject");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (v71)
          goto LABEL_65;
        objc_msgSend(v79, "bundleId");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDConstants mobileMessagesBundleId]();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v80, "isEqualToString:", v81) & 1) != 0)
        {
          objc_msgSend(v79, "recipients");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = (unint64_t)objc_msgSend(v82, "count") > 1;

          if (v71)
          {
            notify_post((const char *)objc_msgSend(CFSTR("com.apple.CoreDuet.InteractionStore.MessagesGroupInfoChange"), "UTF8String"));
LABEL_65:
            LOBYTE(v71) = 1;
          }
        }
        else
        {

          LOBYTE(v71) = 0;
        }
        if (v79)
        {
          v83 = (void *)MEMORY[0x1E0CB3880];
          objc_msgSend(v79, "updateDate");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "predicateWithFormat:", CFSTR("uuid == %@ AND updateDate < %@"), v73, v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("updateDate"), 0);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v166 = v86;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v166, 1);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = (id *)(*(_QWORD *)&buf[8] + 40);
          v129 = *(id *)(*(_QWORD *)&buf[8] + 40);
          -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:error:](v126, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v85, v87, 1, &v129);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v88, v129);
          objc_msgSend(v89, "firstObject");
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v162 = 138412290;
            v163 = (uint64_t)v79;
            _os_log_debug_impl(&dword_18DDBE000, v91, OS_LOG_TYPE_DEBUG, "duplicateUUID handling, latest interaction: %@", v162, 0xCu);
          }

          +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v162 = 138412290;
            v163 = (uint64_t)v90;
            _os_log_debug_impl(&dword_18DDBE000, v92, OS_LOG_TYPE_DEBUG, "duplicateUUID handling, toBeDeletedInteraction: %@", v162, 0xCu);
          }

          if (objc_msgSend(v90, "mechanism") == 13)
          {
            +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
            v93 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              -[_CDInteractionStore recordInteractionsBatch:error:].cold.1(&v127, v128, v93);

            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@ AND mechanism == %@"), v73, &unk_1E272AA20);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            +[_CDInteractionStore predicateFilteringUsernameForPredicate:](_CDInteractionStore, "predicateFilteringUsernameForPredicate:", v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v101) = 0;
            +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v121, CFSTR("Interactions"), v95, 0, 0, 0, v101);

          }
          else
          {
            +[_CDInteractionStore predicateFilteringUsernameForPredicate:](_CDInteractionStore, "predicateFilteringUsernameForPredicate:", v85);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v100) = 0;
            +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v121, CFSTR("Interactions"), v94, 0, 0, 0, v100);
          }

          objc_msgSend(v123, "removeObject:", v79);
        }

      }
      v70 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v131, v168, 16);
    }
    while (v70);
  }

  if (a4)
  {
    v96 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v96)
      *a4 = objc_retainAutorelease(v96);
  }
  if (objc_msgSend(v123, "count"))
    -[_CDInteractionStoreNotifier recorded:](v126->_notifier, "recorded:", v123);
  -[_CDMemoryUsageInterval end](v115, "end");
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v97 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
  {
    v98 = objc_msgSend(v123, "count");
    *(_DWORD *)v162 = 134218243;
    v163 = v98;
    v164 = 2117;
    v165 = v123;
    _os_log_impl(&dword_18DDBE000, v97, OS_LOG_TYPE_INFO, "recordInteractionsBatch - recorded %tu interactions, %{sensitive}@", v162, 0x16u);
  }

  _Block_object_dispose(&v142, 8);
  _Block_object_dispose(buf, 8);

LABEL_94:
LABEL_95:

  return v105 != 0;
}

- (BOOL)openAndCheckIfReadable
{
  void *v2;
  BOOL v3;

  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)recipientArrayWithMostRecentSenderFirstFromIncomingInteraction:(id)a3 outgoingInteraction:(id)a4
{
  void *v4;
  void *v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "recipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v7, "sender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && objc_msgSend(v10, "containsObject:", v11))
  {
    objc_msgSend(v10, "removeObject:", v11);
    objc_msgSend(v10, "insertObject:atIndex:", v11, 0);
    goto LABEL_20;
  }
  objc_msgSend(v11, "identifier", v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
    goto LABEL_19;
  v14 = 0;
  while (1)
  {
    if (!v13)
    {
      if (!v12)
        goto LABEL_15;
      goto LABEL_11;
    }
    objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v13))
      break;
    if (!v12)
    {

      goto LABEL_15;
    }
LABEL_11:
    objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v12);

    if (v13)
    {

      if ((v17 & 1) != 0)
        goto LABEL_18;
    }
    else if (v17)
    {
      goto LABEL_18;
    }
LABEL_15:
    if (objc_msgSend(v10, "count") <= (unint64_t)++v14)
      goto LABEL_19;
  }

LABEL_18:
  objc_msgSend(v10, "removeObjectAtIndex:", v14);
  objc_msgSend(v10, "insertObject:atIndex:", v11, 0);
LABEL_19:

  v8 = v20;
  v7 = v21;
LABEL_20:
  v18 = (void *)objc_msgSend(v10, "copy");

  return v18;
}

- (BOOL)updateInteractionsBatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  unint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[_CDInteractionStore predicateForInteractions:](self, "predicateForInteractions:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](self, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v7, 0, -1, CFSTR("updateInteractionsBatch"), 0);
    +[_CDLogging mediaAnalysisChannel](_CDLogging, "mediaAnalysisChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218240;
      v13 = v8;
      v14 = 2048;
      v15 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_DEFAULT, "Deleted %tu interactions, creating %tu interactions", (uint8_t *)&v12, 0x16u);
    }

    v10 = -[_CDInteractionStore recordInteractionsBatch:error:](self, "recordInteractionsBatch:error:", v6, a4);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)predicateForInteractions:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_213);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid in %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)countInteractionsUsingPredicate:(id)a3 error:(id *)a4
{
  id v5;
  _CDMemoryUsageInterval *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v5 = a3;
  v6 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("countInteractionsUsingPredicate"), 0);
  -[_CDMemoryUsageInterval begin](v6, "begin");
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDInteractionStore predicateFilteringUsernameForPredicate:](_CDInteractionStore, "predicateFilteringUsernameForPredicate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = +[_DKCoreDataStorage countObjectsInContext:entityName:predicate:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "countObjectsInContext:entityName:predicate:includeSubentities:includePendingChanges:", v7, CFSTR("Interactions"), v8, 0, 0);
  -[_CDMemoryUsageInterval end](v6, "end");

  return v9;
}

- (void)countInteractionsUsingPredicate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  OS_dispatch_queue *workQueue;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    workQueue = self->_workQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __73___CDInteractionStore_countInteractionsUsingPredicate_completionHandler___block_invoke;
    v14[3] = &unk_1E26E4248;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    v10 = v14;
    v11 = workQueue;
    v12 = (void *)os_transaction_create();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
    block[3] = &unk_1E26E3380;
    v18 = v12;
    v19 = v10;
    v13 = v12;
    dispatch_async(v11, block);

  }
}

- (unint64_t)countContactsUsingPredicate:(id)a3 error:(id *)a4
{
  id v5;
  _CDMemoryUsageInterval *v6;
  void *v7;
  unint64_t v8;

  v5 = a3;
  v6 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("countContactsUsingPredicate"), 0);
  -[_CDMemoryUsageInterval begin](v6, "begin");
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[_DKCoreDataStorage countObjectsInContext:entityName:predicate:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "countObjectsInContext:entityName:predicate:includeSubentities:includePendingChanges:", v7, CFSTR("Contacts"), v5, 0, 0);

  -[_CDMemoryUsageInterval end](v6, "end");
  return v8;
}

- (void)countContactsUsingPredicate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  OS_dispatch_queue *workQueue;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    workQueue = self->_workQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69___CDInteractionStore_countContactsUsingPredicate_completionHandler___block_invoke;
    v14[3] = &unk_1E26E4248;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    v10 = v14;
    v11 = workQueue;
    v12 = (void *)os_transaction_create();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
    block[3] = &unk_1E26E3380;
    v18 = v12;
    v19 = v10;
    v13 = v12;
    dispatch_async(v11, block);

  }
}

- (unint64_t)numberOfInteractionsMatchingPredicate:(id)a3
{
  return -[_CDInteractionStore countInteractionsUsingPredicate:error:](self, "countInteractionsUsingPredicate:error:", a3, 0);
}

- (id)queryInteractionsUsingPredicate:(id)a3 matchingNameTokens:(id)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6 error:(id *)a7
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v27;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v9 = a4;
  v27 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY recipients.displayName CONTAINS[cd] %@"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sender.displayName CONTAINS[cd] %@"), v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);
        objc_msgSend(v10, "addObject:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v10);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v30)
  {
    v21 = (void *)MEMORY[0x1E0CB3528];
    v35[0] = v30;
    v35[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v23;
  }
  -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:](self, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", v20, v27, a6, 0, a7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5
{
  return -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:error:](self, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", a3, a4, a5, 0);
}

- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  OS_dispatch_queue *workQueue;
  _QWORD *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  _QWORD block[4];
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    v13 = MEMORY[0x1E0C809B0];
    workQueue = self->_workQueue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __95___CDInteractionStore_queryInteractionsUsingPredicate_sortDescriptors_limit_completionHandler___block_invoke;
    v19[3] = &unk_1E26E4928;
    v19[4] = self;
    v20 = v10;
    v21 = v11;
    v23 = a5;
    v22 = v12;
    v15 = v19;
    v16 = workQueue;
    v17 = (void *)os_transaction_create();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
    block[3] = &unk_1E26E3380;
    v25 = v17;
    v26 = v15;
    v18 = v17;
    dispatch_async(v16, block);

  }
}

- (id)queryInteractionsUsingPredicate:(id)a3 withLimit:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3928];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithKey:ascending:", CFSTR("startDate"), 0);
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:](self, "queryInteractionsUsingPredicate:sortDescriptors:limit:", v7, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _CDMemoryUsageInterval *v14;
  _CDMemoryUsageInterval *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  _CDMemoryUsageInterval *v26;
  id v27;
  id v28;
  id v29;
  _CDInteractionStore *v30;
  uint64_t *v31;
  __int128 *p_buf;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  __int128 buf;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a5;
    _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_INFO, "queryContactsUsingPredicate - querying for %tu items from interaction store", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__10;
  v43 = __Block_byref_object_dispose__10;
  v44 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__10;
  v38 = __Block_byref_object_dispose__10;
  v39 = 0;
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("queryContactsUsingPredicate"), 0);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __79___CDInteractionStore_queryContactsUsingPredicate_sortDescriptors_limit_error___block_invoke;
  v25 = &unk_1E26E4950;
  v15 = v14;
  v26 = v15;
  v16 = v13;
  v27 = v16;
  v17 = v10;
  v28 = v17;
  v18 = v11;
  v29 = v18;
  v30 = self;
  v31 = &v34;
  p_buf = &buf;
  v33 = a5;
  objc_msgSend(v16, "performWithOptions:andBlock:", 4, &v22);
  -[_CDMemoryUsageInterval end](v15, "end", v22, v23, v24, v25);
  if (a6)
  {
    v19 = (void *)v35[5];
    if (v19)
      *a6 = objc_retainAutorelease(v19);
  }
  v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&buf, 8);

  return v20;
}

- (id)queryContactsUsingPredicate:(id)a3 withLimit:(unint64_t)a4 error:(id *)a5
{
  return -[_CDInteractionStore queryContactsUsingPredicate:sortDescriptors:limit:error:](self, "queryContactsUsingPredicate:sortDescriptors:limit:error:", a3, 0, a4, 0);
}

- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  OS_dispatch_queue *workQueue;
  _QWORD *v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  _QWORD block[4];
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    v13 = MEMORY[0x1E0C809B0];
    workQueue = self->_workQueue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91___CDInteractionStore_queryContactsUsingPredicate_sortDescriptors_limit_completionHandler___block_invoke;
    v19[3] = &unk_1E26E4928;
    v19[4] = self;
    v20 = v10;
    v21 = v11;
    v23 = a5;
    v22 = v12;
    v15 = v19;
    v16 = workQueue;
    v17 = (void *)os_transaction_create();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
    block[3] = &unk_1E26E3380;
    v25 = v17;
    v26 = v15;
    v18 = v17;
    dispatch_async(v16, block);

  }
}

- (unint64_t)numberOfContactsMatchingPredicate:(id)a3
{
  return -[_CDInteractionStore countContactsUsingPredicate:error:](self, "countContactsUsingPredicate:error:", a3, 0);
}

- (id)queryContactInteractionsUsingPredicate:(id)a3 withLimit:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  _CDMemoryUsageInterval *v9;
  _CDMemoryUsageInterval *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  _CDMemoryUsageInterval *v19;
  id v20;
  id v21;
  _CDInteractionStore *v22;
  __int128 *p_buf;
  unint64_t v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a4;
    _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_INFO, "queryContactInteractionsUsingPredicate - querying for %tu items from interaction store", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("queryContactInteractionsUsingPredicate"), 0);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __72___CDInteractionStore_queryContactInteractionsUsingPredicate_withLimit___block_invoke;
  v18 = &unk_1E26E4978;
  v10 = v9;
  v19 = v10;
  v11 = v8;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  v22 = self;
  p_buf = &buf;
  v24 = a4;
  objc_msgSend(v11, "performWithOptions:andBlock:", 4, &v15);
  -[_CDMemoryUsageInterval end](v10, "end", v15, v16, v17, v18);
  v13 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v13;
}

- (id)histogramContactInteractionsUsingPredicate:(id)a3 withLimit:(unint64_t)a4
{
  id v6;
  void *v7;
  _CDMemoryUsageInterval *v8;
  _CDMemoryUsageInterval *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  _CDMemoryUsageInterval *v18;
  id v19;
  id v20;
  _CDInteractionStore *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("histogramContactInteractionsUsingPredicate"), 0);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __76___CDInteractionStore_histogramContactInteractionsUsingPredicate_withLimit___block_invoke;
  v17 = &unk_1E26E49A0;
  v9 = v8;
  v18 = v9;
  v10 = v7;
  v19 = v10;
  v11 = v6;
  v22 = &v24;
  v23 = a4;
  v20 = v11;
  v21 = self;
  objc_msgSend(v10, "performWithOptions:andBlock:", 4, &v14);
  -[_CDMemoryUsageInterval end](v9, "end", v14, v15, v16, v17);
  v12 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v12;
}

- (id)interactionCountPerMechanism
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  for (i = 0; i != 21; ++i)
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("mechanism = %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[_CDInteractionStore countInteractionsUsingPredicate:error:](self, "countInteractionsUsingPredicate:error:", v7, 0);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      mechanismToString(i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

    }
  }
  return v3;
}

- (id)usersWithInteractions
{
  void *v3;
  void *v4;
  _CDMemoryUsageInterval *v5;
  id v6;
  id v7;
  _CDMemoryUsageInterval *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  _CDMemoryUsageInterval *v13;
  id v14;
  id v15;

  v3 = (void *)objc_opt_new();
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("usersWithInteractions"), 0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44___CDInteractionStore_usersWithInteractions__block_invoke;
  v12[3] = &unk_1E26E35A8;
  v13 = v5;
  v14 = v4;
  v6 = v3;
  v15 = v6;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v7, "performWithOptions:andBlock:", 4, v12);
  -[_CDMemoryUsageInterval end](v8, "end");
  v9 = v15;
  v10 = v6;

  return v10;
}

- (id)conversationsWithInteractions
{
  void *v3;
  void *v4;
  _CDMemoryUsageInterval *v5;
  id v6;
  id v7;
  _CDMemoryUsageInterval *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  _CDMemoryUsageInterval *v13;
  id v14;
  id v15;

  v3 = (void *)objc_opt_new();
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("conversationsWithInteractions"), 0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52___CDInteractionStore_conversationsWithInteractions__block_invoke;
  v12[3] = &unk_1E26E35A8;
  v13 = v5;
  v14 = v4;
  v6 = v3;
  v15 = v6;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v7, "performWithOptions:andBlock:", 4, v12);
  -[_CDMemoryUsageInterval end](v8, "end");
  v9 = v15;
  v10 = v6;

  return v10;
}

- (id)kMostRecentConversationsWithLimit:(unint64_t)a3 predicate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _CDMemoryUsageInterval *v9;
  id v10;
  id v11;
  id v12;
  _CDMemoryUsageInterval *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  _CDMemoryUsageInterval *v18;
  id v19;
  id v20;
  id v21;
  unint64_t v22;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("kMostRecentConversationsWithLimit"), 0);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67___CDInteractionStore_kMostRecentConversationsWithLimit_predicate___block_invoke;
  v17[3] = &unk_1E26E49C8;
  v18 = v9;
  v19 = v8;
  v20 = v6;
  v10 = v7;
  v21 = v10;
  v22 = a3;
  v11 = v6;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v12, "performWithOptions:andBlock:", 4, v17);
  -[_CDMemoryUsageInterval end](v13, "end");
  v14 = v21;
  v15 = v10;

  return v15;
}

- (id)getInteractionsStatisticsForConfig:(id)a3
{
  id v4;
  _CDInteractionsStatistics *v5;
  void *v6;
  _CDInteractionsStatistics *v7;
  void *v8;
  _CDMemoryUsageInterval *v9;
  _CDInteractionsStatistics *v10;
  id v11;
  id v12;
  _CDMemoryUsageInterval *v13;
  _CDInteractionsStatistics *v14;
  _CDInteractionsStatistics *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  _CDMemoryUsageInterval *v21;
  id v22;
  id v23;
  _CDInteractionsStatistics *v24;

  v4 = a3;
  v5 = [_CDInteractionsStatistics alloc];
  objc_msgSend(v4, "defaultValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_CDInteractionsStatistics initWithDefaultValues:](v5, "initWithDefaultValues:", v6);

  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("getInteractionsStatisticsForConfig"), 0);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __58___CDInteractionStore_getInteractionsStatisticsForConfig___block_invoke;
  v20 = &unk_1E26E4A58;
  v21 = v9;
  v22 = v8;
  v23 = v4;
  v10 = v7;
  v24 = v10;
  v11 = v4;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v12, "performWithOptions:andBlock:", 4, &v17);
  -[_CDMemoryUsageInterval end](v13, "end", v17, v18, v19, v20);
  v14 = v24;
  v15 = v10;

  return v15;
}

- (void)enterMaintenanceMode
{
  self->_inMaintenanceMode = 1;
  -[_CDInteractionStoreNotifier suspend](self->_notifier, "suspend");
}

- (void)exitMaintenanceMode
{
  -[_CDInteractionStoreNotifier resume](self->_notifier, "resume");
  -[_CDInteractionStoreNotifier deleteAll](self->_notifier, "deleteAll");
  self->_inMaintenanceMode = 0;
}

- (unint64_t)deleteUnreferencedKeywords
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v6;

  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("interactions.@count == 0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  v4 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v2, CFSTR("Keywords"), v3, MEMORY[0x1E0C9AA60], 20000, 0, v6);

  return v4;
}

- (unint64_t)deleteUnreferencedContacts
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v6;

  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("interactionRecipient.@count == 0 AND interactionSender.@count == 0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  v4 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v2, CFSTR("Contacts"), v3, MEMORY[0x1E0C9AA60], 20000, 0, v6);

  return v4;
}

- (unint64_t)deleteInteractionsOlderThanDate:(id)a3 limit:(unint64_t)a4
{
  return -[_CDInteractionStore deleteInteractionsOlderThanDate:debuggingReason:limit:](self, "deleteInteractionsOlderThanDate:debuggingReason:limit:", a3, CFSTR("deleteInteractionsOlderThanDate"), a4);
}

- (unint64_t)deleteInteractionsOlderThanDate:(id)a3 debuggingReason:(id)a4 limit:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB3928];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate < %@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](self, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v12, v13, a5, v9, 0);

  return v14;
}

- (unint64_t)deleteOldInteractionsIfNeededToLimitTotalNumber:(unint64_t)a3 limit:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v14;
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v14) = 1;
  v11 = +[_DKCoreDataStorage deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", a3, v8, CFSTR("Interactions"), v9, v10, a4, v14);

  if (v11)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v16 = v11;
      v17 = 2048;
      v18 = a3;
      v19 = 2048;
      v20 = a4;
      _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_DEFAULT, "Deleted %tu interactions due to age (deleteOldInteractionsIfNeededToLimitTotalNumber:%tu limit:%tu)", buf, 0x20u);
    }

    -[_CDInteractionStore deleteUnreferencedKeywords](self, "deleteUnreferencedKeywords");
    -[_CDInteractionStore deleteUnreferencedContacts](self, "deleteUnreferencedContacts");
    if (!self->_inMaintenanceMode)
      -[_CDInteractionStoreNotifier deleteAll](self->_notifier, "deleteAll");
  }

  return v11;
}

- (void)closeStorage
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_6(&dword_18DDBE000, v0, v1, "Closing interaction storage connection", v2);
  OUTLINED_FUNCTION_4();
}

- (int64_t)queryVersionNumber
{
  void *v2;
  id v3;
  int64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0x8000000000000000;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41___CDInteractionStore_queryVersionNumber__block_invoke;
  v6[3] = &unk_1E26E4A80;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v3, "performWithOptions:andBlock:", 4, v6);
  v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BOOL)recordVersionNumber:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  int64_t v9;

  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43___CDInteractionStore_recordVersionNumber___block_invoke;
  v7[3] = &unk_1E26E4AA8;
  v8 = v4;
  v9 = a3;
  v5 = v4;
  objc_msgSend(v5, "performWithOptions:andBlock:", 4, v7);

  return 1;
}

- (BOOL)deleteStorage
{
  _BOOL4 v3;

  v3 = -[_DKCoreDataStorage deleteStorageFor:](self->_storage, "deleteStorageFor:", *MEMORY[0x1E0CB2AC0]);
  if (v3 && !self->_inMaintenanceMode)
    -[_CDInteractionStoreNotifier deleteAll](self->_notifier, "deleteAll");
  return v3;
}

- (unint64_t)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v34 = a6;
  v33 = MEMORY[0x193FEE914]();
  if (a5 >= 0x3E8)
    v13 = 1000;
  else
    v13 = a5;
  if (a5)
    v14 = v13;
  else
    v14 = 1000;
  v35 = 0;
  v36 = 0;
  -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:offset:objectIDs:error:](self, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:objectIDs:error:", v11, v12, v14, 0, &v36, &v35);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v35;
  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_290);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend(v36, "count") >= v14)
        v19 = CFSTR("at least ");
      else
        v19 = &stru_1E26E9728;
      v20 = objc_msgSend(v36, "count");
      *(_DWORD *)buf = 138544131;
      v38 = v19;
      v39 = 2048;
      v40 = v20;
      v41 = 2114;
      v42 = v34;
      v43 = 2113;
      v44 = v17;
      _os_log_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEFAULT, "Deleted %{public}@%tu interactions with reason %{public}@: %{private}@", buf, 0x2Au);
    }

  }
  v21 = objc_msgSend(v36, "count");
  -[_DKCoreDataStorage managedObjectContextFor:](self->_storage, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 >= v14)
  {
    +[_CDInteractionStore predicateFilteringUsernameForPredicate:](_CDInteractionStore, "predicateFilteringUsernameForPredicate:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v32) = 0;
    v24 = v22;
    v25 = v23;
    v26 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v32) = 0;
    v24 = v22;
    v25 = v23;
    v26 = 0;
  }
  v27 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v24, CFSTR("Interactions"), v25, v26, a5, 0, v32);

  if (v16 && v27)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:].cold.1();

    v29 = (void *)v33;
  }
  else
  {
    if (v16 && !v27)
    {
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:].cold.2();

      v29 = (void *)v33;
      goto LABEL_31;
    }
    v29 = (void *)v33;
    if (!v27)
      goto LABEL_31;
  }
  -[_CDInteractionStore deleteUnreferencedKeywords](self, "deleteUnreferencedKeywords");
  -[_CDInteractionStore deleteUnreferencedContacts](self, "deleteUnreferencedContacts");
  if (self->_inMaintenanceMode)
  {
    if (v16)
LABEL_30:
      -[_CDInteractionStoreNotifier deleteAll](self->_notifier, "deleteAll");
  }
  else
  {
    if (v16 || v27 > 0x3E8)
      goto LABEL_30;
    if (v27 <= 0x3E7)
      -[_CDInteractionStoreNotifier deleted:](self->_notifier, "deleted:", v15);
  }
LABEL_31:

  objc_autoreleasePoolPop(v29);
  return v27;
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v8 = (void *)MEMORY[0x1E0CB3880];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("bundleId == %@ AND account == %@"), v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("deleteInteractionsWithBundleId:%@ account:%@"), v10, v9);

  v13 = -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](self, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", v11, MEMORY[0x1E0C9AA60], 20000, v12, a5);
  return v13;
}

- (unint64_t)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_CDInteractionStore deleteInteractionsWithBundleId:domainIdentifiers:error:](self, "deleteInteractionsWithBundleId:domainIdentifiers:error:", v10, v11, a5, v14, v15);
  return v12;
}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:completionHandler:](self, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:completionHandler:", a3, a4, a5, CFSTR("unspecified reason"), a6);
}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 debuggingReason:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  OS_dispatch_queue *workQueue;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  _QWORD block[4];
  id v33;
  id v34;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  workQueue = self->_workQueue;
  v17 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __115___CDInteractionStore_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_completionHandler___block_invoke;
  v26[3] = &unk_1E26E4B18;
  v26[4] = self;
  v27 = v12;
  v28 = v13;
  v29 = v14;
  v30 = v15;
  v31 = a5;
  v18 = v26;
  v19 = workQueue;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  v24 = (void *)os_transaction_create();
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E26E3380;
  v33 = v24;
  v34 = v18;
  v25 = v24;
  dispatch_async(v19, block);

}

- (void)deleteInteractionsWithBundleId:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *workQueue;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72___CDInteractionStore_deleteInteractionsWithBundleId_completionHandler___block_invoke;
  v16[3] = &unk_1E26E4248;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v10 = v16;
  v11 = workQueue;
  v12 = v7;
  v13 = v6;
  v14 = (void *)os_transaction_create();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E26E3380;
  v20 = v14;
  v21 = v10;
  v15 = v14;
  dispatch_async(v11, block);

}

- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *workQueue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80___CDInteractionStore_deleteInteractionsWithBundleId_account_completionHandler___block_invoke;
  v20[3] = &unk_1E26E4B40;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v13 = v20;
  v14 = workQueue;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v18 = (void *)os_transaction_create();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E26E3380;
  v25 = v18;
  v26 = v13;
  v19 = v18;
  dispatch_async(v14, block);

}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *workQueue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __89___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifier_completionHandler___block_invoke;
  v20[3] = &unk_1E26E4B40;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v13 = v20;
  v14 = workQueue;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v18 = (void *)os_transaction_create();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E26E3380;
  v25 = v18;
  v26 = v13;
  v19 = v18;
  dispatch_async(v14, block);

}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *workQueue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90___CDInteractionStore_deleteInteractionsWithBundleId_domainIdentifiers_completionHandler___block_invoke;
  v20[3] = &unk_1E26E4B40;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v13 = v20;
  v14 = workQueue;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v18 = (void *)os_transaction_create();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_3;
  block[3] = &unk_1E26E3380;
  v25 = v18;
  v26 = v13;
  v19 = v18;
  dispatch_async(v14, block);

}

- (void)truncateInteractionsToCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    -[_CDInteractionStore deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:](self, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:", 0, 0, 0, CFSTR("truncateInteractionsToCount:0"), 0);
    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:](self, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", 0, v6, 1, a3 - 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("truncateInteractionsToCount:%tu (cutoffDate: %@)"), a3, v9);
    -[_CDInteractionStore deleteInteractionsOlderThanDate:debuggingReason:limit:](self, "deleteInteractionsOlderThanDate:debuggingReason:limit:", v9, v10, 0);
LABEL_8:

    goto LABEL_9;
  }
  if (v8)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[_CDInteractionStore truncateInteractionsToCount:].cold.1(v8, v10);
    goto LABEL_8;
  }
LABEL_9:

}

- (id)anonymizedCopyToDirectory:(id)a3 salt:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x193FEE914]();
  v9 = -[_DKCoreDataStorage copyStorageFor:toDirectory:](self->_storage, "copyStorageFor:toDirectory:", *MEMORY[0x1E0CB2AC0], v6);

  objc_autoreleasePoolPop(v8);
  if (v9)
  {
    +[_CDInteractionStore storeWithDirectory:readOnly:](_CDInteractionStore, "storeWithDirectory:readOnly:", v6, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anonymizeWithSalt:", v7);
  }

  return v9;
}

- (void)anonymizeWithSalt:(id)a3
{
  id v4;

  v4 = a3;
  -[_CDInteractionStore anonymizeContactsWithSalt:](self, "anonymizeContactsWithSalt:", v4);
  -[_CDInteractionStore anonymizeKeywordsWithSalt:](self, "anonymizeKeywordsWithSalt:", v4);
  -[_CDInteractionStore anonymizeInteractionsWithSalt:](self, "anonymizeInteractionsWithSalt:", v4);
  -[_CDInteractionStore anonymizeAttachmentsWithSalt:](self, "anonymizeAttachmentsWithSalt:", v4);

}

- (void)anonymizeInteractionsWithSalt:(id)a3
{
  _DKCoreDataStorage *storage;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  storage = self->_storage;
  v4 = *MEMORY[0x1E0CB2AC0];
  v5 = a3;
  -[_DKCoreDataStorage managedObjectContextFor:](storage, "managedObjectContextFor:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  +[_DKCoreDataStorage anonymizeObjectStringsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:salt:](_DKCoreDataStorage, "anonymizeObjectStringsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:salt:", v7, CFSTR("Interactions"), 0, 0, 1000, 0, v6, v5);

}

- (void)anonymizeKeywordsWithSalt:(id)a3
{
  _DKCoreDataStorage *storage;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  storage = self->_storage;
  v4 = *MEMORY[0x1E0CB2AC0];
  v5 = a3;
  -[_DKCoreDataStorage managedObjectContextFor:](storage, "managedObjectContextFor:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  +[_DKCoreDataStorage anonymizeObjectStringsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:salt:](_DKCoreDataStorage, "anonymizeObjectStringsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:salt:", v7, CFSTR("Keywords"), 0, 0, 1000, 0, v6, v5);

}

- (void)anonymizeContactsWithSalt:(id)a3
{
  _DKCoreDataStorage *storage;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  storage = self->_storage;
  v4 = *MEMORY[0x1E0CB2AC0];
  v5 = a3;
  -[_DKCoreDataStorage managedObjectContextFor:](storage, "managedObjectContextFor:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  +[_DKCoreDataStorage anonymizeObjectStringsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:salt:](_DKCoreDataStorage, "anonymizeObjectStringsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:salt:", v7, CFSTR("Contacts"), 0, 0, 1000, 0, v6, v5);

}

- (void)anonymizeAttachmentsWithSalt:(id)a3
{
  _DKCoreDataStorage *storage;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  storage = self->_storage;
  v4 = *MEMORY[0x1E0CB2AC0];
  v5 = a3;
  -[_DKCoreDataStorage managedObjectContextFor:](storage, "managedObjectContextFor:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  +[_DKCoreDataStorage anonymizeObjectStringsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:salt:](_DKCoreDataStorage, "anonymizeObjectStringsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:salt:", v7, CFSTR("Attachment"), 0, 0, 1000, 0, v6, v5);

}

+ (id)predicateFilteringUsernameForPredicate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (_CDInteraction)pendingShareSheetInteraction
{
  return self->_pendingShareSheetInteraction;
}

- (void)setPendingShareSheetInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pendingShareSheetInteraction, a3);
}

- (_DKCoreDataStorage)storage
{
  return self->_storage;
}

- (void)setReadConcurrently:(BOOL)a3
{
  self->_readConcurrently = a3;
}

- (void)initWithDirectory:knowledgeStore:readOnly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Could not obtain model path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithDirectory:knowledgeStore:readOnly:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Missing model URL...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)recordInteractionsBatch:(NSObject *)a3 error:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_6_6(&dword_18DDBE000, a3, (uint64_t)a3, "Applying special logic not to overwrite donation with SS mechanism", a1);
}

- (void)recordInteractionsBatch:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "recordInteractionsBatch - interactionsToPersistSortedByDate: %{sensitive}@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)recordInteractionsBatch:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "recordInteractionsBatch - interactionsToPersist: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)recordInteractionsBatch:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Missing managedObjectContext, bail!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_7_5(&dword_18DDBE000, v0, v1, "Deleted interactions but encountered error fetching interactions, reason: %{public}@, error: %{public}@");
  OUTLINED_FUNCTION_5();
}

- (void)deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_10(&dword_18DDBE000, v0, (uint64_t)v0, "Did not delete any interactions but encountered error fetching interactions, reason: %{public}@, error: %{public}@", v1);
  OUTLINED_FUNCTION_5();
}

- (void)truncateInteractionsToCount:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "targetBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138740483;
  v7 = a1;
  v8 = 2114;
  v9 = v4;
  v10 = 2114;
  v11 = v5;
  _os_log_fault_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_FAULT, "truncateInteractionsToCount got nil cutoffDate for interaction %{sensitive}@ from bundle id %{public}@, target bundle id %{public}@", (uint8_t *)&v6, 0x20u);

}

@end
