@implementation CADDatabaseConnectionPoolManager

- (CADDatabaseConnectionPoolManager)init
{
  CADDatabaseConnectionPoolManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *purgeQueue;
  uint64_t v6;
  NSMutableDictionary *pools;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CADDatabaseConnectionPoolManager;
  v2 = -[CADDatabaseConnectionPoolManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.calendar.db_connection_purge", v3);
    purgeQueue = v2->_purgeQueue;
    v2->_purgeQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    pools = v2->_pools;
    v2->_pools = (NSMutableDictionary *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_databaseChangedExternally_, *MEMORY[0x1E0D0BE60], 0);

  }
  return v2;
}

- (id)poolForClient:(id)a3 options:(id)a4
{
  id v6;
  CADDatabasePoolKey *v7;
  CADDatabasePoolKey *v8;
  CADDatabaseSingleConnectionProvider *v9;
  NSObject *v10;
  CADDatabaseConnectionPool *v11;
  void *v12;
  int v14;
  CADDatabasePoolKey *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (CADDatabasePoolKey *)a4;
  if ((-[CADDatabasePoolKey databaseInitOptions](v7, "databaseInitOptions") & 0x20) != 0)
  {
    v9 = -[CADDatabaseSingleConnectionProvider initWithConfiguration:]([CADDatabaseSingleConnectionProvider alloc], "initWithConfiguration:", v7);
    v8 = v7;
  }
  else
  {
    v8 = -[CADDatabasePoolKey initWithInitializationOptions:]([CADDatabasePoolKey alloc], "initWithInitializationOptions:", v7);

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", v8);
    v9 = (CADDatabaseSingleConnectionProvider *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        v14 = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_DEBUG, "Creating a new pool for %@", (uint8_t *)&v14, 0xCu);
      }
      v11 = [CADDatabaseConnectionPool alloc];
      -[CADDatabasePoolKey options](v8, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CADDatabaseConnectionPool initWithOptions:manager:](v11, "initWithOptions:manager:", v12, self);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pools, "setObject:forKeyedSubscript:", v9, v8);
    }
    -[CADDatabaseSingleConnectionProvider addClient:](v9, "addClient:", v6);
    os_unfair_lock_unlock(&self->_lock);
  }

  return v9;
}

- (void)schedulePurge
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *purgeQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_purgeScheduled)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_purgeScheduled = 1;
    os_unfair_lock_unlock(p_lock);
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v9 = 0x4044000000000000;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEBUG, "Scheduling a purge for %f seconds", buf, 0xCu);
    }
    v5 = dispatch_time(0, 40000000000);
    purgeQueue = self->_purgeQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CADDatabaseConnectionPoolManager_schedulePurge__block_invoke;
    block[3] = &unk_1E6A373A8;
    block[4] = self;
    dispatch_after(v5, purgeQueue, block);
  }
}

uint64_t __49__CADDatabaseConnectionPoolManager_schedulePurge__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeAndReschedule");
}

- (void)_purgeAndReschedule
{
  uint64_t v3;
  uint64_t v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *purgeQueue;
  NSObject *v20;
  _QWORD block[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  double v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = CalApproximateContinuousTime();
  v4 = CalNSTimeIntervalToContinuousInterval();
  v26 = xmmword_1B6A8C610;
  os_unfair_lock_lock(&self->_lock);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_pools;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = v3 - v4;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "purgeConnectionsLastUsedPriorTo:stats:", v8, &v26);

        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    }
    while (v7);
  }

  v12 = CalApproximateContinuousTime();
  v13 = *((_QWORD *)&v26 + 1);
  self->_purgeScheduled = *((_QWORD *)&v26 + 1) < v12;
  os_unfair_lock_unlock(&self->_lock);
  if (v13 >= v12)
  {
    v20 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v28 = v26;
      v29 = 1024;
      v30 = DWORD1(v26);
      _os_log_impl(&dword_1B6A18000, v20, OS_LOG_TYPE_INFO, "Purged %i unused connections (%i remain.) Not scheduling another purge because no old pools remain", buf, 0xEu);
    }
  }
  else
  {
    CalContinuousIntervalToNSTimeInterval();
    v15 = 20.0 - v14 + 20.0;
    if (v15 >= 0.0)
      v16 = v15;
    else
      v16 = 0.0;
    v17 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      v28 = v26;
      v29 = 1024;
      v30 = DWORD1(v26);
      v31 = 2048;
      v32 = v16;
      _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_INFO, "Purged %i unused connections (%i remain.) Scheduling another check in %f seconds", buf, 0x18u);
    }
    v18 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    purgeQueue = self->_purgeQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__CADDatabaseConnectionPoolManager__purgeAndReschedule__block_invoke;
    block[3] = &unk_1E6A373A8;
    block[4] = self;
    dispatch_after(v18, purgeQueue, block);
  }
}

uint64_t __55__CADDatabaseConnectionPoolManager__purgeAndReschedule__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeAndReschedule");
}

- (void)databaseChangedExternally:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("auxDBID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if ((objc_msgSend(v5, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("/"));
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary allValues](self->_pools, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "databaseChangedExternally:auxDatabaseID:", v5, v7, (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)returnPool:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  id v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  os_unfair_lock_s *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(v8, "removeClient:", v7);
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (!objc_msgSend(v8, "numberOfClients"))
    {
      v18 = &self->_lock;
      v19 = v8;
      v10 = (void *)objc_opt_new();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = self->_pools;
      v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v21 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_pools, "objectForKeyedSubscript:", v16, v18, v19, (_QWORD)v20);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v17, "numberOfClients"))
              objc_msgSend(v10, "addObject:", v16);

          }
          v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v13);
      }

      -[NSMutableDictionary removeObjectsForKeys:](self->_pools, "removeObjectsForKeys:", v10);
      p_lock = v18;
      v8 = v19;
    }
    os_unfair_lock_unlock(p_lock);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeQueue, 0);
  objc_storeStrong((id *)&self->_pools, 0);
}

@end
