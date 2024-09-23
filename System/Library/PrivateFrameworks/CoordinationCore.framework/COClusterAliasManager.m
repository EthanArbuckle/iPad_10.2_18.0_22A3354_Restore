@implementation COClusterAliasManager

- (id)_initWithProvider:(id)a3 delegate:(id)a4 delegateDispatchQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  COClusterAliasManager *v11;
  COClusterAliasManager *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *dispatchQueue;
  NSDictionary *v16;
  NSDictionary *resolvers;
  NSSet *v18;
  NSSet *resolving;
  NSDictionary *v20;
  NSDictionary *waiting;
  NSDictionary *v22;
  NSDictionary *identifiers;
  NSDictionary *v24;
  NSDictionary *updates;
  NSDictionary *v26;
  NSDictionary *associations;
  NSDictionary *v28;
  NSDictionary *meshes;
  NSSet *v30;
  NSSet *starting;
  NSSet *v32;
  NSSet *stopping;
  objc_super v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)COClusterAliasManager;
  v11 = -[COClusterAliasManager init](&v35, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_provider, v8);
    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_delegateDispatchQueue, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.COClusterAliasManager", v13);
    dispatchQueue = v12->_dispatchQueue;
    v12->_dispatchQueue = (OS_dispatch_queue *)v14;

    v16 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    resolvers = v12->_resolvers;
    v12->_resolvers = v16;

    v18 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    resolving = v12->_resolving;
    v12->_resolving = v18;

    v20 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    waiting = v12->_waiting;
    v12->_waiting = v20;

    v22 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    identifiers = v12->_identifiers;
    v12->_identifiers = v22;

    v24 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    updates = v12->_updates;
    v12->_updates = v24;

    v26 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    associations = v12->_associations;
    v12->_associations = v26;

    v28 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    meshes = v12->_meshes;
    v12->_meshes = v28;

    v30 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    starting = v12->_starting;
    v12->_starting = v30;

    v32 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    stopping = v12->_stopping;
    v12->_stopping = v32;

  }
  return v12;
}

+ (id)aliasManagerWithProvider:(id)a3 delegate:(id)a4 delegateDispatchQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithProvider:delegate:delegateDispatchQueue:", v10, v9, v8);

  return v11;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COClusterAliasManager resolvers](self, "resolvers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[COClusterAliasManager identifiers](self, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[COClusterAliasManager associations](self, "associations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[COClusterAliasManager meshes](self, "meshes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p r(%lu) i(%lu) a(%lu) m(%lu)>"), v5, self, v7, v9, v11, objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (void)startTrackingCluster:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__COClusterAliasManager_startTrackingCluster___block_invoke;
  v7[3] = &unk_24D4B0858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __46__COClusterAliasManager_startTrackingCluster___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "resolvers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    COCoreLogForCategory(13);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v13 = 134218498;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      v17 = 2048;
      v18 = v3;
      _os_log_debug_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEBUG, "%p already tracking %@ with %p", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    +[COClusterResolver resolverForCluster:delegate:](COClusterResolver, "resolverForCluster:delegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "resolvers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "mutableCopy");

    -[NSObject setObject:forKey:](v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setResolvers:", v4);
    objc_msgSend(*(id *)(a1 + 32), "resolving");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setResolving:", v9);
    COCoreLogForCategory(13);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 134218498;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2048;
      v18 = v3;
      _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, "%p will track %@ with %p", (uint8_t *)&v13, 0x20u);
    }

    objc_msgSend(v3, "activate");
  }

}

- (void)stopTrackingCluster:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__COClusterAliasManager_stopTrackingCluster___block_invoke;
  v7[3] = &unk_24D4B0858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__COClusterAliasManager_stopTrackingCluster___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "resolvers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v4 = (_QWORD *)(a1 + 40);
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(13);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *v2;
      v10 = *v4;
      v12 = 134218242;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p stopping tracking %@", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*v2, "resolvers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "mutableCopy");

    -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", *v4);
    objc_msgSend(*v2, "setResolvers:", v8);
    objc_msgSend(*v2, "_updateClusterIdentifier:forCluster:", 0, *v4);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __45__COClusterAliasManager_stopTrackingCluster___block_invoke_cold_1();
  }

}

- (void)waitForBootstrapOfCluster:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke;
  v19[3] = &unk_24D4B1428;
  v19[4] = self;
  v9 = v7;
  v20 = v9;
  v10 = (void *)MEMORY[0x2199F3D40](v19);
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke_2;
  v15[3] = &unk_24D4B1450;
  v15[4] = self;
  v16 = v6;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v6;
  dispatch_async(v11, v15);

}

void __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegateDispatchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));

}

void __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "resolvers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)(a1 + 40);
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!objc_msgSend(*v2, "_clusterIsBootstrapped:", *v4))
    {
      objc_msgSend(*(id *)(a1 + 32), "_addWaitingBlock:forCluster:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
      goto LABEL_9;
    }
    COCoreLogForCategory(13);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *v2;
      v8 = *v4;
      v9 = 134218242;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p already bootstrapped Cluster %@, invoking bootstrap block inline", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    COCoreLogForCategory(13);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:

}

- (void)resolver:(id)a3 clusterIdentifierChanged:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  COClusterAliasManager *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cluster");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__COClusterAliasManager_resolver_clusterIdentifierChanged___block_invoke;
  v13[3] = &unk_24D4B0E50;
  v14 = v6;
  v15 = self;
  v16 = v8;
  v17 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(v9, v13);

}

void __59__COClusterAliasManager_resolver_clusterIdentifierChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "resolvers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v4);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateClusterIdentifier:forCluster:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    COCoreLogForCategory(13);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 134218754;
      v11 = v8;
      v12 = 2112;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_215E92000, v5, OS_LOG_TYPE_ERROR, "%p ignoring change to %@ for %@ from %@", (uint8_t *)&v10, 0x2Au);
    }

  }
}

- (void)_updateClusterIdentifier:(id)a3 forCluster:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  COClusterAliasManager *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[COClusterAliasManager identifiers](self, "identifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[COClusterAliasManager updates](self, "updates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v6;
  COCoreLogForCategory(13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 134219010;
    v22 = self;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p identifier updated to %@ from %@ (pending %@) for %@", (uint8_t *)&v21, 0x34u);
  }

  -[COClusterAliasManager resolving](self, "resolving");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v7);

  if (v16)
  {
    -[COClusterAliasManager resolving](self, "resolving");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "removeObject:", v7);
    -[COClusterAliasManager setResolving:](self, "setResolving:", v18);

  }
  if ((v13 || v10 || v12)
    && (!objc_msgSend(v12, "isEqual:", v13) || !objc_msgSend(v10, "isEqual:", v13)))
  {
    -[COClusterAliasManager updates](self, "updates");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v20, "mutableCopy");

    if (v13)
      objc_msgSend(v19, "setObject:forKey:", v13, v7);
    else
      objc_msgSend(v19, "removeObjectForKey:", v7);
    -[COClusterAliasManager setUpdates:](self, "setUpdates:", v19);
    if (v10)
      -[COClusterAliasManager _deactivateMeshWithClusterIdentifier:](self, "_deactivateMeshWithClusterIdentifier:", v10);
    if (v13)
      -[COClusterAliasManager _deactivateMeshWithClusterIdentifier:](self, "_deactivateMeshWithClusterIdentifier:", v13);
    -[COClusterAliasManager _applyUpdates](self, "_applyUpdates");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[COClusterAliasManager _invokeWaitingBlocksForClusters:](self, "_invokeWaitingBlocksForClusters:", v19);
  }

}

- (void)_applyUpdates
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  COClusterAliasManager *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[COClusterAliasManager stopping](self, "stopping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  COCoreLogForCategory(13);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      -[COClusterAliasManager stopping](self, "stopping");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v27 = self;
      v28 = 2048;
      v29 = v5;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p deferring updates, waiting for %lu (%@) to stop", buf, 0x20u);

    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      v27 = self;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p applying updates", buf, 0xCu);
    }

    -[COClusterAliasManager updates](self, "updates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[COClusterAliasManager setIdentifiers:](self, "setIdentifiers:", v10);

    -[COClusterAliasManager _recomputeAssociations](self, "_recomputeAssociations");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[COClusterAliasManager associations](self, "associations", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15);
          -[COClusterAliasManager meshes](self, "meshes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            -[COClusterAliasManager associations](self, "associations");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            -[COClusterAliasManager _activateMeshWithClusterIdentifier:forClusters:](self, "_activateMeshWithClusterIdentifier:forClusters:", v16, v20);
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    COCoreLogForCategory(13);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = self;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p finished applying updates", buf, 0xCu);
    }
  }

}

- (void)_recomputeAssociations
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  COClusterAliasManager *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  COClusterAliasManager *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = self;
  -[COClusterAliasManager identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v12, "mutableCopy");

        if (!v13)
          v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        objc_msgSend(v13, "addObject:", v10);
        objc_msgSend(v4, "setObject:forKey:", v13, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v7);
  }
  -[COClusterAliasManager setAssociations:](v17, "setAssociations:", v4);
  COCoreLogForCategory(13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v4, "count");
    v16 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 134218496;
    v23 = v17;
    v24 = 2048;
    v25 = v15;
    v26 = 2048;
    v27 = v16;
    _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p recomputed associations, %lu meshes for %lu Clusters", buf, 0x20u);
  }

}

- (BOOL)_clusterIsBootstrapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

  v4 = a3;
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COClusterAliasManager resolving](self, "resolving");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    -[COClusterAliasManager identifiers](self, "identifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v4);
    v10 = objc_claimAutoreleasedReturnValue();

    -[COClusterAliasManager updates](self, "updates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v4);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12 | v10)
    {
      v8 = objc_msgSend((id)v10, "isEqual:", v12);
      if (v8 && v10)
      {
        -[COClusterAliasManager starting](self, "starting");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v10);

        LOBYTE(v8) = v14 ^ 1;
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }

  }
  return v8;
}

- (void)_addWaitingBlock:(id)a3 forCluster:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  COClusterAliasManager *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[COClusterAliasManager waiting](self, "waiting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x2199F3D40](v6);
    objc_msgSend(v10, "arrayByAddingObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = objc_alloc(MEMORY[0x24BDBCE30]);
    v11 = (void *)MEMORY[0x2199F3D40](v6);
    v12 = (void *)objc_msgSend(v13, "initWithObjects:", v11, 0);
  }

  COCoreLogForCategory(13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v18 = self;
    v19 = 2048;
    v20 = objc_msgSend(v12, "count");
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p now %lu blocks waiting for bootstrap of Cluster %@", buf, 0x20u);
  }

  -[COClusterAliasManager waiting](self, "waiting");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "setObject:forKey:", v12, v7);
  -[COClusterAliasManager setWaiting:](self, "setWaiting:", v16);

}

- (void)_invokeWaitingBlocksForClusters:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  __int128 v22;
  _QWORD block[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  COClusterAliasManager *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COClusterAliasManager waiting](self, "waiting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v26;
    *(_QWORD *)&v11 = 134218242;
    v22 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (-[COClusterAliasManager _clusterIsBootstrapped:](self, "_clusterIsBootstrapped:", v15, v22))
        {
          -[COClusterAliasManager waiting](self, "waiting");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v15);
          v17 = objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            COCoreLogForCategory(13);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = -[NSObject count](v17, "count");
              *(_DWORD *)buf = 134218498;
              v30 = self;
              v31 = 2048;
              v32 = v19;
              v33 = 2112;
              v34 = v15;
              _os_log_impl(&dword_215E92000, v18, OS_LOG_TYPE_DEFAULT, "%p now invoking %lu blocks waiting for bootstrap of Cluster %@", buf, 0x20u);
            }

            objc_msgSend(v8, "addObjectsFromArray:", v17);
            objc_msgSend(v7, "removeObjectForKey:", v15);
          }
        }
        else
        {
          COCoreLogForCategory(13);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v30 = self;
            v31 = 2112;
            v32 = v15;
            _os_log_error_impl(&dword_215E92000, v17, OS_LOG_TYPE_ERROR, "%p NOT invoking blocks waiting for bootstrap of Cluster %@, not bootstrapped", buf, 0x16u);
          }
        }

      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v12);
  }

  -[COClusterAliasManager setWaiting:](self, "setWaiting:", v7);
  -[COClusterAliasManager delegateDispatchQueue](self, "delegateDispatchQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__COClusterAliasManager__invokeWaitingBlocksForClusters___block_invoke;
  block[3] = &unk_24D4B0C80;
  v24 = v8;
  v21 = v8;
  dispatch_async(v20, block);

}

void __57__COClusterAliasManager__invokeWaitingBlocksForClusters___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_deactivateMeshWithClusterIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  int v16;
  COClusterAliasManager *v17;
  __int16 v18;
  NSObject *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[COClusterAliasManager stopping](self, "stopping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    COCoreLogForCategory(13);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[COClusterAliasManager _deactivateMeshWithClusterIdentifier:].cold.1((uint64_t)self, (uint64_t)v4, v8);
  }
  else
  {
    -[COClusterAliasManager meshes](self, "meshes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[COClusterAliasManager stopping](self, "stopping");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setByAddingObject:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[COClusterAliasManager setStopping:](self, "setStopping:", v11);
      COCoreLogForCategory(13);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 134218754;
        v17 = self;
        v18 = 2048;
        v19 = v8;
        v20 = 2112;
        v21 = v4;
        v22 = 2048;
        v23 = objc_msgSend(v11, "count");
        _os_log_impl(&dword_215E92000, v12, OS_LOG_TYPE_DEFAULT, "%p deactivating %p with %@ (%lu stopping)", (uint8_t *)&v16, 0x2Au);
      }

      -[COClusterAliasManager starting](self, "starting");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v4);

      if ((v14 & 1) != 0)
      {
        COCoreLogForCategory(13);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v16 = 134218498;
          v17 = self;
          v18 = 2048;
          v19 = v8;
          v20 = 2112;
          v21 = v4;
          _os_log_debug_impl(&dword_215E92000, v15, OS_LOG_TYPE_DEBUG, "%p deferring deactivation of %p with %@", (uint8_t *)&v16, 0x20u);
        }

      }
      else
      {
        -[NSObject stop](v8, "stop");
      }

    }
  }

}

- (void)_activateMeshWithClusterIdentifier:(id)a3 forClusters:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  COClusterAliasManager *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[COClusterAliasManager meshes](self, "meshes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    COCoreLogForCategory(13);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v21 = self;
      v22 = 2048;
      v23 = v10;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_215E92000, v11, OS_LOG_TYPE_DEFAULT, "%p found existing %p with %@ for %@ to activate", buf, 0x2Au);
    }

    goto LABEL_6;
  }
  -[COClusterAliasManager _prepareNewMeshWithClusterIdentifier:forClusters:](self, "_prepareNewMeshWithClusterIdentifier:forClusters:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
LABEL_6:
    -[COClusterAliasManager starting](self, "starting");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setByAddingObject:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[COClusterAliasManager setStarting:](self, "setStarting:", v13);
    COCoreLogForCategory(13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v21 = self;
      v22 = 2048;
      v23 = v10;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p activating %p with %@ for %@", buf, 0x2Au);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __72__COClusterAliasManager__activateMeshWithClusterIdentifier_forClusters___block_invoke;
    v16[3] = &unk_24D4B0E50;
    v16[4] = self;
    v17 = v6;
    v18 = v10;
    v19 = v7;
    v15 = v10;
    -[COClusterAliasManager _delegateNotifyActivatingMesh:withClusterIdentifier:forClusters:completion:](self, "_delegateNotifyActivatingMesh:withClusterIdentifier:forClusters:completion:", v15, v17, v19, v16);

    goto LABEL_9;
  }
  COCoreLogForCategory(13);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    v21 = self;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_error_impl(&dword_215E92000, v15, OS_LOG_TYPE_ERROR, "%p unable to activate with %@ for %@", buf, 0x20u);
  }
LABEL_9:

}

void __72__COClusterAliasManager__activateMeshWithClusterIdentifier_forClusters___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "starting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setStarting:", v3);
  objc_msgSend(*(id *)(a1 + 32), "stopping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "didStopMeshController:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    COCoreLogForCategory(13);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v11 = 134219010;
      v12 = v7;
      v13 = 2048;
      v14 = v9;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      v19 = 2048;
      v20 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p starting %p with %@ for %@ (%lu starting)", (uint8_t *)&v11, 0x34u);
    }

    objc_msgSend(*(id *)(a1 + 48), "start");
    objc_msgSend(*(id *)(a1 + 32), "_invokeWaitingBlocksForClusters:", *(_QWORD *)(a1 + 56));
  }

}

- (id)_prepareNewMeshWithClusterIdentifier:(id)a3 forClusters:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _COClusterAliasManagerStateTrackingAddOn *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  COCompanionLinkClientFactory *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v35;
  void *v36;
  _COClusterAliasManagerStateTrackingAddOn *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  COClusterAliasManager *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "options");
  -[COClusterAliasManager _providerRequestMesh](self, "_providerRequestMesh");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClusterOptions:", v11);
  objc_msgSend(v10, "globalServiceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGlobalServiceName:", v13);

  if (v12)
  {
    COCoreLogForCategory(13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      v44 = self;
      v45 = 2048;
      v46 = (uint64_t)v12;
      v47 = 2112;
      v48 = (uint64_t)v6;
      v49 = 2112;
      v50 = (uint64_t)v7;
      _os_log_impl(&dword_215E92000, v14, OS_LOG_TYPE_DEFAULT, "%p created %p with %@ for %@", buf, 0x2Au);
    }

    objc_msgSend(v12, "setMeshName:", v6);
    -[COClusterAliasManager _labelForClusters:](self, "_labelForClusters:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLabel:", v15);

    v16 = objc_alloc_init(_COClusterAliasManagerStateTrackingAddOn);
    -[_COClusterAliasManagerStateTrackingAddOn setAliasManager:](v16, "setAliasManager:", self);
    v37 = v16;
    objc_msgSend(v12, "addAddOn:", v16);
    -[COClusterAliasManager meshes](self, "meshes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v17;
    if (objc_msgSend(MEMORY[0x24BE19E30], "isSharedCompanionLinkClientEnabled"))
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v17, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v39;
        while (2)
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v39 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v22), "companionLinkClientFactory");
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = (COCompanionLinkClientFactory *)v23;

              goto LABEL_15;
            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          if (v20)
            continue;
          break;
        }
      }

      v24 = objc_alloc_init(COCompanionLinkClientFactory);
LABEL_15:
      objc_msgSend(v12, "setCompanionLinkClientFactory:", v24);

      v17 = v36;
    }
    v25 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v25, "setObject:forKey:", v12, v6);
    -[COClusterAliasManager setMeshes:](self, "setMeshes:", v25);
    COCoreLogForCategory(13);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(v25, "count");
      -[COClusterAliasManager starting](self, "starting");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v10;
      v29 = v7;
      v30 = v6;
      v31 = objc_msgSend(v27, "count");
      -[COClusterAliasManager stopping](self, "stopping");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");
      *(_DWORD *)buf = 134218752;
      v44 = self;
      v45 = 2048;
      v46 = v35;
      v47 = 2048;
      v48 = v31;
      v6 = v30;
      v7 = v29;
      v10 = v28;
      v49 = 2048;
      v50 = v33;
      _os_log_impl(&dword_215E92000, v26, OS_LOG_TYPE_DEFAULT, "%p now %lu meshes (%lu starting, %lu stopping)", buf, 0x2Au);

      v17 = v36;
    }

  }
  return v12;
}

- (void)didStopMeshController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "meshName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COClusterAliasManager dispatchQueue](self, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__COClusterAliasManager_didStopMeshController___block_invoke;
  block[3] = &unk_24D4B08D0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __47__COClusterAliasManager_didStopMeshController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "associations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  COCoreLogForCategory(13);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v15 = v7;
    v16 = 2048;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p deactivating stopped %p with %@ for %@", buf, 0x2Au);
  }

  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__COClusterAliasManager_didStopMeshController___block_invoke_19;
  v11[3] = &unk_24D4B08D0;
  v11[4] = v10;
  v12 = v8;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v10, "_delegateNotifyDeactivatingMesh:withClusterIdentifier:forClusters:completion:", v9, v12, v3, v11);

}

void __47__COClusterAliasManager_didStopMeshController___block_invoke_19(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "meshes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setMeshes:", v3);
  objc_msgSend(*(id *)(a1 + 32), "stopping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setStopping:", v5);
  COCoreLogForCategory(13);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(v3, "count");
    objc_msgSend(*(id *)(a1 + 32), "starting");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134219266;
    v13 = v9;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2048;
    v19 = v10;
    v20 = 2048;
    v21 = objc_msgSend(v11, "count");
    v22 = 2048;
    v23 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "%p removing deactivated %p with %@ (now %lu meshes, %lu starting, %lu stopping)", (uint8_t *)&v12, 0x3Eu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_applyUpdates");

}

- (id)_providerRequestMesh
{
  void *v3;
  void *v4;
  void *v5;

  -[COClusterAliasManager provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "aliasManagerRequestsNewMesh:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_delegateNotifyActivatingMesh:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  COClusterAliasManager *v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  _QWORD v26[4];
  id v27;
  id v28;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(location, self);
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __100__COClusterAliasManager__delegateNotifyActivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke;
  v26[3] = &unk_24D4B1478;
  objc_copyWeak(&v28, location);
  v15 = v13;
  v27 = v15;
  v16 = (void (**)(_QWORD))MEMORY[0x2199F3D40](v26);
  -[COClusterAliasManager delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[COClusterAliasManager delegateDispatchQueue](self, "delegateDispatchQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __100__COClusterAliasManager__delegateNotifyActivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke_2;
    v19[3] = &unk_24D4B0948;
    v20 = v17;
    v21 = self;
    v22 = v10;
    v23 = v11;
    v24 = v12;
    v25 = v16;
    dispatch_async(v18, v19);

  }
  else
  {
    v16[2](v16);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(location);

}

void __100__COClusterAliasManager__delegateNotifyActivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "dispatchQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 32));

    WeakRetained = v4;
  }

}

uint64_t __100__COClusterAliasManager__delegateNotifyActivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "aliasManager:activatingMesh:withClusterIdentifier:forClusters:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_delegateNotifyDeactivatingMesh:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  COClusterAliasManager *v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  _QWORD v26[4];
  id v27;
  id v28;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(location, self);
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __102__COClusterAliasManager__delegateNotifyDeactivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke;
  v26[3] = &unk_24D4B1478;
  objc_copyWeak(&v28, location);
  v15 = v13;
  v27 = v15;
  v16 = (void (**)(_QWORD))MEMORY[0x2199F3D40](v26);
  -[COClusterAliasManager delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[COClusterAliasManager delegateDispatchQueue](self, "delegateDispatchQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __102__COClusterAliasManager__delegateNotifyDeactivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke_2;
    v19[3] = &unk_24D4B0948;
    v20 = v17;
    v21 = self;
    v22 = v10;
    v23 = v11;
    v24 = v12;
    v25 = v16;
    dispatch_async(v18, v19);

  }
  else
  {
    v16[2](v16);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(location);

}

void __102__COClusterAliasManager__delegateNotifyDeactivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "dispatchQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 32));

    WeakRetained = v4;
  }

}

uint64_t __102__COClusterAliasManager__delegateNotifyDeactivatingMesh_withClusterIdentifier_forClusters_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "aliasManager:deactivatingMesh:withClusterIdentifier:forClusters:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (id)_labelForClusters:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[4];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "label");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }

  v11 = *MEMORY[0x24BE19C68];
  v31[0] = *MEMORY[0x24BE19C60];
  v31[1] = v11;
  v12 = *MEMORY[0x24BE19C58];
  v31[2] = *MEMORY[0x24BE19C50];
  v31[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
LABEL_10:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v17);
      if ((objc_msgSend(v4, "containsObject:", v18, (_QWORD)v22) & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v15)
          goto LABEL_10;
        goto LABEL_16;
      }
    }
    v19 = v18;

    if (v19)
      goto LABEL_19;
  }
  else
  {
LABEL_16:

  }
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_, (_QWORD)v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("|"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v19;
}

- (COClusterAliasManagerMeshProvider)provider
{
  return (COClusterAliasManagerMeshProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (COClusterAliasManagerDelegate)delegate
{
  return (COClusterAliasManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateDispatchQueue
{
  return self->_delegateDispatchQueue;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSDictionary)resolvers
{
  return self->_resolvers;
}

- (void)setResolvers:(id)a3
{
  objc_storeStrong((id *)&self->_resolvers, a3);
}

- (NSSet)resolving
{
  return self->_resolving;
}

- (void)setResolving:(id)a3
{
  objc_storeStrong((id *)&self->_resolving, a3);
}

- (NSDictionary)waiting
{
  return self->_waiting;
}

- (void)setWaiting:(id)a3
{
  objc_storeStrong((id *)&self->_waiting, a3);
}

- (NSDictionary)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_updates, a3);
}

- (NSDictionary)associations
{
  return self->_associations;
}

- (void)setAssociations:(id)a3
{
  objc_storeStrong((id *)&self->_associations, a3);
}

- (NSDictionary)meshes
{
  return self->_meshes;
}

- (void)setMeshes:(id)a3
{
  objc_storeStrong((id *)&self->_meshes, a3);
}

- (NSSet)starting
{
  return self->_starting;
}

- (void)setStarting:(id)a3
{
  objc_storeStrong((id *)&self->_starting, a3);
}

- (NSSet)stopping
{
  return self->_stopping;
}

- (void)setStopping:(id)a3
{
  objc_storeStrong((id *)&self->_stopping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopping, 0);
  objc_storeStrong((id *)&self->_starting, 0);
  objc_storeStrong((id *)&self->_meshes, 0);
  objc_storeStrong((id *)&self->_associations, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_waiting, 0);
  objc_storeStrong((id *)&self->_resolving, 0);
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_delegateDispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_provider);
}

void __45__COClusterAliasManager_stopTrackingCluster___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p not tracking %@");
  OUTLINED_FUNCTION_2_0();
}

void __61__COClusterAliasManager_waitForBootstrapOfCluster_withBlock___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215E92000, v0, v1, "%p no resolver for Cluster %@, invoking bootstrap block inline");
  OUTLINED_FUNCTION_2_0();
}

- (void)_deactivateMeshWithClusterIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_215E92000, log, OS_LOG_TYPE_DEBUG, "%p already deactivating %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

@end
