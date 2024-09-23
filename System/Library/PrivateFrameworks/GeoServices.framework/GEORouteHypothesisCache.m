@implementation GEORouteHypothesisCache

- (GEORouteHypothesisCache)init
{
  GEORouteHypothesisCache *v2;
  GEONavdCachePersistenceManager *v3;
  GEONavdCachePersistenceManager *persistenceManager;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORouteHypothesisCache;
  v2 = -[GEORouteHypothesisCache init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GEONavdCachePersistenceManager);
    persistenceManager = v2->_persistenceManager;
    v2->_persistenceManager = v3;

    +[GEOKeyBagNotification sharedObject](GEOKeyBagNotification, "sharedObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDataDidBecomeAvailableAfterFirstUnlockObserver:", v2);

  }
  return v2;
}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_DEBUG, "DB became available.  Notifying clients.", v4, 2u);
  }

  notify_post("com.apple.navd.wakeUpForHypothesisUpdate");
  notify_post("com.apple.navd.restarted");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GEORouteHypothesisCache;
  -[GEORouteHypothesisCache dealloc](&v4, sel_dealloc);
}

- (void)tearDown
{
  -[GEONavdCachePersistenceManager tearDown](self->_persistenceManager, "tearDown");
}

- (id)loadValueForKey:(id)a3
{
  -[GEONavdCachePersistenceManager readValueWithKey:](self->_persistenceManager, "readValueWithKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)loadEntryForRowId:(int64_t)a3
{
  return -[GEONavdCachePersistenceManager entryWithRowId:](self->_persistenceManager, "entryWithRowId:", a3);
}

- (void)saveValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138478083;
    v10 = v7;
    v11 = 2113;
    v12 = v6;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Saving value in the cache for key: %{private}@, value: %{private}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v6, "setRowId:", -[GEONavdCachePersistenceManager dumpToDiskWithKey:value:](self->_persistenceManager, "dumpToDiskWithKey:value:", v7, v6));
}

- (void)removeKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138477827;
    v11 = v6;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEBUG, "Removing key from the cache: %{private}@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v7, "monitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopMonitoring");

  -[GEONavdCachePersistenceManager deleteFromDiskWithKey:](self->_persistenceManager, "deleteFromDiskWithKey:", v6);
}

- (void)enumerateAllForCacheEntriesWithHandler:(id)a3
{
  -[GEONavdCachePersistenceManager enumerateAllForCacheEntriesWithHandler:](self->_persistenceManager, "enumerateAllForCacheEntriesWithHandler:", a3);
}

- (int64_t)numberOfEntriesOnDisk
{
  return -[GEONavdCachePersistenceManager numberOfEntries](self->_persistenceManager, "numberOfEntries");
}

- (double)nextRefreshTimeStamp
{
  double result;

  -[GEONavdCachePersistenceManager nextTimeStampForRefreshTimer](self->_persistenceManager, "nextTimeStampForRefreshTimer");
  return result;
}

- (id)descriptionOfAllEntries
{
  void *v3;
  GEONavdCachePersistenceManager *persistenceManager;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%lld items {\n"), -[GEORouteHypothesisCache numberOfEntriesOnDisk](self, "numberOfEntriesOnDisk"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  persistenceManager = self->_persistenceManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__GEORouteHypothesisCache_descriptionOfAllEntries__block_invoke;
  v7[3] = &unk_1E1C11FA0;
  v5 = v3;
  v8 = v5;
  -[GEONavdCachePersistenceManager enumerateAllEntriesWithHandler:](persistenceManager, "enumerateAllEntriesWithHandler:", v7);
  objc_msgSend(v5, "appendString:", CFSTR("}"));

  return v5;
}

void __50__GEORouteHypothesisCache_descriptionOfAllEntries__block_invoke(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringFromDate:dateStyle:timeStyle:", v8, 1, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@ Refresh at %@,\n"), v10, v9);

}

- (void)_removeAllEntries
{
  -[GEONavdCachePersistenceManager removeAllEntries](self->_persistenceManager, "removeAllEntries");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
}

@end
