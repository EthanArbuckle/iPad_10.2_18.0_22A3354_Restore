@implementation FPArchiveOperation

+ (id)extensionForArchiveFormat:(unint64_t)a3 utType:(id *)a4
{
  id v6;
  __CFString *v7;
  void *v10;
  id *v11;

  switch(a3)
  {
    case 0uLL:
      goto LABEL_5;
    case 1uLL:
      if (a4)
      {
        v6 = (id)*MEMORY[0x1E0CEC448];
        v7 = CFSTR("cpio");
        goto LABEL_11;
      }
      v7 = CFSTR("cpio");
      return v7;
    case 2uLL:
      if (a4)
      {
        v6 = (id)*MEMORY[0x1E0CEC448];
        v7 = CFSTR("cpgz");
        goto LABEL_11;
      }
      v7 = CFSTR("cpgz");
      break;
    case 3uLL:
      v11 = (id *)MEMORY[0x1E0CEC608];
      goto LABEL_10;
    case 4uLL:
      v11 = (id *)MEMORY[0x1E0CEC430];
      goto LABEL_10;
    case 5uLL:
      if (a4)
      {
        v6 = (id)*MEMORY[0x1E0CEC448];
        v7 = CFSTR("aea");
LABEL_11:
        *a4 = objc_retainAutorelease(v6);
      }
      else
      {
        v7 = CFSTR("aea");
      }
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPArchiveOperation.m"), 168, CFSTR("No DS match for FP archive format: %ld"), a3);

LABEL_5:
      v11 = (id *)MEMORY[0x1E0CEC678];
LABEL_10:
      v6 = *v11;
      objc_msgSend(*v11, "preferredFilenameExtension");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (a4)
        goto LABEL_11;
      return v7;
  }
  return v7;
}

- (FPArchiveOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
  id v8;
  id v9;
  void *v10;
  FPArchiveOperation *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSOperationQueue *v15;
  NSOperationQueue *operationQueue;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPArchiveOperation.m"), 181, CFSTR("no items to archive: %@"), v8);

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPArchiveOperation.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationFolder"));

LABEL_3:
  objc_msgSend(v9, "providerDomainID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)FPArchiveOperation;
  v11 = -[FPActionOperation initWithProvider:action:](&v22, sel_initWithProvider_action_, v10, 0);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_items, a3);
    objc_storeStrong((id *)&v11->_destinationFolder, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.FileProvider.ArchiveOperation", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    v15 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v11->_operationQueue;
    v11->_operationQueue = v15;

    -[NSOperationQueue setUnderlyingQueue:](v11->_operationQueue, "setUnderlyingQueue:", v11->_queue);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v11->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    v11->_archiveFormat = 0;
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPActionOperation setProgress:](v11, "setProgress:", v17);

    -[FPActionOperation progress](v11, "progress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fp_setFileOperationKind:", *MEMORY[0x1E0CB30B0]);

  }
  return v11;
}

- (void)_coordinateArchivedItemsWithCompletionHandler:(id)a3
{
  void *v3;
  NSObject *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v18;
  _QWORD block[4];
  id v20;
  FPArchiveOperation *v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  _QWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__5;
  v33[4] = __Block_byref_object_dispose__5;
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_items, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_group_create();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v8);
        dispatch_group_enter(v4);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke;
        v25[3] = &unk_1E444B980;
        v26 = v3;
        v28 = v33;
        v27 = v4;
        objc_msgSend(v18, "fetchURLForItem:completionHandler:", v9, v25);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E444B9F0;
  v24 = v33;
  v12 = v16;
  v23 = v12;
  v13 = v3;
  v20 = v13;
  v21 = self;
  v14 = v10;
  v22 = v14;
  dispatch_group_notify(v4, queue, block);
  -[FPActionOperation progress](self, "progress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addChild:withPendingUnitCount:", v14, 10);

  _Block_object_dispose(v33, 8);
}

void __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  else
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  objc_sync_exit(v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
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
          objc_msgSend(MEMORY[0x1E0CB35F8], "readingIntentWithURL:options:", v9, 0x20000);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);
          if (objc_msgSend(v9, "startAccessingSecurityScopedResource"))
            objc_msgSend(v2, "addObject:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v6);
    }

    v11 = (void *)objc_opt_new();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 480);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_4;
    v16[3] = &unk_1E444B9C8;
    v17 = v2;
    v21 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 48);
    v19 = v3;
    v20 = v11;
    v13 = v11;
    v14 = v3;
    v15 = v2;
    objc_msgSend(v13, "coordinateAccessWithIntents:queue:byAccessor:", v14, v12, v16);

  }
}

void __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, _QWORD, _QWORD *);
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "stopAccessingSecurityScopedResource");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", 100);
    objc_msgSend(*(id *)(a1 + 48), "fp_map:", &__block_literal_global_46_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "retainAccess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 64);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_7;
    v14[3] = &unk_1E444AB48;
    v15 = *(id *)(a1 + 32);
    v16 = *(id *)(a1 + 56);
    v17 = v10;
    v12 = *(void (**)(uint64_t, void *, _QWORD, _QWORD *))(v11 + 16);
    v13 = v10;
    v12(v11, v9, 0, v14);

  }
}

uint64_t __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "URL");
}

uint64_t __68__FPArchiveOperation__coordinateArchivedItemsWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "stopAccessingSecurityScopedResource", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "releaseAccess:", *(_QWORD *)(a1 + 48));
}

- (void)_copyArchivedItemsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_items, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E444BA60;
  v10 = v5;
  v11 = v4;
  v9[4] = self;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v7, "fetchURLForItem:completionHandler:", v6, v9);

}

void __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  FPArchiveTemporaryFolder *v8;
  void *v9;
  FPCopyOperation *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  FPArchiveTemporaryFolder *v18;
  id v19;
  id v20;
  id location;
  id v22;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v8 = -[FPArchiveTemporaryFolder initWithURL:]([FPArchiveTemporaryFolder alloc], "initWithURL:", v5);
    v22 = 0;
    -[FPArchiveTemporaryFolder temporaryFolderURLGetError:](v8, "temporaryFolderURLGetError:", &v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    if (v9)
    {
      v10 = -[FPMoveOperation initWithItems:destinationURL:]([FPCopyOperation alloc], "initWithItems:destinationURL:", *((_QWORD *)a1[4] + 56), v9);
      -[FPMoveOperation setShouldBounceOnCollision:](v10, "setShouldBounceOnCollision:", 1);
      -[FPActionOperation setHaveStitching:](v10, "setHaveStitching:", 0);
      -[FPMoveOperation setLastUsageUpdatePolicy:](v10, "setLastUsageUpdatePolicy:", 1);
      location = 0;
      objc_initWeak(&location, v10);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke_4;
      v16 = &unk_1E444BA38;
      objc_copyWeak(&v20, &location);
      v17 = v9;
      v19 = a1[6];
      v18 = v8;
      -[FPActionOperation setActionCompletionBlock:](v10, "setActionCompletionBlock:", &v13);
      objc_msgSend(a1[5], "scheduleAction:", v10, v13, v14, v15, v16);
      objc_msgSend(a1[4], "progress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPActionOperation progress](v10, "progress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addChild:withPendingUnitCount:", v12, 10);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);

    }
    else
    {
      (*((void (**)(void))a1[6] + 2))();
    }

  }
}

void __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(WeakRetained, "transferLocations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke_6;
    v10[3] = &unk_1E4449A40;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD *))(v7 + 16))(v7, v9, 0, v10);

  }
}

void __62__FPArchiveOperation__copyArchivedItemsWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)_checkNeedOfTemporaryDirectory
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  NSArray *obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = self->_items;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v4)
    goto LABEL_10;
  v5 = v4;
  v6 = *(_QWORD *)v28;
  obj = v3;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v28 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      objc_msgSend(v8, "providerDomainID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray firstObject](self->_items, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "providerDomainID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
      {
        fp_current_or_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[FPArchiveOperation _checkNeedOfTemporaryDirectory].cold.3();
        goto LABEL_18;
      }
      objc_msgSend(v8, "parentItemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray firstObject](self->_items, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "parentItemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "isEqualToItemID:", v15);

      if ((v16 & 1) == 0)
      {
        fp_current_or_default_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[FPArchiveOperation _checkNeedOfTemporaryDirectory].cold.2();
LABEL_18:
        v19 = 1;
        v18 = obj;
        goto LABEL_19;
      }
    }
    v3 = obj;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v5)
      continue;
    break;
  }
LABEL_10:

  -[NSArray firstObject](self->_items, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "providerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) != 0
    || (objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0
    || (objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider")) & 1) != 0)
  {
    v19 = 0;
  }
  else
  {
    -[NSArray firstObject](self->_items, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "providerDomainID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPProviderDomain providerDomainWithID:cachePolicy:error:](FPProviderDomain, "providerDomainWithID:cachePolicy:error:", v23, 1, 0);
    v20 = objc_claimAutoreleasedReturnValue();

    v24 = -[NSObject isUsingFPFS](v20, "isUsingFPFS");
    if ((v24 & 1) == 0)
    {
      fp_current_or_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[FPArchiveOperation _checkNeedOfTemporaryDirectory].cold.1();

    }
    v19 = v24 ^ 1;
LABEL_19:

  }
  return v19;
}

- (void)_materializeDestinationFolder:(id)a3
{
  id v4;
  void *v5;
  FPItem *destinationFolder;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  destinationFolder = self->_destinationFolder;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__FPArchiveOperation__materializeDestinationFolder___block_invoke;
  v8[3] = &unk_1E444BAF8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "fetchURLForItem:completionHandler:", destinationFolder, v8);

}

void __52__FPArchiveOperation__materializeDestinationFolder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_cold_1(a1, (uint64_t)v5);

    v9 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
    v10 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB35F8], "readingIntentWithURL:options:", v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 480);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_63;
    v15[3] = &unk_1E444BAD0;
    v16 = 0;
    v19 = v9;
    v17 = v5;
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v10, "coordinateAccessWithIntents:queue:byAccessor:", v12, v13, v15);

    goto LABEL_9;
  }
  v14 = *(_QWORD *)(a1 + 40);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 516, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *))(v14 + 16))(v14, 0, v10, &__block_literal_global_61);
LABEL_9:

    goto LABEL_10;
  }
  (*(void (**)(uint64_t, _QWORD, id, void *))(v14 + 16))(v14, 0, v6, &__block_literal_global_61);
LABEL_10:

}

void __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 40), "stopAccessingSecurityScopedResource");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_3;
    v6[3] = &unk_1E444BAA8;
    v8 = *(_BYTE *)(a1 + 56);
    v7 = v4;
    (*(void (**)(uint64_t, id, _QWORD, _QWORD *))(v5 + 16))(v5, v7, 0, v6);

  }
}

uint64_t __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_3(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "stopAccessingSecurityScopedResource");
  return result;
}

- (void)_prepareItemsWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *, void *);
  void *v5;
  NSObject *v6;

  v4 = (void (**)(id, _QWORD, void *, void *))a3;
  if (-[NSArray count](self->_items, "count"))
  {
    if (-[FPArchiveOperation _checkNeedOfTemporaryDirectory](self, "_checkNeedOfTemporaryDirectory"))
    {
      -[FPArchiveOperation _copyArchivedItemsWithCompletionHandler:](self, "_copyArchivedItemsWithCompletionHandler:", v4);
    }
    else
    {
      fp_current_or_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[FPArchiveOperation _prepareItemsWithCompletionHandler:].cold.1();

      -[FPArchiveOperation _coordinateArchivedItemsWithCompletionHandler:](self, "_coordinateArchivedItemsWithCompletionHandler:", v4);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v5, &__block_literal_global_66);

  }
}

- (unint64_t)_fpToDSArchiveFormat:(unint64_t)a3
{
  unint64_t v3;
  void *v6;

  v3 = a3;
  if (a3 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPArchiveOperation.m"), 423, CFSTR("No DS match for FP archive format: %ld"), v3);

    return 0;
  }
  return v3;
}

- (void)_archiveURLForFPEnumeratedDestination:(id)a3 targetArchiveName:(id)a4 service:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *, void *);
  void *v25;
  FPArchiveOperation *v26;
  id v27;
  id v28;
  SEL v29;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a5;
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[FPArchiveOperation _archiveURLForFPEnumeratedDestination:targetArchiveName:service:completionHandler:].cold.1();

  v16 = -[FPArchiveOperation _fpToDSArchiveFormat:](self, "_fpToDSArchiveFormat:", -[FPArchiveOperation archiveFormat](self, "archiveFormat"));
  objc_msgSend(v11, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __104__FPArchiveOperation__archiveURLForFPEnumeratedDestination_targetArchiveName_service_completionHandler___block_invoke;
  v25 = &unk_1E444BB48;
  v28 = v13;
  v29 = a2;
  v26 = self;
  v27 = v12;
  v18 = v12;
  v19 = v13;
  objc_msgSend(v14, "archiveItemsWithURLs:compressionFormat:destinationFolderURL:completionHandler:", v11, v16, v17, &v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPActionOperation progress](self, "progress", v22, v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addChild:withPendingUnitCount:", v20, 80);

}

void __104__FPArchiveOperation__archiveURLForFPEnumeratedDestination_targetArchiveName_service_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  id *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  FPMoveOperation *v20;
  void *v21;
  FPMoveOperation *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  char v38;
  void *v39;
  id v40;
  void *v41;
  _BYTE location[12];
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_13;
  }
  if (v7)
  {
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("FPArchiveOperation.m"), 446, CFSTR("url should exist if error is nil"));

    if (!v8)
    {
LABEL_7:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("FPArchiveOperation.m"), 447, CFSTR("nil archive name"));

    }
  }
  v12 = objc_msgSend(v7, "startAccessingSecurityScopedResource");
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "fileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = *(id **)(a1 + 32);
    objc_msgSend(v16[58], "fileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "findUniqueArchivedName:parent:", v14, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v18;
  }
  fp_current_or_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(_QWORD *)(v28 + 464);
    *(_DWORD *)location = 138413058;
    *(_QWORD *)&location[4] = v28;
    v43 = 2112;
    v44 = v13;
    v45 = 2112;
    v46 = v29;
    v47 = 2112;
    v48 = v14;
    _os_log_debug_impl(&dword_1A0A34000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: moving archive from temporary folder %@ to provider %@ with name \"%@\", location, 0x2Au);
  }

  v20 = [FPMoveOperation alloc];
  v41 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[FPMoveOperation initWithURLs:destinationFolder:](v20, "initWithURLs:destinationFolder:", v21, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));

  v39 = v13;
  v40 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPMoveOperation setTargetFilenamesByURL:](v22, "setTargetFilenamesByURL:", v23);

  *(_QWORD *)location = 0;
  objc_initWeak((id *)location, v22);
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __104__FPArchiveOperation__archiveURLForFPEnumeratedDestination_targetArchiveName_service_completionHandler___block_invoke_73;
  v33 = &unk_1E444BB20;
  v34 = v7;
  v38 = v12;
  v36 = *(id *)(a1 + 48);
  objc_copyWeak(&v37, (id *)location);
  v24 = v13;
  v35 = v24;
  -[FPActionOperation setActionCompletionBlock:](v22, "setActionCompletionBlock:", &v30);
  -[FPMoveOperation setShouldBounceOnCollision:](v22, "setShouldBounceOnCollision:", 1, v30, v31, v32, v33);
  -[FPActionOperation setHaveStitching:](v22, "setHaveStitching:", 0);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPActionOperation progress](v22, "progress");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addChild:withPendingUnitCount:", v26, 10);

  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "scheduleAction:", v22);

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)location);

LABEL_13:
}

void __104__FPArchiveOperation__archiveURLForFPEnumeratedDestination_targetArchiveName_service_completionHandler___block_invoke_73(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  v6 = *(_QWORD *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "transferResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v8, v4);

}

- (void)_archiveURLForDSEnumeratedDestination:(id)a3 service:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke;
  v14[3] = &unk_1E444BBC0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[FPArchiveOperation _materializeDestinationFolder:](self, "_materializeDestinationFolder:", v14);

}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *, void *, void *);
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    (*((void (**)(id))v9 + 2))(v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_cold_1(a1, v7, v11);

    v13 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v14 = objc_msgSend(*(id *)(a1 + 32), "_fpToDSArchiveFormat:", objc_msgSend(*(id *)(a1 + 32), "archiveFormat"));
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_75;
    v21 = &unk_1E444BB98;
    v15 = *(_QWORD *)(a1 + 32);
    v22 = 0;
    v23 = v15;
    v24 = v10;
    v25 = *(id *)(a1 + 56);
    objc_msgSend(v12, "archiveItemsAtURLs:toURL:options:compressionFormat:passphrase:completionHandler:", v13, v7, 0, v14, 0, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "progress", v18, v19, v20, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addChild:withPendingUnitCount:", v16, 80);

  }
}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_75(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (!v5 || v7)
  {
    if (v9)
      __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_75_cold_2((uint64_t)a1, a1 + 4);

    (*((void (**)(void))a1[6] + 2))();
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    if (v9)
      __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_75_cold_1((uint64_t)a1, v5);

    +[FPItemManager defaultManager](FPItemManager, "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_76;
    v11[3] = &unk_1E444BB70;
    v12 = v5;
    v13 = a1[6];
    v14 = a1[7];
    objc_msgSend(v10, "fetchItemForURL:completionHandler:", v12, v11);

  }
}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_76(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeItemAtURL:error:", a1[4], 0);

  }
  (*(void (**)(void))(a1[5] + 16))();
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)_archiveURLs:(id)a3 targetArchiveName:(id)a4 completionHandler:(id)a5
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
  getDSArchiveServiceClass();
  v10 = (void *)objc_opt_new();
  -[FPItem providerDomainID](self->_destinationFolder, "providerDomainID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPProviderDomain providerDomainWithID:cachePolicy:error:](FPProviderDomain, "providerDomainWithID:cachePolicy:error:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isUsingFPFS") && (objc_opt_respondsToSelector() & 1) != 0)
    -[FPArchiveOperation _archiveURLForDSEnumeratedDestination:service:completionHandler:](self, "_archiveURLForDSEnumeratedDestination:service:completionHandler:", v13, v10, v9);
  else
    -[FPArchiveOperation _archiveURLForFPEnumeratedDestination:targetArchiveName:service:completionHandler:](self, "_archiveURLForFPEnumeratedDestination:targetArchiveName:service:completionHandler:", v13, v8, v10, v9);

}

- (id)findUniqueArchivedName:(id)a3 parent:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;

  v5 = a3;
  v11 = 0;
  objc_msgSend(a4, "fp_existingURLOfChildWithName:isFolder:notMatchingFileID:nextAvailableBounceNumber:forceFetchingBounceNumber:", v5, 0, 0, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v7;
  if (v6)
  {
    if (!v7)
      v8 = &unk_1E448E920;
    objc_msgSend(v5, "fp_bouncedNameWithIndex:isDir:", objc_msgSend(v8, "longValue") + 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (void)actionMain
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v4 = 2112;
  v5 = v0;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v1, v2, "[DEBUG] %@: preparing items for archiving: %@", v3);
  OUTLINED_FUNCTION_3();
}

void __32__FPArchiveOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD);
  uint64_t v28[5];
  id v29;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    v9[2](v9);
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v8);
  }
  else
  {
    v11 = objc_msgSend(v7, "count");
    if (v11 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "count") && objc_msgSend(v7, "count"))
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "count") == 1)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "filename");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fp_displayNameFromFilenameWithHiddenPathExtension:isFolder:", 1, objc_msgSend(v19, "isFolder"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPArchiveOperation extensionForArchiveFormat:utType:](FPArchiveOperation, "extensionForArchiveFormat:utType:", objc_msgSend(*(id *)(a1 + 32), "archiveFormat"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "fp_filenameFromDisplayNameWithExtension:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        FPLoc(CFSTR("ARCHIVE_FILENAME"), v12, v13, v14, v15, v16, v17, v18, v28[0]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPArchiveOperation extensionForArchiveFormat:utType:](FPArchiveOperation, "extensionForArchiveFormat:utType:", objc_msgSend(*(id *)(a1 + 32), "archiveFormat"), 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByAppendingPathExtension:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v26 = *(void **)(a1 + 32);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = (uint64_t)__32__FPArchiveOperation_actionMain__block_invoke_2;
      v28[3] = (uint64_t)&unk_1E444BBE8;
      v27 = v10;
      v28[4] = *(_QWORD *)(a1 + 32);
      v29 = v27;
      objc_msgSend(v26, "_archiveURLs:targetArchiveName:completionHandler:", v7, v23, v28);

    }
    else
    {
      v10[2](v10);
      v24 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "completedWithResult:error:", 0, v25);

    }
  }

}

void __32__FPArchiveOperation_actionMain__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5);
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v8, v7);

}

- (void)presendNotifications
{
  void *v3;
  NSUInteger v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  FPItemID *v9;
  FPItemID *placeholderID;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[FPActionOperation stitcher](self, "stitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[NSArray firstObject](self->_items, "firstObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[NSArray count](self->_items, "count");
  -[FPActionOperation stitcher](self, "stitcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parentItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "providerDomainID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPArchiveOperation archiveFormat](self, "archiveFormat");
  if (v4 == 1)
    objc_msgSend(v5, "createArchivePlaceholderForItem:underParent:inProviderDomainID:withArchiveFormat:", v14, v6, v7, v8);
  else
    objc_msgSend(v5, "createGenericArchivePlaceholderUnderParent:inProviderDomainID:withArchiveFormat:", v6, v7, v8);
  v9 = (FPItemID *)objc_claimAutoreleasedReturnValue();
  placeholderID = self->_placeholderID;
  self->_placeholderID = v9;

  +[FPProgressManager defaultManager](FPProgressManager, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPActionOperation progress](self, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerCopyProgress:forItemID:", v12, self->_placeholderID);

  -[FPActionOperation stitcher](self, "stitcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "flush");

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (v7)
  {
    if (-[NSArray count](self->_items, "count") == 1)
    {
      -[NSArray firstObject](self->_items, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v7, "fp_annotatedErrorWithItem:variant:", v9, CFSTR("Archive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FPActionOperation stitcher](self, "stitcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "associateItem:withPlaceholderID:", v8, self->_placeholderID);
    v10 = 0;
  }

  -[FPActionOperation stitcher](self, "stitcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishWithItem:error:", v8, v10);

  -[FPArchiveOperation archiveCompletionBlock](self, "archiveCompletionBlock");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, id, void *))(v12 + 16))(v12, v8, v10);
    -[FPArchiveOperation setArchiveCompletionBlock:](self, "setArchiveCompletionBlock:", 0);
  }

  v14.receiver = self;
  v14.super_class = (Class)FPArchiveOperation;
  -[FPActionOperation finishWithResult:error:](&v14, sel_finishWithResult_error_, v8, v10);

}

- (id)archiveCompletionBlock
{
  return self->_archiveCompletionBlock;
}

- (void)setArchiveCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (unint64_t)archiveFormat
{
  return self->_archiveFormat;
}

- (void)setArchiveFormat:(unint64_t)a3
{
  self->_archiveFormat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_archiveCompletionBlock, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_destinationFolder, 0);
  objc_storeStrong((id *)&self->_placeholderID, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

- (void)_checkNeedOfTemporaryDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: item set contain items from several domains, prepare by copy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__FPArchiveOperation__materializeDestinationFolder___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_7_4(a1, a2), "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] %@: materializing target URL: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)_prepareItemsWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: downloading content of item prior to archiving", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_archiveURLForFPEnumeratedDestination:targetArchiveName:service:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] %@: creating archive from URLs using old SPI: %@", v1);
  OUTLINED_FUNCTION_3();
}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "fp_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: creating archive from URLs using new SPI: %@ to %@", (uint8_t *)&v7, 0x20u);

}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_75_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_shortDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] %@: archiving succeeded at %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __86__FPArchiveOperation__archiveURLForDSEnumeratedDestination_service_completionHandler___block_invoke_75_cold_2(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17_0(&dword_1A0A34000, v3, v4, "[DEBUG] %@: archiving failed with error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
