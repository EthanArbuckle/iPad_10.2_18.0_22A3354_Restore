@implementation HDOntologyShardRegistry

- (HDOntologyShardRegistry)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDOntologyShardRegistry)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4;
  HDOntologyShardRegistry *v5;
  HDOntologyShardRegistry *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURL *stagingDirectoryURL;
  uint64_t v14;
  OS_dispatch_queue *cachedFileHandlesAssertionQueue;
  HDAssertionManager *v16;
  HDAssertionManager *cachedFileHandlesAssertionManager;
  objc_super v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDOntologyShardRegistry;
  v5 = -[HDOntologyShardRegistry init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
    v7 = v4;
    objc_opt_self();
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v7, "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "healthDirectoryPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v20[1] = CFSTR("ontology");
    v20[2] = CFSTR("staging");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPathComponents:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    stagingDirectoryURL = v6->_stagingDirectoryURL;
    v6->_stagingDirectoryURL = (NSURL *)v12;

    HKCreateSerialDispatchQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    cachedFileHandlesAssertionQueue = v6->_cachedFileHandlesAssertionQueue;
    v6->_cachedFileHandlesAssertionQueue = (OS_dispatch_queue *)v14;

    v16 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    cachedFileHandlesAssertionManager = v6->_cachedFileHandlesAssertionManager;
    v6->_cachedFileHandlesAssertionManager = v16;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v6->_cachedFileHandlesAssertionManager, "addObserver:forAssertionIdentifier:queue:", v6, CFSTR("OntologyShardRegistryAssertionIdentifierCachedFileHandles"), v6->_cachedFileHandlesAssertionQueue);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HDAssertionManager invalidate](self->_cachedFileHandlesAssertionManager, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDOntologyShardRegistry;
  -[HDOntologyShardRegistry dealloc](&v3, sel_dealloc);
}

- (HDDaemon)daemon
{
  void *v2;
  void *v3;

  -[HDOntologyShardRegistry updateCoordinator](self, "updateCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDDaemon *)v3;
}

- (BOOL)insertEntry:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[HDOntologyShardRegistry insertEntries:error:](self, "insertEntries:error:", v8, a4, v10, v11);
  return (char)a4;
}

- (BOOL)insertEntries:(id)a3 error:(id *)a4
{
  id v7;
  _HDOntologyShardRegistryInsertOperation *v8;
  id v9;
  HDOntologyShardRegistry *v10;
  id WeakRetained;
  void *v12;
  BOOL v13;
  objc_super v15;

  v7 = a3;
  v8 = [_HDOntologyShardRegistryInsertOperation alloc];
  v9 = v7;
  if (v8)
  {
    v15.receiver = v8;
    v15.super_class = (Class)_HDOntologyShardRegistryInsertOperation;
    v10 = -[HDOntologyShardRegistry init](&v15, sel_init);
    v8 = (_HDOntologyShardRegistryInsertOperation *)v10;
    if (v10)
      objc_storeStrong((id *)&v10->_cachedFileHandlesAssertionQueue, a3);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  objc_msgSend(WeakRetained, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDJournalableOperation performOrJournalWithProfile:error:](v8, "performOrJournalWithProfile:error:", v12, a4);

  return v13;
}

+ (BOOL)insertEntry:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  objc_msgSend(a4, "graphDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "underlyingDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[HDOntologyShardRegistryEntity insertEntry:database:error:](HDOntologyShardRegistryEntity, "insertEntry:database:error:", v7, v9, a5);

  return (char)a5;
}

- (BOOL)entryWithIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 entryOut:(id *)a6 transaction:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  BOOL v19;
  char v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  HDOntologyShardRegistryPredicateForEntry((uint64_t)v14, v15, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__43;
  v27 = __Block_byref_object_dispose__43;
  v28 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __99__HDOntologyShardRegistry_entryWithIdentifier_schemaType_schemaVersion_entryOut_transaction_error___block_invoke;
  v22[3] = &unk_1E6CEF7F0;
  v22[4] = &v23;
  v18 = -[HDOntologyShardRegistry _enumerateEntriesWithPredicate:orderingTerms:transaction:error:enumerationHandler:](self, v17, 0, v16, (uint64_t)a8, v22);
  v19 = v18;
  if (a6)
    v20 = v18;
  else
    v20 = 0;
  if ((v20 & 1) != 0)
    *a6 = objc_retainAutorelease((id)v24[5]);
  _Block_object_dispose(&v23, 8);

  return v19;
}

uint64_t __99__HDOntologyShardRegistry_entryWithIdentifier_schemaType_schemaVersion_entryOut_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

- (uint64_t)_enumerateEntriesWithPredicate:(void *)a3 orderingTerms:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (a1)
  {
    if (v13)
      v15 = +[HDOntologyShardRegistry _rawEnumerateEntriesWithPredicate:orderingTerms:transaction:error:enumerationHandler:]((uint64_t)HDOntologyShardRegistry, v11, v12, v13, a5, v14);
    else
      v15 = objc_msgSend(a1, "enumerateEntriesWithPredicate:orderingTerms:error:enumerationHandler:", v11, v12, a5, v14);
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)entriesWithPredicate:(id)a3 orderingTerms:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v8 = (objc_class *)MEMORY[0x1E0C99DE8];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__HDOntologyShardRegistry_entriesWithPredicate_orderingTerms_error___block_invoke;
  v16[3] = &unk_1E6CEF818;
  v17 = v11;
  v12 = v11;
  LODWORD(a5) = -[HDOntologyShardRegistry enumerateEntriesWithPredicate:orderingTerms:error:enumerationHandler:](self, "enumerateEntriesWithPredicate:orderingTerms:error:enumerationHandler:", v10, v9, a5, v16);

  if ((_DWORD)a5)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

uint64_t __68__HDOntologyShardRegistry_entriesWithPredicate_orderingTerms_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (BOOL)enumerateEntriesWithPredicate:(id)a3 orderingTerms:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__HDOntologyShardRegistry_enumerateEntriesWithPredicate_orderingTerms_error_enumerationHandler___block_invoke;
  v18[3] = &unk_1E6CEF840;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  LOBYTE(a5) = objc_msgSend(WeakRetained, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 0, 0, a5, v18);

  return (char)a5;
}

uint64_t __96__HDOntologyShardRegistry_enumerateEntriesWithPredicate_orderingTerms_error_enumerationHandler___block_invoke(void **a1, void *a2, uint64_t a3)
{
  return -[HDOntologyShardRegistry _enumerateEntriesWithPredicate:orderingTerms:transaction:error:enumerationHandler:](a1[4], a1[5], a1[6], a2, a3, a1[7]);
}

+ (id)nextAvailableMercuryZipTSVSlotWithTransaction:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0D29838];
  v6 = *MEMORY[0x1E0CB5750];
  v7 = a3;
  objc_msgSend(v5, "predicateWithProperty:equalToValue:", CFSTR("schema_type"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "graphDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "underlyingDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDOntologyShardRegistryEntity nextAvailableSlotInAllowedRange:predicate:database:error:](HDOntologyShardRegistryEntity, "nextAvailableSlotInAllowedRange:predicate:database:error:", 0, 64, v8, v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)importedMercuryZipTSVEntriesWithTransaction:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D29838];
  v7 = a3;
  objc_msgSend(v6, "predicateWithProperty:greaterThanValue:", CFSTR("current_version"), &unk_1E6DFAC58);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("schema_type"), *MEMORY[0x1E0CB5750]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__HDOntologyShardRegistry_importedMercuryZipTSVEntriesWithTransaction_error___block_invoke;
  v17[3] = &unk_1E6CEF818;
  v18 = v12;
  v13 = v12;
  LODWORD(a4) = +[HDOntologyShardRegistry _rawEnumerateEntriesWithPredicate:orderingTerms:transaction:error:enumerationHandler:]((uint64_t)a1, v11, 0, v7, (uint64_t)a4, v17);

  if ((_DWORD)a4)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

uint64_t __77__HDOntologyShardRegistry_importedMercuryZipTSVEntriesWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (BOOL)_rawEnumerateEntriesWithPredicate:(void *)a3 orderingTerms:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL8 v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_opt_self();
  objc_msgSend(v11, "graphDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "underlyingDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[HDOntologyShardRegistryEntity enumerateEntriesWithPredicate:orderingTerms:database:error:enumerationHandler:](HDOntologyShardRegistryEntity, "enumerateEntriesWithPredicate:orderingTerms:database:error:enumerationHandler:", v13, v12, v15, a5, v10);

  return v16;
}

- (id)takeFileHandleAssertionForOwnerIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *cachedFileHandlesAssertionQueue;
  id v9;
  id v10;
  void *v11;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29800]), "initWithAssertionIdentifier:ownerIdentifier:", CFSTR("OntologyShardRegistryAssertionIdentifierCachedFileHandles"), v6);
  if ((-[HDAssertionManager takeAssertion:](self->_cachedFileHandlesAssertionManager, "takeAssertion:", v7) & 1) != 0)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 1;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__43;
    v18 = __Block_byref_object_dispose__43;
    v19 = 0;
    cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__HDOntologyShardRegistry_takeFileHandleAssertionForOwnerIdentifier_error___block_invoke;
    block[3] = &unk_1E6CEF868;
    block[4] = self;
    block[5] = &v20;
    block[6] = &v14;
    dispatch_sync(cachedFileHandlesAssertionQueue, block);
    if (*((_BYTE *)v21 + 24))
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v7, "invalidate");
      v10 = (id)v15[5];
      v11 = v10;
      if (v10)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v10);
        else
          _HKLogDroppedError();
      }

      v9 = 0;
    }
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    objc_msgSend(v7, "invalidate");
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Unable to take assertion /'%@/' for owner %@"), CFSTR("OntologyShardRegistryAssertionIdentifierCachedFileHandles"), v6);
    v9 = 0;
  }

  return v9;
}

void __75__HDOntologyShardRegistry_takeFileHandleAssertionForOwnerIdentifier_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  id obj;
  _QWORD v10[5];

  v2 = a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v3 + 40);
  v5 = (id *)(v3 + 40);
  v4 = v6;
  obj = v6;
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    if (!*(_QWORD *)(v2 + 32))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(void **)(v2 + 32);
      *(_QWORD *)(v2 + 32) = v7;

    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__HDOntologyShardRegistry__assertionQueue_openFileHandlesWithError___block_invoke;
    v10[3] = &unk_1E6CEF890;
    v10[4] = v2;
    LOBYTE(v2) = -[HDOntologyShardRegistry _enumerateStagedShardFileEntriesWithWithError:handler:](v2, &obj, v10);
    v4 = obj;
  }
  objc_storeStrong(v5, v4);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v2;
}

- (id)stagedShardFileEntriesWithError:(id *)a3
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HDOntologyShardRegistry_stagedShardFileEntriesWithError___block_invoke;
  v9[3] = &unk_1E6CEF890;
  v6 = v5;
  v10 = v6;
  if (-[HDOntologyShardRegistry _enumerateStagedShardFileEntriesWithWithError:handler:]((uint64_t)self, a3, v9))v7 = v6;
  else
    v7 = 0;

  return v7;
}

uint64_t __59__HDOntologyShardRegistry_stagedShardFileEntriesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

- (uint64_t)_enumerateStagedShardFileEntriesWithWithError:(void *)a3 handler:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  if (a1)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__HDOntologyShardRegistry__enumerateStagedShardFileEntriesWithWithError_handler___block_invoke;
    v12[3] = &unk_1E6CEF980;
    v13 = v7;
    v14 = v5;
    v9 = v7;
    v10 = +[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:]((uint64_t)HDOntologyShardRegistry, v6, v8, a2, v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)stagedShardFileEntryForEntry:(id)a3 entryOut:(id *)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  BOOL v11;
  char v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__HDOntologyShardRegistry_stagedShardFileEntryForEntry_entryOut_error___block_invoke;
  v14[3] = &unk_1E6CEF8B8;
  v9 = v8;
  v15 = v9;
  v16 = &v17;
  v10 = -[HDOntologyShardRegistry _enumerateStagedShardFileEntriesWithWithError:handler:]((uint64_t)self, a5, v14);
  v11 = v10;
  if (a4)
    v12 = v10;
  else
    v12 = 0;
  if ((v12 & 1) != 0)
    *a4 = objc_retainAutorelease((id)v18[5]);

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __71__HDOntologyShardRegistry_stagedShardFileEntryForEntry_entryOut_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;

  v4 = a2;
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = 2;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)stageShardFileWithLocalURL:(id)a3 entry:(id)a4 error:(id *)a5
{
  return -[HDOntologyShardRegistry _stageShardFileWithLocalURL:entry:shouldCopy:error:]((uint64_t)self, a3, a4, 0, a5);
}

- (uint64_t)_stageShardFileWithLocalURL:(void *)a3 entry:(char)a4 shouldCopy:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  id v25;
  id v27;
  uint64_t block;
  uint64_t v29;
  void (*v30)(_QWORD *);
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_18;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (!objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", *(_QWORD *)(a1 + 8), 1, 0, a5))
  {
LABEL_6:
    v18 = 0;
    goto LABEL_17;
  }
  v12 = v9;
  v13 = v10;
  v14 = *(NSObject **)(a1 + 16);
  block = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __80__HDOntologyShardRegistry__attemptToCacheFileHandleIfNecessaryForFileURL_entry___block_invoke;
  v31 = &unk_1E6CE7FB8;
  v32 = a1;
  v15 = v13;
  v33 = v15;
  v16 = v12;
  v34 = v16;
  dispatch_sync(v14, &block);

  if ((a4 & 1) != 0)
  {
    if ((+[HDOntologyShardRegistry _deleteStagedFilesForEntry:stagingDirectory:fileManager:error:]((uint64_t)HDOntologyShardRegistry, v15, *(void **)(a1 + 8), v11, a5) & 1) != 0)
    {
      -[HDOntologyShardRegistry _stagedShardFileURLForEntry:]((id *)a1, v15);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v16, v17, a5);
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_6;
  }
  v27 = v9;
  objc_msgSend(v16, "path");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_opt_self();
  v20 = *MEMORY[0x1E0CB2AB8];
  v21 = *MEMORY[0x1E0CB2AA8];
  v35[0] = *MEMORY[0x1E0CB2AD8];
  v35[1] = v21;
  block = v20;
  v29 = (uint64_t)&unk_1E6DFAC70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &block, v35, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v19, "setAttributes:ofItemAtPath:error:", v22, v17, a5);

  if ((v23 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error setting protection class for %@"), v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 102, v24, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v27;
    if (v25)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v25);
      else
        _HKLogDroppedError();
    }

    v18 = 0;
    goto LABEL_16;
  }

  if ((+[HDOntologyShardRegistry _deleteStagedFilesForEntry:stagingDirectory:fileManager:error:]((uint64_t)HDOntologyShardRegistry, v15, *(void **)(a1 + 8), v19, a5) & 1) != 0)
  {
    -[HDOntologyShardRegistry _stagedShardFileURLForEntry:]((id *)a1, v15);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "moveItemAtURL:toURL:error:", v16, v17, a5);
    v9 = v27;
    goto LABEL_16;
  }
  v18 = 0;
  v9 = v27;
LABEL_17:

LABEL_18:
  return v18;
}

- (BOOL)copyToStagingDirectoryFileWithLocalURL:(id)a3 entry:(id)a4 error:(id *)a5
{
  return -[HDOntologyShardRegistry _stageShardFileWithLocalURL:entry:shouldCopy:error:]((uint64_t)self, a3, a4, 1, a5);
}

+ (uint64_t)_deleteStagedFilesForEntry:(void *)a3 stagingDirectory:(void *)a4 fileManager:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;

  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = objc_opt_self();
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "schemaType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "schemaVersion");

  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:%@:%ld"), v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__HDOntologyShardRegistry__deleteStagedFilesForEntry_stagingDirectory_fileManager_error___block_invoke;
  v21[3] = &unk_1E6CEF9A8;
  v23 = v8;
  v24 = v11;
  v22 = v16;
  v17 = v8;
  v18 = v16;
  v19 = +[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:](v11, v17, v9, a5, v21);

  return v19;
}

- (id)_stagedShardFileURLForEntry:(id *)a1
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = a1;
  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = a2;
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "schemaType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "schemaVersion");
    v8 = objc_msgSend(v4, "availableVersion");

    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%ld:%ld"), v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2[1], "URLByAppendingPathComponent:", v9);
    v2 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (BOOL)deleteStagedShardFileForEntry:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *cachedFileHandlesAssertionQueue;
  NSURL *stagingDirectoryURL;
  id v11;
  char v12;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  if (+[HDOntologyShardRegistry _isCacheableEntry:]((uint64_t)HDOntologyShardRegistry, v6))
  {
    v7 = v6;
    v8 = v7;
    if (self)
    {
      cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__HDOntologyShardRegistry__removeCachedFileHandleForEntry___block_invoke;
      v14[3] = &unk_1E6CE8080;
      v14[4] = self;
      v15 = v7;
      dispatch_sync(cachedFileHandlesAssertionQueue, v14);

    }
  }
  stagingDirectoryURL = self->_stagingDirectoryURL;
  v11 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v12 = +[HDOntologyShardRegistry _deleteStagedFilesForEntry:stagingDirectory:fileManager:error:]((uint64_t)HDOntologyShardRegistry, v6, stagingDirectoryURL, v11, a4);

  return v12;
}

+ (uint64_t)_isCacheableEntry:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_opt_self();
  objc_msgSend(v3, "schemaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0CB5750];
  v6 = v4 != (void *)*MEMORY[0x1E0CB5750];
  if (v4 == (void *)*MEMORY[0x1E0CB5750])
    goto LABEL_5;
  if (!v5)
  {
    v6 = 0;
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "schemaType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", v5))
  {
LABEL_5:
    v8 = objc_msgSend(v3, "schemaVersion");
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1;
    v9 = 1;
    if (v8 == HKCurrentSchemaVersionForShardIdentifier())
      goto LABEL_14;
    goto LABEL_8;
  }
  v7 = 0;
  v6 = 1;
LABEL_8:
  objc_msgSend(v3, "schemaType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v9 = *MEMORY[0x1E0CB5740];
  if (v10 == (void *)*MEMORY[0x1E0CB5740])
  {
    v9 = objc_msgSend(v3, "schemaVersion") == 1;
LABEL_13:

    if ((v7 & 1) != 0)
      goto LABEL_14;
LABEL_20:
    if (!v6)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (v9)
  {
    objc_msgSend(v3, "schemaType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", v9))
    {
      v9 = objc_msgSend(v3, "schemaVersion") == 1;

      goto LABEL_13;
    }

    v9 = 0;
    if ((v7 & 1) == 0)
      goto LABEL_20;
  }
  else
  {

    if (!v7)
      goto LABEL_20;
  }
LABEL_14:

  if (v6)
LABEL_15:

LABEL_16:
  return v9;
}

- (BOOL)deleteStagedFilesNotMatchingEntries:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  NSURL *stagingDirectoryURL;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  HDOntologyShardRegistry *v16;
  _QWORD v17[5];

  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__HDOntologyShardRegistry_deleteStagedFilesNotMatchingEntries_error___block_invoke;
  v17[3] = &unk_1E6CEF8E0;
  v17[4] = self;
  objc_msgSend(a3, "hk_mapToSet:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  stagingDirectoryURL = self->_stagingDirectoryURL;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __69__HDOntologyShardRegistry_deleteStagedFilesNotMatchingEntries_error___block_invoke_2;
  v13[3] = &unk_1E6CEF908;
  v14 = v7;
  v15 = v8;
  v16 = self;
  v10 = v8;
  v11 = v7;
  LOBYTE(a4) = +[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:]((uint64_t)HDOntologyShardRegistry, v10, stagingDirectoryURL, a4, v13);

  return (char)a4;
}

id __69__HDOntologyShardRegistry_deleteStagedFilesNotMatchingEntries_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  -[HDOntologyShardRegistry _stagedShardFileURLForEntry:](*(id **)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __69__HDOntologyShardRegistry_deleteStagedFilesNotMatchingEntries_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) != 0)
  {
LABEL_7:
    v8 = 1;
    goto LABEL_9;
  }
  if (!+[HDOntologyShardRegistry _deleteStagedFileWithURL:fileManager:error:]((uint64_t)HDOntologyShardRegistry, v5, *(void **)(a1 + 40), a3))
  {
    v8 = 0;
    goto LABEL_9;
  }
  _HKInitializeLogging();
  HKLogHealthOntology();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 1;
  v9 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

  if (v9)
  {
    HKLogHealthOntology();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: deleted from staging directory %{public}@", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_7;
  }
LABEL_9:

  return v8;
}

+ (uint64_t)_deleteStagedFileWithURL:(void *)a3 fileManager:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v14;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  v14 = 0;
  v8 = objc_msgSend(v6, "removeItemAtURL:error:", v7, &v14);

  v9 = v14;
  v10 = v9;
  if ((v8 & 1) != 0 || (objc_msgSend(v9, "hk_isCocoaNoSuchFileError") & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v12 = v10;
    if (v12)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    v11 = 0;
  }

  return v11;
}

+ (uint64_t)_enumerateStagedShardFileURLsWithFileManager:(void *)a3 stagingDirectory:(_QWORD *)a4 error:(void *)a5 handler:
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v17;

  v8 = a5;
  v9 = a3;
  v10 = a2;
  objc_opt_self();
  v17 = 0;
  v11 = objc_msgSend(v10, "hk_enumerateDirectoryAtURL:includingPropertiesForKeys:options:error:handler:", v9, MEMORY[0x1E0C9AA60], 0, &v17, v8);

  v12 = v17;
  v13 = v12;
  if ((v11 & 1) != 0 || (objc_msgSend(v12, "hk_isCocoaNoSuchFileError") & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    v15 = v13;
    if (v15)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    v14 = 0;
  }

  return v14;
}

- (int64_t)purgeableSpaceForStagedShards
{
  id v3;
  NSURL *stagingDirectoryURL;
  char v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  int64_t v10;
  _QWORD v12[6];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  HDOntologyShardRegistry *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  stagingDirectoryURL = self->_stagingDirectoryURL;
  v13 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__HDOntologyShardRegistry_purgeableSpaceForStagedShards__block_invoke;
  v12[3] = &unk_1E6CEF930;
  v12[4] = self;
  v12[5] = &v14;
  v5 = +[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:]((uint64_t)HDOntologyShardRegistry, v3, stagingDirectoryURL, &v13, v12);
  v6 = v13;
  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

    if (v8)
    {
      HKLogHealthOntology();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v19 = self;
        v20 = 2114;
        v21 = v6;
        _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_INFO, "%{public}@: error during enumeration to determine purgeable space: %{public}@", buf, 0x16u);
      }

    }
  }
  v10 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v10;
}

uint64_t __56__HDOntologyShardRegistry_purgeableSpaceForStagedShards__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0;
  objc_msgSend(v3, "hk_fileSizeWithError:", &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v4, "longLongValue");
  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v7)
    {
      HKLogHealthOntology();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v13 = v9;
        v14 = 2114;
        v15 = v3;
        v16 = 2114;
        v17 = v5;
        _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "%{public}@: unable to determine size of %{public}@: %{public}@", buf, 0x20u);
      }

    }
  }

  return 1;
}

- (int64_t)purgeSpaceForStagedShards
{
  uint64_t v3;
  NSObject *cachedFileHandlesAssertionQueue;
  id v5;
  NSURL *stagingDirectoryURL;
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int64_t v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD block[5];
  uint8_t buf[4];
  HDOntologyShardRegistry *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDOntologyShardRegistry_purgeSpaceForStagedShards__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(cachedFileHandlesAssertionQueue, block);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  stagingDirectoryURL = self->_stagingDirectoryURL;
  v17 = 0;
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __52__HDOntologyShardRegistry_purgeSpaceForStagedShards__block_invoke_2;
  v14[3] = &unk_1E6CEF958;
  v14[4] = self;
  v7 = v5;
  v15 = v7;
  v16 = &v18;
  LOBYTE(stagingDirectoryURL) = +[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:]((uint64_t)HDOntologyShardRegistry, v7, stagingDirectoryURL, &v17, v14);
  v8 = v17;
  if ((stagingDirectoryURL & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

    if (v10)
    {
      HKLogHealthOntology();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v24 = self;
        v25 = 2114;
        v26 = v8;
        _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "%{public}@: error during purge enumeration: %{public}@", buf, 0x16u);
      }

    }
  }
  v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __52__HDOntologyShardRegistry_purgeSpaceForStagedShards__block_invoke(uint64_t a1)
{
  -[HDOntologyShardRegistry _assertionQueue_closeFileHandles](*(_QWORD *)(a1 + 32));
}

- (void)_assertionQueue_closeFileHandles
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "closeFile");
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

    v7 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
}

uint64_t __52__HDOntologyShardRegistry_purgeSpaceForStagedShards__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0;
  objc_msgSend(v3, "hk_fileSizeWithError:", &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;
  if (v4)
  {
    if (objc_msgSend(v4, "longLongValue") >= 1)
    {
      v6 = (void *)a1[5];
      v23 = v5;
      v7 = objc_msgSend(v6, "removeItemAtURL:error:", v3, &v23);
      v8 = v23;

      if ((v7 & 1) != 0 || (objc_msgSend(v8, "hk_isCocoaNoSuchFileError") & 1) != 0)
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);

        if (v10)
        {
          HKLogHealthOntology();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v12 = a1[4];
            objc_msgSend(v3, "lastPathComponent");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v26 = v12;
            v27 = 2114;
            v28 = v13;
            _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "%{public}@: purged from staging directory %{public}@", buf, 0x16u);

          }
        }
        *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += objc_msgSend(v4, "longLongValue");
      }
      else
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

        if (v20)
        {
          HKLogHealthOntology();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = a1[4];
            *(_DWORD *)buf = 138543874;
            v26 = v22;
            v27 = 2114;
            v28 = v3;
            v29 = 2114;
            v30 = v8;
            _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_INFO, "%{public}@: unable to purge %{public}@: %{public}@", buf, 0x20u);
          }

        }
      }
      v5 = v8;
    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

    if (v15)
    {
      HKLogHealthOntology();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = a1[4];
        *(_DWORD *)buf = 138543874;
        v26 = v17;
        v27 = 2114;
        v28 = v3;
        v29 = 2114;
        v30 = v5;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "%{public}@: unable to determine purgeable size of %{public}@: %{public}@", buf, 0x20u);
      }

    }
  }

  return 1;
}

- (id)openShardFileForEntry:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *cachedFileHandlesAssertionQueue;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  if (+[HDOntologyShardRegistry _isCacheableEntry:]((uint64_t)HDOntologyShardRegistry, v6))
  {
    v7 = v6;
    v8 = v7;
    if (self)
    {
      v24 = 0;
      v25 = &v24;
      v26 = 0x3032000000;
      v27 = __Block_byref_object_copy__43;
      v28 = __Block_byref_object_dispose__43;
      v29 = 0;
      v18 = 0;
      v19 = &v18;
      v20 = 0x3032000000;
      v21 = __Block_byref_object_copy__43;
      v22 = __Block_byref_object_dispose__43;
      v23 = 0;
      cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__HDOntologyShardRegistry__getCacheableFileHandleForEntry_error___block_invoke;
      v14[3] = &unk_1E6CEF9D0;
      v16 = &v24;
      v14[4] = self;
      v15 = v7;
      v17 = &v18;
      dispatch_sync(cachedFileHandlesAssertionQueue, v14);
      v10 = (id)v19[5];
      v11 = v10;
      if (v10)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v10);
        else
          _HKLogDroppedError();
      }

      v12 = (id)v25[5];
      _Block_object_dispose(&v18, 8);

      _Block_object_dispose(&v24, 8);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    -[HDOntologyShardRegistry _openFileHandleForEntry:error:]((id *)&self->super.isa, v6, (uint64_t)a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_openFileHandleForEntry:(uint64_t)a3 error:
{
  void *v4;
  void *v5;

  if (a1)
  {
    -[HDOntologyShardRegistry _stagedShardFileURLForEntry:](a1, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v4, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)moveStagedShardFileForEntry:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a4;
  -[HDOntologyShardRegistry _stagedShardFileURLForEntry:]((id *)&self->super.isa, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  LOBYTE(a5) = objc_msgSend(v10, "moveItemAtURL:toURL:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)unzipStagedShardFileForEntry:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  HDFileArchiver *v10;

  v8 = a4;
  -[HDOntologyShardRegistry _stagedShardFileURLForEntry:]((id *)&self->super.isa, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(HDFileArchiver);
  LOBYTE(a5) = -[HDFileArchiver decompressArchiveAt:to:error:](v10, "decompressArchiveAt:to:error:", v9, v8, a5);

  return (char)a5;
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  NSObject *cachedFileHandlesAssertionQueue;
  id v6;

  cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
  v6 = a3;
  dispatch_assert_queue_V2(cachedFileHandlesAssertionQueue);
  LOBYTE(cachedFileHandlesAssertionQueue) = objc_msgSend(v6, "hasActiveAssertionForIdentifier:", CFSTR("OntologyShardRegistryAssertionIdentifierCachedFileHandles"));

  if ((cachedFileHandlesAssertionQueue & 1) == 0)
    -[HDOntologyShardRegistry _assertionQueue_closeFileHandles]((uint64_t)self);
}

uint64_t __81__HDOntologyShardRegistry__enumerateStagedShardFileEntriesWithWithError_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB69B0]);
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");
    objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v5, "initWithIdentifier:schemaType:schemaVersion:availableVersion:date:", v6, v7, v9, objc_msgSend(v10, "integerValue"), *(_QWORD *)(a1 + 32));

    v12 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

BOOL __89__HDOntologyShardRegistry__deleteStagedFilesForEntry_stagingDirectory_fileManager_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  int v7;
  _BOOL8 v8;

  v5 = a2;
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", *(_QWORD *)(a1 + 32));

  v8 = !v7
    || +[HDOntologyShardRegistry _deleteStagedFileWithURL:fileManager:error:](*(_QWORD *)(a1 + 48), v5, *(void **)(a1 + 40), a3);

  return v8;
}

void __59__HDOntologyShardRegistry__removeCachedFileHandleForEntry___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeFile");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

void __65__HDOntologyShardRegistry__getCacheableFileHandleForEntry_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id obj;

  v3 = a1[4];
  v2 = (void *)a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  obj = v6;
  v7 = v2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 16));
    objc_msgSend(*(id *)(v3 + 32), "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[HDOntologyShardRegistry _openFileHandleForEntry:error:]((id *)v3, v7, (uint64_t)&obj);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v3 + 32), "setObject:forKeyedSubscript:", v10, v7);
    }

  }
  else
  {
    v10 = 0;
  }

  objc_storeStrong(v5, obj);
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __80__HDOntologyShardRegistry__attemptToCacheFileHandleIfNecessaryForFileURL_entry___block_invoke(_QWORD *a1)
{
  id v2;

  if (*(_QWORD *)(a1[4] + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", a1[6], 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", v2, a1[5]);

  }
}

uint64_t __68__HDOntologyShardRegistry__assertionQueue_openFileHandlesWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  if (+[HDOntologyShardRegistry _isCacheableEntry:]((uint64_t)HDOntologyShardRegistry, v5))
  {
    -[HDOntologyShardRegistry _openFileHandleForEntry:error:](*(id **)(a1 + 32), v5, a3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v7 = (void *)v6;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v6, v5);

  }
  v8 = 1;
LABEL_6:

  return v8;
}

- (id)unitTesting_stagedShardFileFullPathForEntry:(id)a3
{
  void *v3;
  void *v4;

  -[HDOntologyShardRegistry _stagedShardFileURLForEntry:]((id *)&self->super.isa, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)unitTesting_stagedShardFileNamesWithError:(id *)a3
{
  id v5;
  id v6;
  NSURL *stagingDirectoryURL;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  stagingDirectoryURL = self->_stagingDirectoryURL;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__HDOntologyShardRegistry_unitTesting_stagedShardFileNamesWithError___block_invoke;
  v12[3] = &unk_1E6CEF9F8;
  v13 = v5;
  v8 = v5;
  if (+[HDOntologyShardRegistry _enumerateStagedShardFileURLsWithFileManager:stagingDirectory:error:handler:]((uint64_t)HDOntologyShardRegistry, v6, stagingDirectoryURL, a3, v12))v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

uint64_t __69__HDOntologyShardRegistry_unitTesting_stagedShardFileNamesWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v3);

  return 1;
}

- (BOOL)unitTesting_stageFileWithLocalURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  NSURL *stagingDirectoryURL;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", self->_stagingDirectoryURL, 1, 0, a4))
  {
    stagingDirectoryURL = self->_stagingDirectoryURL;
    objc_msgSend(v6, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL URLByAppendingPathComponent:](stagingDirectoryURL, "URLByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "moveItemAtURL:toURL:error:", v6, v10, a4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)unitTesting_cachedFileHandles
{
  NSObject *cachedFileHandlesAssertionQueue;
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
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  cachedFileHandlesAssertionQueue = self->_cachedFileHandlesAssertionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__HDOntologyShardRegistry_unitTesting_cachedFileHandles__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cachedFileHandlesAssertionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __56__HDOntologyShardRegistry_unitTesting_cachedFileHandles__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  return (HDOntologyUpdateCoordinator *)objc_loadWeakRetained((id *)&self->_updateCoordinator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCoordinator);
  objc_storeStrong((id *)&self->_cachedFileHandles, 0);
  objc_storeStrong((id *)&self->_cachedFileHandlesAssertionManager, 0);
  objc_storeStrong((id *)&self->_cachedFileHandlesAssertionQueue, 0);
  objc_storeStrong((id *)&self->_stagingDirectoryURL, 0);
}

@end
