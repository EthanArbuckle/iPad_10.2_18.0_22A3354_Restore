@implementation FPSpotlightDataSource

- (unint64_t)maximumNumberOfItems
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FPSpotlightQueryDescriptor settings](self->_queryDescriptor, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "desiredNumberOfItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = -1;

  return v4;
}

void __81__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didGatherItems___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "dataSource:didChangeItemsOrigin:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "itemsOrigin"));

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(v3, "dataSource:replaceContentsWithItems:hasMoreChanges:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), 0);

}

- (void)collector:(id)a3 didGatherItems:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didGatherItems___block_invoke;
  block[3] = &unk_1E444AB48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (id)itemPredicateForCollector:(id)a3
{
  return self->_predicate;
}

uint64_t __35__FPSpotlightDataSource_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __30__FPSpotlightDataSource_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "registerDataSource:");
}

- (void)_invalidate
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] invalidating spotlight data source: %@", (uint8_t *)&v2, 0xCu);
}

- (FPSpotlightQueryDescriptor)queryDescriptor
{
  return self->_queryDescriptor;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__FPSpotlightDataSource_start__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(queue, block);
}

- (FPSpotlightDataSource)initWithQueryDescriptor:(id)a3 predicate:(id)a4
{
  id v7;
  id v8;
  FPSpotlightDataSource *v9;
  uint64_t v10;
  FPSpotlightCollectorManager *collectorManager;
  id v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)FPSpotlightDataSource;
  v9 = -[FPSpotlightDataSource init](&v19, sel_init);
  if (v9)
  {
    +[FPSpotlightCollectorManager sharedInstance](FPSpotlightCollectorManager, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    collectorManager = v9->_collectorManager;
    v9->_collectorManager = (FPSpotlightCollectorManager *)v10;

    objc_storeStrong((id *)&v9->_predicate, a4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.FileProvider.SpotlightDataSource.queue (%p)"), v9);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    FPDataSourceBaseQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create_with_target_V2(v13, v14, v15);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v9->_queryDescriptor, a3);
  }

  return v9;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__FPSpotlightDataSource_invalidate__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_enumerationSettings, 0);
  objc_storeStrong((id *)&self->_collectorManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_invalidateWithError:(id)a3
{
  NSObject *queue;
  id v5;
  id WeakRetained;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[FPSpotlightDataSource _invalidate](self, "_invalidate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dataSource:wasInvalidatedWithError:", self, v5);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p d:'<%@:%p>'>"), v5, self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (BOOL)hasMoreIncoming
{
  return self->_hasMoreIncoming;
}

- (FPSpotlightDataSourceDelegate)delegate
{
  return (FPSpotlightDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)collector:(id)a3 didUpdateItems:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didUpdateItems___block_invoke;
  v8[3] = &unk_1E4449A40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __81__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didUpdateItems___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "dataSource:receivedUpdatedItems:deletedItems:hasMoreChanges:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), MEMORY[0x1E0C9AA60], 0);

}

- (void)collector:(id)a3 didRemoveItemIDs:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didRemoveItemIDs___block_invoke;
  v8[3] = &unk_1E4449A40;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __83__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didRemoveItemIDs___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "dataSource:receivedUpdatedItems:deletedItems:hasMoreChanges:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 40), 0);

}

- (void)collector:(id)a3 didUpdateItemsOrigin:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didUpdateItemsOrigin___block_invoke;
  v5[3] = &unk_1E44499E8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

void __87__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didUpdateItemsOrigin___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "dataSource:didChangeItemsOrigin:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)collector:(id)a3 didEncounterError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FPSpotlightDataSource(FPSpotlightCollectorObserving) collector:didEncounterError:].cold.1((uint64_t)v6, (uint64_t)v7, v8);

  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didEncounterError___block_invoke;
  v11[3] = &unk_1E4449A40;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  dispatch_async(queue, v11);

}

uint64_t __84__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didEncounterError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithError:", *(_QWORD *)(a1 + 40));
}

@end
