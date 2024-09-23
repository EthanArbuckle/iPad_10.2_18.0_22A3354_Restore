@implementation ICCoreDataIndexer

- (ICCoreDataIndexer)initWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  id v7;
  id v8;
  ICCoreDataIndexer *v9;
  ICCoreDataIndexer *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *reloadDataSerialQueue;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICCoreDataIndexer;
  v9 = -[ICCoreDataIndexer init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_legacyManagedObjectContext, a3);
    objc_storeStrong((id *)&v10->_modernManagedObjectContext, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.notes.indexer-reload-data-serial-queue", v11);
    reloadDataSerialQueue = v10->_reloadDataSerialQueue;
    v10->_reloadDataSerialQueue = (OS_dispatch_queue *)v12;

  }
  return v10;
}

- (NSManagedObjectContext)modernManagedObjectContext
{
  return self->_modernManagedObjectContext;
}

id __72__ICCoreDataIndexer_unsafelyIndexAllObjectsForFetchedResultsController___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "indexObjectsInSection:sectionIndex:fetchedResultsController:", a2, a3, *(_QWORD *)(a1 + 40));
}

uint64_t __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "managedObjectContext");
}

- (void)reloadData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICCoreDataIndexer reloadDataSerialQueue](self, "reloadDataSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__ICCoreDataIndexer_reloadData___block_invoke;
  v7[3] = &unk_1E5C1D718;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)reloadDataSerialQueue
{
  return self->_reloadDataSerialQueue;
}

- (BOOL)shouldIncludeOutlineParentItems
{
  return self->_shouldIncludeOutlineParentItems;
}

void __70__ICCoreDataIndexer_performAndWaitForFetchedResultsControllers_block___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;

  v3 = a2;
  v7 = 0;
  objc_msgSend(v3, "performFetch:", &v7);
  v4 = v7;
  if (v4)
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_5_cold_1((uint64_t)v4, v5);

  }
  else
  {
    v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "willIndex");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    objc_sync_exit(v6);

    objc_msgSend(*(id *)(a1 + 32), "unsafelyIndexAllObjectsForFetchedResultsController:", v3);
  }

}

- (void)unsafelyIndexAllObjectsForFetchedResultsController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ICCoreDataIndexer_unsafelyIndexAllObjectsForFetchedResultsController___block_invoke;
  v7[3] = &unk_1E5C23730;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __32__ICCoreDataIndexer_reloadData___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "unsafelyReloadData");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)unsafelyReloadData
{
  BOOL v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = -[ICCoreDataIndexer needsFetchedResultsControllerUpdate](self, "needsFetchedResultsControllerUpdate");
  v4 = MEMORY[0x1E0C809B0];
  if (v3
    || (-[ICCoreDataIndexer activeFetchedResultsControllers](self, "activeFetchedResultsControllers"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        !v6))
  {
    -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v4;
    v33[1] = 3221225472;
    v33[2] = __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke;
    v33[3] = &unk_1E5C1D540;
    v33[4] = self;
    objc_msgSend(v7, "performBlockAndWait:", v33);

    -[ICCoreDataIndexer legacyManagedObjectContext](self, "legacyManagedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v4;
    v32[1] = 3221225472;
    v32[2] = __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_2;
    v32[3] = &unk_1E5C1D540;
    v32[4] = self;
    objc_msgSend(v8, "performBlockAndWait:", v32);

    -[ICCoreDataIndexer setNeedsFetchedResultsControllerUpdate:](self, "setNeedsFetchedResultsControllerUpdate:", 0);
  }
  -[ICCoreDataIndexer activeFetchedResultsControllers](self, "activeFetchedResultsControllers");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "setDelegate:", self);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v10);
  }

  objc_msgSend(v9, "ic_map:", &__block_literal_global_79);
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v24 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        if ((objc_msgSend(v17, "automaticallyMergesChangesFromParent") & 1) == 0)
          objc_msgSend(v17, "setAutomaticallyMergesChangesFromParent:", 1);
        if (objc_msgSend(v17, "concurrencyType") != 2)
        {
          v23[0] = v4;
          v23[1] = 3221225472;
          v23[2] = __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_4;
          v23[3] = &unk_1E5C1D540;
          v23[4] = v17;
          objc_msgSend(v17, "performBlockAndWait:", v23);
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v14);
  }

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_5;
  v18[3] = &unk_1E5C23708;
  v18[4] = self;
  v18[5] = &v19;
  -[ICCoreDataIndexer performAndWaitForFetchedResultsControllers:block:](self, "performAndWaitForFetchedResultsControllers:block:", v9, v18);
  if (!*((_BYTE *)v20 + 24))
    -[ICCoreDataIndexer willIndex](self, "willIndex");
  -[ICCoreDataIndexer didIndex](self, "didIndex");
  _Block_object_dispose(&v19, 8);

}

- (void)setNeedsFetchedResultsControllerUpdate:(BOOL)a3
{
  self->_needsFetchedResultsControllerUpdate = a3;
}

- (void)performAndWaitForFetchedResultsControllers:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  dispatch_time_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  NSObject *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v11, "managedObjectContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "concurrencyType");

        if (v13 == 2)
        {
          objc_msgSend(v11, "managedObjectContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __70__ICCoreDataIndexer_performAndWaitForFetchedResultsControllers_block___block_invoke;
          v42[3] = &unk_1E5C1D6F0;
          v15 = v6;
          v42[4] = v11;
          v43 = v15;
          objc_msgSend(v14, "performBlockAndWait:", v42);

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v8);
  }
  v16 = dispatch_group_create();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v22, "managedObjectContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "concurrencyType");

        if (v24 != 2)
        {
          dispatch_group_enter(v16);
          objc_msgSend(v22, "managedObjectContext");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __70__ICCoreDataIndexer_performAndWaitForFetchedResultsControllers_block___block_invoke_2;
          v35[3] = &unk_1E5C1FE08;
          v37 = v6;
          v35[4] = v22;
          v36 = v16;
          objc_msgSend(v25, "performBlock:", v35);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v19);
  }

  v26 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v16, v26))
  {
    v27 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ICCoreDataIndexer performAndWaitForFetchedResultsControllers:block:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

  }
}

- (BOOL)needsFetchedResultsControllerUpdate
{
  return self->_needsFetchedResultsControllerUpdate;
}

uint64_t __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

uint64_t __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLegacyFetchedResultsControllers");
}

uint64_t __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateModernFetchedResultsControllers");
}

- (void)setShouldIncludeOutlineParentItems:(BOOL)a3
{
  self->_shouldIncludeOutlineParentItems = a3;
}

- (id)newSnapshotFromIndex
{
  void *v3;
  void *v4;
  id v5;

  -[ICCoreDataIndexer legacyManagedObjectContext](self, "legacyManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICCoreDataIndexer newSnapshotFromIndexWithLegacyManagedObjectContext:modernManagedObjectContext:](self, "newSnapshotFromIndexWithLegacyManagedObjectContext:modernManagedObjectContext:", v3, v4);

  return v5;
}

- (NSManagedObjectContext)legacyManagedObjectContext
{
  return self->_legacyManagedObjectContext;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

uint64_t __70__ICCoreDataIndexer_performAndWaitForFetchedResultsControllers_block___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)controller:(id)a3 didChangeContentWithDifference:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICCoreDataIndexer delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexer:didChangeContentWithDifference:controller:", self, v6, v7);

}

- (ICCoreDataIndexerDelegate)delegate
{
  return (ICCoreDataIndexerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSSet)activeFetchedResultsControllers
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (NSString)expansionStateContext
{
  return 0;
}

- (void)reloadDataAndWait
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "Timed out waiting for reload to complete", a5, a6, a7, a8, 0);
}

intptr_t __38__ICCoreDataIndexer_reloadDataAndWait__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "unsafelyReloadData");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)indexObjectsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[ICCoreDataIndexer reloadDataSerialQueue](self, "reloadDataSerialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ICCoreDataIndexer_indexObjectsWithCompletion___block_invoke;
  block[3] = &unk_1E5C22AA0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__ICCoreDataIndexer_indexObjectsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "willIndex");
    objc_msgSend(v3, "activeFetchedResultsControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__ICCoreDataIndexer_indexObjectsWithCompletion___block_invoke_2;
    v6[3] = &unk_1E5C236A0;
    v6[4] = v3;
    objc_msgSend(v3, "performAndWaitForFetchedResultsControllers:block:", v4, v6);

    objc_msgSend(v3, "didIndex");
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

uint64_t __48__ICCoreDataIndexer_indexObjectsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "unsafelyIndexAllObjectsForFetchedResultsController:", a2);
}

- (id)indexObjectsInSection:(id)a3 sectionIndex:(unint64_t)a4 fetchedResultsController:(id)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)newSnapshotFromIndexWithLegacyManagedObjectContext:(id)a3 modernManagedObjectContext:(id)a4
{
  return objc_alloc_init(MEMORY[0x1E0DC3398]);
}

- (id)sectionIdentifiersForSectionType:(unint64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)sectionSnapshotsForSectionType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[ICCoreDataIndexer legacyManagedObjectContext](self, "legacyManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCoreDataIndexer modernManagedObjectContext](self, "modernManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCoreDataIndexer sectionSnapshotsForSectionType:legacyManagedObjectContext:modernManagedObjectContext:](self, "sectionSnapshotsForSectionType:legacyManagedObjectContext:modernManagedObjectContext:", a3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sectionIdentifierForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  return 0;
}

- (ICItemIdentifier)firstRelevantItemIdentifier
{
  return self->_firstRelevantItemIdentifier;
}

- (void)setReloadDataSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reloadDataSerialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadDataSerialQueue, 0);
  objc_storeStrong((id *)&self->_firstRelevantItemIdentifier, 0);
  objc_storeStrong((id *)&self->_modernManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_legacyManagedObjectContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)performAndWaitForFetchedResultsControllers:(uint64_t)a3 block:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "Timed out waiting for block to complete for background fetched results controllers", a5, a6, a7, a8, 0);
}

void __39__ICCoreDataIndexer_unsafelyReloadData__block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Error performing fetch: %@", (uint8_t *)&v2, 0xCu);
}

@end
