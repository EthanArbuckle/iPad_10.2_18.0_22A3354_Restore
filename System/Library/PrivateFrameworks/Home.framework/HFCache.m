@implementation HFCache

- (HFCache)initWithDelegate:(id)a3
{
  id v4;
  HFCache *v5;
  HFCache *v6;
  uint64_t v7;
  NSMapTable *mapTable;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *accessQueue;
  id defaultObjectEvictionComparator;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFCache;
  v5 = -[HFCache init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    mapTable = v6->_mapTable;
    v6->_mapTable = (NSMapTable *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.Home.HFCache.accessQueue", v9);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v10;

    defaultObjectEvictionComparator = v6->_defaultObjectEvictionComparator;
    v6->_defaultObjectEvictionComparator = &__block_literal_global_133;

  }
  return v6;
}

uint64_t __28__HFCache_initWithDelegate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  return v10;
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  v18 = 0;
  -[HFCache accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__HFCache_objectForKey___block_invoke;
  block[3] = &unk_1EA737880;
  block[4] = self;
  v11 = v4;
  v12 = &v13;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __24__HFCache_objectForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "mapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "object");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5 removeObjectsToAccommodateCost:(BOOL)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  HFCache *v18;
  id v19;
  unint64_t v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  -[HFCache accessQueue](self, "accessQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v12);

  -[HFCache accessQueue](self, "accessQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HFCache_setObject_forKey_cost_removeObjectsToAccommodateCost___block_invoke;
  block[3] = &unk_1EA7378A8;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v20 = a5;
  v21 = a6;
  v14 = v11;
  v15 = v10;
  dispatch_async(v13, block);

}

uint64_t __64__HFCache_setObject_forKey_cost_removeObjectsToAccommodateCost___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
    return objc_msgSend(v2, "_setObject:forKey:cost:removeObjectsToAccommodateCost:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  else
    return objc_msgSend(v2, "_removeObjectForKey:", *(_QWORD *)(a1 + 48));
}

- (void)_setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5 removeObjectsToAccommodateCost:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  NSObject *v11;
  HFCacheEntry *v12;
  void *v13;
  id v14;

  v6 = a6;
  v14 = a3;
  v10 = a4;
  -[HFCache accessQueue](self, "accessQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (!v6 || -[HFCache _removeObjectsToAccommodateCost:](self, "_removeObjectsToAccommodateCost:", a5))
  {
    v12 = -[HFCacheEntry initWithKey:object:cost:]([HFCacheEntry alloc], "initWithKey:object:cost:", v10, v14, a5);
    -[HFCache mapTable](self, "mapTable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, v10);

    -[HFCache _setTotalCost:](self, "_setTotalCost:", -[HFCache _totalCost](self, "_totalCost") + a5);
  }

}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5
{
  -[HFCache setObject:forKey:cost:removeObjectsToAccommodateCost:](self, "setObject:forKey:cost:removeObjectsToAccommodateCost:", a3, a4, a5, 1);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[HFCache setObject:forKey:cost:](self, "setObject:forKey:cost:", a3, a4, 0);
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[HFCache accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__HFCache_removeObjectForKey___block_invoke;
  v8[3] = &unk_1EA727188;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __30__HFCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)_removeObjectForKey:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HFCache mapTable](self, "mapTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCache.m"), 149, CFSTR("%@ does not exist in cache"), v11);

  }
  -[HFCache mapTable](self, "mapTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v11);

  v9 = -[HFCache _totalCost](self, "_totalCost");
  objc_msgSend(v7, "cost");
  -[HFCache _setTotalCost:](self, "_setTotalCost:", v9 - objc_msgSend(v7, "cost"));

}

- (void)removeAllObjects
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HFCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[HFCache accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__HFCache_removeAllObjects__block_invoke;
  block[3] = &unk_1EA727DD8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __27__HFCache_removeAllObjects__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "_setTotalCost:", 0);
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[HFCache accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HFCache_enumerateKeysAndObjectsUsingBlock___block_invoke;
  block[3] = &unk_1EA727308;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __45__HFCache_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "mapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
      objc_msgSend(*(id *)(a1 + 32), "mapTable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v10, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *, unsigned __int8 *))(v11 + 16))(v11, v8, v12, &v13);

      LODWORD(v8) = v13;
      if ((_DWORD)v8)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)canAccommodateCost:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[HFCache accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__HFCache_canAccommodateCost___block_invoke;
  block[3] = &unk_1EA7378D0;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v6, block);

  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

uint64_t __30__HFCache_canAccommodateCost___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_canAccommodateCost:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_canAccommodateCost:(unint64_t)a3
{
  NSObject *v5;

  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  return -[HFCache _totalCostLimit](self, "_totalCostLimit") >= a3;
}

- (BOOL)removeObjectsToAccommodateCost:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[HFCache accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HFCache_removeObjectsToAccommodateCost___block_invoke;
  block[3] = &unk_1EA7378D0;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v6, block);

  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

uint64_t __42__HFCache_removeObjectsToAccommodateCost___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_removeObjectsToAccommodateCost:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_removeObjectsToAccommodateCost:(unint64_t)a3
{
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HFCache _canAccommodateCostWithoutRemoval:](self, "_canAccommodateCostWithoutRemoval:", a3))
    return 1;
  -[HFCache _overrideObjectEvictionComparator](self, "_overrideObjectEvictionComparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = _Block_copy(v7);
  }
  else
  {
    -[HFCache defaultObjectEvictionComparator](self, "defaultObjectEvictionComparator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _Block_copy(v10);

  }
  -[HFCache mapTable](self, "mapTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __43__HFCache__removeObjectsToAccommodateCost___block_invoke;
  v28[3] = &unk_1EA7378F8;
  v14 = v9;
  v29 = v14;
  objc_msgSend(v13, "sortedArrayUsingComparator:", v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (-[HFCache _canAccommodateCostWithoutRemoval:](self, "_canAccommodateCostWithoutRemoval:", a3))
  {
LABEL_9:
    v6 = 1;
  }
  else
  {
    while (1)
    {
      objc_msgSend(v16, "firstObject");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
        break;
      v18 = (void *)v17;
      -[HFCache mapTable](self, "mapTable");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "key");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectForKey:", v20);

      objc_msgSend(v16, "removeObjectAtIndex:", 0);
      -[HFCache _setTotalCost:](self, "_setTotalCost:", -[HFCache _totalCost](self, "_totalCost") - objc_msgSend(v18, "cost"));
      objc_msgSend(v18, "object");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "key");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCache _didEvictObject:forKey:cost:](self, "_didEvictObject:forKey:cost:", v21, v22, objc_msgSend(v18, "cost"));

      if (-[HFCache _canAccommodateCostWithoutRemoval:](self, "_canAccommodateCostWithoutRemoval:", a3))
        goto LABEL_9;
    }
    HFLogForCategory(0xDuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFCache _totalCost](self, "_totalCost"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFCache _totalCostLimit](self, "_totalCostLimit"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v31 = "-[HFCache _removeObjectsToAccommodateCost:]";
      v32 = 2112;
      v33 = v25;
      v34 = 2112;
      v35 = v26;
      v36 = 2112;
      v37 = v27;
      _os_log_error_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_ERROR, "%s cannot remove enough cache entries to accommodate cost: %@; totalCost: %@; totalCostLimit: %@",
        buf,
        0x2Au);

    }
    v6 = 0;
  }

  return v6;
}

uint64_t __43__HFCache__removeObjectsToAccommodateCost___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "cost");

  objc_msgSend(v5, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "cost");

  v13 = (*(uint64_t (**)(uint64_t, void *, void *, uint64_t, void *, void *, uint64_t))(v4 + 16))(v4, v7, v8, v9, v10, v11, v12);
  return v13;
}

- (BOOL)_canAccommodateCostWithoutRemoval:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;

  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[HFCache _totalCost](self, "_totalCost") + a3;
  return v6 <= -[HFCache _totalCostLimit](self, "_totalCostLimit");
}

- (void)_didEvictObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  -[HFCache accessQueue](self, "accessQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HFCache delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[HFCache delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cache:didEvictObject:forKey:cost:", self, v13, v8, a5);

  }
}

- (unint64_t)count
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[HFCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HFCache accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __16__HFCache_count__block_invoke;
  v7[3] = &unk_1EA72B240;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __16__HFCache_count__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mapTable");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (void)_setTotalCost:(unint64_t)a3
{
  NSObject *v5;

  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_totalCost = a3;
}

- (unint64_t)totalCost
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[HFCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HFCache accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __20__HFCache_totalCost__block_invoke;
  v7[3] = &unk_1EA72B240;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __20__HFCache_totalCost__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_totalCost");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_totalCost
{
  NSObject *v3;

  -[HFCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_totalCost;
}

- (void)setTotalCostLimit:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];

  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[HFCache accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__HFCache_setTotalCostLimit___block_invoke;
  v7[3] = &unk_1EA72B268;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(v6, v7);

}

uint64_t __29__HFCache_setTotalCostLimit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTotalCostLimit:", *(_QWORD *)(a1 + 40));
}

- (void)_setTotalCostLimit:(unint64_t)a3
{
  NSObject *v5;

  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  self->_totalCostLimit = a3;
}

- (unint64_t)totalCostLimit
{
  NSObject *v3;
  NSObject *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[HFCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HFCache accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__HFCache_totalCostLimit__block_invoke;
  v7[3] = &unk_1EA72B240;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __25__HFCache_totalCostLimit__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_totalCostLimit");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_totalCostLimit
{
  NSObject *v3;

  -[HFCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_totalCostLimit;
}

- (void)setOverrideObjectEvictionComparator:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[HFCache accessQueue](self, "accessQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__HFCache_setOverrideObjectEvictionComparator___block_invoke;
  v8[3] = &unk_1EA727308;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __47__HFCache_setOverrideObjectEvictionComparator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setOverrideObjectEvictionComparator:", *(_QWORD *)(a1 + 40));
}

- (void)_setOverrideObjectEvictionComparator:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id overrideObjectEvictionComparator;

  v4 = a3;
  -[HFCache accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_msgSend(v4, "copy");
  overrideObjectEvictionComparator = self->_overrideObjectEvictionComparator;
  self->_overrideObjectEvictionComparator = v6;

}

- (id)overrideObjectEvictionComparator
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *(*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[HFCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__42;
  v12 = __Block_byref_object_dispose__43;
  v13 = 0;
  -[HFCache accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HFCache_overrideObjectEvictionComparator__block_invoke;
  v7[3] = &unk_1EA72B240;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = _Block_copy((const void *)v9[5]);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __43__HFCache_overrideObjectEvictionComparator__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_overrideObjectEvictionComparator");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_overrideObjectEvictionComparator
{
  NSObject *v3;

  -[HFCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return (id)objc_msgSend(self->_overrideObjectEvictionComparator, "copy");
}

- (id)description
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  HFCache *v13;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCache accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __22__HFCache_description__block_invoke;
  v11 = &unk_1EA727188;
  v12 = v3;
  v13 = self;
  v5 = v3;
  dispatch_sync(v4, &v8);

  objc_msgSend(v5, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __22__HFCache_description__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "mapTable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("entries"));

}

- (void)setTotalCost:(unint64_t)a3
{
  self->_totalCost = a3;
}

- (id)defaultObjectEvictionComparator
{
  return self->_defaultObjectEvictionComparator;
}

- (HFCacheDelegate)delegate
{
  return (HFCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (NSMapTable)mapTable
{
  return self->_mapTable;
}

- (void)setMapTable:(id)a3
{
  objc_storeStrong((id *)&self->_mapTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapTable, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_defaultObjectEvictionComparator, 0);
  objc_storeStrong(&self->_overrideObjectEvictionComparator, 0);
}

@end
