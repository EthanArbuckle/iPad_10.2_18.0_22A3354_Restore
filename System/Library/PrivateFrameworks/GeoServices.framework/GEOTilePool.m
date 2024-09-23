@implementation GEOTilePool

- (GEOTileData)tileForKey:(_QWORD *)a3
{
  GEOTileData *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id to;

  objc_msgSend(*(id *)(a1 + 336), "tileForKey:");
  v5 = (GEOTileData *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    std::mutex::lock((std::mutex *)(a1 + 16));
    v6 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((_QWORD *)(a1 + 104), a3);
    if (v6)
    {
      std::list<CacheItem>::splice(a1 + 80, *(uint64_t **)(a1 + 88), a1 + 80, (uint64_t *)v6[4]);
      objc_copyWeak(&to, (id *)(*(_QWORD *)(a1 + 88) + 48));
    }
    else
    {
      to = 0;
    }
    std::mutex::unlock((std::mutex *)(a1 + 16));
    v5 = (GEOTileData *)objc_loadWeakRetained(&to);
    objc_storeWeak(&to, 0);
    objc_destroyWeak(&to);
    if (!v5)
    {
      std::mutex::lock((std::mutex *)(a1 + 176));
      v7 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((_QWORD *)(a1 + 264), a3);
      if (v7)
      {
        std::list<CacheItem>::splice(a1 + 240, *(uint64_t **)(a1 + 248), a1 + 240, (uint64_t *)v7[4]);
        v8 = *(_QWORD *)(a1 + 248);
        v9 = *(_QWORD *)(v8 + 40);
        objc_copyWeak(&to, (id *)(v8 + 48));
      }
      else
      {
        v9 = 0;
        to = 0;
      }
      std::mutex::unlock((std::mutex *)(a1 + 176));
      v10 = objc_loadWeakRetained(&to);
      objc_storeWeak(&to, 0);
      objc_destroyWeak(&to);
      if (v10)
      {
        v5 = -[GEOTileData initWithDecodedRepresentation:]([GEOTileData alloc], "initWithDecodedRepresentation:", v10);
        objc_msgSend((id)a1, "setTile:forKey:cost:", v5, a3, v9);
      }
      else
      {
        v5 = 0;
      }

    }
  }
  return v5;
}

- (void)setTile:(void *)a3 forKey:(_QWORD *)a4 cost:(uint64_t)a5
{
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64x2_t v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64x2_t v30;
  id v31;
  id location;

  v8 = a3;
  objc_initWeak(&location, v8);
  std::mutex::lock((std::mutex *)(a1 + 16));
  v9 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((_QWORD *)(a1 + 104), a4);
  if (v9)
  {
    v10 = v9[4];
    *(_QWORD *)(a1 + 160) += a5 - *(_QWORD *)(v10 + 40);
    GEOMachAbsoluteTimeGetCurrent();
    *(_QWORD *)(v10 + 32) = v11;
    geo::_geo_weak_ptr<GEOTileData * {__strong}>::operator=((id *)(v10 + 48), &location);
    *(_QWORD *)(v10 + 40) = a5;
    std::list<CacheItem>::splice(a1 + 80, *(uint64_t **)(a1 + 88), a1 + 80, (uint64_t *)v10);
    v12 = *(_QWORD *)(a1 + 88);
    std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<_GEOTileKey>,std::hash<_GEOTileKey>,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((float *)(a1 + 104), a4, a4)[4] = v12;
  }
  else
  {
    v13 = operator new(0x38uLL);
    *((_OWORD *)v13 + 2) = 0u;
    *((_QWORD *)v13 + 6) = 0;
    *(_OWORD *)v13 = 0u;
    *((_OWORD *)v13 + 1) = 0u;
    v14 = *(_QWORD **)(a1 + 88);
    *(_QWORD *)v13 = a1 + 80;
    *((_QWORD *)v13 + 1) = v14;
    *v14 = v13;
    v15 = *(_QWORD *)(a1 + 96) + 1;
    *(_QWORD *)(a1 + 88) = v13;
    *(_QWORD *)(a1 + 96) = v15;
    *((_OWORD *)v13 + 1) = *(_OWORD *)a4;
    *((_QWORD *)v13 + 5) = a5;
    geo::_geo_weak_ptr<GEOTileData * {__strong}>::operator=((id *)v13 + 6, &location);
    GEOMachAbsoluteTimeGetCurrent();
    *((_QWORD *)v13 + 4) = v16;
    v17 = *(_QWORD *)(a1 + 88);
    std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<_GEOTileKey>,std::hash<_GEOTileKey>,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,GEOTileData * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((float *)(a1 + 104), a4, a4)[4] = v17;
    v18 = vdupq_n_s64(1uLL);
    v18.i64[0] = a5;
    *(int64x2_t *)(a1 + 160) = vaddq_s64(*(int64x2_t *)(a1 + 160), v18);
  }
  std::mutex::unlock((std::mutex *)(a1 + 16));
  objc_msgSend(v8, "decodedRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v8, "decodedRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&v31, v20);

    std::mutex::lock((std::mutex *)(a1 + 176));
    v21 = std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,hashkey,eqkey,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>,eqkey,hashkey,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<CacheItem,void *>>>>::find<_GEOTileKey>((_QWORD *)(a1 + 264), a4);
    if (v21)
    {
      v22 = v21[4];
      *(_QWORD *)(a1 + 320) += a5 - *(_QWORD *)(v22 + 40);
      GEOMachAbsoluteTimeGetCurrent();
      *(_QWORD *)(v22 + 32) = v23;
      geo::_geo_weak_ptr<GEOTileData * {__strong}>::operator=((id *)(v22 + 48), &v31);
      *(_QWORD *)(v22 + 40) = a5;
      std::list<CacheItem>::splice(a1 + 240, *(uint64_t **)(a1 + 248), a1 + 240, (uint64_t *)v22);
      v24 = *(_QWORD *)(a1 + 248);
      std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<_GEOTileKey>,std::hash<_GEOTileKey>,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((float *)(a1 + 264), a4, a4)[4] = v24;
    }
    else
    {
      v25 = operator new(0x38uLL);
      *((_OWORD *)v25 + 2) = 0u;
      *((_QWORD *)v25 + 6) = 0;
      *(_OWORD *)v25 = 0u;
      *((_OWORD *)v25 + 1) = 0u;
      v26 = *(_QWORD **)(a1 + 248);
      *(_QWORD *)v25 = a1 + 240;
      *((_QWORD *)v25 + 1) = v26;
      *v26 = v25;
      v27 = *(_QWORD *)(a1 + 256) + 1;
      *(_QWORD *)(a1 + 248) = v25;
      *(_QWORD *)(a1 + 256) = v27;
      *((_OWORD *)v25 + 1) = *(_OWORD *)a4;
      *((_QWORD *)v25 + 5) = a5;
      geo::_geo_weak_ptr<GEOTileData * {__strong}>::operator=((id *)v25 + 6, &v31);
      GEOMachAbsoluteTimeGetCurrent();
      *((_QWORD *)v25 + 4) = v28;
      v29 = *(_QWORD *)(a1 + 248);
      std::__hash_table<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::__unordered_map_hasher<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,true>,std::__unordered_map_equal<_GEOTileKey,std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>,std::equal_to<_GEOTileKey>,std::hash<_GEOTileKey>,true>,std::allocator<std::__hash_value_type<_GEOTileKey,std::__list_iterator<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>,void *>>>>::__emplace_unique_key_args<_GEOTileKey,std::piecewise_construct_t const&,std::tuple<_GEOTileKey const&>,std::tuple<>>((float *)(a1 + 264), a4, a4)[4] = v29;
      v30 = vdupq_n_s64(1uLL);
      v30.i64[0] = a5;
      *(int64x2_t *)(a1 + 320) = vaddq_s64(*(int64x2_t *)(a1 + 320), v30);
    }
    std::mutex::unlock((std::mutex *)(a1 + 176));
    objc_storeWeak(&v31, 0);
    objc_destroyWeak(&v31);
  }
  objc_msgSend(*(id *)(a1 + 336), "setTile:forKey:cost:", v8, a4, a5);
  objc_storeWeak(&location, 0);
  objc_destroyWeak(&location);

}

- (void)setMaxCost:(unint64_t)a3
{
  int64x2_t *v5;
  unint64_t v6;

  v5 = (int64x2_t *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  *((_QWORD *)self + 19) = a3;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)v5);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity(v5, *((_QWORD *)self + 19), *((_QWORD *)self + 18));
  std::mutex::unlock((std::mutex *)v5);
  std::mutex::lock((std::mutex *)((char *)self + 176));
  *((_QWORD *)self + 39) = a3;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)self + 176);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity((int64x2_t *)self + 11, *((_QWORD *)self + 39), *((_QWORD *)self + 38));
  std::mutex::unlock((std::mutex *)((char *)self + 176));
  if (a3 >= 0x400000)
    v6 = 0x400000;
  else
    v6 = a3;
  objc_msgSend(*((id *)self + 42), "setMaxCost:", v6);
}

- (void)setMaxCapacity:(unint64_t)a3
{
  int64x2_t *v5;
  unint64_t v6;

  v5 = (int64x2_t *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  *((_QWORD *)self + 18) = a3;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)v5);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity(v5, *((_QWORD *)self + 19), *((_QWORD *)self + 18));
  std::mutex::unlock((std::mutex *)v5);
  std::mutex::lock((std::mutex *)((char *)self + 176));
  *((_QWORD *)self + 38) = a3;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)self + 176);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity((int64x2_t *)self + 11, *((_QWORD *)self + 39), *((_QWORD *)self + 38));
  std::mutex::unlock((std::mutex *)((char *)self + 176));
  if (a3 >= 0x20)
    v6 = 32;
  else
    v6 = a3;
  objc_msgSend(*((id *)self + 42), "setMaxCapacity:", v6);
}

- (GEOTilePool)init
{
  return -[GEOTilePool initWithSideCacheEnabled:](self, "initWithSideCacheEnabled:", 1);
}

- (GEOTilePool)initWithSideCacheEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  dispatch_source_t v11;
  void *v12;
  NSObject *v13;
  GEOTileCache *v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v3 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOTilePool;
  v4 = -[GEOTilePool init](&v24, sel_init);
  if (v4)
  {
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
    objc_msgSend(v8, "addObserver:selector:name:object:", v4, sel__enteredBackground_, v10, 0);

    v11 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, MEMORY[0x1E0C80D38]);
    v12 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v11;

    objc_initWeak(&location, v4);
    v13 = *((_QWORD *)v4 + 1);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __40__GEOTilePool_initWithSideCacheEnabled___block_invoke;
    v21 = &unk_1E1C00650;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v13, &v18);
    dispatch_activate(*((dispatch_object_t *)v4 + 1));
    if (v3)
    {
      v14 = objc_alloc_init(GEOTileCache);
      v15 = (void *)*((_QWORD *)v4 + 42);
      *((_QWORD *)v4 + 42) = v14;

      objc_msgSend(*((id *)v4 + 42), "setMaxCapacity:", 32, v18, v19, v20, v21);
      objc_msgSend(*((id *)v4 + 42), "setMaxCost:", 0x400000);
    }
    v16 = v4;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return (GEOTilePool *)v4;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 850045863;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = (char *)self + 80;
  *((_QWORD *)self + 11) = (char *)self + 80;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_QWORD *)self + 16) = 0;
  *((_DWORD *)self + 34) = 1065353216;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 22) = 850045863;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 30) = (char *)self + 240;
  *((_QWORD *)self + 31) = (char *)self + 240;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_QWORD *)self + 36) = 0;
  *((_DWORD *)self + 74) = 1065353216;
  *((_QWORD *)self + 38) = 0;
  *((_QWORD *)self + 39) = 0;
  return self;
}

void __40__GEOTilePool_initWithSideCacheEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_receivedMemoryNotification");

}

- (uint64_t)removeTileForKey:(_QWORD *)a3
{
  int64x2_t *v5;

  v5 = (int64x2_t *)(a1 + 16);
  std::mutex::lock((std::mutex *)(a1 + 16));
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey(v5, a3);
  std::mutex::unlock((std::mutex *)v5);
  std::mutex::lock((std::mutex *)(a1 + 176));
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey((int64x2_t *)(a1 + 176), a3);
  std::mutex::unlock((std::mutex *)(a1 + 176));
  return objc_msgSend(*(id *)(a1 + 336), "removeTileForKey:", a3);
}

- (void)removeTilesWithKeys:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  int64x2_t *v22;
  char *v23;
  _QWORD *v24;
  char *v25;
  _QWORD *v26;
  GEOTilePool *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v4 = objc_msgSend(v28, "count");
  v5 = v4;
  if (v4)
  {
    if (v4 >> 61)
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v4);
    v8 = &v6[8 * v7];
    bzero(v6, 8 * v5);
    v9 = &v6[8 * v5];
  }
  else
  {
    v6 = 0;
    v9 = 0;
    v8 = 0;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v28;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  v27 = self;
  if (v11)
  {
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (v9 >= v8)
        {
          v15 = (v9 - v6) >> 3;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 61)
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          if ((v8 - v6) >> 2 > v16)
            v16 = (v8 - v6) >> 2;
          if ((unint64_t)(v8 - v6) >= 0x7FFFFFFFFFFFFFF8)
            v17 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v17 = v16;
          if (v17)
            v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v17);
          else
            v18 = 0;
          v19 = (char *)(v17 + 8 * v15);
          *(_QWORD *)v19 = v14;
          v20 = v19 + 8;
          while (v9 != v6)
          {
            v21 = *((_QWORD *)v9 - 1);
            v9 -= 8;
            *((_QWORD *)v19 - 1) = v21;
            v19 -= 8;
          }
          v8 = (char *)(v17 + 8 * v18);
          if (v6)
            operator delete(v6);
          v6 = v19;
          v9 = v20;
        }
        else
        {
          *(_QWORD *)v9 = v14;
          v9 += 8;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  v22 = (int64x2_t *)((char *)v27 + 16);
  std::mutex::lock((std::mutex *)((char *)v27 + 16));
  if (v6 != v9)
  {
    v23 = v6;
    do
    {
      v24 = *(_QWORD **)v23;
      v23 += 8;
      geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey(v22, v24);
    }
    while (v23 != v9);
  }
  std::mutex::unlock((std::mutex *)v22);
  std::mutex::lock((std::mutex *)((char *)v27 + 176));
  if (v6 != v9)
  {
    v25 = v6;
    do
    {
      v26 = *(_QWORD **)v25;
      v25 += 8;
      geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey((int64x2_t *)v27 + 11, v26);
    }
    while (v25 != v9);
  }
  std::mutex::unlock((std::mutex *)((char *)v27 + 176));
  objc_msgSend(*((id *)v27 + 42), "removeTilesWithKeys:", v10);
  if (v6)
    operator delete(v6);

}

- (void)removeAllObjects
{
  std::mutex *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t j;

  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  std::__list_imp<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear((id *)self + 10);
  if (*((_QWORD *)self + 16))
  {
    v4 = (_QWORD *)*((_QWORD *)self + 15);
    if (v4)
    {
      do
      {
        v5 = (_QWORD *)*v4;
        operator delete(v4);
        v4 = v5;
      }
      while (v5);
    }
    *((_QWORD *)self + 15) = 0;
    v6 = *((_QWORD *)self + 14);
    if (v6)
    {
      for (i = 0; i != v6; ++i)
        *(_QWORD *)(*((_QWORD *)self + 13) + 8 * i) = 0;
    }
    *((_QWORD *)self + 16) = 0;
  }
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  std::mutex::unlock(v3);
  std::mutex::lock((std::mutex *)((char *)self + 176));
  std::__list_imp<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear((id *)self + 30);
  if (*((_QWORD *)self + 36))
  {
    v8 = (_QWORD *)*((_QWORD *)self + 35);
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
    *((_QWORD *)self + 35) = 0;
    v10 = *((_QWORD *)self + 34);
    if (v10)
    {
      for (j = 0; j != v10; ++j)
        *(_QWORD *)(*((_QWORD *)self + 33) + 8 * j) = 0;
    }
    *((_QWORD *)self + 36) = 0;
  }
  *((_QWORD *)self + 40) = 0;
  *((_QWORD *)self + 41) = 0;
  std::mutex::unlock((std::mutex *)((char *)self + 176));
  objc_msgSend(*((id *)self + 42), "removeAllObjects");
}

- (void)enumerate:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[3];
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7[0] = &off_1E1BFA338;
  v7[1] = &v6;
  v8 = v7;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::enumerate((uint64_t)self + 16, (uint64_t)v7);
  v4 = v8;
  if (v8 == v7)
  {
    v5 = 4;
    v4 = v7;
    goto LABEL_5;
  }
  if (v8)
  {
    v5 = 5;
LABEL_5:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }

}

- (void)removeTilesMatchingPredicate:(id)a3
{
  uint64_t (***v4)();
  uint64_t v5;
  id *i;
  _QWORD *v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  __int128 v11;
  id *v12;
  id *k;
  id v14;
  uint64_t (***v15)();
  uint64_t v16;
  uint64_t *m;
  _QWORD *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  id v24;
  id *v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[3];
  _QWORD *v30;
  _QWORD v31[3];
  _QWORD *v32;
  uint64_t (**v33)();
  id *v34;
  _QWORD *v35;
  uint64_t (***v36)();
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v31[0] = &off_1E1BFA3E8;
  v31[1] = &v20;
  v32 = v31;
  v24 = &v24;
  v25 = &v24;
  v26 = 0;
  v33 = &off_1E1BFAC80;
  v34 = &v24;
  v35 = v31;
  v36 = &v33;
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::enumerate((uint64_t)self + 16, (uint64_t)&v33);
  v4 = v36;
  if (v36 == &v33)
  {
    v5 = 4;
    v4 = &v33;
  }
  else
  {
    if (!v36)
      goto LABEL_6;
    v5 = 5;
  }
  (*v4)[v5]();
LABEL_6:
  if (v26)
  {
    std::mutex::lock((std::mutex *)((char *)self + 16));
    for (i = v25; i != &v24; i = (id *)i[1])
      geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey((int64x2_t *)self + 1, i + 2);
    std::mutex::unlock((std::mutex *)((char *)self + 16));
  }
  std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(&v24);
  v7 = v32;
  if (v32 == v31)
  {
    v8 = 4;
    v7 = v31;
  }
  else
  {
    if (!v32)
      goto LABEL_16;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_16:
  v29[0] = &off_1E1BFA440;
  v29[1] = &v20;
  v30 = v29;
  v21 = (uint64_t)&v21;
  v22 = &v21;
  v33 = &off_1E1BFACD8;
  v34 = (id *)&v21;
  v35 = v29;
  v36 = &v33;
  v23 = 0;
  v24 = &v24;
  v25 = &v24;
  v26 = 0;
  std::mutex::lock((std::mutex *)((char *)self + 176));
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)self + 176);
  for (j = *((_QWORD *)self + 31); (GEOTilePool *)j != (GEOTilePool *)((char *)self + 240); j = *(_QWORD *)(j + 8))
  {
    v10 = operator new(0x38uLL);
    *((_QWORD *)v10 + 1) = 0;
    *(_QWORD *)v10 = 0;
    v11 = *(_OWORD *)(j + 32);
    *((_OWORD *)v10 + 1) = *(_OWORD *)(j + 16);
    *((_OWORD *)v10 + 2) = v11;
    objc_copyWeak((id *)v10 + 6, (id *)(j + 48));
    *(_QWORD *)v10 = &v24;
    v12 = v25;
    *((_QWORD *)v10 + 1) = v25;
    *v12 = v10;
    v25 = (id *)v10;
    ++v26;
  }
  std::mutex::unlock((std::mutex *)((char *)self + 176));
  for (k = v25; k != &v24; k = (id *)k[1])
  {
    v14 = k[5];
    v28 = k[4];
    v27 = v14;
    if (!v36)
      std::__throw_bad_function_call[abi:ne180100]();
    ((void (*)(uint64_t (***)(), id *, id *, id *, id *))(*v36)[6])(v36, k + 2, k + 6, &v28, &v27);
  }
  std::__list_imp<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear(&v24);
  v15 = v36;
  if (v36 == &v33)
  {
    v16 = 4;
    v15 = &v33;
  }
  else
  {
    if (!v36)
      goto LABEL_27;
    v16 = 5;
  }
  (*v15)[v16]();
LABEL_27:
  if (v23)
  {
    std::mutex::lock((std::mutex *)((char *)self + 176));
    for (m = v22; m != &v21; m = (uint64_t *)m[1])
      geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_removeForKey((int64x2_t *)self + 11, m + 2);
    std::mutex::unlock((std::mutex *)((char *)self + 176));
  }
  std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear(&v21);
  v18 = v30;
  if (v30 == v29)
  {
    v19 = 4;
    v18 = v29;
    goto LABEL_36;
  }
  if (v30)
  {
    v19 = 5;
LABEL_36:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }
  objc_msgSend(*((id *)self + 42), "removeTilesMatchingPredicate:", v20);

}

- (uint64_t)containsKey:(_QWORD *)a3 cost:(_QWORD *)a4
{
  std::mutex *v7;
  unint64_t v8;
  int8x8_t v9;
  uint8x8_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *i;
  unint64_t v14;
  unint64_t v16;
  int8x8_t v17;
  uint8x8_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v23;

  v7 = (std::mutex *)(a1 + 16);
  std::mutex::lock((std::mutex *)(a1 + 16));
  v8 = GEOTileKeyHash(a3);
  v9 = *(int8x8_t *)(a1 + 112);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8(v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v11 = v8;
      if (v8 >= *(_QWORD *)&v9)
        v11 = v8 % *(_QWORD *)&v9;
    }
    else
    {
      v11 = (*(_QWORD *)&v9 - 1) & v8;
    }
    v12 = *(_QWORD **)(*(_QWORD *)(a1 + 104) + 8 * v11);
    if (v12)
    {
      for (i = (_QWORD *)*v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v8 == v14)
        {
          if (i[2] == *a3 && i[3] == a3[1])
          {
LABEL_43:
            if (a4)
              *a4 = *(_QWORD *)(i[4] + 40);
            v23 = 1;
            goto LABEL_42;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= *(_QWORD *)&v9)
              v14 %= *(_QWORD *)&v9;
          }
          else
          {
            v14 &= *(_QWORD *)&v9 - 1;
          }
          if (v14 != v11)
            break;
        }
      }
    }
  }
  std::mutex::unlock(v7);
  v7 = (std::mutex *)(a1 + 176);
  std::mutex::lock((std::mutex *)(a1 + 176));
  v16 = GEOTileKeyHash(a3);
  v17 = *(int8x8_t *)(a1 + 272);
  if (v17)
  {
    v18 = (uint8x8_t)vcnt_s8(v17);
    v18.i16[0] = vaddlv_u8(v18);
    if (v18.u32[0] > 1uLL)
    {
      v19 = v16;
      if (v16 >= *(_QWORD *)&v17)
        v19 = v16 % *(_QWORD *)&v17;
    }
    else
    {
      v19 = (*(_QWORD *)&v17 - 1) & v16;
    }
    v20 = *(_QWORD **)(*(_QWORD *)(a1 + 264) + 8 * v19);
    if (v20)
    {
      for (i = (_QWORD *)*v20; i; i = (_QWORD *)*i)
      {
        v21 = i[1];
        if (v16 == v21)
        {
          if (i[2] == *a3 && i[3] == a3[1])
            goto LABEL_43;
        }
        else
        {
          if (v18.u32[0] > 1uLL)
          {
            if (v21 >= *(_QWORD *)&v17)
              v21 %= *(_QWORD *)&v17;
          }
          else
          {
            v21 &= *(_QWORD *)&v17 - 1;
          }
          if (v21 != v19)
            break;
        }
      }
    }
  }
  v23 = 0;
LABEL_42:
  std::mutex::unlock(v7);
  return v23;
}

- (unint64_t)maxCapacity
{
  std::mutex *v3;
  unint64_t v4;

  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v4 = *((_QWORD *)self + 18);
  std::mutex::unlock(v3);
  return v4;
}

- (unint64_t)maxCost
{
  std::mutex *v3;
  unint64_t v4;

  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v4 = *((_QWORD *)self + 19);
  std::mutex::unlock(v3);
  return v4;
}

- (void)_receivedMemoryNotification
{
  int64x2_t *v3;

  v3 = (int64x2_t *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)v3);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity(v3, *((_QWORD *)self + 19) >> 1, *((_QWORD *)self + 18) >> 1);
  std::mutex::unlock((std::mutex *)v3);
  std::mutex::lock((std::mutex *)((char *)self + 176));
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_prune((uint64_t)self + 176);
  geo::detail::_GEOGenericContainer<_GEOTileKey,GEOTileData * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_evictWithMaxCostAndCapacity((int64x2_t *)self + 11, *((_QWORD *)self + 39) >> 1, *((_QWORD *)self + 38) >> 1);
  std::mutex::unlock((std::mutex *)((char *)self + 176));
}

- (void).cxx_destruct
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;

  objc_storeStrong((id *)self + 42, 0);
  v3 = (_QWORD *)*((_QWORD *)self + 35);
  if (v3)
  {
    do
    {
      v4 = (_QWORD *)*v3;
      operator delete(v3);
      v3 = v4;
    }
    while (v4);
  }
  v5 = (void *)*((_QWORD *)self + 33);
  *((_QWORD *)self + 33) = 0;
  if (v5)
    operator delete(v5);
  std::__list_imp<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear((id *)self + 30);
  std::mutex::~mutex((std::mutex *)((char *)self + 176));
  v6 = (_QWORD *)*((_QWORD *)self + 15);
  if (v6)
  {
    do
    {
      v7 = (_QWORD *)*v6;
      operator delete(v6);
      v6 = v7;
    }
    while (v7);
  }
  v8 = (void *)*((_QWORD *)self + 13);
  *((_QWORD *)self + 13) = 0;
  if (v8)
    operator delete(v8);
  std::__list_imp<geo::detail::_CacheItem<_GEOTileKey,objc_object * {__strong},geo::detail::_GEOGenericContainer<_GEOTileKey,objc_object * {__strong},std::hash<_GEOTileKey>,std::equal_to<_GEOTileKey>,geo::GEOGenericContainerWeakReferenceTag,0ul,0ul,geo::GEOGenericContainerLockingTag,geo::detail::_default_pointer_type>::_value_ptr>>::clear((id *)self + 10);
  std::mutex::~mutex((std::mutex *)((char *)self + 16));
  objc_storeStrong((id *)self + 1, 0);
}

- (unint64_t)currentCount
{
  std::mutex *v3;
  unint64_t v4;

  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v4 = *((_QWORD *)self + 21);
  std::mutex::unlock(v3);
  return v4;
}

- (unint64_t)currentCost
{
  std::mutex *v3;
  unint64_t v4;

  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v4 = *((_QWORD *)self + 20);
  std::mutex::unlock(v3);
  return v4;
}

- (void)enumerate:
{
}

- (_QWORD)enumerate:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E1BFA338;
  result[1] = v3;
  return result;
}

- (uint64_t)enumerate:
{
    return a1 + 8;
  else
    return 0;
}

- (void)removeTilesMatchingPredicate:
{
}

- (_QWORD)removeTilesMatchingPredicate:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E1BFA440;
  result[1] = v3;
  return result;
}

- (uint64_t)removeTilesMatchingPredicate:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end
