@implementation BMBiomeScheduler

void __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  id *v14;
  id *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v8 && v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412802;
        v26 = v7;
        v27 = 2112;
        v28 = v9;
        v29 = 2112;
        v30 = v8;
        _os_log_impl(&dword_18D810000, v11, OS_LOG_TYPE_INFO, "BMBiomeScheduler received callback from subscription %@, publishing event %@ for stream %@", buf, 0x20u);
      }

      objc_msgSend(WeakRetained, "queue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke_161;
      block[3] = &unk_1E2649600;
      block[4] = WeakRetained;
      v14 = &v21;
      v21 = v7;
      v15 = &v22;
      v22 = v9;
      v23 = v8;
      v24 = *(id *)(a1 + 32);
      dispatch_async(v13, block);

      v16 = v23;
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        _os_log_impl(&dword_18D810000, v11, OS_LOG_TYPE_INFO, "BMBiomeScheduler received callback from subscription %@, reading bookmark and subscribing to DSL graph publisher", buf, 0xCu);
      }

      objc_msgSend(WeakRetained, "queue");
      v16 = objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke_162;
      v17[3] = &unk_1E2649628;
      v17[4] = WeakRetained;
      v14 = &v18;
      v18 = v7;
      v15 = &v19;
      v19 = *(id *)(a1 + 32);
      dispatch_async(v16, v17);
    }

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke_162(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(*(id *)(a1 + 32), "_updatedPublisherForSubscription:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  if (v2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  objc_msgSend(*(id *)(a1 + 32), "_persistBookmarkForPublisher:", v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));

}

- (id)_updatedPublisherForSubscription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BMComputeXPCPublisherStorage *bookmarkStorage;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  BMComputeXPCPublisherStorage *v15;
  void *v16;
  NSObject *v17;
  BMComputeXPCPublisherStorage *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v41;
  id v42;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[BMBiomeScheduler bpsPublisher](self, "bpsPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[BMBiomeScheduler graph](self, "graph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bpsPublisher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    bookmarkStorage = self->_bookmarkStorage;
    v42 = 0;
    objc_msgSend(v4, "fetchBookmarkFromStorage:error:", bookmarkStorage, &v42);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v42;
    v11 = v10;
    if (v9 && !v10)
    {
      objc_msgSend(v7, "validateBookmarkNode:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0D01D18], "current");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = self->_bookmarkStorage;
        objc_msgSend(v4, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMComputeXPCPublisherStorage removeBookmarkFileForSubscriptionWithIdentifier:client:](v15, "removeBookmarkFileForSubscriptionWithIdentifier:client:", v16, v14);

        __biome_log_for_category();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[BMBiomeScheduler _updatedPublisherForSubscription:].cold.6();

        v18 = self->_bookmarkStorage;
        v41 = 0;
        objc_msgSend(v4, "fetchBookmarkFromStorage:error:", v18, &v41);
        v19 = objc_claimAutoreleasedReturnValue();
        v11 = v41;

        v9 = (void *)v19;
      }
      else
      {
        v11 = 0;
      }

    }
    if (v11)
    {
      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_BMBiomeXPCSchedulerInner switchToUpdatedPublisher].cold.2();

    }
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[_BMBiomeXPCSchedulerInner switchToUpdatedPublisher].cold.1();

    objc_msgSend(v7, "applyBookmarkNode:", v9);
    objc_msgSend(v7, "startWithSubscriber:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[BMBiomeScheduler _updatedPublisherForSubscription:].cold.3();
    }
    else
    {
      -[BMBiomeScheduler setBpsPublisher:](self, "setBpsPublisher:", v7);
      __biome_log_for_category();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[BMBiomeScheduler _updatedPublisherForSubscription:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);
    }

  }
  __biome_log_for_category();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    -[BMBiomeScheduler _updatedPublisherForSubscription:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);

  -[BMBiomeScheduler bpsPublisher](self, "bpsPublisher");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (BMBookmarkablePublisher)bpsPublisher
{
  return self->_bpsPublisher;
}

- (void)_persistBookmarkForPublisher:(id)a3
{
  id v4;
  void *v5;
  BMComputeXPCPublisherStorage *bookmarkStorage;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4 && objc_msgSend(v4, "conformsToProtocol:", &unk_1EE0D13C0))
  {
    objc_msgSend(v4, "bookmarkNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    bookmarkStorage = self->_bookmarkStorage;
    -[BMBiomeScheduler identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01D18], "current");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMComputeXPCPublisherStorage writeBookmark:forSubscriptionWithIdentifier:client:](bookmarkStorage, "writeBookmark:forSubscriptionWithIdentifier:client:", v5, v7, v9);

    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[BMBiomeScheduler _persistBookmarkForPublisher:].cold.1(self, v10);

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BMBiomeScheduler *v9;

  v6 = a4;
  v7 = a3;
  +[BMComputeXPCPublisherClient shared](BMComputeXPCPublisherClient, "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BMBiomeScheduler initWithIdentifier:targetQueue:client:](self, "initWithIdentifier:targetQueue:client:", v7, v6, v8);

  return v9;
}

- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4 client:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  BMBiomeScheduler *v21;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D01D18], "current");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isManagedByLaunchd");

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = *MEMORY[0x1E0C999C0];
  v14 = v25[0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v13, "resourceValuesForKeys:error:", v15, &v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v24;

  objc_msgSend(v16, "objectForKeyedSubscript:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    __biome_log_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[BMBiomeScheduler initWithIdentifier:targetQueue:client:].cold.1();
    goto LABEL_6;
  }
  if (objc_msgSend(v18, "BOOLValue"))
  {
    objc_msgSend(v12, "bundleIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject isEqualToString:](v20, "isEqualToString:", CFSTR("com.apple.springboard"));
LABEL_6:

  }
  v21 = -[BMBiomeScheduler initWithIdentifier:targetQueue:client:waking:](self, "initWithIdentifier:targetQueue:client:waking:", v7, v8, v9, v11, self);

  return v21;
}

- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4 client:(id)a5 waking:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  BMBiomeScheduler *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BMBiomeScheduler;
  v13 = -[BMBiomeScheduler init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_queue, a4);
    objc_storeStrong((id *)&v13->_client, a5);
    v13->_waking = a6;
    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (BMBiomeScheduler)initWithIdentifier:(id)a3 targetQueue:(id)a4 waking:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  BMBiomeScheduler *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  +[BMComputeXPCPublisherClient shared](BMComputeXPCPublisherClient, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BMBiomeScheduler initWithIdentifier:targetQueue:client:waking:](self, "initWithIdentifier:targetQueue:client:waking:", v9, v8, v10, v5);

  return v11;
}

- (void)subscribeWithDSLGraph:(id)a3 forSubscriber:(id)a4
{
  id v6;
  id v7;
  _BMBiomeXPCSchedulerInner *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _BMBiomeXPCSchedulerInner *v14;
  void *v15;
  void *v16;
  void *v17;
  _BMBiomeXPCSchedulerInner *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "streamPublishers");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (_BMBiomeXPCSchedulerInner *)(id)objc_claimAutoreleasedReturnValue();
  v9 = -[_BMBiomeXPCSchedulerInner countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "streamType", (_QWORD)v19) != 1 && objc_msgSend(v13, "streamType") != 2)
        {
          v18 = v8;
          goto LABEL_14;
        }
      }
      v10 = -[_BMBiomeXPCSchedulerInner countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }

  v14 = [_BMBiomeXPCSchedulerInner alloc];
  -[BMBiomeScheduler identifier](self, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBiomeScheduler client](self, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBiomeScheduler queue](self, "queue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[_BMBiomeXPCSchedulerInner initWithDownstream:identifier:graph:client:targetQueue:waking:](v14, "initWithDownstream:identifier:graph:client:targetQueue:waking:", v7, v15, v6, v16, v17, -[BMBiomeScheduler waking](self, "waking"));

  if (self->_bookmarkStorage)
    -[_BMBiomeXPCSchedulerInner setBookmarkStorage:](v18, "setBookmarkStorage:");
  objc_msgSend(v7, "receiveSubscription:", v18, (_QWORD)v19);
LABEL_14:

}

- (void)subscribeWithDSLGraph:(id)a3 publisherBlock:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BMComputeXPCPublisherStorage *v15;
  BMComputeXPCPublisherStorage *bookmarkStorage;
  void *v17;
  void *v18;
  BMComputeXPCPublisherStorage *v19;
  void *v20;
  BMComputeXPCSubscription *v21;
  void *v22;
  BMComputeXPCSubscription *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "streamPublishers");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v13, "streamType") != 1 && objc_msgSend(v13, "streamType") != 2)
        {
          __biome_log_for_category();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[BMBiomeScheduler subscribeWithDSLGraph:publisherBlock:].cold.1(v13, v26);

          goto LABEL_18;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v10)
        continue;
      break;
    }
  }

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke;
  aBlock[3] = &unk_1E2649650;
  objc_copyWeak(&v29, &location);
  v28 = v8;
  v14 = _Block_copy(aBlock);
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_graph, a3);
  if (!self->_bookmarkStorage)
  {
    +[BMComputeXPCPublisherStorage bookmarkStorageForCurrentProcess](BMComputeXPCPublisherStorage, "bookmarkStorageForCurrentProcess");
    v15 = (BMComputeXPCPublisherStorage *)objc_claimAutoreleasedReturnValue();
    bookmarkStorage = self->_bookmarkStorage;
    self->_bookmarkStorage = v15;

  }
  objc_msgSend(MEMORY[0x1E0D01D18], "current");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[BMBiomeScheduler waking](self, "waking"))
  {
    v19 = self->_bookmarkStorage;
    -[BMBiomeScheduler identifier](self, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMComputeXPCPublisherStorage removeBookmarkFileForSubscriptionWithIdentifier:client:](v19, "removeBookmarkFileForSubscriptionWithIdentifier:client:", v20, v18);

  }
  v21 = [BMComputeXPCSubscription alloc];
  -[BMBiomeScheduler identifier](self, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[BMComputeXPCSubscription initWithIdentifier:client:waking:DSLGraph:block:](v21, "initWithIdentifier:client:waking:DSLGraph:block:", v22, v18, -[BMBiomeScheduler waking](self, "waking"), v7, v14);

  -[BMComputeXPCSubscription identifier](v23, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBiomeScheduler setSubscriptionIdentifier:](self, "setSubscriptionIdentifier:", v24);

  os_unfair_lock_unlock(&self->_lock);
  -[BMBiomeScheduler client](self, "client");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "subscribe:", v23);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
LABEL_18:

}

void __57__BMBiomeScheduler_subscribeWithDSLGraph_publisherBlock___block_invoke_161(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(*(id *)(a1 + 48), "timestamp");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setInitialBookmarkTimestamp:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_publisherWithStreamIdentifier:storeEvent:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 20));
  v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v4 = v5;
  }

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BMBiomeScheduler subscriptionIdentifier](self, "subscriptionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBiomeScheduler bpsPublisher](self, "bpsPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBiomeScheduler setSubscriptionIdentifier:](self, "setSubscriptionIdentifier:", 0);
  -[BMBiomeScheduler setBpsPublisher:](self, "setBpsPublisher:", 0);
  objc_msgSend(MEMORY[0x1E0D01D18], "current");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMComputeXPCPublisherStorage removeBookmarkFileForSubscriptionWithIdentifier:client:](self->_bookmarkStorage, "removeBookmarkFileForSubscriptionWithIdentifier:client:", v4, v7);
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    -[BMBiomeScheduler client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unsubscribeWithIdentifier:", v4);

  }
  if (v5)
    objc_msgSend(v5, "reset");
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_18D810000, v9, OS_LOG_TYPE_DEFAULT, "BMBiomeScheduler client invoked cancel, unsubscribing", v10, 2u);
  }

}

- (id)_publisherWithStreamIdentifier:(id)a3 storeEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
  BMBiomeScheduler *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v30 = self;
  -[BMBiomeScheduler graph](self, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "streamPublishers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v6);

        if (v16)
        {
          v40 = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBackingEvents:", v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v11);
  }

  -[BMBiomeScheduler graph](v30, "graph");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bpsPublisher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[BMBiomeScheduler graph](v30, "graph");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "streamPublishers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v26, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", v6);

        if (v28)
          objc_msgSend(v26, "setBackingEvents:", 0);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v23);
  }

  return v19;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BMComputeXPCPublisherClient)client
{
  return self->_client;
}

- (BOOL)waking
{
  return self->_waking;
}

- (NSString)subscriptionIdentifier
{
  return self->_subscriptionIdentifier;
}

- (void)setSubscriptionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionIdentifier, a3);
}

- (void)setBpsPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_bpsPublisher, a3);
}

- (BMDSL)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graph, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_bpsPublisher, 0);
  objc_storeStrong((id *)&self->_subscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bookmarkStorage, 0);
}

- (void)initWithIdentifier:targetQueue:client:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_5(&dword_18D810000, v0, v1, "Error checking whether process is an application: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)subscribeWithDSLGraph:(void *)a1 publisherBlock:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_5(&dword_18D810000, a2, v4, "BMBiomeScheduler cannot subscribe to BMDSLStreamPublisher %@ because it is the incorrect streamType", v5);

}

- (void)_updatedPublisherForSubscription:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_18D810000, a1, a3, "BMBiomeScheduler using cached publisher", a5, a6, a7, a8, 0);
}

- (void)_updatedPublisherForSubscription:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_18D810000, a1, a3, "BMBiomeScheduler created and cached new publisher w/ bookmark", a5, a6, a7, a8, 0);
}

- (void)_updatedPublisherForSubscription:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_5(&dword_18D810000, v0, v1, "BMBiomeScheduler could not create new publisher w/ err: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_updatedPublisherForSubscription:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_5(&dword_18D810000, v0, v1, "Client bookmark failed validation for subscription %@, removing old bookmark and creating new one", v2);
  OUTLINED_FUNCTION_5();
}

- (void)_persistBookmarkForPublisher:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D18], "current");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v3;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_0_4(&dword_18D810000, a2, v6, "BMBiomeScheduler persisted new bookmark for identifier: %@, client: %@", (uint8_t *)&v7);

}

@end
