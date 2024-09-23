@implementation PHBatchFetchingArray

- (PHBatchFetchingArray)initWithOIDs:(id)a3 options:(id)a4 dataSource:(id)a5
{
  id v10;
  id v11;
  id v12;
  PHBatchFetchingArray *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PHBatchFetchingArrayFetchedClass *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  PHBatchFetchingArrayFetchedClass *v22;
  PHBatchFetchingArrayFetchedClass *overridenFetchResultClass;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t count;
  unint64_t v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *uuidsQueue;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSCache *cache;
  void *v39;
  objc_super v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v40.receiver = self;
  v40.super_class = (Class)PHBatchFetchingArray;
  v13 = -[PHBatchFetchingArray init](&v40, sel_init);
  if (!v13)
    goto LABEL_31;
  if (!v12 && objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PHBatchFetchingArray.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSource || oids.count == 0"));

  }
  v13->_cacheLock._os_unfair_lock_opaque = 0;
  v13->_lastBatchLock._os_unfair_lock_opaque = 0;
  objc_storeStrong((id *)&v13->_oids, a3);
  objc_storeStrong((id *)&v13->_dataSource, a5);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("propertyHint"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    v16 = objc_msgSend(v14, "integerValue");
  else
    v16 = 2;
  v13->_propertyHint = v16;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fetchedObjectBatchPropertySetClass"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = [PHBatchFetchingArrayFetchedClass alloc];
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fetchedObjectBatchPropertySetClass"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PHBatchFetchingArrayFetchedClass initWithFetchedPropertySetClass:](v18, "initWithFetchedPropertySetClass:", v19);
LABEL_12:
    overridenFetchResultClass = v13->_overridenFetchResultClass;
    v13->_overridenFetchResultClass = (PHBatchFetchingArrayFetchedClass *)v20;

    goto LABEL_13;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fetchedObjectClass"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = [PHBatchFetchingArrayFetchedClass alloc];
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fetchedObjectClass"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PHBatchFetchingArrayFetchedClass initWithFetchedObjectClass:](v22, "initWithFetchedObjectClass:", v19);
    goto LABEL_12;
  }
LABEL_13:
  v24 = -[NSArray count](v13->_oids, "count");
  v13->_count = v24;
  if (v24)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("batchSize"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "unsignedIntegerValue");

    count = 200;
    if (v26)
      count = v26;
    if (count >= v13->_count)
      count = v13->_count;
    v13->_batchSize = count;
    v28 = (v13->_count - 1) / count;
    v13->_lastBatchIndex = 0x7FFFFFFFFFFFFFFFLL;
    v29 = dispatch_queue_create("com.apple.batchFetchingArray", 0);
    uuidsQueue = v13->_uuidsQueue;
    v13->_uuidsQueue = (OS_dispatch_queue *)v29;

    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("cacheSize"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
        v33 = objc_msgSend(v31, "unsignedIntegerValue");
      else
        v33 = 10000;
      v34 = v13->_count;
      if (v33 < v34)
        v34 = v33;
      if (v34)
        v35 = (v34 - 1) / v13->_batchSize + 1;
      else
        v35 = 0;
      v36 = objc_opt_new();
      cache = v13->_cache;
      v13->_cache = (NSCache *)v36;

      -[NSCache setEvictsObjectsWithDiscardedContent:](v13->_cache, "setEvictsObjectsWithDiscardedContent:", 0);
      -[NSCache setCountLimit:](v13->_cache, "setCountLimit:", v35);
      if (!-[PHBatchFetchingArrayFetchedClass fetchedPropertySetClass](v13->_overridenFetchResultClass, "fetchedPropertySetClass"))+[PHSafeNSCacheDelegateReflector setDelegate:forCache:](PHSafeNSCacheDelegateReflector, "setDelegate:forCache:", v13, v13->_cache);

    }
  }

LABEL_31:
  return v13;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSArray)oids
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

id __67__PHBatchFetchingArray__batchForBatchNumber_shouldUpdateLastBatch___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_fetchObjectsInBatchNumber:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_fetchObjectsInBatchNumber:(unint64_t)a3
{
  unint64_t batchSize;
  unint64_t v5;
  unint64_t v6;
  unint64_t count;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  int v26;
  void *v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  batchSize = self->_batchSize;
  v5 = batchSize * a3;
  v6 = batchSize * a3 + batchSize;
  if (v6 >= self->_count)
    count = self->_count;
  else
    count = v6;
  -[PHBatchFetchingArray oids](self, "oids");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = count - v5;
  objc_msgSend(v8, "subarrayWithRange:", v5, count - v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (kdebug_is_enabled())
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_msgSend(v14, "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PLPhotoKitGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_id_generate(v17);
    v19 = v17;
    v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      v21 = self->_count;
      v26 = 138413058;
      v27 = v16;
      v28 = 2048;
      v29 = v5;
      v30 = 2048;
      v31 = v9;
      v32 = 2048;
      v33 = v21;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "FetchObjects", "Entity: %@, range location: %tu, length: %tu, count: %tu", (uint8_t *)&v26, 0x2Au);
    }

  }
  else
  {
    v20 = 0;
    v18 = 0;
  }
  -[PHBatchFetchingArray _phObjectsForOIDs:](self, "_phObjectsForOIDs:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (kdebug_is_enabled())
  {
    v23 = v20;
    v24 = v23;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v24, OS_SIGNPOST_INTERVAL_END, v18, "FetchObjects", ", (uint8_t *)&v26, 2u);
    }

  }
  return v22;
}

- (id)_phObjectsForOIDs:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  PHBatchFetchingArrayDataSource *dataSource;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  PHBatchFetchingArray *v17;
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v6 = -[PHBatchFetchingArrayFetchedClass fetchedPropertySetClass](self->_overridenFetchResultClass, "fetchedPropertySetClass");
    dataSource = self->_dataSource;
    if (v6)
      -[PHBatchFetchingArrayDataSource bfa_fetchedObjectsForOIDs:propertySetClass:](dataSource, "bfa_fetchedObjectsForOIDs:propertySetClass:", v4, -[PHBatchFetchingArrayFetchedClass fetchedPropertySetClass](self->_overridenFetchResultClass, "fetchedPropertySetClass"));
    else
      -[PHBatchFetchingArrayDataSource bfa_fetchObjectsForOIDs:propertyHint:overrideResultsWithClass:](dataSource, "bfa_fetchObjectsForOIDs:propertyHint:overrideResultsWithClass:", v4, self->_propertyHint, -[PHBatchFetchingArrayFetchedClass fetchedObjectClass](self->_overridenFetchResultClass, "fetchedObjectClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[PHBatchFetchingArray _prepareObjectsByOIDsFromOIDsToFetch:andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects:](self, "_prepareObjectsByOIDsFromOIDsToFetch:andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__PHBatchFetchingArray__phObjectsForOIDs___block_invoke;
  v15[3] = &unk_1E35DE7C8;
  v16 = v9;
  v17 = self;
  v10 = v5;
  v18 = v10;
  v11 = v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);
  v12 = v18;
  v13 = v10;

  return v13;
}

- (id)_prepareObjectsByOIDsFromOIDsToFetch:(id)a3 andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  PHBatchFetchingArrayDataSource *dataSource;
  void *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  PHBatchFetchingArray *v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  if (v9 < objc_msgSend(v6, "count")
    && -[PHBatchFetchingArray _shouldRetrieveRestrictedAssetOIDsWithSample:](self, "_shouldRetrieveRestrictedAssetOIDsWithSample:", v6))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v6);
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __121__PHBatchFetchingArray__prepareObjectsByOIDsFromOIDsToFetch_andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects___block_invoke;
    v31 = &unk_1E35DF9E8;
    v32 = self;
    v11 = v10;
    v33 = v11;
    pl_dispatch_sync();

  }
  else
  {
    v11 = 0;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "objectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v17, v18);
        objc_msgSend(v11, "removeObject:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v11, "count"))
  {
    dataSource = self->_dataSource;
    objc_msgSend(v11, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHBatchFetchingArrayDataSource bfa_fetchUUIDsForRestrictedOIDs:](dataSource, "bfa_fetchUUIDsForRestrictedOIDs:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v23 = v21;
      pl_dispatch_sync();

    }
  }

  return v8;
}

- (NSSet)oidsSet
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  if (self->_count)
  {
    v4 = 0;
    v5 = &v4;
    v6 = 0x3032000000;
    v7 = __Block_byref_object_copy__38949;
    v8 = __Block_byref_object_dispose__38950;
    v9 = 0;
    pl_dispatch_sync();
    v2 = (id)v5[5];
    _Block_object_dispose(&v4, 8);

    return (NSSet *)v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t count;
  unint64_t v9;
  unint64_t v10;
  unint64_t result;

  var0 = a3->var0;
  if (!a3->var0)
    a3->var2 = (unint64_t *)&a3->var2;
  count = self->_count;
  v9 = var0 + a5 - count;
  if (var0 + a5 < count)
    v9 = 0;
  v10 = a5 - v9;
  if (a5 == v9)
    return 0;
  result = -[PHBatchFetchingArray _populateObjectBuffer:range:](self, "_populateObjectBuffer:range:", a4, var0, a5 - v9);
  a3->var0 = v10 + var0;
  a3->var1 = a4;
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t count;
  void *v4;

  count = self->_count;
  if (count <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%p: index (%lu) beyond bounds (%lu)"), self, a3, count);
    v4 = 0;
  }
  else
  {
    -[PHBatchFetchingArray _phObjectAtIndex:](self, "_phObjectAtIndex:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (unint64_t)_populateObjectBuffer:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  __CFArray *Mutable;
  void *v9;
  CFIndex Count;
  CFRange v12;

  length = a4.length;
  location = a4.location;
  Mutable = CFArrayCreateMutable(0, a4.length, MEMORY[0x1E0C9B378]);
  if (location < location + length)
  {
    do
    {
      -[PHBatchFetchingArray _phObjectAtIndex:](self, "_phObjectAtIndex:", location);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CFArrayAppendValue(Mutable, v9);

      ++location;
      --length;
    }
    while (length);
  }
  Count = CFArrayGetCount(Mutable);
  v12.location = 0;
  v12.length = Count;
  CFArrayGetValues(Mutable, v12, (const void **)a3);
  CFAutorelease(Mutable);
  return Count;
}

- (id)_phObjectAtIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;

  v5 = a3 / self->_batchSize;
  -[PHBatchFetchingArray _batchForBatchNumber:shouldUpdateLastBatch:](self, "_batchForBatchNumber:shouldUpdateLastBatch:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3 - self->_batchSize * v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_batchForBatchNumber:(unint64_t)a3 shouldUpdateLastBatch:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_lastBatchLock;
  PHBatchFetchingArray *v7;
  unint64_t lastBatchIndex;
  NSArray *v9;
  NSCache *cache;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSCache *v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;
  os_unfair_lock_s *v19;
  PHBatchFetchingArray *v20;
  NSArray *lastBatch;
  _QWORD v23[4];
  id v24[2];
  id location;

  v4 = a4;
  p_lastBatchLock = &self->_lastBatchLock;
  v7 = self;
  os_unfair_lock_lock(p_lastBatchLock);
  lastBatchIndex = v7->_lastBatchIndex;
  v9 = v7->_lastBatch;
  os_unfair_lock_unlock(&v7->_lastBatchLock);

  if (lastBatchIndex == a3)
  {
    if (v9)
      return v9;
  }
  else
  {

  }
  os_unfair_lock_lock(&v7->_cacheLock);
  cache = v7->_cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](cache, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_initWeak(&location, v7);

    v14 = objc_alloc(MEMORY[0x1E0D73248]);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __67__PHBatchFetchingArray__batchForBatchNumber_shouldUpdateLastBatch___block_invoke;
    v23[3] = &unk_1E35DE7F0;
    objc_copyWeak(v24, &location);
    v24[1] = (id)a3;
    v12 = (void *)objc_msgSend(v14, "initWithBlock:", v23);
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    v15 = v7->_cache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](v15, "setObject:forKey:", v12, v16);

  }
  os_unfair_lock_unlock(&v7->_cacheLock);
  objc_msgSend(v12, "objectValue");
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v4)
  {
    v18 = v17;
    v19 = &v7->_lastBatchLock;
    v20 = v7;
    os_unfair_lock_lock(v19);
    v20->_lastBatchIndex = a3;
    lastBatch = v20->_lastBatch;
    v20->_lastBatch = v18;

    os_unfair_lock_unlock(&v20->_lastBatchLock);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSCache setDelegate:](self->_cache, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PHBatchFetchingArray;
  -[PHBatchFetchingArray dealloc](&v3, sel_dealloc);
}

void __31__PHBatchFetchingArray_oidsSet__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(v2 + 8));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __42__PHBatchFetchingArray__phObjectsForOIDs___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  _QWORD *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (objc_msgSend(*((id *)a1[5] + 13), "fetchedPropertySetClass"))
    {
      v5 = objc_alloc((Class)objc_msgSend(*((id *)a1[5] + 13), "fetchedPropertySetClass"));
      objc_msgSend(a1[5], "photoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v5, "initWithObjectID:knownKeysDictionary:photoLibrary:", v3, 0, v6);

    }
    else
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__38949;
      v21 = __Block_byref_object_dispose__38950;
      v22 = 0;
      v7 = v3;
      v16 = v7;
      pl_dispatch_sync();
      v8 = v18[5];
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUIDString");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v18[5];
        v18[5] = v10;

        PLPhotoKitGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = a1[5];
          v14 = v13[6];
          v15 = v18[5];
          *(_DWORD *)buf = 134218754;
          v24 = v13;
          v25 = 2112;
          v26 = v14;
          v27 = 2112;
          v28 = v7;
          v29 = 2112;
          v30 = v15;
          _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_INFO, "BFA %p with NSCache %@: could not find tombstone UUID for objectID: %@, using: %@", buf, 0x2Au);
        }

        v8 = v18[5];
      }
      objc_msgSend(*((id *)a1[5] + 3), "bfa_tombstoneObjectForOID:uuid:propertyHint:overrideResultsWithClass:", v7, v8, *((_QWORD *)a1[5] + 14), objc_msgSend(*((id *)a1[5] + 13), "fetchedObjectClass"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v17, 8);
    }
  }
  objc_msgSend(a1[6], "addObject:", v4);

}

- (unint64_t)indexOfObject:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  _objectIDForObject(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PHBatchFetchingArray oids](self, "oids");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", v4);

  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridenFetchResultClass, 0);
  objc_storeStrong((id *)&self->_uuidsByOIDs, 0);
  objc_storeStrong((id *)&self->_uuidsQueue, 0);
  objc_storeStrong((id *)&self->_lastBatch, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_oidsSet, 0);
  objc_storeStrong((id *)&self->_oids, 0);
}

- (PHBatchFetchingArray)initWithObjects:(id)a3 options:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PHBatchFetchingArray *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "objectID", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  v18 = -[PHBatchFetchingArray initWithOIDs:options:dataSource:](self, "initWithOIDs:options:dataSource:", v11, v9, v10);
  return v18;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This array is truly immutable"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%p) of %lu items"), v5, self, self->_count);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  if (self->_count)
    -[PHBatchFetchingArray _populateObjectBuffer:range:](self, "_populateObjectBuffer:range:", a3, a4.location, a4.length);
}

- (BOOL)containsObject:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  _objectIDForObject(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PHBatchFetchingArray oids](self, "oids");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  unint64_t v9;

  length = a4.length;
  location = a4.location;
  _objectIDForObject(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PHBatchFetchingArray oids](self, "oids");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:inRange:", v7, location, length);

  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (id)subarrayWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSCache *cache;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PHBatchFetchingArray *v12;
  void *v13;
  void *v14;
  PHBatchFetchingArray *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  length = a3.length;
  location = a3.location;
  v18[3] = *MEMORY[0x1E0C80C00];
  cache = self->_cache;
  if (cache)
    v7 = self->_batchSize * -[NSCache countLimit](cache, "countLimit");
  else
    v7 = 10000;
  v17[0] = CFSTR("batchSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PHBatchFetchingArray batchSize](self, "batchSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v17[1] = CFSTR("propertyHint");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_propertyHint);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v17[2] = CFSTR("cacheSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PHBatchFetchingArray alloc];
  -[PHBatchFetchingArray oids](self, "oids");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subarrayWithRange:", location, length);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PHBatchFetchingArray initWithOIDs:options:dataSource:](v12, "initWithOIDs:options:dataSource:", v14, v11, self->_dataSource);

  return v15;
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)-[PHBatchFetchingArrayDataSource bfa_photoLibrary](self->_dataSource, "bfa_photoLibrary");
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (BOOL)_shouldRetrieveRestrictedAssetOIDsWithSample:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "count")
    && (-[PHBatchFetchingArrayDataSource bfa_supportsPrivacyRestrictionsForOIDs:](self->_dataSource, "bfa_supportsPrivacyRestrictionsForOIDs:", v4) & 1) != 0;

  return v5;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  -[PHBatchFetchingArray _rememberUUIDsForBatch:](self, "_rememberUUIDsForBatch:", a4);
}

- (void)_rememberUUIDsForBatch:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v13 = v4;
  pl_dispatch_async();

}

- (void)test_evictBatchNumber:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSCache removeObjectForKey:](self->_cache, "removeObjectForKey:", v4);

}

- (void)test_invalidateUUIDCache
{
  pl_dispatch_async();
}

- (unint64_t)test_lastBatchIndex
{
  os_unfair_lock_s *p_lastBatchLock;
  unint64_t lastBatchIndex;

  p_lastBatchLock = &self->_lastBatchLock;
  os_unfair_lock_lock(&self->_lastBatchLock);
  lastBatchIndex = self->_lastBatchIndex;
  os_unfair_lock_unlock(p_lastBatchLock);
  return lastBatchIndex;
}

- (void)prefetchObjectsAtIndexes:(id)a3
{
  id v4;
  NSCache *cache;
  _QWORD v6[6];
  BOOL v7;
  _QWORD v8[4];

  v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  cache = self->_cache;
  v8[3] = -1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PHBatchFetchingArray_prefetchObjectsAtIndexes___block_invoke;
  v6[3] = &unk_1E35DE818;
  v6[4] = self;
  v6[5] = v8;
  v7 = cache == 0;
  objc_msgSend(v4, "enumerateRangesUsingBlock:", v6);
  _Block_object_dispose(v8, 8);

}

_QWORD *__49__PHBatchFetchingArray_prefetchObjectsAtIndexes___block_invoke(_QWORD *result, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  _QWORD *v9;

  v3 = *(_QWORD *)(result[4] + 96);
  v4 = a2 / v3;
  v5 = (a3 + a2 - 1) / v3;
  v6 = *(_QWORD *)(result[5] + 8);
  v7 = *(_QWORD *)(v6 + 24);
  if (v4 <= v7)
    v8 = *(_QWORD *)(v6 + 24);
  else
    v8 = v4;
  if (v8 <= v5)
  {
    v9 = result;
    do
      result = (id)objc_msgSend((id)v9[4], "_batchForBatchNumber:shouldUpdateLastBatch:", v8, *((unsigned __int8 *)v9 + 48));
    while (v8++ != v5);
    v6 = *(_QWORD *)(v9[5] + 8);
    v7 = *(_QWORD *)(v6 + 24);
  }
  if (v7 <= v5 + 1)
    v7 = v5 + 1;
  *(_QWORD *)(v6 + 24) = v7;
  return result;
}

uint64_t __48__PHBatchFetchingArray_test_invalidateUUIDCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeAllObjects");
}

uint64_t __47__PHBatchFetchingArray__rememberUUIDsForBatch___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  }
  return objc_msgSend(v2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

void __121__PHBatchFetchingArray__prepareObjectsByOIDsFromOIDsToFetch_andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v2, "allKeys");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "minusSet:", v5);

  }
}

uint64_t __121__PHBatchFetchingArray__prepareObjectsByOIDsFromOIDsToFetch_andUpdateUUIDsByOIDsForRestrictedObjectsUsingFetchedObjects___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  }
  return objc_msgSend(v2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

void __42__PHBatchFetchingArray__phObjectsForOIDs___block_invoke_71(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 88), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end
