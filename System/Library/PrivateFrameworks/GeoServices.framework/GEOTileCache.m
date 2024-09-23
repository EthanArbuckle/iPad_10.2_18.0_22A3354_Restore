@implementation GEOTileCache

- (id)tileForKey:(_QWORD *)a3
{
  std::mutex *v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;

  v5 = (std::mutex *)(*(_QWORD *)(a1 + 8) + 8);
  std::mutex::lock(v5);
  v6 = *(_QWORD *)(a1 + 8);
  v7 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((_QWORD *)(v6 + 96), a3);
  if (v7)
  {
    std::list<CacheItem>::splice(v6 + 72, *(uint64_t **)(v6 + 80), v6 + 72, (uint64_t *)v7[4]);
    v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 80) + 48);
  }
  else
  {
    v8 = 0;
  }
  std::mutex::unlock(v5);
  return v8;
}

- (void)setTile:(void *)a3 forKey:(_QWORD *)a4 cost:(uint64_t)a5
{
  std::mutex *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v9 = (std::mutex *)(a1[1] + 8);
  std::mutex::lock(v9);
  v10 = (_QWORD *)a1[1];
  v11 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>(v10 + 12, a4);
  if (v11)
  {
    v12 = v11[4];
    objc_storeStrong((id *)(v12 + 48), a3);
    GEOMachAbsoluteTimeGetCurrent();
    *(_QWORD *)(v12 + 32) = v13;
    *(_QWORD *)(a1[1] + 152) -= *(_QWORD *)(v12 + 40);
    *(_QWORD *)(a1[1] + 152) += a5;
    *(_QWORD *)(v12 + 40) = a5;
    std::list<CacheItem>::splice(a1[1] + 72, *(uint64_t **)(a1[1] + 80), a1[1] + 72, (uint64_t *)v12);
  }
  else
  {
    v16 = operator new(0x38uLL);
    v16[6] = 0;
    *((_OWORD *)v16 + 1) = 0u;
    *((_OWORD *)v16 + 2) = 0u;
    v17 = (_QWORD *)v10[10];
    v18 = v10[11];
    *v16 = v10 + 9;
    v16[1] = v17;
    *v17 = v16;
    v10[10] = v16;
    v10[11] = v18 + 1;
    v19 = *(_QWORD *)(a1[1] + 80);
    *(_OWORD *)(v19 + 16) = *(_OWORD *)a4;
    objc_storeStrong((id *)(v19 + 48), a3);
    GEOMachAbsoluteTimeGetCurrent();
    *(_QWORD *)(v19 + 32) = v20;
    *(_QWORD *)(v19 + 40) = a5;
    *(_QWORD *)(a1[1] + 152) += a5;
    ++*(_QWORD *)(a1[1] + 160);
  }
  v14 = a1[1];
  v15 = *(_QWORD *)(v14 + 80);
  std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((float *)(v14 + 96), a4, a4)[4] = v15;
  objc_msgSend(a1, "_evictWithMaxCost:maxCapacity:", *(_QWORD *)(a1[1] + 144), *(_QWORD *)(a1[1] + 136));
  std::mutex::unlock(v9);

}

- (void)_evictWithMaxCost:(unint64_t)a3 maxCapacity:(unint64_t)a4
{
  GEOTileCacheReserved *i;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t *v10;
  void *v11;
  GEOTileCacheReserved *reserved;
  uint64_t *v13;
  uint64_t v14;

  for (i = self->_reserved; *((_QWORD *)i + 11); i = self->_reserved)
  {
    if (*((_QWORD *)i + 19) <= a3 && *((_QWORD *)i + 20) <= a4)
      break;
    v8 = (_QWORD *)*((_QWORD *)i + 9);
    v9 = (_QWORD *)((char *)i + 96);
    v10 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((_QWORD *)i + 12, v8 + 2);
    if (v10)
      std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::erase(v9, v10);
    v11 = (void *)v8[6];
    v8[6] = 0;

    *((_QWORD *)self->_reserved + 19) -= v8[5];
    --*((_QWORD *)self->_reserved + 20);
    reserved = self->_reserved;
    v13 = (uint64_t *)*((_QWORD *)reserved + 9);
    v14 = *v13;
    *(_QWORD *)(v14 + 8) = v13[1];
    *(_QWORD *)v13[1] = v14;
    --*((_QWORD *)reserved + 11);

    operator delete(v13);
  }
}

- (void)setMaxCost:(unint64_t)a3
{
  std::mutex *v5;

  v5 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v5);
  *((_QWORD *)self->_reserved + 18) = a3;
  -[GEOTileCache _evictWithMaxCost:maxCapacity:](self, "_evictWithMaxCost:maxCapacity:", *((_QWORD *)self->_reserved + 18), *((_QWORD *)self->_reserved + 17));
  std::mutex::unlock(v5);
}

- (void)setMaxCapacity:(unint64_t)a3
{
  std::mutex *v5;

  v5 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v5);
  *((_QWORD *)self->_reserved + 17) = a3;
  -[GEOTileCache _evictWithMaxCost:maxCapacity:](self, "_evictWithMaxCost:maxCapacity:", *((_QWORD *)self->_reserved + 18), *((_QWORD *)self->_reserved + 17));
  std::mutex::unlock(v5);
}

- (GEOTileCache)init
{
  id v2;
  GEOTileCacheReserved *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  dispatch_source_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GEOTileCache;
  v2 = -[GEOTileCache init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GEOTileCacheReserved);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    *(_QWORD *)(*((_QWORD *)v2 + 1) + 136) = 64;
    *(_QWORD *)(*((_QWORD *)v2 + 1) + 144) = 0x200000;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Maps"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      v10 = CFSTR("MNApplicationDidEnterBackgroundNotification");
    else
      v10 = CFSTR("UIApplicationDidEnterBackgroundNotification");
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__enteredBackground_, v10, 0);

    v11 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, MEMORY[0x1E0C80D38]);
    v12 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v11;

    objc_initWeak(&location, v2);
    v13 = *((_QWORD *)v2 + 2);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __20__GEOTileCache_init__block_invoke;
    v15[3] = &unk_1E1C00650;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v13, v15);
    dispatch_activate(*((dispatch_object_t *)v2 + 2));
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (GEOTileCache *)v2;
}

void __20__GEOTileCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_receivedMemoryNotification");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GEOTileCache;
  -[GEOTileCache dealloc](&v4, sel_dealloc);
}

- (id)_description
{
  void *v3;
  GEOTileCacheReserved *reserved;
  char *v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; maxCost = %lu; maxCapacity = %lu; currentCost = %lu; currentCount = %lu;"),
    objc_opt_class(),
    self,
    *((_QWORD *)self->_reserved + 18),
    *((_QWORD *)self->_reserved + 17),
    *((_QWORD *)self->_reserved + 19),
    *((_QWORD *)self->_reserved + 20));
  reserved = self->_reserved;
  v5 = (char *)reserved + 72;
  v6 = *((_QWORD *)reserved + 10);
  if ((GEOTileCacheReserved *)v6 != (GEOTileCacheReserved *)((char *)reserved + 72))
  {
    do
    {
      v7 = *(_OWORD *)(v6 + 32);
      v12 = *(_OWORD *)(v6 + 16);
      v13 = v7;
      v14 = *(id *)(v6 + 48);
      GEOStringFromTileKey((char *)&v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v14;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)&v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\n    %@=>%@ (inserted: %@, cost: %lu)"), v8, v9, v10, *((_QWORD *)&v13 + 1));

      v6 = *(_QWORD *)(v6 + 8);
    }
    while ((char *)v6 != v5);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)description
{
  std::mutex *v3;
  void *v4;

  v3 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v3);
  -[GEOTileCache _description](self, "_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  std::mutex::unlock(v3);
  return v4;
}

- (void)_receivedMemoryNotification
{
  std::mutex *v3;

  v3 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v3);
  -[GEOTileCache _evictWithMaxCost:maxCapacity:](self, "_evictWithMaxCost:maxCapacity:", *((_QWORD *)self->_reserved + 18) >> 1, *((_QWORD *)self->_reserved + 17) >> 1);
  std::mutex::unlock(v3);
}

- (unint64_t)maxCapacity
{
  std::mutex *v3;
  unint64_t v4;

  v3 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v3);
  v4 = *((_QWORD *)self->_reserved + 17);
  std::mutex::unlock(v3);
  return v4;
}

- (unint64_t)maxCost
{
  std::mutex *v3;
  unint64_t v4;

  v3 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v3);
  v4 = *((_QWORD *)self->_reserved + 18);
  std::mutex::unlock(v3);
  return v4;
}

- (BOOL)containsKey:(_QWORD *)a3 cost:(_QWORD *)a4
{
  std::mutex *v7;
  _QWORD *v8;
  _BOOL8 v9;

  v7 = (std::mutex *)(*(_QWORD *)(a1 + 8) + 8);
  std::mutex::lock(v7);
  v8 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((_QWORD *)(*(_QWORD *)(a1 + 8) + 96), a3);
  if (a4 && v8)
    *a4 = *(_QWORD *)(v8[4] + 40);
  v9 = v8 != 0;
  std::mutex::unlock(v7);
  return v9;
}

- (void)_removeTileForKey:(_QWORD *)a3
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((_QWORD *)(*(_QWORD *)(a1 + 8) + 96), a3);
  if (v4)
  {
    v5 = v4;
    v6 = v4[4];
    v7 = *(void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 152) -= *(_QWORD *)(v6 + 40);
    --*(_QWORD *)(*(_QWORD *)(a1 + 8) + 160);
    v8 = *(_QWORD *)(a1 + 8);
    v9 = *(_QWORD *)v6;
    *(_QWORD *)(v9 + 8) = *(_QWORD *)(v6 + 8);
    **(_QWORD **)(v6 + 8) = v9;
    --*(_QWORD *)(v8 + 88);

    operator delete((void *)v6);
    std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::erase((_QWORD *)(*(_QWORD *)(a1 + 8) + 96), v5);
  }
}

- (void)removeTileForKey:(uint64_t)a3
{
  std::mutex *v5;

  v5 = (std::mutex *)(a1[1] + 8);
  std::mutex::lock(v5);
  objc_msgSend(a1, "_removeTileForKey:", a3);
  std::mutex::unlock(v5);
}

- (void)removeTilesWithKeys:(id)a3
{
  id v4;
  std::mutex *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v5);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[GEOTileCache _removeTileForKey:](self, "_removeTileForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  std::mutex::unlock(v5);
}

- (void)removeAllObjects
{
  std::mutex *v3;
  GEOTileCacheReserved *reserved;
  uint64_t *v5;
  uint64_t *i;
  GEOTileCacheReserved *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t j;

  v3 = (std::mutex *)((char *)self->_reserved + 8);
  std::mutex::lock(v3);
  reserved = self->_reserved;
  v5 = (uint64_t *)((char *)reserved + 72);
  for (i = (uint64_t *)*((_QWORD *)reserved + 10); i != v5; i = (uint64_t *)i[1])
    ;
  std::__list_imp<CacheItem>::clear(v5);
  v7 = self->_reserved;
  if (*((_QWORD *)v7 + 15))
  {
    v8 = (_QWORD *)*((_QWORD *)v7 + 14);
    if (v8)
    {
      do
      {
        v9 = (_QWORD *)*v8;
        operator delete(v8);
        v8 = v9;
      }
      while (v9);
    }
    *((_QWORD *)v7 + 14) = 0;
    v10 = *((_QWORD *)v7 + 13);
    if (v10)
    {
      for (j = 0; j != v10; ++j)
        *(_QWORD *)(*((_QWORD *)v7 + 12) + 8 * j) = 0;
    }
    *((_QWORD *)v7 + 15) = 0;
    v7 = self->_reserved;
  }
  *((_QWORD *)v7 + 19) = 0;
  *((_QWORD *)self->_reserved + 20) = 0;
  std::mutex::unlock(v3);
}

- (void)enumerate:(id)a3
{
  void (**v4)(id, _OWORD *, id, double);
  std::mutex *v5;
  GEOTileCacheReserved *reserved;
  char *v7;
  uint64_t v8;
  __int128 v9;
  id v10;
  _OWORD *v11;
  __int128 v12;
  id v13;
  uint64_t v14;
  uint64_t *i;
  __int128 v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _OWORD *, id, double))a3;
  if (v4)
  {
    v17 = &v17;
    v18 = (uint64_t *)&v17;
    v19 = 0;
    v5 = (std::mutex *)((char *)self->_reserved + 8);
    std::mutex::lock(v5);
    reserved = self->_reserved;
    v7 = (char *)reserved + 72;
    v8 = *((_QWORD *)reserved + 10);
    if ((GEOTileCacheReserved *)v8 != (GEOTileCacheReserved *)((char *)reserved + 72))
    {
      do
      {
        v9 = *(_OWORD *)(v8 + 32);
        v20 = *(_OWORD *)(v8 + 16);
        v21 = v9;
        v10 = *(id *)(v8 + 48);
        v11 = operator new(0x38uLL);
        v12 = v21;
        v11[1] = v20;
        v11[2] = v12;
        v13 = v10;
        *((_QWORD *)v11 + 6) = v13;
        v14 = (uint64_t)v17;
        *(_QWORD *)v11 = v17;
        *((_QWORD *)v11 + 1) = &v17;
        *(_QWORD *)(v14 + 8) = v11;
        v17 = v11;
        ++v19;

        v8 = *(_QWORD *)(v8 + 8);
      }
      while ((char *)v8 != v7);
    }
    std::mutex::unlock(v5);
    for (i = v18; i != (uint64_t *)&v17; i = (uint64_t *)i[1])
    {
      v16 = *((_OWORD *)i + 2);
      v20 = *((_OWORD *)i + 1);
      v21 = v16;
      v22 = (id)i[6];
      v4[2](v4, &v20, v22, *(double *)&v21);

    }
    std::__list_imp<CacheItem>::clear((uint64_t *)&v17);
  }

}

- (void)removeTilesMatchingPredicate:(id)a3
{
  id v4;
  id v5;
  std::mutex *v6;
  _QWORD *v7;
  uint64_t i;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t *, uint64_t);
  _QWORD *(*v16)(uint64_t);
  uint64_t v17;
  _QWORD v18[3];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x4812000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  v18[0] = v18;
  v18[1] = v18;
  v18[2] = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__GEOTileCache_removeTilesMatchingPredicate___block_invoke;
  v9[3] = &unk_1E1C00678;
  v5 = v4;
  v10 = v5;
  v11 = &v12;
  -[GEOTileCache enumerate:](self, "enumerate:", v9);
  if (v13[8])
  {
    v6 = (std::mutex *)((char *)self->_reserved + 8);
    std::mutex::lock(v6);
    v7 = v13 + 6;
    for (i = v13[7]; (_QWORD *)i != v7; i = *(_QWORD *)(i + 8))
    {
      v19 = *(_OWORD *)(i + 16);
      -[GEOTileCache _removeTileForKey:](self, "_removeTileForKey:", &v19);
    }
    std::mutex::unlock(v6);
  }

  _Block_object_dispose(&v12, 8);
  std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(v18);

}

void __45__GEOTileCache_removeTilesMatchingPredicate___block_invoke(uint64_t a1, _OWORD *a2, void *a3, double a4)
{
  uint64_t v7;
  _OWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if ((*(unsigned int (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a4))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = operator new(0x20uLL);
    v8[1] = *a2;
    v9 = *(_QWORD **)(v7 + 56);
    v10 = *(_QWORD *)(v7 + 64);
    *(_QWORD *)v8 = v7 + 48;
    *((_QWORD *)v8 + 1) = v9;
    *v9 = v8;
    *(_QWORD *)(v7 + 56) = v8;
    *(_QWORD *)(v7 + 64) = v10 + 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
}

- (unint64_t)currentCount
{
  return *((_QWORD *)self->_reserved + 20);
}

- (unint64_t)currentCost
{
  return *((_QWORD *)self->_reserved + 19);
}

@end
