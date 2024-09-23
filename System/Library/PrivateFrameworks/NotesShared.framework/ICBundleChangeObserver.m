@implementation ICBundleChangeObserver

- (ICBundleChangeObserver)initWithPersistentStoreCoordinator:(id)a3 managedObjectContext:(id)a4
{
  id v7;
  id v8;
  ICBundleChangeObserver *v9;
  ICBundleChangeObserver *v10;
  uint64_t v11;
  NSMutableDictionary *mutableFilePresenters;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *processingQueue;
  id didChangeFilePresenters;
  id attachmentDidChange;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICBundleChangeObserver;
  v9 = -[ICBundleChangeObserver init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_isObserving = 0;
    objc_storeStrong((id *)&v9->_persistentStoreCoordinator, a3);
    objc_storeStrong((id *)&v10->_managedObjectContext, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    mutableFilePresenters = v10->_mutableFilePresenters;
    v10->_mutableFilePresenters = (NSMutableDictionary *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.notes.bundle-change-observer-processing-queue", v13);
    processingQueue = v10->_processingQueue;
    v10->_processingQueue = (OS_dispatch_queue *)v14;

    didChangeFilePresenters = v10->_didChangeFilePresenters;
    v10->_didChangeFilePresenters = 0;

    attachmentDidChange = v10->_attachmentDidChange;
    v10->_attachmentDidChange = 0;

  }
  return v10;
}

- (ICBundleChangeObserver)init
{
  void *v3;
  void *v4;
  void *v5;
  ICBundleChangeObserver *v6;

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workerManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICBundleChangeObserver initWithPersistentStoreCoordinator:managedObjectContext:](self, "initWithPersistentStoreCoordinator:managedObjectContext:", v4, v5);

  return v6;
}

- (void)start
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(void);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[ICBundleChangeObserver isObserving](self, "isObserving"))
  {
    -[ICBundleChangeObserver addManagedObjectContextDidSaveObserver](self, "addManagedObjectContextDidSaveObserver");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[ICBundleChangeObserver mutableFilePresenters](self, "mutableFilePresenters", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
          -[ICBundleChangeObserver didChangeFilePresenters](self, "didChangeFilePresenters");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            -[ICBundleChangeObserver didChangeFilePresenters](self, "didChangeFilePresenters");
            v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
            v10[2]();

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    -[ICBundleChangeObserver setIsObserving:](self, "setIsObserving:", 1);
    if (!-[ICBundleChangeObserver didAddForExistingPaperAttachments](self, "didAddForExistingPaperAttachments"))
    {
      -[ICBundleChangeObserver setDidAddForExistingPaperAttachments:](self, "setDidAddForExistingPaperAttachments:", 1);
      -[ICBundleChangeObserver addObserversForExistingPaperAttachments](self, "addObserversForExistingPaperAttachments");
    }
  }
}

- (void)stop
{
  -[ICBundleChangeObserver stopAndNotifyObservers:](self, "stopAndNotifyObservers:", 1);
}

- (void)stopAndNotifyObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (**v12)(void);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (-[ICBundleChangeObserver isObserving](self, "isObserving"))
  {
    -[ICBundleChangeObserver removeManagedObjectContextDidSaveObserver](self, "removeManagedObjectContextDidSaveObserver");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[ICBundleChangeObserver mutableFilePresenters](self, "mutableFilePresenters", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

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
          objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          if (v3)
          {
            -[ICBundleChangeObserver didChangeFilePresenters](self, "didChangeFilePresenters");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              -[ICBundleChangeObserver didChangeFilePresenters](self, "didChangeFilePresenters");
              v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
              v12[2]();

            }
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[ICBundleChangeObserver setIsObserving:](self, "setIsObserving:", 0);
  }
}

- (void)contextDidSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3B7AC74]();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C97870]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__ICBundleChangeObserver_contextDidSave___block_invoke;
    v8[3] = &unk_1E76CBDB0;
    v8[4] = self;
    -[ICBundleChangeObserver processObjectIDs:completion:](self, "processObjectIDs:completion:", v7, v8);
  }

  objc_autoreleasePoolPop(v5);
}

uint64_t __41__ICBundleChangeObserver_contextDidSave___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObserversForObjects:", a2);
}

- (void)addObserversForExistingPaperAttachments
{
  NSObject *v3;
  _QWORD block[5];

  -[ICBundleChangeObserver processingQueue](self, "processingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke_2;
  v5[3] = &unk_1E76C73B0;
  v3 = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

void __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  +[ICAttachment predicateForVisibleAttachmentsWithTypeUTI:inContext:](ICAttachment, "predicateForVisibleAttachmentsWithTypeUTI:inContext:", CFSTR("com.apple.paper"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachment ic_objectIDsMatchingPredicate:context:](ICAttachment, "ic_objectIDsMatchingPredicate:context:", v2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke_3;
  v6[3] = &unk_1E76CBDB0;
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "processObjectIDs:completion:", v5, v6);

}

uint64_t __65__ICBundleChangeObserver_addObserversForExistingPaperAttachments__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObserversForObjects:", a2);
}

- (void)addObserversForObjects:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = v3;
    performBlockOnMainThread();

  }
}

void __49__ICBundleChangeObserver_addObserversForObjects___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
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
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObserverForBundleWithObjectID:url:", v7, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)addObserverForBundleWithObjectID:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ICBundleChangeFilePresenter *v10;
  void *v11;
  ICBundleChangeFilePresenter *v12;
  void *v13;
  void *v14;
  void (**v15)(void);
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICBundleChangeObserver addObserverForBundleWithObjectID:url:]", 1, 0, CFSTR("Must be on main thread here"));
  -[ICBundleChangeObserver filePresenters](self, "filePresenters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = [ICBundleChangeFilePresenter alloc];
    -[ICBundleChangeObserver managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICBundleChangeFilePresenter initWithObjectID:url:managedObjectContext:](v10, "initWithObjectID:url:managedObjectContext:", v6, v7, v11);

    -[ICBundleChangeObserver mutableFilePresenters](self, "mutableFilePresenters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v7);

    if (objc_msgSend(v6, "ic_isEntityOfClass:", objc_opt_class()))
    {
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __63__ICBundleChangeObserver_addObserverForBundleWithObjectID_url___block_invoke;
      v16[3] = &unk_1E76CBDD8;
      objc_copyWeak(&v18, &location);
      v17 = v6;
      -[ICBundleChangeFilePresenter setPresentedItemDidApplyChanges:](v12, "setPresentedItemDidApplyChanges:", v16);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    if (-[ICBundleChangeObserver isObserving](self, "isObserving"))
    {
      objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", v12);
      -[ICBundleChangeObserver didChangeFilePresenters](self, "didChangeFilePresenters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[ICBundleChangeObserver didChangeFilePresenters](self, "didChangeFilePresenters");
        v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v15[2]();

      }
    }

  }
}

void __63__ICBundleChangeObserver_addObserverForBundleWithObjectID_url___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "attachmentDidChange");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v5;
    if (v3)
    {
      objc_msgSend(v5, "attachmentDidChange");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, *(_QWORD *)(a1 + 32));

      WeakRetained = v5;
    }
  }

}

- (void)removeObserverForBundleWithURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  id v9;

  v9 = a3;
  -[ICBundleChangeObserver mutableFilePresenters](self, "mutableFilePresenters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICBundleChangeObserver mutableFilePresenters](self, "mutableFilePresenters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v9);

    objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", v5);
    -[ICBundleChangeObserver didChangeFilePresenters](self, "didChangeFilePresenters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[ICBundleChangeObserver didChangeFilePresenters](self, "didChangeFilePresenters");
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v8[2]();

    }
  }

}

- (void)addManagedObjectContextDidSaveObserver
{
  void *v3;
  id v4;

  -[ICBundleChangeObserver persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_contextDidSave_, *MEMORY[0x1E0C978A8], v4);

}

- (void)removeManagedObjectContextDidSaveObserver
{
  void *v3;
  id v4;

  -[ICBundleChangeObserver persistentStoreCoordinator](self, "persistentStoreCoordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C978A8], v4);

}

- (id)filePresenters
{
  void *v2;
  void *v3;

  -[ICBundleChangeObserver mutableFilePresenters](self, "mutableFilePresenters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)processObjectIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ICBundleChangeObserver processingQueue](self, "processingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ICBundleChangeObserver_processObjectIDs_completion___block_invoke;
  block[3] = &unk_1E76C7780;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __54__ICBundleChangeObserver_processObjectIDs_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(a1[4], "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__ICBundleChangeObserver_processObjectIDs_completion___block_invoke_2;
  v4[3] = &unk_1E76C7780;
  v5 = a1[5];
  v6 = v2;
  v7 = a1[6];
  v3 = v2;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

void __54__ICBundleChangeObserver_processObjectIDs_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _UNKNOWN **v5;
  _UNKNOWN **v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _UNKNOWN **v10;
  _UNKNOWN **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v1 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(v1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v27;
    v5 = &off_1E76C5000;
    v6 = &off_1E76C5000;
    do
    {
      v7 = 0;
      v23 = v3;
      do
      {
        if (*(_QWORD *)v27 != v4)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        if (objc_msgSend(v8, "ic_isEntityOfClass:", objc_opt_class()))
        {
          v9 = v4;
          v10 = v6;
          v11 = v5;
          v12 = v1;
          objc_msgSend(*(id *)(v1 + 40), "objectWithID:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          objc_msgSend(v13, "attachmentModel");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          ICDynamicCast();
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            v17 = v14 == 0;
          else
            v17 = 1;
          if (!v17)
          {
            objc_msgSend(v16, "paperBundleURL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, v8);

          }
          v5 = v11;
          v6 = v10;
          v1 = v12;
          v4 = v9;
          v3 = v23;
        }
        if (objc_msgSend(v8, "ic_isEntityOfClass:", objc_opt_class()))
        {
          objc_msgSend(*(id *)(v1 + 40), "objectWithID:", v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "mediaURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, v8);

        }
        ++v7;
      }
      while (v3 != v7);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v3);
  }

  v21 = *(_QWORD *)(v1 + 48);
  v22 = (void *)objc_msgSend(v25, "copy");
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (BOOL)didAddForExistingPaperAttachments
{
  return self->_didAddForExistingPaperAttachments;
}

- (void)setDidAddForExistingPaperAttachments:(BOOL)a3
{
  self->_didAddForExistingPaperAttachments = a3;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (NSMutableDictionary)mutableFilePresenters
{
  return self->_mutableFilePresenters;
}

- (void)setMutableFilePresenters:(id)a3
{
  objc_storeStrong((id *)&self->_mutableFilePresenters, a3);
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (id)didChangeFilePresenters
{
  return self->_didChangeFilePresenters;
}

- (void)setDidChangeFilePresenters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)attachmentDidChange
{
  return self->_attachmentDidChange;
}

- (void)setAttachmentDidChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attachmentDidChange, 0);
  objc_storeStrong(&self->_didChangeFilePresenters, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_mutableFilePresenters, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

@end
