@implementation MessageListDataSource

uint64_t __53__MessageListDataSource_messageListSectionIsVisible___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)snapshotForMessageListSectionDataSource:(id)a3
{
  void *v3;
  void *v4;

  -[MessageListDataSource dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_dataSourceForSectionIndex:(id)a1
{
  id v2;
  void *v4;
  void *v5;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a1, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionIdentifierForIndex:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[MessageListDataSource _dataSourceForObjectID:](v2, v5);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (id)_dataSourceForObjectID:(id)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    v14 = 0;
    objc_msgSend(a1, "dataSourcesForObjectIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48__MessageListDataSource__dataSourceForObjectID___block_invoke;
    v6[3] = &unk_1E99E1690;
    v8 = &v9;
    v7 = v3;
    objc_msgSend(v4, "performWhileLocked:", v6);

    a1 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  return a1;
}

- (EFLocked)dataSourcesForObjectIdentifier
{
  return self->_dataSourcesForObjectIdentifier;
}

- (BOOL)messageListSectionIsVisible:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[MessageListDataSource visibleSections](self, "visibleSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__MessageListDataSource_messageListSectionIsVisible___block_invoke;
  v8[3] = &unk_1E99E1350;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "performWhileLocked:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (EFLocked)visibleSections
{
  return self->_visibleSections;
}

void __47__MessageListDataSource__dataSourceForSection___block_invoke(uint64_t a1, void *a2)
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

- (void)messageListSectionDataSource:(id)a3 performUpdateAnimated:(BOOL)a4 cleanSnapshot:(BOOL)a5 prepare:(id)a6 update:(id)a7 completion:(id)a8
{
  -[MessageListDataSource _performDataSourceUpdateAnimated:withSectionDataSource:cleanSnapshot:prepare:update:immediateCompletion:completion:]((uint64_t)self, a4, a3, a5, a6, a7, 0, a8);
}

- (void)_performDataSourceUpdateAnimated:(void *)a3 withSectionDataSource:(uint64_t)a4 cleanSnapshot:(void *)a5 prepare:(void *)a6 update:(uint64_t)a7 immediateCompletion:(void *)a8 completion:
{
  id v15;
  id v16;
  id v17;
  id v18;
  MessageListSectionUpdate *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v15 = a8;
    v16 = a6;
    v17 = a5;
    v18 = a3;
    v19 = -[MessageListSectionUpdate initWithMessageListSectionDataSource:animated:cleanSnapshot:prepareHandler:updateHandler:immediateCompletion:completionHandler:]([MessageListSectionUpdate alloc], "initWithMessageListSectionDataSource:animated:cleanSnapshot:prepareHandler:updateHandler:immediateCompletion:completionHandler:", v18, a2, a4, v17, v16, a7, v15);

    v21[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListDataSource _performDataSourceUpdates:](a1, v20);

  }
}

void __28__MessageListDataSource_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;

}

void __45__MessageListDataSource__objectIDForSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1E2A8]), "initAsEphemeralID:", 1);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }

}

void __48__MessageListDataSource__dataSourceForObjectID___block_invoke(uint64_t a1, void *a2)
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

- (MessageListDataSource)initWithCollectionView:(id)a3
{
  id v4;
  MessageListDataSource *v5;
  MessageListDataSource *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *updateQueue;
  id v11;
  id v12;
  uint64_t v13;
  EFLocked *objectIdentifiersForSection;
  id v15;
  id v16;
  uint64_t v17;
  EFLocked *dataSourcesForObjectIdentifier;
  id v19;
  id v20;
  uint64_t v21;
  EFLocked *visibleSections;
  id v23;
  id v24;
  uint64_t v25;
  EFLocked *pendingSectionsToClear;
  id v27;
  uint64_t v28;
  UICollectionViewDiffableDataSource *v29;
  UICollectionViewDiffableDataSource *dataSource;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MessageListDataSource;
  v5 = -[MessageListDataSource init](&v37, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.mobilemail.messagelistdatasource.collectionViewUpdate", v8);
    updateQueue = v6->_updateQueue;
    v6->_updateQueue = (OS_dispatch_queue *)v9;

    atomic_store(0, &v6->_updateIdentifier);
    v6->_updateQueueLock._os_unfair_lock_opaque = 0;
    v11 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = objc_msgSend(v11, "initWithObject:", v12);
    objectIdentifiersForSection = v6->_objectIdentifiersForSection;
    v6->_objectIdentifiersForSection = (EFLocked *)v13;

    v15 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = objc_msgSend(v15, "initWithObject:", v16);
    dataSourcesForObjectIdentifier = v6->_dataSourcesForObjectIdentifier;
    v6->_dataSourcesForObjectIdentifier = (EFLocked *)v17;

    v19 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v21 = objc_msgSend(v19, "initWithObject:", v20);
    visibleSections = v6->_visibleSections;
    v6->_visibleSections = (EFLocked *)v21;

    v23 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v24 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v25 = objc_msgSend(v23, "initWithObject:", v24);
    pendingSectionsToClear = v6->_pendingSectionsToClear;
    v6->_pendingSectionsToClear = (EFLocked *)v25;

    v6->_hasAdditionalSections = 0;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    objc_msgSend(v4, "setPrefetchDataSource:", v6);
    v27 = objc_alloc(MEMORY[0x1E0DC35E8]);
    v28 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __48__MessageListDataSource_initWithCollectionView___block_invoke;
    v34[3] = &unk_1E99E1400;
    objc_copyWeak(&v35, &location);
    v29 = (UICollectionViewDiffableDataSource *)objc_msgSend(v27, "initWithCollectionView:cellProvider:", v4, v34);
    v32[0] = v28;
    v32[1] = 3221225472;
    v32[2] = __48__MessageListDataSource_initWithCollectionView___block_invoke_2;
    v32[3] = &unk_1E99E1428;
    objc_copyWeak(&v33, &location);
    -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v29, "setSupplementaryViewProvider:", v32);
    dataSource = v6->_dataSource;
    v6->_dataSource = v29;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (int64_t)numberOfItems
{
  void *v2;
  void *v3;
  int64_t v4;

  -[MessageListDataSource dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItems");

  return v4;
}

id __48__MessageListDataSource_initWithCollectionView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  -[MessageListDataSource _configuredCellForCollectionView:indexPath:itemID:cellIdentifier:](WeakRetained, v9, v8, v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)resumeUpdates
{
  -[MessageListDataSource _resumeUpdatesWithForce:]((os_unfair_lock_s *)self, 0);
}

uint64_t __52__MessageListDataSource__setDataSource_forObjectID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)_dataSourceForSection:(void *)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    v14 = 0;
    objc_msgSend(a1, "objectIdentifiersForSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__MessageListDataSource__dataSourceForSection___block_invoke;
    v6[3] = &unk_1E99E1690;
    v8 = &v9;
    v7 = v3;
    objc_msgSend(v4, "performWhileLocked:", v6);

    -[MessageListDataSource _dataSourceForObjectID:](a1, (void *)v10[5]);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

- (id)_createSectionDataSourceForSection:(void *)a3 messageList:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = a3;
    -[MessageListDataSource _objectIDForSection:](a1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "provider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageListDataSource:sectionDataSourceForSection:objectID:messageList:", a1, v5, v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__createSectionDataSourceForSection_messageList_, a1, CFSTR("MessageListDataSource.m"), 243, CFSTR("Cannot reload message list with empty data source"));

    }
    objc_msgSend(v9, "setProvider:", a1);
    +[MessageListDataSource log](MessageListDataSource, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218498;
      v14 = a1;
      v15 = 2048;
      v16 = v9;
      v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_1D5522000, v10, OS_LOG_TYPE_DEFAULT, "%p: creating new data source (%p) for section: %{public}@", (uint8_t *)&v13, 0x20u);
    }

    -[MessageListDataSource _setDataSource:forObjectID:](a1, v9, v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)suspendUpdates
{
  os_unfair_lock_s *p_updateQueueLock;
  int64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  MessageListDataSource *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_updateQueueLock = &self->_updateQueueLock;
  os_unfair_lock_lock(&self->_updateQueueLock);
  v4 = -[MessageListDataSource updateQueueSuspensionCount](self, "updateQueueSuspensionCount");
  if (v4)
  {
    +[MessageListDataSource log](MessageListDataSource, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = self;
      v9 = 2048;
      v10 = v4;
      _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: Queue is already suspended (count=%ld)", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    +[MessageListDataSource log](MessageListDataSource, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = self;
      v9 = 2048;
      v10 = 0;
      _os_log_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEFAULT, "%p: Suspend update queue (count=%ld)", (uint8_t *)&v7, 0x16u);
    }

    -[MessageListDataSource updateQueue](self, "updateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v5);
  }

  -[MessageListDataSource setUpdateQueueSuspensionCount:](self, "setUpdateQueueSuspensionCount:", -[MessageListDataSource updateQueueSuspensionCount](self, "updateQueueSuspensionCount") + 1);
  os_unfair_lock_unlock(p_updateQueueLock);
}

- (int64_t)updateQueueSuspensionCount
{
  return self->_updateQueueSuspensionCount;
}

- (void)setUpdateQueueSuspensionCount:(int64_t)a3
{
  self->_updateQueueSuspensionCount = a3;
}

- (void)_resumeUpdatesWithForce:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  os_unfair_lock_s *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    v5 = -[os_unfair_lock_s updateQueueSuspensionCount](a1, "updateQueueSuspensionCount");
    if (v5)
    {
      if (a2)
        v6 = 0;
      else
        v6 = v5 - 1;
      if (v6)
      {
        +[MessageListDataSource log](MessageListDataSource, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 134218496;
          v11 = a1;
          v12 = 2048;
          v13 = v6;
          v14 = 1024;
          v15 = a2;
          _os_log_impl(&dword_1D5522000, v7, OS_LOG_TYPE_DEFAULT, "%p: Skip resume queue (count=%ld, force=%{BOOL}d)", (uint8_t *)&v10, 0x1Cu);
        }
      }
      else
      {
        +[MessageListDataSource log](MessageListDataSource, "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 134218496;
          v11 = a1;
          v12 = 2048;
          v13 = 0;
          v14 = 1024;
          v15 = a2;
          _os_log_impl(&dword_1D5522000, v9, OS_LOG_TYPE_DEFAULT, "%p: Resume update queue (count=%ld, force=%{BOOL}d)", (uint8_t *)&v10, 0x1Cu);
        }

        -[os_unfair_lock_s updateQueue](a1, "updateQueue");
        v7 = objc_claimAutoreleasedReturnValue();
        dispatch_resume(v7);
      }

      -[os_unfair_lock_s setUpdateQueueSuspensionCount:](a1, "setUpdateQueueSuspensionCount:", v6);
    }
    else
    {
      +[MessageListDataSource log](MessageListDataSource, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 134218496;
        v11 = a1;
        v12 = 2048;
        v13 = 0;
        v14 = 1024;
        v15 = a2;
        _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "%p: Queue is already resumed (count=%ld, force=%{BOOL}d)", (uint8_t *)&v10, 0x1Cu);
      }

    }
    os_unfair_lock_unlock(v4);
  }
}

- (MessageListDataSourceDelegate)delegate
{
  return (MessageListDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MessageListDataSource_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, block);
  return (OS_os_log *)(id)log_log_2;
}

id __60__MessageListDataSource__insertDefaultSectionsIntoSnapshot___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[MessageListDataSource _objectIDForSection:](*(id *)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = v3;

  return v6;
}

- (id)_objectIDForSection:(id)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    v14 = 0;
    objc_msgSend(a1, "objectIdentifiersForSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__MessageListDataSource__objectIDForSection___block_invoke;
    v6[3] = &unk_1E99E1690;
    v8 = &v9;
    v7 = v3;
    objc_msgSend(v4, "performWhileLocked:", v6);

    a1 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  return a1;
}

- (EFLocked)objectIdentifiersForSection
{
  return self->_objectIdentifiersForSection;
}

- (MessageListDataSourceProvider)provider
{
  return (MessageListDataSourceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)_insertDefaultSectionsIntoSnapshot:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("MessageListSectionRecent"), 0);
    objc_msgSend(v4, "addObject:", CFSTR("MessageListSectionIndexedSearch"));
    if (_os_feature_enabled_impl())
      objc_msgSend(v4, "addObject:", CFSTR("MessageListSectionServerSearch"));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__MessageListDataSource__insertDefaultSectionsIntoSnapshot___block_invoke;
    v8[3] = &unk_1E99E1858;
    v8[4] = a1;
    v5 = v7;
    v9 = v5;
    objc_msgSend(v4, "ef_compactMap:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v6);

    v3 = v7;
  }

}

- (void)_setDataSource:(void *)a3 forObjectID:
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "dataSourcesForObjectIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__MessageListDataSource__setDataSource_forObjectID___block_invoke;
    v8[3] = &unk_1E99E16B8;
    v9 = v5;
    v10 = v7;
    objc_msgSend(v6, "performWhileLocked:", v8);

  }
}

- (id)_configuredCellForCollectionView:(void *)a3 indexPath:(void *)a4 itemID:(void *)a5 cellIdentifier:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    -[MessageListDataSource _dataSourceForSectionIndex:](a1, objc_msgSend(v10, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "configuredCollectionViewCellForCollectionView:indexPath:itemID:cellIdentifier:", v9, v10, v11, v12);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

id __48__MessageListDataSource_initWithCollectionView___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  -[MessageListDataSource _supplementaryViewForCollectionView:elementKind:indexPath:](WeakRetained, v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_supplementaryViewForCollectionView:(void *)a3 elementKind:(void *)a4 indexPath:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  if (a1)
  {
    v7 = a4;
    v8 = a3;
    v9 = a2;
    -[MessageListDataSource _dataSourceForSectionIndex:](a1, objc_msgSend(v7, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configuredReusableSupplementaryViewForCollectionView:elementKind:indexPath:", v9, v8, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageListDataSource:didConfigureSupplementaryView:elementKind:section:", a1, v11, v8, v10);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (int64_t)numberOfSections
{
  void *v2;
  void *v3;
  int64_t v4;

  -[MessageListDataSource dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)numberOfItemsAtSectionIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[MessageListDataSource dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifierForIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "numberOfItemsInSection:", v6);

  return v7;
}

- (id)itemIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[MessageListDataSource dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleMessageListSections
{
  void *v2;
  void *v3;

  -[MessageListDataSource visibleSections](self, "visibleSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)applyMessageListDataSourceUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  _QWORD v40[5];
  uint8_t v41[128];
  uint8_t buf[4];
  MessageListDataSource *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MessageListDataSource log](MessageListDataSource, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v43 = self;
    v44 = 2114;
    v45 = v6;
    _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%p: applyMessageListDataSourceUpdate: %{public}@", buf, 0x16u);

  }
  -[MessageListDataSource pendingSectionsToClear](self, "pendingSectionsToClear");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performWhileLocked:", &__block_literal_global_2);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionsToRemove");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_2;
  v40[3] = &unk_1E99E1490;
  v40[4] = self;
  objc_msgSend(v10, "ef_map:", v40);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ef_filter:", *MEMORY[0x1E0D1ED88]);
  v12 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "startsWithEmptySnapshot"))
  {
    objc_msgSend(v8, "addObjectsFromArray:", v12);
  }
  else
  {
    objc_msgSend(v4, "sectionsToRemove");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v13);

  }
  v28 = (void *)v12;
  objc_msgSend(v4, "sectionsToUpdate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_3;
  v36[3] = &unk_1E99E14F8;
  v36[4] = self;
  v15 = v4;
  v37 = v15;
  v16 = v8;
  v38 = v16;
  v17 = v9;
  v39 = v17;
  objc_msgSend(v14, "ef_map:", v36);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "startsWithEmptySnapshot"))
    -[MessageListDataSource _performDataSourceUpdates:]((uint64_t)self, v16);
  if ((objc_msgSend(v15, "startsWithEmptySnapshot") & 1) == 0)
  {
    -[MessageListDataSource pendingSectionsToClear](self, "pendingSectionsToClear");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_5;
    v34[3] = &unk_1E99E1300;
    v35 = v17;
    objc_msgSend(v19, "performWhileLocked:", v34);

  }
  v27 = v17;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[MessageListDataSource _resumeUpdatesWithForce:]((os_unfair_lock_s *)self, 1);
        -[MessageListDataSource visibleSections](self, "visibleSections", v27);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_6;
        v29[3] = &unk_1E99E1300;
        v29[4] = v25;
        objc_msgSend(v26, "performWhileLocked:", v29);

        objc_msgSend(v25, "beginObservingAnimated:nextUpdateNeedsCleanSnapshot:", 1, objc_msgSend(v15, "startsWithEmptySnapshot") ^ 1);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    }
    while (v22);
  }

}

uint64_t __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

MessageListSectionUpdate *__58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  return -[MessageListDataSource _removeMessageListSection:animated:](*(void **)(a1 + 32), a2, 0);
}

- (MessageListSectionUpdate)_removeMessageListSection:(uint64_t)a3 animated:
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  MessageListSectionUpdate *v11;
  MessageListSectionUpdate *v12;
  NSObject *v13;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  NSObject *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    objc_msgSend(a1, "visibleSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__MessageListDataSource__removeMessageListSection_animated___block_invoke;
    v17[3] = &unk_1E99E1520;
    v8 = v5;
    v18 = v8;
    v19 = &v20;
    objc_msgSend(v6, "performWhileLocked:", v17);

    if (*((_BYTE *)v21 + 24))
    {
      -[MessageListDataSource _dataSourceForSection:](a1, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        +[MessageListDataSource log](MessageListDataSource, "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          v25 = a1;
          v26 = 2048;
          v27 = v9;
          v28 = 2114;
          v29 = v8;
          _os_log_impl(&dword_1D5522000, v10, OS_LOG_TYPE_DEFAULT, "%p: Remove data source (%p) from section: %{public}@", buf, 0x20u);
        }

        -[NSObject stopObserving](v9, "stopObserving");
        v11 = [MessageListSectionUpdate alloc];
        v15[0] = v7;
        v15[1] = 3221225472;
        v15[2] = __60__MessageListDataSource__removeMessageListSection_animated___block_invoke_24;
        v15[3] = &unk_1E99E1548;
        v16 = v8;
        v12 = -[MessageListSectionUpdate initWithMessageListSectionDataSource:animated:cleanSnapshot:updateHandler:](v11, "initWithMessageListSectionDataSource:animated:cleanSnapshot:updateHandler:", v9, a3, 1, v15);
        v13 = v16;
      }
      else
      {
        +[MessageListDataSource log](MessageListDataSource, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v25 = a1;
          v26 = 2114;
          v27 = v8;
          _os_log_impl(&dword_1D5522000, v13, OS_LOG_TYPE_DEFAULT, "%p: Section does not exist. Cannot remove data source from section: %{public}@", buf, 0x16u);
        }
        v12 = 0;
      }

    }
    else
    {
      +[MessageListDataSource log](MessageListDataSource, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v25 = a1;
        v26 = 2114;
        v27 = v8;
        _os_log_impl(&dword_1D5522000, v9, OS_LOG_TYPE_DEFAULT, "%p: Message list section (%{public}@) is not visible", buf, 0x16u);
      }
      v12 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MessageListSectionUpdate *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListDataSource _dataSourceForSection:](v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stopObserving");
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v3, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListDataSource _createSectionDataSourceForSection:messageList:](v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "startsWithEmptySnapshot"))
  {
    v11 = -[MessageListSectionUpdate initWithMessageListSectionDataSource:animated:cleanSnapshot:updateHandler:]([MessageListSectionUpdate alloc], "initWithMessageListSectionDataSource:animated:cleanSnapshot:updateHandler:", v10, 0, 1, &__block_literal_global_14);
    v12 = *(void **)(a1 + 48);
  }
  else
  {
    v13 = *(void **)(a1 + 56);
    objc_msgSend(v3, "section");
    v11 = (MessageListSectionUpdate *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
  }
  objc_msgSend(v12, "addObject:", v11);

  return v10;
}

id __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_4()
{
  return +[MessageListSectionDataSourceChange cleanSnapshot](_TtC6MailUI34MessageListSectionDataSourceChange, "cleanSnapshot");
}

- (void)_performDataSourceUpdates:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  char *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__MessageListDataSource__performDataSourceUpdates___block_invoke;
    v6[3] = &unk_1E99E13D8;
    v6[4] = a1;
    v7 = v3;
    v8 = sel__performDataSourceUpdates_;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performBlock:", v6);

  }
}

uint64_t __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSet:", *(_QWORD *)(a1 + 32));
}

void __58__MessageListDataSource_applyMessageListDataSourceUpdate___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "section");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (void)showMessageListSection:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  MessageListDataSource *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MessageListDataSource visibleSections](self, "visibleSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __57__MessageListDataSource_showMessageListSection_animated___block_invoke;
  v15 = &unk_1E99E1350;
  v17 = &v18;
  v8 = v6;
  v16 = v8;
  objc_msgSend(v7, "performWhileLocked:", &v12);
  +[MessageListDataSource log](MessageListDataSource, "log", v12, v13, v14, v15);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *((unsigned __int8 *)v19 + 24);
    *(_DWORD *)buf = 134218754;
    v23 = self;
    v24 = 2114;
    v25 = v8;
    v26 = 1024;
    v27 = v10;
    v28 = 1024;
    v29 = v4;
    _os_log_impl(&dword_1D5522000, v9, OS_LOG_TYPE_DEFAULT, "%p: showMessageListSection: %{public}@, requiresUpdate: %{BOOL}d, animated: %{BOOL}d", buf, 0x22u);
  }

  if (*((_BYTE *)v19 + 24))
  {
    -[MessageListDataSource _dataSourceForSection:](self, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "beginObservingAnimated:nextUpdateNeedsCleanSnapshot:", v4, 0);

  }
  _Block_object_dispose(&v18, 8);

}

void __57__MessageListDataSource_showMessageListSection_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)) ^ 1;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)removeMessageListSection:(id)a3 animated:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[MessageListDataSource _removeMessageListSection:animated:](self, a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListDataSource _performDataSourceUpdates:]((uint64_t)self, v7);

  }
}

void __60__MessageListDataSource__removeMessageListSection_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

id __60__MessageListDataSource__removeMessageListSection_animated___block_invoke_24(uint64_t a1)
{
  return +[MessageListSectionDataSourceChange sectionRemovedWithSection:](_TtC6MailUI34MessageListSectionDataSourceChange, "sectionRemovedWithSection:", *(_QWORD *)(a1 + 32));
}

- (BOOL)shouldDisplaySupplementaryKind:(id)a3 forSectionAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v14;

  v6 = a3;
  -[MessageListDataSource _dataSourceForSectionIndex:](self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "section");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MessageListDataSource messageListSectionIsVisible:](self, "messageListSectionIsVisible:", v8);

  if (v9 && objc_msgSend(v7, "hasSupplementaryViewOfKind:", v6))
  {
    -[MessageListDataSource collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numberOfItemsInSection:", a4);

    if (v11)
    {
      v12 = 1;
    }
    else
    {
      -[MessageListDataSource delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v7, "shouldShowSupplementaryViewOfKindIfEmpty:isIndexing:", v6, objc_msgSend(v14, "isIndexingMessagesForMessageListDataSource:", self));

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)deleteItemsWithIDs:(id)a3 animated:(BOOL)a4 immediateCompletion:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  MessageListDataSource *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  uint64_t v39;

  v25 = a5;
  v7 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  +[MessageListDataSource log](MessageListDataSource, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v32 = self;
    v33 = 2114;
    v34 = v9;
    v35 = 1024;
    v36 = v7;
    v37 = 1024;
    v38 = v25;
    _os_log_impl(&dword_1D5522000, v11, OS_LOG_TYPE_DEFAULT, "%p: delete items with ids: %{public}@, animated: %{BOOL}d, immediateCompletion: %{BOOL}d", buf, 0x22u);
  }

  -[MessageListDataSource dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "snapshot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v13;
  v24 = v9;
  -[MessageListDataSource _groupMessagesListItemIDsBySection:snapshot:]((uint64_t)self, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListDataSource _dataSourceForObjectID:](self, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "deleteItemsWithIDs:animated:useImmediateCompletion:completionHandler:", v21, v7, v25, v10);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

}

- (id)_groupMessagesListItemIDsBySection:(void *)a3 snapshot:
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__MessageListDataSource__groupMessagesListItemIDsBySection_snapshot___block_invoke;
    v9[3] = &unk_1E99E1708;
    v10 = v5;
    objc_msgSend(a2, "ef_groupBy:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)reloadItemsWithItemIDs:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  MessageListDataSource *v11;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke;
  v9[3] = &unk_1E99E1600;
  v10 = v4;
  v11 = self;
  v5 = v9;
  v6 = (void *)MEMORY[0x1E0D1F070];
  v7 = v4;
  objc_msgSend(v6, "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performBlock:", v5);

}

void __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke_2;
  v14[3] = &unk_1E99E1570;
  v3 = *(void **)(a1 + 32);
  v14[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "ef_compactMap:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  +[MessageListDataSource log](MessageListDataSource, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = objc_msgSend(v4, "count");
      v10 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134218496;
      v16 = v8;
      v17 = 2048;
      v18 = v9;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEFAULT, "%p: reload %lu items (intial set: %lu)", buf, 0x20u);
    }

    objc_msgSend(v4, "ef_groupBy:", &__block_literal_global_28);
    v6 = objc_claimAutoreleasedReturnValue();
    v13[0] = v2;
    v13[1] = 3221225472;
    v13[2] = __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke_2_30;
    v13[3] = &unk_1E99E15D8;
    v13[4] = *(_QWORD *)(a1 + 40);
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", v13);
  }
  else if (v7)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEFAULT, "%p: skip reload items (%{public}@) - requested items are not visible", buf, 0x16u);
  }

}

id __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForItemIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke_26(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "section"));
}

void __48__MessageListDataSource_reloadItemsWithItemIDs___block_invoke_2_30(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  -[MessageListDataSource _dataSourceForSectionIndex:](v4, objc_msgSend(a2, "integerValue"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reconfigureItemsAtIndexPaths:", v5);

}

- (void)reloadVisibleCellsInvalidatingCache:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  MessageListDataSource *v24;
  id v25;
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  MessageListDataSource *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v3 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  -[MessageListDataSource _indexPathsForPreparedItems](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    +[MessageListDataSource log](MessageListDataSource, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v33 = self;
      v34 = 2048;
      v35 = objc_msgSend(v5, "count");
      v36 = 2112;
      v37 = v5;
      v38 = 1024;
      v39 = v3;
      _os_log_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEFAULT, "%p: updateListForChange - reloading visible cells at (%lu) indexPaths:%@ invalidateCache:%{BOOL}d", buf, 0x26u);
    }

    -[MessageListDataSource dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v5;
    objc_msgSend(v8, "mui_validItemIDsFromIndexPaths:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8;
    -[MessageListDataSource _groupMessagesListItemIDsBySection:snapshot:]((uint64_t)self, v21, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[MessageListDataSource _dataSourceForObjectID:](self, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v15, v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "count"))
          {
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __61__MessageListDataSource_reloadVisibleCellsInvalidatingCache___block_invoke;
            v22[3] = &unk_1E99E1628;
            v23 = v17;
            v24 = self;
            v26 = v3;
            v25 = v16;
            -[MessageListDataSource _performDataSourceUpdateAnimated:withSectionDataSource:cleanSnapshot:prepare:update:immediateCompletion:completion:]((uint64_t)self, 0, v25, 0, 0, v22, 0, 0);

            v18 = v23;
          }
          else
          {
            +[MessageListDataSource log](MessageListDataSource, "log");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v33 = self;
              v34 = 2114;
              v35 = (uint64_t)v21;
              _os_log_impl(&dword_1D5522000, v18, OS_LOG_TYPE_DEFAULT, "%p: skip reloading visible items (%{public}@)", buf, 0x16u);
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);
    }

    v5 = v20;
  }

}

- (id)_indexPathsForPreparedItems
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "collectionView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "mui_indexPathsForPreparedItems");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __61__MessageListDataSource_reloadVisibleCellsInvalidatingCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "mui_validItemIDsFromExistingItemIDs:updateReason:", *(_QWORD *)(a1 + 32), CFSTR("reloadVisibleCellsInvalidatingCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    +[MessageListDataSource log](MessageListDataSource, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 134218498;
      v12 = v7;
      v13 = 2048;
      v14 = v5;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEFAULT, "%p: updateListForChange - reloading (%ld) itemIDs %@", (uint8_t *)&v11, 0x20u);
    }

    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 48), "messageList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidateCacheForItemIDs:", v4);

    }
    objc_msgSend(v3, "reloadItemsWithIdentifiers:", v4);
  }
  +[MessageListSectionDataSourceChange withCount:](_TtC6MailUI34MessageListSectionDataSourceChange, "withCount:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)reconfigureVisibleCells
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  MessageListDataSource *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MessageListDataSource _indexPathsForPreparedItems](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[MessageListDataSource dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "mui_validItemIDsFromIndexPaths:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MessageListDataSource log](MessageListDataSource, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218754;
      v9 = self;
      v10 = 2048;
      v11 = objc_msgSend(v3, "count");
      v12 = 2112;
      v13 = v3;
      v14 = 2048;
      v15 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1D5522000, v7, OS_LOG_TYPE_DEFAULT, "%p: updateListForChange - reconfigureVisibleCells visible cells at (%lu) indexPaths:%@ itemIDs (%lu)", (uint8_t *)&v8, 0x2Au);
    }

    -[MessageListDataSource reloadItemsWithItemIDs:](self, "reloadItemsWithItemIDs:", v6);
  }

}

- (id)itemIdentifierForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[MessageListDataSource dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)indexPathForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[MessageListDataSource dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)messageListAtSectionIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[MessageListDataSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifierForIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessageListDataSource _messageListInSectionWithObjectIdentifier:](self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_messageListInSectionWithObjectIdentifier:(void *)a1
{
  void *v2;
  void *v3;

  v2 = 0;
  if (a1 && a2)
  {
    -[MessageListDataSource _dataSourceForObjectID:](a1, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageList");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)messageListForSection:(id)a3
{
  void *v4;
  void *v5;

  -[MessageListDataSource _objectIDForSection:](self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListDataSource _messageListInSectionWithObjectIdentifier:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)sectionIndexForSection:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[MessageListDataSource _objectIDForSection:](self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListDataSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexForSectionIdentifier:", v4);

  return v6;
}

- (id)messageListForMessageListItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    -[MessageListDataSource dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "snapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifierForSectionContainingItemIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[MessageListDataSource _messageListInSectionWithObjectIdentifier:](self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)refresh
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[MessageListDataSource _allDataSources](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "refresh");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_allDataSources
{
  void *v1;
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  objc_msgSend(a1, "dataSourcesForObjectIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__MessageListDataSource__allDataSources__block_invoke;
  v4[3] = &unk_1E99E16E0;
  v4[4] = &v5;
  objc_msgSend(v1, "performWhileLocked:", v4);

  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)messageListItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (v4)
  {
    -[MessageListDataSource dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MessageListDataSource _dataSourceForSectionIndex:](self, objc_msgSend(v4, "section"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "messageListItemForItemID:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[MessageListDataSource log](MessageListDataSource, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MessageListDataSource messageListItemAtIndexPath:].cold.1((uint64_t)self, (uint64_t)v4, v10);

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)messageListItemForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageListItemForItemID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_dataSourceContainingItemID:(void *)a1
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = a2;
    objc_msgSend(a1, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "snapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifierForSectionContainingItemIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[MessageListDataSource _dataSourceForObjectID:](a1, v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)messageListItemForItemID:(id)a3 section:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[MessageListDataSource _dataSourceForSection:](self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageListItemForItemID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)messageListItemsForItemIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MessageListDataSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v6;
  v20 = v4;
  -[MessageListDataSource _groupMessagesListItemIDsBySection:snapshot:]((uint64_t)self, v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v7, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListDataSource _dataSourceForObjectID:](self, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "messageList");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "messageListItemsForItemIDs:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v17);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  return v8;
}

- (id)messageListItemsForItemIDs:(id)a3 section:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[MessageListDataSource _dataSourceForSection:](self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageListItemsForItemIDs:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)messageListItemsInSection:(id)a3 limit:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v16;
  MessageListDataSource *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MessageListDataSource _dataSourceForSection:](self, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allItemIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") > a4)
  {
    +[MessageListDataSource log](MessageListDataSource, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218754;
      v17 = self;
      v18 = 2114;
      v19 = v12;
      v20 = 2048;
      v21 = objc_msgSend(v10, "count");
      v22 = 2048;
      v23 = a4;
      _os_log_impl(&dword_1D5522000, v11, OS_LOG_TYPE_DEFAULT, "%p: %{public}@ - limit the itemIDs.count:%lu to limit:%lu", (uint8_t *)&v16, 0x2Au);

    }
    objc_msgSend(v10, "subarrayWithRange:", 0, a4);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  objc_msgSend(v8, "messageListItemsForItemIDs:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)messagesInMessageListItem:(id)a3
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
  id v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "itemID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MessageListDataSource _dataSourceContainingItemID:](self, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "allItemIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "result:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "messageList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageListItemsForItemIDs:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ef_map:", &__block_literal_global_37);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  if (v5)
    v12 = v5;
  else
    v12 = (void *)MEMORY[0x1E0C9AA60];
  v13 = v12;

  return v13;
}

id __51__MessageListDataSource_messagesInMessageListItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)objectIDForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectIDForItemID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)applyFilterPredicate:(id)a3 userFiltered:(BOOL)a4 ignoreMessagesPredicate:(id)a5 section:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  _BOOL4 v16;
  int v17;
  MessageListDataSource *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v8 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[MessageListDataSource _dataSourceForSection:](self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MessageListDataSource _isSectionVisible:]((_BOOL8)self, v12);
  +[MessageListDataSource log](MessageListDataSource, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      v17 = 134218754;
      v18 = self;
      v19 = 1024;
      v20 = v10 != 0;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_1D5522000, v15, OS_LOG_TYPE_DEFAULT, "%p: applyFilterPredicate: %{BOOL}d, section: %{public}@, dataSource: %{public}@", (uint8_t *)&v17, 0x26u);
    }

    objc_msgSend(v13, "applyFilterPredicate:userFiltered:ignoreMessagesPredicate:", v10, v8, v11);
  }
  else
  {
    if (v16)
    {
      v17 = 134218754;
      v18 = self;
      v19 = 1024;
      v20 = v10 != 0;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v13;
      _os_log_impl(&dword_1D5522000, v15, OS_LOG_TYPE_DEFAULT, "%p: Cannot apply filter to hidden section: %{BOOL}d, section: %{public}@, dataSource: %{public}@", (uint8_t *)&v17, 0x26u);
    }

  }
}

- (BOOL)_isSectionVisible:(_BOOL8)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  if (a1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    objc_msgSend((id)a1, "visibleSections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__MessageListDataSource__isSectionVisible___block_invoke;
    v6[3] = &unk_1E99E1350;
    v8 = &v9;
    v7 = v3;
    objc_msgSend(v4, "performWhileLocked:", v6);

    a1 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

- (BOOL)isExpandedThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expandedThreadItemIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  return v8;
}

- (BOOL)anyExpandedThreadContainsItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "anyExpandedThreadContainsItemID:", v4);

  return v7;
}

- (id)threadItemIDForItemInExpandedThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadItemIDForItemInExpandedThread:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itemIDsInExpandedThread:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIDsInExpandedThread:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didScheduleReadInteractionForItemID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MessageListDataSource _dataSourceContainingItemID:](self, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didScheduleReadInteractionForItemID:", v4);

}

- (id)relatedItemIDsForSelectedItemID:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[MessageListDataSource _dataSourceForSectionIndex:](self, objc_msgSend(a4, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListDataSource dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "relatedItemIDsForSelectedItemID:snapshot:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isSection:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[MessageListDataSource dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionIdentifierForIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessageListDataSource _objectIDForSection:](self, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "isEqual:", v8);
  return (char)v6;
}

void __40__MessageListDataSource__allDataSources__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allValues");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __69__MessageListDataSource__groupMessagesListItemIDsBySection_snapshot___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sectionIdentifierForSectionContainingItemIdentifier:", a2);
}

uint64_t __43__MessageListDataSource__isSectionVisible___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)didSelectDisclosureButtonForMessageListItem:(id)a3 disclosureEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListDataSource _dataSourceContainingItemID:](self, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "didSelectDisclosureButtonForMessageListItem:disclosureEnabled:", v6, v4);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint8_t buf[4];
  MessageListDataSource *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __66__MessageListDataSource_collectionView_prefetchItemsAtIndexPaths___block_invoke;
  v27[3] = &unk_1E99E1730;
  v27[4] = self;
  objc_msgSend(a4, "ef_compactMap:", v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListDataSource dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v7;
  v22 = v5;
  -[MessageListDataSource _groupMessagesListItemIDsBySection:snapshot:]((uint64_t)self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[MessageListDataSource _dataSourceForObjectID:](self, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v14, v21, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[MessageListDataSource log](MessageListDataSource, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_msgSend(v16, "count");
          *(_DWORD *)buf = 134218498;
          v29 = self;
          v30 = 2048;
          v31 = v18;
          v32 = 2112;
          v33 = v16;
          _os_log_impl(&dword_1D5522000, v17, OS_LOG_TYPE_DEFAULT, "%p: Prefetch %lu itemIDs: %@", buf, 0x20u);
        }

        objc_msgSend(v15, "messageList");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v19, "messageListItemsForItemIDs:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    }
    while (v11);
  }

}

id __66__MessageListDataSource_collectionView_prefetchItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifierForIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __51__MessageListDataSource__performDataSourceUpdates___block_invoke(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void (**v17)(void);
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint64_t v24;
  unsigned int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 8);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
  +[MessageListDataSource log](MessageListDataSource, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    v32 = v5;
    v33 = 1024;
    v34 = v3;
    v35 = 2114;
    v36 = v6;
    _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_DEFAULT, "%p: [%u] Enqueue updates: %{public}@ ", buf, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v14 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v13, "sectionDataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "messageListDataSourcePrepareUpdate:section:cleanSnapshot:", v14, v15, objc_msgSend(v13, "cleanSnapshot"));

        objc_msgSend(v13, "prepareHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v13, "prepareHandler");
          v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v17[2]();

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MessageListDataSource__performDataSourceUpdates___block_invoke_44;
  block[3] = &unk_1E99E1830;
  v19 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v25 = v3;
  v22 = v19;
  v23 = v7;
  v24 = *(_QWORD *)(a1 + 48);
  v20 = v7;
  dispatch_async(v18, block);

}

void __51__MessageListDataSource__performDataSourceUpdates___block_invoke_44(uint64_t a1)
{
  void *v1;
  __int128 v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  unsigned int v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  unsigned int v34;
  void *v35;
  unsigned int v36;
  _BOOL4 v37;
  NSObject *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unsigned int v44;
  void *v45;
  uint64_t v46;
  unsigned int v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  unsigned int v54;
  void *v55;
  const void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  void *v60;
  void *v61;
  uint64_t v62;
  unsigned int v63;
  id obj;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v71[4];
  id v72;
  _QWORD aBlock[5];
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  unsigned int v78;
  char v79;
  _QWORD v80[5];
  id v81;
  _BYTE *v82;
  unsigned int v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE buf[40];
  id v89[2];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "snapshot");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "itemIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v1, "count");

  LOBYTE(v63) = objc_msgSend(*(id *)(a1 + 40), "ef_all:", &__block_literal_global_46);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = *(id *)(a1 + 40);
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
  if (v66)
  {
    v65 = *(_QWORD *)v85;
    *(_QWORD *)&v2 = 134219266;
    v59 = v2;
    do
    {
      for (i = 0; i != v66; ++i)
      {
        if (*(_QWORD *)v85 != v65)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        objc_msgSend(v4, "sectionDataSource", v59);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 32);
        objc_msgSend(v5, "objectID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListDataSource _dataSourceForObjectID:](v6, v7);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (v69 == v5)
        {
          objc_msgSend(v5, "objectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "sectionIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "ef_isEmpty");

          if (v13)
            -[MessageListDataSource _insertDefaultSectionsIntoSnapshot:](*(_QWORD *)(a1 + 32), v67);
          if (objc_msgSend(v4, "cleanSnapshot"))
          {
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            *(_QWORD *)&buf[24] = __Block_byref_object_copy_;
            *(_QWORD *)&buf[32] = __Block_byref_object_dispose_;
            v89[0] = (id)0xAAAAAAAAAAAAAAAALL;
            objc_msgSend(v67, "itemIdentifiersInSectionWithIdentifier:", v11);
            v89[0] = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "deleteItemsWithIdentifiers:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            objc_msgSend(*(id *)(a1 + 32), "pendingSectionsToClear");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v80[0] = MEMORY[0x1E0C809B0];
            v80[1] = 3221225472;
            v80[2] = __51__MessageListDataSource__performDataSourceUpdates___block_invoke_47;
            v80[3] = &unk_1E99E1798;
            v80[4] = *(_QWORD *)(a1 + 32);
            v15 = atomic_load((unsigned int *)(a1 + 64));
            v83 = v15;
            v82 = buf;
            v81 = v67;
            objc_msgSend(v14, "performWhileLocked:", v80);

            _Block_object_dispose(buf, 8);
          }
          objc_msgSend(v4, "updateHandler");
          v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v16)[2](v16, v67, v11);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = *(void **)(a1 + 32);
          objc_msgSend(v5, "section");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v17) = objc_msgSend(v17, "messageListSectionIsVisible:", v18);

          if ((v17 & 1) != 0 || (objc_msgSend(v68, "isSectionRemoval") & 1) != 0)
          {
            +[MessageListDataSource log](MessageListDataSource, "log");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = *(_QWORD *)(a1 + 32);
              v21 = atomic_load((unsigned int *)(a1 + 64));
              objc_msgSend(v4, "sectionDataSource");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "section");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "ef_publicDescription");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              *(_QWORD *)&buf[4] = v20;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v21;
              *(_WORD *)&buf[18] = 2114;
              *(_QWORD *)&buf[20] = v23;
              *(_WORD *)&buf[28] = 2114;
              *(_QWORD *)&buf[30] = v24;
              _os_log_impl(&dword_1D5522000, v19, OS_LOG_TYPE_DEFAULT, "%p: [%u][%{public}@] Perform data source update: %{public}@", buf, 0x26u);

            }
            if (objc_msgSend(v68, "failed"))
            {
              +[MessageListDataSource log](MessageListDataSource, "log");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v43 = *(_QWORD *)(a1 + 32);
                v44 = atomic_load((unsigned int *)(a1 + 64));
                objc_msgSend(v67, "itemIdentifiers");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                *(_QWORD *)&buf[4] = v43;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v44;
                *(_WORD *)&buf[18] = 2114;
                *(_QWORD *)&buf[20] = v45;
                _os_log_error_impl(&dword_1D5522000, v25, OS_LOG_TYPE_ERROR, "%p: [%u] Reloading datasource as we failed to update snapshot with stale snapshot identifiers:%{public}@", buf, 0x1Cu);

              }
              objc_msgSend(*(id *)(a1 + 48), "messageListDataSourceUpdateFailed:section:", *(_QWORD *)(a1 + 32), v5);
            }
            else
            {
              if ((objc_msgSend(v68, "isSkipped") & 1) != 0 || objc_msgSend(v68, "isEmpty"))
                v26 = objc_msgSend(v4, "cleanSnapshot") ^ 1 | (v62 == 0);
              else
                v26 = 0;
              if (objc_msgSend(v68, "isCleanSnapshot"))
              {
                v36 = atomic_load((unsigned int *)(a1 + 64));
                v37 = v36 == 0;
              }
              else
              {
                v37 = 0;
              }
              if ((v26 | v37) == 1)
              {
                +[MessageListDataSource log](MessageListDataSource, "log");
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  v46 = *(_QWORD *)(a1 + 32);
                  v47 = atomic_load((unsigned int *)(a1 + 64));
                  objc_msgSend(v5, "section");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v4, "cleanSnapshot");
                  objc_msgSend(v68, "ef_publicDescription");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v59;
                  *(_QWORD *)&buf[4] = v46;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v47;
                  *(_WORD *)&buf[18] = 2114;
                  *(_QWORD *)&buf[20] = v48;
                  *(_WORD *)&buf[28] = 1024;
                  *(_DWORD *)&buf[30] = v49;
                  *(_WORD *)&buf[34] = 1024;
                  *(_DWORD *)&buf[36] = v62 == 0;
                  LOWORD(v89[0]) = 2114;
                  *(id *)((char *)v89 + 2) = v50;
                  _os_log_error_impl(&dword_1D5522000, v38, OS_LOG_TYPE_ERROR, "%p: [%u] Skip data source update for section: %{public}@, cleanSnapshot: %{BOOL}d, snapshotWasEmpty: %{BOOL}d, change: %{public}@", buf, 0x32u);

                }
                objc_msgSend(*(id *)(a1 + 48), "messageListDataSourceDidSkipUpdate:section:change:", *(_QWORD *)(a1 + 32), v5, v68);
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 32), "delegate");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "messageListDataSource:shouldSuspendUpdatesAfterChange:", *(_QWORD *)(a1 + 32), v68);

                if (v40)
                  objc_msgSend(*(id *)(a1 + 32), "suspendUpdates");
                if ((v63 & 1) != 0)
                {
                  objc_msgSend(*(id *)(a1 + 32), "provider");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = objc_msgSend(v41, "messageListDataSource:shouldAnimateNextUpdateInSectionDataSource:change:", *(_QWORD *)(a1 + 32), v5, v68);

                }
                else
                {
                  v63 = 0;
                }
                objc_msgSend(*(id *)(a1 + 48), "messageListDataSource:willUpdateWithChange:section:animated:cleanSnapshot:", *(_QWORD *)(a1 + 32), v68, v5, v63, objc_msgSend(v4, "cleanSnapshot"));
                objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v5, v68);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "addObject:", v42);

              }
            }
          }
          else
          {
            +[MessageListDataSource log](MessageListDataSource, "log");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = *(_QWORD *)(a1 + 32);
              v29 = atomic_load((unsigned int *)(a1 + 64));
              objc_msgSend(v68, "ef_publicDescription");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "section");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              *(_QWORD *)&buf[4] = v28;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v29;
              *(_WORD *)&buf[18] = 2114;
              *(_QWORD *)&buf[20] = v30;
              *(_WORD *)&buf[28] = 2114;
              *(_QWORD *)&buf[30] = v31;
              _os_log_impl(&dword_1D5522000, v27, OS_LOG_TYPE_DEFAULT, "%p: [%u] Skip data source update (%{public}@) - %{public}@ is not visible", buf, 0x26u);

            }
            objc_msgSend(v5, "stopObserving");
          }

        }
        else
        {
          +[MessageListDataSource log](MessageListDataSource, "log");
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            v32 = v69;
            v33 = *(_QWORD *)(a1 + 32);
            v34 = atomic_load((unsigned int *)(a1 + 64));
            objc_msgSend(v32, "section");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            *(_QWORD *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v34;
            *(_WORD *)&buf[18] = 2114;
            *(_QWORD *)&buf[20] = v35;
            *(_WORD *)&buf[28] = 2048;
            *(_QWORD *)&buf[30] = v5;
            _os_log_error_impl(&dword_1D5522000, v8, OS_LOG_TYPE_ERROR, "%p: [%u] Skip data source update - %{public}@ is stale: %p", buf, 0x26u);

          }
          v9 = *(void **)(a1 + 48);
          v10 = *(_QWORD *)(a1 + 32);
          +[MessageListSectionDataSourceChange stale](_TtC6MailUI34MessageListSectionDataSourceChange, "stale");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "messageListDataSourceDidSkipUpdate:section:change:", v10, v5, v11);
        }

      }
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
    }
    while (v66);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__MessageListDataSource__performDataSourceUpdates___block_invoke_49;
  aBlock[3] = &unk_1E99E17C0;
  v51 = a1;
  v52 = *(_QWORD *)(a1 + 32);
  v77 = *(_QWORD *)(a1 + 56);
  aBlock[4] = v52;
  v53 = v61;
  v74 = v53;
  v54 = atomic_load((unsigned int *)(a1 + 64));
  v78 = v54;
  v79 = v63 & 1;
  v75 = *(id *)(v51 + 48);
  v76 = *(id *)(v51 + 40);
  v55 = _Block_copy(aBlock);
  if (objc_msgSend(*(id *)(v51 + 40), "ef_any:", &__block_literal_global_53))
    v56 = 0;
  else
    v56 = v55;
  v57 = _Block_copy(v56);
  if ((v63 & 1) != 0)
    objc_msgSend(v60, "applySnapshot:animatingDifferences:completion:", v67, 1, v57);
  else
    objc_msgSend(v60, "applySnapshotUsingReloadData:completion:", v67, v57);
  if (!v57)
  {
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __51__MessageListDataSource__performDataSourceUpdates___block_invoke_2_54;
    v71[3] = &unk_1E99E1808;
    v72 = v55;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "performBlock:", v71);

  }
}

uint64_t __51__MessageListDataSource__performDataSourceUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "animated");
}

void __51__MessageListDataSource__performDataSourceUpdates___block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  unsigned int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MessageListDataSource log](MessageListDataSource, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = atomic_load((unsigned int *)(a1 + 56));
    *(_DWORD *)buf = 134218754;
    v23 = v5;
    v24 = 1024;
    v25 = v6;
    v26 = 2048;
    v27 = objc_msgSend(v3, "count");
    v28 = 2114;
    v29 = v3;
    _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_DEFAULT, "%p: [%u] Clearing %lu other sections: %{public}@", buf, 0x26u);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(a1 + 40);
        -[MessageListDataSource _objectIDForSection:](*(id *)(a1 + 32), *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "itemIdentifiersInSectionWithIdentifier:", v13, (_QWORD)v17);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        objc_msgSend(*(id *)(a1 + 40), "deleteItemsWithIdentifiers:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "removeAllObjects");
}

void __51__MessageListDataSource__performDataSourceUpdates___block_invoke_49(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  unsigned int v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  unsigned int v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  _BYTE v66[14];
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("MessageListDataSource.m"), 898, CFSTR("Current thread must be main"));

  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = *(id *)(a1 + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
  v49 = a1;
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v55;
    *(_QWORD *)&v3 = 134218754;
    v42 = v3;
    v46 = *(_QWORD *)v55;
    do
    {
      v6 = 0;
      v47 = v4;
      do
      {
        if (*(_QWORD *)v55 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v6);
        objc_msgSend(v7, "first", v42);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v8, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListDataSource _dataSourceForObjectID:](v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        +[MessageListDataSource log](MessageListDataSource, "log");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11 == v8)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v44 = *(_QWORD *)(a1 + 32);
            v17 = atomic_load((unsigned int *)(a1 + 72));
            v43 = v17;
            objc_msgSend(v7, "second");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "ef_publicDescription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = *(unsigned __int8 *)(a1 + 76);
            objc_msgSend(v7, "first");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "first");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "messageList");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134219266;
            v60 = v44;
            v61 = 1024;
            v62 = v43;
            v63 = 2114;
            v64 = v18;
            v65 = 1024;
            *(_DWORD *)v66 = v19;
            *(_WORD *)&v66[4] = 2114;
            *(_QWORD *)&v66[6] = v20;
            v67 = 2114;
            v68 = v22;
            _os_log_impl(&dword_1D5522000, v13, OS_LOG_TYPE_DEFAULT, "%p: [%u] dataSource update completion: %{public}@ (animated=%{BOOL}d) to section datasource: %{public}@ with message list: %{public}@", buf, 0x36u);

            a1 = v49;
          }

          v23 = *(void **)(a1 + 48);
          v24 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v7, "second");
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "first");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "messageListDataSource:didUpdateWithChange:section:animated:", v24, v13, v25, *(unsigned __int8 *)(v49 + 76));

          a1 = v49;
          v5 = v46;
          v4 = v47;
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v14 = *(_QWORD *)(a1 + 32);
          v15 = atomic_load((unsigned int *)(a1 + 72));
          objc_msgSend(v11, "section");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v42;
          v60 = v14;
          v61 = 1024;
          v62 = v15;
          v5 = v46;
          v4 = v47;
          v63 = 2114;
          v64 = v16;
          v65 = 2048;
          *(_QWORD *)v66 = v8;
          _os_log_error_impl(&dword_1D5522000, v13, OS_LOG_TYPE_ERROR, "%p: [%u] Skip data source completion - %{public}@ is stale: %p", buf, 0x26u);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
    }
    while (v4);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v26 = *(id *)(a1 + 56);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v31, "sectionDataSource");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *(void **)(a1 + 32);
        objc_msgSend(v32, "objectID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[MessageListDataSource _dataSourceForObjectID:](v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35 == v32)
        {
          objc_msgSend(v31, "completionHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v40)
            goto LABEL_27;
          objc_msgSend(v31, "completionHandler");
          v36 = objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(v36 + 16))();
        }
        else
        {
          +[MessageListDataSource log](MessageListDataSource, "log");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            v37 = *(_QWORD *)(v49 + 32);
            v38 = atomic_load((unsigned int *)(v49 + 72));
            objc_msgSend(v35, "section");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218754;
            v60 = v37;
            a1 = v49;
            v61 = 1024;
            v62 = v38;
            v63 = 2114;
            v64 = v39;
            v65 = 2048;
            *(_QWORD *)v66 = v32;
            _os_log_error_impl(&dword_1D5522000, (os_log_t)v36, OS_LOG_TYPE_ERROR, "%p: [%u] Skip update completion handler - %{public}@ is stale: %p", buf, 0x26u);

          }
        }

LABEL_27:
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v28);
  }

}

uint64_t __51__MessageListDataSource__performDataSourceUpdates___block_invoke_52(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "immediateCompletion");
}

uint64_t __51__MessageListDataSource__performDataSourceUpdates___block_invoke_2_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)messageListSectionDataSource:(id)a3 itemIdentifiersForIndexPaths:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  -[MessageListDataSource dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__MessageListDataSource_messageListSectionDataSource_itemIdentifiersForIndexPaths___block_invoke;
  v10[3] = &unk_1E99E1730;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "ef_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __83__MessageListDataSource_messageListSectionDataSource_itemIdentifiersForIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "itemIdentifierForIndexPath:", a2);
}

- (id)messageListSectionDataSource:(id)a3 itemIdentifierForIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[MessageListDataSource dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)messageListSectionDataSource:(id)a3 indexPathForItemIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[MessageListDataSource dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)messageListSectionDataSource:(id)a3 indexPathsForItemIdentifiers:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  -[MessageListDataSource dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__MessageListDataSource_messageListSectionDataSource_indexPathsForItemIdentifiers___block_invoke;
  v10[3] = &unk_1E99E1570;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "ef_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __83__MessageListDataSource_messageListSectionDataSource_indexPathsForItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexPathForItemIdentifier:", a2);
}

- (BOOL)shouldReloadMessageListSectionDataSource:(id)a3
{
  void *v4;

  objc_msgSend(a3, "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[MessageListDataSource messageListSectionIsVisible:](self, "messageListSectionIsVisible:", v4);

  return (char)self;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (void)setVisibleSections:(id)a3
{
  objc_storeStrong((id *)&self->_visibleSections, a3);
}

- (void)setObjectIdentifiersForSection:(id)a3
{
  objc_storeStrong((id *)&self->_objectIdentifiersForSection, a3);
}

- (void)setDataSourcesForObjectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourcesForObjectIdentifier, a3);
}

- (BOOL)hasAdditionalSections
{
  return self->_hasAdditionalSections;
}

- (void)setHasAdditionalSections:(BOOL)a3
{
  self->_hasAdditionalSections = a3;
}

- (EFLocked)pendingSectionsToClear
{
  return self->_pendingSectionsToClear;
}

- (void)setPendingSectionsToClear:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSectionsToClear, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSectionsToClear, 0);
  objc_storeStrong((id *)&self->_dataSourcesForObjectIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifiersForSection, 0);
  objc_storeStrong((id *)&self->_visibleSections, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_provider);
}

- (void)messageListItemAtIndexPath:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D5522000, log, OS_LOG_TYPE_ERROR, "%p: No EMCollectionItemID found at index path: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
