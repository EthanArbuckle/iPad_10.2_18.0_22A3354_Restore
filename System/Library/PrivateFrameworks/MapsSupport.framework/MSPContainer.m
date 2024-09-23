@implementation MSPContainer

- (MSPQuerySource)entireContentsQuerySource
{
  id v3;

  objc_getAssociatedObject(self, (const void *)entireContentsQuerySource_key);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[MSPQuerySource _initWithOwningContainer:]([MSPQuerySource alloc], "_initWithOwningContainer:", self);
    objc_setAssociatedObject(self, (const void *)entireContentsQuerySource_key, v3, (void *)0x301);
  }
  return (MSPQuerySource *)v3;
}

+ (void)mutableObjectContentDidUpdate:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("MSPMutableObjectContentDidUpdateNotification"), v4);

}

+ (void)_disableLogging
{
  _MSPShouldLog = 1;
}

+ (void)_preventAssertionsForDuplicateStorageIdentifiersInContainersCreatedPerfomingBlock:(id)a3
{
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3978];
    v4 = (void (**)(_QWORD))a3;
    objc_msgSend(v3, "currentThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadDictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("com.apple.Maps.MSPContainerPreventAssertionsForDuplicateStorageIdentifiers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("com.apple.Maps.MSPContainerPreventAssertionsForDuplicateStorageIdentifiers"));
    v4[2](v4);

    if (v6)
      objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("com.apple.Maps.MSPContainerPreventAssertionsForDuplicateStorageIdentifiers"));
    else
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("com.apple.Maps.MSPContainerPreventAssertionsForDuplicateStorageIdentifiers"));

  }
}

+ (void)clearDiscardableDataFromAllContainers
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MSPContainerClearDiscardableData"), objc_opt_class());

}

+ (BOOL)_deletes:(unint64_t)a3 mayRepresentDataLossIfAppliedTo:(unint64_t)a4
{
  return a3 >= 3 && (double)a4 / (double)a3 > 0.33;
}

- (MSPContainer)init
{
  MSPContainer *result;

  result = (MSPContainer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (MSPContainer)initWithPersister:(id)a3
{
  id v5;
  MSPContainer *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSHashTable *observers;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *accessQueue;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MSPContainer;
  v6 = -[MSPContainer init](&v25, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "threadDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("com.apple.Maps.MSPContainerPreventAssertionsForDuplicateStorageIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_preventsAssertionsForDuplicateStorageIdentifiers = objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Maps.MSPContainerAccessQueue-%p"), v6);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v6->_persister, a3);
    objc_msgSend(v5, "setDelegate:", v6);
    objc_opt_class();
    _MSPLogForContainer(v6, CFSTR("Created with persister %p (%@)"), v17, v18, v19, v20, v21, v22, (uint64_t)v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v6, sel__clearObjectCacheIfNeeded, CFSTR("MSPContainerClearDiscardableData"), objc_opt_class());

    -[MSPContainer _performInitialLoadNotifyingObservers:kickOffSynchronously:completion:](v6, "_performInitialLoadNotifyingObservers:kickOffSynchronously:completion:", 0, 1, 0);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MSPContainerClearDiscardableData"), objc_opt_class());

  v4.receiver = self;
  v4.super_class = (Class)MSPContainer;
  -[MSPContainer dealloc](&v4, sel_dealloc);
}

- (void)accessContentsUsingConcurrentBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MSPContainer_accessContentsUsingConcurrentBlock___block_invoke;
  v7[3] = &unk_1E6654000;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__MSPContainer_accessContentsUsingConcurrentBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 3))
    {
      v10 = *(_QWORD *)(a1 + 40);
      if (v10)
        (*(void (**)(void))(v10 + 16))();
    }
    else
    {
      _MSPLogForContainer(*(void **)(a1 + 32), CFSTR("An access attempt occurred, but objects are not loaded (memory pressure?). Perform an initial load and postpone the access."), v3, v4, v5, v6, v7, v8, v13[0]);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = (uint64_t)__51__MSPContainer_accessContentsUsingConcurrentBlock___block_invoke_37;
      v13[3] = (uint64_t)&unk_1E6653E38;
      v12 = *(void **)(a1 + 40);
      v14 = *(id *)(a1 + 32);
      v15 = v12;
      objc_msgSend(v14, "_performInitialLoadNotifyingObservers:kickOffSynchronously:completion:", 0, 0, v13);

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[MSPContainer accessContentsUsingConcurrentBlock:]_block_invoke";
      v18 = 1024;
      v19 = 175;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

uint64_t __51__MSPContainer_accessContentsUsingConcurrentBlock___block_invoke_37(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessContentsUsingConcurrentBlock:", *(_QWORD *)(a1 + 40));
}

- (BOOL)containerHasLoadedContents
{
  MSPContainer *v2;
  BOOL hasLoadedContents;

  v2 = self;
  objc_sync_enter(v2);
  hasLoadedContents = v2->_hasLoadedContents;
  objc_sync_exit(v2);

  return hasLoadedContents;
}

- (void)accessStateSnapshotUsingConcurrentBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MSPContainer_accessStateSnapshotUsingConcurrentBlock___block_invoke;
  v7[3] = &unk_1E6654000;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__MSPContainer_accessStateSnapshotUsingConcurrentBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_QWORD *)WeakRetained + 2))
    {
      v10 = *(_QWORD *)(a1 + 40);
      if (v10)
        (*(void (**)(void))(v10 + 16))();
    }
    else
    {
      _MSPLogForContainer(*(void **)(a1 + 32), CFSTR("An access attempt occurred, but the state snapshot isn't loaded (memory pressure?). Perform an initial load and postpone the access."), v3, v4, v5, v6, v7, v8, v13[0]);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = (uint64_t)__56__MSPContainer_accessStateSnapshotUsingConcurrentBlock___block_invoke_41;
      v13[3] = (uint64_t)&unk_1E6653E38;
      v12 = *(void **)(a1 + 40);
      v14 = *(id *)(a1 + 32);
      v15 = v12;
      objc_msgSend(v14, "_performInitialLoadNotifyingObservers:kickOffSynchronously:completion:", 0, 0, v13);

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[MSPContainer accessStateSnapshotUsingConcurrentBlock:]_block_invoke";
      v18 = 1024;
      v19 = 199;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

uint64_t __56__MSPContainer_accessStateSnapshotUsingConcurrentBlock___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessStateSnapshotUsingConcurrentBlock:", *(_QWORD *)(a1 + 40));
}

- (void)_clearObjectCacheIfNeeded
{
  NSObject *accessQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__MSPContainer__clearObjectCacheIfNeeded__block_invoke;
  v4[3] = &unk_1E66520A0;
  objc_copyWeak(&v5, &location);
  dispatch_barrier_async(accessQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__MSPContainer__clearObjectCacheIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    v4 = (void *)v2[3];
    v2[3] = 0;

  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[MSPContainer _clearObjectCacheIfNeeded]_block_invoke";
      v8 = 1024;
      v9 = 216;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v6, 0x12u);
    }

  }
}

- (void)_performInitialLoadNotifyingObservers:(BOOL)a3 kickOffSynchronously:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;
  id location;

  v5 = a4;
  v8 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke;
  v12[3] = &unk_1E6653F10;
  objc_copyWeak(&v14, &location);
  v12[4] = self;
  v15 = a3;
  v9 = v8;
  v13 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x1B5E2B4E8](v12);
  v11 = v10;
  if (v5)
    v10[2](v10);
  else
    dispatch_barrier_async((dispatch_queue_t)self->_accessQueue, v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke(uint64_t a1)
{
  id *v2;
  dispatch_object_t *WeakRetained;
  dispatch_object_t *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_object_t v13;
  id v14;
  NSObject *v15;
  _QWORD v16[6];
  id v17;
  id v18;
  char v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (uint64_t)WeakRetained[5];
    objc_opt_class();
    _MSPLogForContainer(v5, CFSTR("Starting initial load from persister %p (%@)"), v7, v8, v9, v10, v11, v12, v6);
    dispatch_suspend(v4[1]);
    v13 = v4[5];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_44;
    v16[3] = &unk_1E6653EE8;
    objc_copyWeak(&v18, v2);
    v19 = *(_BYTE *)(a1 + 56);
    v16[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    v16[5] = v4;
    v17 = v14;
    -[NSObject fetchStateSnapshotWithCompletion:](v13, "fetchStateSnapshotWithCompletion:", v16);

    objc_destroyWeak(&v18);
  }
  else
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[MSPContainer _performInitialLoadNotifyingObservers:kickOffSynchronously:completion:]_block_invoke";
      v22 = 1024;
      v23 = 226;
      _os_log_impl(&dword_1B39C0000, v15, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_44(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v5;
  uint64_t v6;
  id *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id *v30;
  id *from;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  _QWORD block[6];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  from = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v30 = WeakRetained;
  if (WeakRetained)
  {
    v32 = a1;
    objc_storeStrong(WeakRetained + 2, a2);
    objc_msgSend(v29, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_processedContentsForPersisterContents:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v30;
    v8 = v30[3];
    v30[3] = (id)v6;

    if (*(_BYTE *)(v32 + 64))
    {
      v9 = v30[4];
      objc_sync_enter(v9);
      objc_msgSend(v30[4], "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_exit(v9);

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v38 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              if ((objc_opt_respondsToSelector() & 1) == 0
                || (objc_msgSend(v15, "observationQueueForContainer:", *(_QWORD *)(v32 + 32)),
                    v16 = objc_claimAutoreleasedReturnValue(),
                    (v17 = v16) == 0))
              {
                v16 = 0;
                v17 = v30[1];
              }
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_49;
              block[3] = &unk_1E6653E98;
              objc_copyWeak(&v36, from);
              block[4] = *(_QWORD *)(v32 + 32);
              block[5] = v15;
              dispatch_async(v17, block);
              objc_destroyWeak(&v36);

            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v12);
      }

      v7 = v30;
    }
    v18 = v7;
    objc_sync_enter(v18);
    *((_BYTE *)v18 + 105) = 1;
    objc_sync_exit(v18);

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_54;
    v33[3] = &unk_1E6653EC0;
    objc_copyWeak(&v34, from);
    objc_msgSend(v18, "_forEachObserver:", v33);
    v19 = *(_QWORD *)(v32 + 48);
    if (v19)
      (*(void (**)(void))(v19 + 16))();
    v20 = *(void **)(v32 + 32);
    v21 = *(_QWORD *)(*(_QWORD *)(v32 + 40) + 40);
    objc_opt_class();
    _MSPLogForContainer(v20, CFSTR("Loaded from persister %p (%@) + resuming service on access queue -- snapshot: %@"), v22, v23, v24, v25, v26, v27, v21);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(v32 + 40) + 8));
    objc_destroyWeak(&v34);
  }
  else
  {
    GEOFindOrCreateLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[MSPContainer _performInitialLoadNotifyingObservers:kickOffSynchronously:completion:]_block_invoke";
      v44 = 1024;
      v45 = 231;
      _os_log_impl(&dword_1B39C0000, v28, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }

  }
}

void __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_49(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *WeakRetained;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    _MSPLogForContainer(*(void **)(a1 + 32), CFSTR("Notifying observer %@ of full refetch."), v2, v3, v4, v5, v6, v7, *(_QWORD *)(a1 + 40));
    v9 = *(void **)(a1 + 40);
    v10 = WeakRetained[3];
    +[_MSPContainerEditReplacedEntirely sharedInstance](_MSPContainerEditReplacedEntirely, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "container:didEditWithNewContents:orderedEdits:cause:context:", WeakRetained, v10, v12, 1, 0);

  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[MSPContainer _performInitialLoadNotifyingObservers:kickOffSynchronously:completion:]_block_invoke";
      v16 = 1024;
      v17 = 248;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", buf, 0x12u);
    }
  }

}

void __86__MSPContainer__performInitialLoadNotifyingObservers_kickOffSynchronously_completion___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "containerDidLoadFromPersister:", WeakRetained);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[MSPContainer _performInitialLoadNotifyingObservers:kickOffSynchronously:completion:]_block_invoke";
      v8 = 1024;
      v9 = 261;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", (uint8_t *)&v6, 0x12u);
    }

  }
}

- (id)_processedContentsForPersisterContents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t j;
  id v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    return MEMORY[0x1E0C9AA60];
  v5 = v4;
  v6 = (void *)objc_msgSend(v4, "copy");

  -[MSPContainer _objectsWithDuplicateStorageIdentifiersFromArray:](self, "_objectsWithDuplicateStorageIdentifiersFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") && !-[MSPContainerPersister duplicatesPolicy](self->_persister, "duplicatesPolicy"))
  {
    v23 = v6;
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v24 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v26;
            v19 = 1;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v26 != v18)
                  objc_enumerationMutation(v15);
                if ((v19 & 1) == 0)
                  objc_msgSend(v8, "removeObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
                v19 = 0;
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              v19 = 0;
            }
            while (v17);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v11);
    }

    v6 = (void *)objc_msgSend(v8, "copy");
    v7 = v24;
  }
  v21 = v6;

  return v21;
}

- (id)_objectsWithDuplicateStorageIdentifiersFromArray:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "storageIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "count");
  if (v13 == objc_msgSend(v12, "count"))
  {
    v14 = 0;
  }
  else
  {
    v31 = v12;
    v32 = v11;
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v15 = v5;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v20, "storageIdentifier", v31);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v21);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, v21);
          }
          objc_msgSend(v22, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v17);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = v32;
    v23 = v32;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
          objc_msgSend(v14, "objectForKeyedSubscript:", v28, v31);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v29, "count") <= 1)
            objc_msgSend(v14, "removeObjectForKey:", v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v25);
    }

    v12 = v31;
  }

  return v14;
}

- (void)persisterContentsDidChangeExternally:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_opt_class();
  _MSPLogForContainer(self, CFSTR("Contents changed externally from persister %p (%@) -- enqueuing a full refetch"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);

  -[MSPContainer _performInitialLoadNotifyingObservers:kickOffSynchronously:completion:](self, "_performInitialLoadNotifyingObservers:kickOffSynchronously:completion:", 1, 0, 0);
}

- (OS_dispatch_queue)_accessQueue
{
  return self->_accessQueue;
}

- (void)editContentsUsingBarrierBlock:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  -[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:](self, "editContentsUsingBarrierBlock:context:completionQueue:completion:", a3, 0, a4, a5);
}

- (void)editByMergingStateSnapshot:(id)a3 mergeOptions:(id)a4 context:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *accessQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  MSPContainer *v27;
  id v28;
  id v29;
  id v30;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke;
  v23[3] = &unk_1E6653F60;
  objc_copyWeak(&v30, &location);
  v24 = v12;
  v25 = v13;
  v26 = v15;
  v27 = self;
  v28 = v14;
  v29 = v16;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v13;
  v22 = v12;
  dispatch_barrier_async(accessQueue, v23);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(*((dispatch_object_t *)WeakRetained + 1));
    v5 = (void *)v4[5];
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_67;
    v12[3] = &unk_1E6653F38;
    objc_copyWeak(&v17, v2);
    v16 = *(id *)(a1 + 72);
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(void **)(a1 + 64);
    v13 = v8;
    v14 = v9;
    v15 = v10;
    objc_msgSend(v5, "commitByMergingWithStateSnapshot:mergeOptions:completion:", v6, v7, v12);

    objc_destroyWeak(&v17);
  }
  else
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[MSPContainer editByMergingStateSnapshot:mergeOptions:context:completionQueue:completion:]_block_invoke";
      v20 = 1024;
      v21 = 393;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_67(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  NSObject **WeakRetained;
  dispatch_object_t *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  dispatch_object_t v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  void (**v49)(_QWORD, _QWORD);
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  NSObject **v55;
  void *v56;
  _QWORD v57[4];
  void (**v58)(_QWORD, _QWORD);
  _QWORD v59[6];
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD block[4];
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  int v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v52 = a2;
  v54 = a3;
  v8 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  v10 = WeakRetained;
  v53 = v8;
  if (WeakRetained)
  {
    if (v8)
    {
      v11 = *(void **)(a1 + 56);
      if (!v11)
      {
LABEL_58:
        dispatch_resume(v10[1]);
        goto LABEL_59;
      }
      v12 = *(NSObject **)(a1 + 32);
      if (!v12)
        v12 = WeakRetained[1];
      v55 = WeakRetained;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_68;
      block[3] = &unk_1E6653330;
      v68 = v11;
      v67 = v53;
      dispatch_async(v12, block);

      v13 = v68;
    }
    else
    {
      v55 = WeakRetained;
      if (v54 && (v15 = objc_opt_new()) != 0)
      {
        v51 = (void *)v15;
        v16 = v10[3];
        if (v16)
        {
          v17 = v16;
          v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v19 = v17;
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v69, buf, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v70;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v70 != v21)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "storageIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                  objc_msgSend(v18, "addObject:", v23);

              }
              v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v69, buf, 16);
            }
            while (v20);
          }

          v24 = (void *)objc_msgSend(v18, "copy");
          objc_msgSend(v51, "addObjectsFromArray:", v24);

        }
        v25 = 0;
      }
      else
      {
        v51 = 0;
        v25 = 1;
      }
      v26 = *(void **)(a1 + 40);
      objc_msgSend(v52, "contents");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_processedContentsForPersisterContents:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(v28, "copy");

      objc_storeStrong((id *)v55 + 2, a2);
      v29 = (id *)(v55 + 3);
      objc_storeStrong((id *)v55 + 3, v56);
      if ((v25 & 1) == 0 && *v29)
      {
        v30 = *v29;
        v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v32 = v30;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v69, buf, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v70;
          do
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v70 != v34)
                objc_enumerationMutation(v32);
              objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "storageIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (v36)
                objc_msgSend(v31, "addObject:", v36);

            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v69, buf, 16);
          }
          while (v33);
        }

        v37 = (void *)objc_msgSend(v31, "copy");
        objc_msgSend(v51, "addObjectsFromArray:", v37);

      }
      if (!v54
        || (v38 = objc_msgSend(v51, "count"), objc_msgSend(v51, "minusSet:", v54), objc_msgSend(v51, "count") != v38))
      {
        v39 = v55[4];
        objc_sync_enter(v39);
        -[NSObject allObjects](v55[4], "allObjects");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_exit(v39);

        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v41 = v40;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
        if (v42)
        {
          v43 = *(_QWORD *)v63;
          do
          {
            for (k = 0; k != v42; ++k)
            {
              if (*(_QWORD *)v63 != v43)
                objc_enumerationMutation(v41);
              v45 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                if ((objc_opt_respondsToSelector() & 1) == 0
                  || (objc_msgSend(v45, "observationQueueForContainer:", *(_QWORD *)(a1 + 40)),
                      v46 = objc_claimAutoreleasedReturnValue(),
                      (v47 = v46) == 0))
                {
                  v46 = 0;
                  v47 = v55[1];
                }
                v59[0] = MEMORY[0x1E0C809B0];
                v59[1] = 3221225472;
                v59[2] = __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_4;
                v59[3] = &unk_1E6651CA8;
                v48 = *(_QWORD *)(a1 + 40);
                v59[4] = v45;
                v59[5] = v48;
                v60 = v56;
                v61 = *(id *)(a1 + 48);
                dispatch_async(v47, v59);

              }
            }
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
          }
          while (v42);
        }

      }
      v49 = *(void (***)(_QWORD, _QWORD))(a1 + 56);
      if (v49)
      {
        v50 = *(NSObject **)(a1 + 32);
        if (v50)
        {
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_5;
          v57[3] = &unk_1E6653508;
          v58 = v49;
          dispatch_async(v50, v57);

        }
        else
        {
          v49[2](v49, 0);
        }
      }

      v13 = v51;
    }

    v10 = v55;
    goto LABEL_58;
  }
  GEOFindOrCreateLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v75 = "-[MSPContainer editByMergingStateSnapshot:mergeOptions:context:completionQueue:completion:]_block_invoke";
    v76 = 1024;
    v77 = 398;
    _os_log_impl(&dword_1B39C0000, v14, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
  }

LABEL_59:
}

uint64_t __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  +[_MSPContainerEditReplacedEntirely sharedInstance](_MSPContainerEditReplacedEntirely, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "container:didEditWithNewContents:orderedEdits:cause:context:", v3, v4, v6, 0, a1[7]);

}

uint64_t __91__MSPContainer_editByMergingStateSnapshot_mergeOptions_context_completionQueue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)eraseWithCompletionQueue:(id)a3 completion:(id)a4
{
  -[MSPContainer eraseFromStorageTypes:withCompletionQueue:completion:](self, "eraseFromStorageTypes:withCompletionQueue:completion:", 0, a3, a4);
}

- (void)eraseFromStorageTypes:(unint64_t)a3 withCompletionQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  id v28[2];
  _QWORD v29[4];
  id v30;
  id v31;
  id v32[2];
  id location;
  _QWORD v34[6];

  v8 = a4;
  v9 = a5;
  if (a3 <= 1)
    v10 = 1;
  else
    v10 = a3;
  v11 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke;
  v34[3] = &unk_1E6653F88;
  v34[4] = self;
  v34[5] = v10;
  -[MSPContainer _forEachObserver:](self, "_forEachObserver:", v34);
  objc_initWeak(&location, self);
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2;
  v29[3] = &unk_1E6653FB0;
  objc_copyWeak(v32, &location);
  v32[1] = (id)v10;
  v12 = v9;
  v31 = v12;
  v13 = v8;
  v30 = v13;
  v14 = (void *)MEMORY[0x1B5E2B4E8](v29);
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_3;
  v26[3] = &unk_1E6654028;
  objc_copyWeak(v28, &location);
  v28[1] = (id)v10;
  v15 = v14;
  v26[4] = self;
  v27 = v15;
  v16 = MEMORY[0x1B5E2B4E8](v26);
  v23 = (void *)v16;
  if ((v10 & 2) != 0)
  {
    _MSPLogForContainer(self, CFSTR("Erasing container contents"), v17, v18, v19, v20, v21, v22, v24[0]);
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = (uint64_t)__69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_3_93;
    v24[3] = (uint64_t)&unk_1E66535A8;
    v25 = v15;
    -[MSPContainer editContentsUsingBarrierBlock:completionQueue:completion:](self, "editContentsUsingBarrierBlock:completionQueue:completion:", &__block_literal_global_92_0, 0, v24);

  }
  else
  {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
  }

  objc_destroyWeak(v28);
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "containerWillEraseContents:", *(_QWORD *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "containerWillEraseContents:fromStorageTypes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  dispatch_object_t *WeakRetained;
  dispatch_object_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[6];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_77;
    v16[3] = &unk_1E6653F88;
    v9 = *(_QWORD *)(a1 + 56);
    v16[4] = WeakRetained;
    v16[5] = v9;
    -[dispatch_object_t _forEachObserver:](WeakRetained, "_forEachObserver:", v16);
    v10 = *(void **)(a1 + 40);
    if (v10)
    {
      v11 = *(NSObject **)(a1 + 32);
      if (!v11)
        v11 = v7[1];
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2_80;
      v13[3] = &unk_1E6653330;
      v15 = v10;
      v14 = v5;
      dispatch_async(v11, v13);

    }
    if (a3)
      dispatch_resume(v7[1]);
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[MSPContainer eraseFromStorageTypes:withCompletionQueue:completion:]_block_invoke_2";
      v19 = 1024;
      v20 = 497;
      _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "containerDidEraseContents:fromStorageTypes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2_80(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_3(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *WeakRetained;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    {
      _MSPLogForContainer(*(void **)(a1 + 32), CFSTR("Will erase persister contents"), v3, v4, v5, v6, v7, v8, v12);
      v11 = WeakRetained[1];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_84;
      block[3] = &unk_1E6654000;
      block[4] = WeakRetained;
      objc_copyWeak(&v15, v2);
      v14 = *(id *)(a1 + 40);
      dispatch_barrier_async(v11, block);

      objc_destroyWeak(&v15);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[MSPContainer eraseFromStorageTypes:withCompletionQueue:completion:]_block_invoke_3";
      v18 = 1024;
      v19 = 517;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_84(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2_85;
  v3[3] = &unk_1E6653FD8;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "eraseWithCompletion:", v3);

  objc_destroyWeak(&v5);
}

void __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2_85(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_86;
      v6[3] = &unk_1E6653508;
      v7 = *(id *)(a1 + 32);
      objc_msgSend(WeakRetained, "_performInitialLoadNotifyingObservers:kickOffSynchronously:completion:", 1, 1, v6);

    }
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[MSPContainer eraseFromStorageTypes:withCompletionQueue:completion:]_block_invoke_2";
      v10 = 1024;
      v11 = 529;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }

  }
}

uint64_t __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_2_90(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setArray:", MEMORY[0x1E0C9AA60]);
}

uint64_t __69__MSPContainer_eraseFromStorageTypes_withCompletionQueue_completion___block_invoke_3_93(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)editContentsUsingBarrierBlock:(id)a3 context:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[4];
  id v30;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(a4, "copy");
  v14 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke;
  v29[3] = &unk_1E6654090;
  v15 = v10;
  v30 = v15;
  if (-[MSPContainer _checkAndAddCoalescedEditForContext:identifiers:enqueuedBlock:completionQueue:completion:](self, "_checkAndAddCoalescedEditForContext:identifiers:enqueuedBlock:completionQueue:completion:", v13, 0, v29, v11, v12))
  {
    _MSPLogForContainer(self, CFSTR("Coalescing is on for this context -- the edit for context %@, will be enqueued for later."), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
  }
  else
  {
    objc_initWeak(&location, self);
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2;
    v22[3] = &unk_1E6654180;
    objc_copyWeak(&v27, &location);
    v25 = v15;
    v22[4] = self;
    v23 = v13;
    v26 = v12;
    v24 = v11;
    -[MSPContainer accessContentsUsingConcurrentBlock:](self, "accessContentsUsingConcurrentBlock:", v22);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

}

uint64_t __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 72));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_97;
    block[3] = &unk_1E6654158;
    objc_copyWeak(&v18, (id *)(a1 + 72));
    v12 = v3;
    v7 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v16 = v7;
    v13 = v8;
    v14 = v9;
    v17 = *(id *)(a1 + 64);
    v15 = *(id *)(a1 + 48);
    dispatch_barrier_async(v6, block);

    objc_destroyWeak(&v18);
  }
  else
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:]_block_invoke_2";
      v21 = 1024;
      v22 = 579;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_97(uint64_t a1)
{
  dispatch_object_t *WeakRetained;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (**v50)(_QWORD, _QWORD, _QWORD);
  uint64_t v51;
  uint64_t v52;
  id *from;
  dispatch_object_t *v54;
  _MSPContainerEditsRecorder *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  void (**v60)(_QWORD, _QWORD, _QWORD);
  id v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  id v66;
  dispatch_object_t *v67;
  id v68;
  id v69;
  _QWORD v70[5];
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  const __CFString *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  _BYTE buf[24];
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  from = (id *)(a1 + 80);
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 80));
  v54 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(WeakRetained[1]);
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v77 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          v10 = (void *)objc_msgSend(v9, "mutableCopy");
          objc_msgSend(v3, "addObject:", v10);
          objc_msgSend(v4, "setObject:forKey:", v9, v10);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
      }
      while (v6);
    }

    v55 = -[_MSPContainerEditsRecorder initWithMutableArray:]([_MSPContainerEditsRecorder alloc], "initWithMutableArray:", v3);
    v11 = *(_QWORD *)(a1 + 64);
    -[_MSPContainerEditsRecorder recordableMutableArray](v55, "recordableMutableArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    -[_MSPContainerEditsRecorder recordableMutableArray](v55, "recordableMutableArray");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[dispatch_object_t _processNewEditedContents:](v54, "_processNewEditedContents:", v13);

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v15 = v3;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v73;
LABEL_11:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v73 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v18);
        v71 = 0;
        objc_msgSend(v19, "transferToImmutableIfValidWithError:", &v71);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v71;
        v22 = v21;
        if (!v20)
          break;

        objc_msgSend(v14, "addObject:", v20);
        objc_msgSend(v4, "setObject:forKey:", v20, v19);

        if (v16 == ++v18)
        {
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
          if (v16)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      v22 = 0;
    }

    v23 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v85 = __Block_byref_object_copy__6;
    v86 = __Block_byref_object_dispose__6;
    v87 = 0;
    if (!v22)
    {
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_100;
      v70[3] = &unk_1E66540B8;
      v70[4] = buf;
      -[_MSPContainerEditsRecorder useImmutableObjectsForEditsFromMap:intermediateMutableObjectTransferBlock:](v55, "useImmutableObjectsForEditsFromMap:intermediateMutableObjectTransferBlock:", v4, v70);
      v23 = *(void **)(*(_QWORD *)&buf[8] + 40);
    }
    if (objc_msgSend(v23, "count"))
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v82 = CFSTR("MSPUnderlyingErrors");
      v25 = (void *)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "copy");
      v83 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MapsSupport.MSPContainer"), 2, v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v27;
    }
    if (v22)
      v28 = (void *)MEMORY[0x1E0C9AA60];
    else
      v28 = (void *)objc_msgSend(v14, "copy");
    v29 = *(void **)(a1 + 40);
    -[_MSPContainerEditsRecorder orderedEdits](v55, "orderedEdits");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _MSPLogForContainer(v29, CFSTR("Has terminated the run, which caused the following edits: %@ -- final contents %@, transfer error if any %@"), v31, v32, v33, v34, v35, v36, (uint64_t)v30);

    if (!v22)
    {
      -[dispatch_object_t _objectsWithDuplicateStorageIdentifiersFromArray:](v54, "_objectsWithDuplicateStorageIdentifiersFromArray:", v28);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "count"))
      {
        v38 = (void *)MEMORY[0x1E0CB35C8];
        v80 = CFSTR("MSPDuplicateStorageIdentifiersObjects");
        v81 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MapsSupport.MSPContainer"), 3, v39);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v22 = 0;
      }

    }
    -[_MSPContainerEditsRecorder orderedEdits](v55, "orderedEdits");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2_106;
    v62[3] = &unk_1E6654108;
    objc_copyWeak(&v69, from);
    v41 = *(void **)(a1 + 48);
    v62[4] = *(_QWORD *)(a1 + 40);
    v63 = v41;
    v42 = v28;
    v64 = v42;
    v43 = v40;
    v65 = v43;
    v68 = *(id *)(a1 + 72);
    v66 = *(id *)(a1 + 56);
    v67 = v54;
    v50 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E2B4E8](v62);
    if (v22)
    {
      _MSPLogForContainer(*(void **)(a1 + 40), CFSTR("Not committing due to immutable transfer error."), v44, v45, v46, v47, v48, v49, v51);
      ((void (**)(_QWORD, _QWORD, void *))v50)[2](v50, 0, v22);
    }
    else
    {
      v52 = *(_QWORD *)(a1 + 48);
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_3;
      v56[3] = &unk_1E6654130;
      objc_copyWeak(&v61, from);
      v56[4] = *(_QWORD *)(a1 + 40);
      v60 = v50;
      v57 = v42;
      v58 = v43;
      v59 = *(id *)(a1 + 32);
      -[dispatch_object_t _commitEditWithFinalContents:context:completion:](v54, "_commitEditWithFinalContents:context:completion:", v14, v52, v56);

      objc_destroyWeak(&v61);
    }

    objc_destroyWeak(&v69);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    GEOFindOrCreateLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 582;
      _os_log_impl(&dword_1B39C0000, v15, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }

}

id __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_100(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v10;

  v10 = 0;
  objc_msgSend(a2, "transferToImmutableIfValidWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (!v3)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v5, "addObject:", v4);
  }

  return v3;
}

void __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2_106(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *WeakRetained;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  _QWORD block[4];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    _MSPLogForContainer(*(void **)(a1 + 32), CFSTR("Ending edit operation with context %@ with error %@"), v8, v9, v10, v11, v12, v13, *(_QWORD *)(a1 + 40));
    v15 = MEMORY[0x1E0C809B0];
    if (!v7)
    {
      objc_storeStrong(WeakRetained + 2, a2);
      objc_msgSend(v6, "contents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_processedContentsForPersisterContents:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = WeakRetained[3];
      WeakRetained[3] = (id)v17;

      _MSPLogForContainer(*(void **)(a1 + 32), CFSTR("Committed edit with new snapshot: %@"), v19, v20, v21, v22, v23, v24, (uint64_t)WeakRetained[2]);
      v35[0] = v15;
      v35[1] = 3221225472;
      v35[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_111;
      v35[3] = &unk_1E66540E0;
      v35[4] = WeakRetained;
      v36 = *(id *)(a1 + 48);
      v37 = *(id *)(a1 + 56);
      v38 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "_forEachObserver:", v35);

    }
    v25 = *(void **)(a1 + 80);
    if (v25)
    {
      v26 = *(NSObject **)(a1 + 64);
      if (!v26)
        v26 = *(NSObject **)(*(_QWORD *)(a1 + 72) + 8);
      block[0] = v15;
      block[1] = 3221225472;
      block[2] = __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2_112;
      block[3] = &unk_1E6653330;
      v34 = v25;
      v33 = v7;
      dispatch_async(v26, block);

    }
    if (objc_msgSend(*(id *)(a1 + 72), "_simulatesClearingDiscardableDataAfterOperations"))
    {
      v27 = *(_QWORD *)(a1 + 72);
      v28 = *(void **)(v27 + 16);
      *(_QWORD *)(v27 + 16) = 0;

      v29 = *(_QWORD *)(a1 + 72);
      v30 = *(void **)(v29 + 24);
      *(_QWORD *)(v29 + 24) = 0;

    }
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 72) + 8));
  }
  else
  {
    GEOFindOrCreateLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:]_block_invoke_2";
      v41 = 1024;
      v42 = 659;
      _os_log_impl(&dword_1B39C0000, v31, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", buf, 0x12u);
    }

  }
}

void __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_111(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "container:didEditWithNewContents:orderedEdits:cause:context:", a1[4], a1[5], a1[6], 0, a1[7]);

}

uint64_t __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_2_112(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __81__MSPContainer_editContentsUsingBarrierBlock_context_completionQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  NSObject *v12;
  _BYTE v13[12];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      _MSPLogForContainer(*(void **)(a1 + 32), CFSTR("Not committing due to _commitEdit... hook error."), v5, v6, v7, v8, v9, v10, *(uint64_t *)v13);
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      objc_msgSend(WeakRetained[5], "commitEditWithNewContents:edits:appliedToOldContents:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    }
  }
  else
  {
    GEOFindOrCreateLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)&v13[4] = "-[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:]_block_invoke_3";
      v14 = 1024;
      v15 = 693;
      _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", v13, 0x12u);
    }

  }
}

- (void)editObjectsWithIdentifiers:(id)a3 usingBarrierBlock:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  -[MSPContainer editObjectsWithIdentifiers:usingBarrierBlock:context:completionQueue:completion:](self, "editObjectsWithIdentifiers:usingBarrierBlock:context:completionQueue:completion:", a3, a4, 0, a5, a6);
}

- (void)editObjectsWithIdentifiers:(id)a3 usingBarrierBlock:(id)a4 context:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v12 = a4;
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = a7;
  v15 = a6;
  v16 = a5;
  objc_msgSend(v13, "setWithArray:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __96__MSPContainer_editObjectsWithIdentifiers_usingBarrierBlock_context_completionQueue_completion___block_invoke;
  v22[3] = &unk_1E66541A8;
  v23 = v17;
  v24 = v18;
  v25 = v12;
  v19 = v12;
  v20 = v18;
  v21 = v17;
  -[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:](self, "editContentsUsingBarrierBlock:context:completionQueue:completion:", v22, v16, v15, v14);

}

void __96__MSPContainer_editObjectsWithIdentifiers_usingBarrierBlock_context_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "storageIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9))
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)addObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)_forEachObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *accessQueue;
  id v13;
  void *context;
  id obj;
  _QWORD block[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1B5E2B350]();
  v5 = self->_observers;
  objc_sync_enter(v5);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_msgSend(v10, "observationQueueForContainer:", self, context),
              v11 = objc_claimAutoreleasedReturnValue(),
              (accessQueue = v11) == 0))
        {
          v11 = 0;
          accessQueue = self->_accessQueue;
        }
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __33__MSPContainer__forEachObserver___block_invoke;
        block[3] = &unk_1E6653330;
        v13 = v4;
        block[4] = v10;
        v17 = v13;
        dispatch_async(accessQueue, block);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_autoreleasePoolPop(context);
}

void __33__MSPContainer__forEachObserver___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E2B350]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (id)beginCoalescingEditsWithContext:(id)a3
{
  id v4;
  MSPContainer *v5;
  NSCountedSet *editCoalescingContexts;
  NSCountedSet *v7;
  NSCountedSet *v8;
  MSPContainerCoalescingToken *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  editCoalescingContexts = v5->_editCoalescingContexts;
  if (!editCoalescingContexts)
  {
    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    v8 = v5->_editCoalescingContexts;
    v5->_editCoalescingContexts = v7;

    editCoalescingContexts = v5->_editCoalescingContexts;
  }
  -[NSCountedSet addObject:](editCoalescingContexts, "addObject:", v4);
  objc_sync_exit(v5);

  v9 = -[MSPContainerCoalescingToken initWithContainerOwner:context:]([MSPContainerCoalescingToken alloc], "initWithContainerOwner:context:", v5, v4);
  return v9;
}

- (void)_endCoalescingEditsForContext:(id)a3
{
  MSPContainer *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSCountedSet removeObject:](v4->_editCoalescingContexts, "removeObject:", v5);
  if ((-[NSCountedSet containsObject:](v4->_editCoalescingContexts, "containsObject:", v5) & 1) == 0
    && -[NSObject isEqual:](v4->_contextCoalescingFor, "isEqual:", v5))
  {
    -[MSPContainer _commitPendingCoalescedEditsIfAny](v4, "_commitPendingCoalescedEditsIfAny");
  }
  objc_sync_exit(v4);

}

- (void)coalesceEditsForContext:(id)a3 inBlock:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v6 = (void (**)(_QWORD))a4;
  -[MSPContainer beginCoalescingEditsWithContext:](self, "beginCoalescingEditsWithContext:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6);

  objc_msgSend(v7, "endCoalescingEdits");
}

- (BOOL)_checkAndAddCoalescedEditForContext:(id)a3 identifiers:(id)a4 enqueuedBlock:(id)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MSPContainer *v18;
  BOOL v19;
  NSObject *contextCoalescingFor;
  NSMutableSet *coalescedPartialContentIdentifiersToFetch;
  NSMutableSet *v23;
  NSMutableSet *v24;
  NSMutableSet *v25;
  NSMutableArray *enqueuedCoalescingEditBarrierBlocks;
  NSMutableArray *v27;
  NSMutableArray *v28;
  void *v29;
  void *v30;
  NSMutableArray *v31;
  NSMutableArray *enqueuedCoalescingCompletionBlocks;
  NSMutableArray *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  dispatch_time_t v38;
  _QWORD block[5];
  _QWORD v40[4];
  id v41;
  id v42;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = self;
  objc_sync_enter(v18);
  if (v18->_isCommittingEnqueuedEdits)
    goto LABEL_2;
  contextCoalescingFor = v18->_contextCoalescingFor;
  if (contextCoalescingFor)
  {
    if (v13 && (-[NSObject isEqual:](contextCoalescingFor, "isEqual:", v13) & 1) != 0)
      goto LABEL_9;
    -[MSPContainer _commitPendingCoalescedEditsIfAny](v18, "_commitPendingCoalescedEditsIfAny");
  }
  if (!v13)
  {
LABEL_2:
    v19 = 0;
    goto LABEL_3;
  }
LABEL_9:
  if (!-[NSCountedSet containsObject:](v18->_editCoalescingContexts, "containsObject:", v13))
    goto LABEL_2;
  objc_storeStrong((id *)&v18->_contextCoalescingFor, a3);
  if (v14)
  {
    if (!v18->_coalescedEditsNeedEntireContents)
    {
      coalescedPartialContentIdentifiersToFetch = v18->_coalescedPartialContentIdentifiersToFetch;
      if (!coalescedPartialContentIdentifiersToFetch)
      {
        v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v24 = v18->_coalescedPartialContentIdentifiersToFetch;
        v18->_coalescedPartialContentIdentifiersToFetch = v23;

        coalescedPartialContentIdentifiersToFetch = v18->_coalescedPartialContentIdentifiersToFetch;
      }
      -[NSMutableSet addObjectsFromArray:](coalescedPartialContentIdentifiersToFetch, "addObjectsFromArray:", v14);
    }
  }
  else
  {
    v18->_coalescedEditsNeedEntireContents = 1;
    v25 = v18->_coalescedPartialContentIdentifiersToFetch;
    v18->_coalescedPartialContentIdentifiersToFetch = 0;

  }
  enqueuedCoalescingEditBarrierBlocks = v18->_enqueuedCoalescingEditBarrierBlocks;
  if (!enqueuedCoalescingEditBarrierBlocks)
  {
    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = v18->_enqueuedCoalescingEditBarrierBlocks;
    v18->_enqueuedCoalescingEditBarrierBlocks = v27;

    enqueuedCoalescingEditBarrierBlocks = v18->_enqueuedCoalescingEditBarrierBlocks;
  }
  v29 = (void *)objc_msgSend(v15, "copy");
  v30 = (void *)MEMORY[0x1B5E2B4E8]();
  -[NSMutableArray addObject:](enqueuedCoalescingEditBarrierBlocks, "addObject:", v30);

  if (v18->_enqueuedCoalescingCompletionBlocks)
  {
    if (!v17)
      goto LABEL_25;
  }
  else
  {
    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    enqueuedCoalescingCompletionBlocks = v18->_enqueuedCoalescingCompletionBlocks;
    v18->_enqueuedCoalescingCompletionBlocks = v31;

    if (!v17)
      goto LABEL_25;
  }
  v33 = v18->_enqueuedCoalescingCompletionBlocks;
  if (v16)
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke;
    v40[3] = &unk_1E66541D0;
    v41 = v16;
    v42 = v17;
    v34 = (void *)objc_msgSend(v40, "copy");
    v35 = (void *)MEMORY[0x1B5E2B4E8]();
    -[NSMutableArray addObject:](v33, "addObject:", v35);

  }
  else
  {
    v36 = (void *)objc_msgSend(v17, "copy");
    v37 = (void *)MEMORY[0x1B5E2B4E8]();
    -[NSMutableArray addObject:](v33, "addObject:", v37);

  }
LABEL_25:
  v19 = 1;
  if (!v18->_hasScheduledDelayedCommitForCoalescedEdits)
  {
    v18->_hasScheduledDelayedCommitForCoalescedEdits = 1;
    v38 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke_3;
    block[3] = &unk_1E6651E88;
    block[4] = v18;
    dispatch_after(v38, MEMORY[0x1E0C80D38], block);
  }
LABEL_3:
  objc_sync_exit(v18);

  return v19;
}

void __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke_2;
  v7[3] = &unk_1E6653330;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __105__MSPContainer__checkAndAddCoalescedEditForContext_identifiers_enqueuedBlock_completionQueue_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitPendingCoalescedEditsIfAny");
}

- (void)_commitPendingCoalescedEditsIfAny
{
  MSPContainer *v2;
  NSObject *v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  void *v6;
  NSObject *contextCoalescingFor;
  NSMutableArray *enqueuedCoalescingEditBarrierBlocks;
  NSMutableArray *enqueuedCoalescingCompletionBlocks;
  NSMutableSet *coalescedPartialContentIdentifiersToFetch;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_contextCoalescingFor;
  if (v3)
  {
    v2->_isCommittingEnqueuedEdits = 1;
    v4 = v2->_enqueuedCoalescingEditBarrierBlocks;
    v5 = v2->_enqueuedCoalescingCompletionBlocks;
    -[NSMutableSet allObjects](v2->_coalescedPartialContentIdentifiersToFetch, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    contextCoalescingFor = v2->_contextCoalescingFor;
    v2->_contextCoalescingFor = 0;

    enqueuedCoalescingEditBarrierBlocks = v2->_enqueuedCoalescingEditBarrierBlocks;
    v2->_enqueuedCoalescingEditBarrierBlocks = 0;

    enqueuedCoalescingCompletionBlocks = v2->_enqueuedCoalescingCompletionBlocks;
    v2->_enqueuedCoalescingCompletionBlocks = 0;

    coalescedPartialContentIdentifiersToFetch = v2->_coalescedPartialContentIdentifiersToFetch;
    v2->_coalescedPartialContentIdentifiersToFetch = 0;

    v11 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke;
      v17[3] = &unk_1E66541F8;
      v12 = v17;
      v17[4] = v4;
      v16[0] = v11;
      v16[1] = 3221225472;
      v16[2] = __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_2;
      v16[3] = &unk_1E6654220;
      v13 = v16;
      v16[4] = v5;
      -[MSPContainer editObjectsWithIdentifiers:usingBarrierBlock:context:completionQueue:completion:](v2, "editObjectsWithIdentifiers:usingBarrierBlock:context:completionQueue:completion:", v6, v17, v3, 0, v16);
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_3;
      v15[3] = &unk_1E6654248;
      v12 = v15;
      v15[4] = v4;
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_4;
      v14[3] = &unk_1E6654220;
      v13 = v14;
      v14[4] = v5;
      -[MSPContainer editContentsUsingBarrierBlock:context:completionQueue:completion:](v2, "editContentsUsingBarrierBlock:context:completionQueue:completion:", v15, v3, 0, v14);
    }

    v2->_hasScheduledDelayedCommitForCoalescedEdits = 0;
    v2->_isCommittingEnqueuedEdits = 0;

  }
  objc_sync_exit(v2);

}

void __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __49__MSPContainer__commitPendingCoalescedEditsIfAny__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_commitEditWithFinalContents:(id)a3 context:(id)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (MSPContainerPersister)persister
{
  return self->_persister;
}

- (BOOL)_preventsAssertionsForDuplicateStorageIdentifiers
{
  return self->_preventsAssertionsForDuplicateStorageIdentifiers;
}

- (BOOL)_simulatesClearingDiscardableDataAfterOperations
{
  return self->_simulatesClearingDiscardableDataAfterOperations;
}

- (void)_setSimulatesClearingDiscardableDataAfterOperations:(BOOL)a3
{
  self->_simulatesClearingDiscardableDataAfterOperations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enqueuedCoalescingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_enqueuedCoalescingEditBarrierBlocks, 0);
  objc_storeStrong((id *)&self->_coalescedPartialContentIdentifiersToFetch, 0);
  objc_storeStrong((id *)&self->_contextCoalescingFor, 0);
  objc_storeStrong((id *)&self->_editCoalescingContexts, 0);
  objc_storeStrong((id *)&self->_persister, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentProcessedContents, 0);
  objc_storeStrong((id *)&self->_currentStateSnapshot, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
