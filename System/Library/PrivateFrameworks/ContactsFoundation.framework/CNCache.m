@implementation CNCache

- (id)resultWithResourceLock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  -[CNCache resourceScheduler](self, "resourceScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__CNCache_resultWithResourceLock___block_invoke;
  v9[3] = &unk_1E29B8BE8;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (CNScheduler)resourceScheduler
{
  return self->_resourceScheduler;
}

void __34__CNCache_resultWithResourceLock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __24__CNCache_objectForKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "resourceLock_validateKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_willAccessKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __36__CNCache_objectForKey_onCacheMiss___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "resourceLock_validateKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "resourceLock_willAccessKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "resourceLock_setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
  }
  v4 = v3;

  return v4;
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)resourceLock_validateKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNCache resourceLock_validateKeys:](self, "resourceLock_validateKeys:", v6, v7, v8);
  }
}

- (void)resourceLock_validateKeys:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v8 = a3;
  -[CNCache boundingStrategies](self, "boundingStrategies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__CNCache_resourceLock_validateKeys___block_invoke;
    v9[3] = &unk_1E29B93D0;
    v9[4] = self;
    objc_msgSend(v8, "indexesOfObjectsPassingTest:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v8, "objectsAtIndexes:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNCache resourceLock_evictObjectsForKeys:](self, "resourceLock_evictObjectsForKeys:", v7);

    }
  }

}

- (void)resourceLock_willAccessKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNCache boundingStrategies](self, "boundingStrategies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "willAccessKey:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)boundingStrategies
{
  return self->_boundingStrategies;
}

- (void)resourceLock_setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[CNCache resourceLock_willSetObject:forKey:](self, "resourceLock_willSetObject:forKey:", v9, v6);
  -[CNCache storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (void)resourceLock_willSetObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CNCache boundingStrategies](self, "boundingStrategies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = a3 != 0;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        v15 = 0;
        objc_msgSend(v13, "willUpdateCacheBy:forKey:keysToEvict:", v11, v6, &v15);
        v14 = v15;
        if (v14)
          -[CNCache resourceLock_evictObjectsForKeys:](self, "resourceLock_evictObjectsForKeys:", v14);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

uint64_t __28__CNCache_setObject_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resourceLock_setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__CNCache_setObject_forKey___block_invoke;
  v10[3] = &unk_1E29B9308;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CNCache performWithResourceLock:](self, "performWithResourceLock:", v10);
  -[CNCache callDidEvictHandlersIfNecessary](self, "callDidEvictHandlersIfNecessary");

}

- (void)performWithResourceLock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNCache resourceScheduler](self, "resourceScheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:", v4);

}

- (id)objectForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  CNCache *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __24__CNCache_objectForKey___block_invoke;
  v11 = &unk_1E29B8C38;
  v12 = self;
  v13 = v4;
  v5 = v4;
  -[CNCache resultWithResourceLock:](self, "resultWithResourceLock:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCache callDidEvictHandlersIfNecessary](self, "callDidEvictHandlersIfNecessary", v8, v9, v10, v11, v12);

  return v6;
}

- (id)objectForKey:(id)a3 onCacheMiss:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__CNCache_objectForKey_onCacheMiss___block_invoke;
  v12[3] = &unk_1E29B92E0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  -[CNCache resultWithResourceLock:](self, "resultWithResourceLock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCache callDidEvictHandlersIfNecessary](self, "callDidEvictHandlersIfNecessary");

  return v10;
}

- (void)callDidEvictHandlersIfNecessary
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[7];
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__1;
  v6[4] = __Block_byref_object_dispose__1;
  v7 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke;
  v5[3] = &unk_1E29B9420;
  v5[4] = self;
  v5[5] = &v8;
  v5[6] = v6;
  -[CNCache performWithResourceLock:](self, "performWithResourceLock:", v5);
  v3 = (void *)v9[5];
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke_2;
  v4[3] = &unk_1E29B9470;
  v4[4] = v6;
  objc_msgSend(v3, "_cn_each:", v4);
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
}

- (NSArray)evictedKeysAndValues
{
  return self->_evictedKeysAndValues;
}

uint64_t __37__CNCache_resourceLock_validateKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "boundingStrategies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__CNCache_resourceLock_validateKeys___block_invoke_2;
  v8[3] = &unk_1E29B93A8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "_cn_any:", v8);

  return v6;
}

uint64_t __37__CNCache_resourceLock_validateKeys___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldEvictKey:", *(_QWORD *)(a1 + 32));
}

- (void)resourceLock_evictObjectsForKeys:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v9 = a3;
  -[CNCache boundingStrategies](self, "boundingStrategies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__CNCache_resourceLock_evictObjectsForKeys___block_invoke;
    v10[3] = &unk_1E29B93F8;
    v10[4] = self;
    objc_msgSend(v9, "_cn_map:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_filter:", CNPairNeitherElementIsNil);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
      -[CNCache setEvictedKeysAndValues:](self, "setEvictedKeysAndValues:", v7);

  }
  -[CNCache storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectsForKeys:", v9);

}

+ (id)cache
{
  return objc_alloc_init((Class)a1);
}

- (CNCache)init
{
  void *v3;
  CNCache *v4;

  +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNCache initWithResourceScheduler:](self, "initWithResourceScheduler:", v3);

  return v4;
}

+ (id)atomicCache
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "atomicCacheScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResourceScheduler:", v3);

  return v4;
}

- (CNCache)initWithBoundingStrategies:(id)a3 resourceScheduler:(id)a4
{
  id v6;
  id v7;
  CNCache *v8;
  uint64_t v9;
  NSArray *boundingStrategies;
  NSMutableDictionary *v11;
  NSMutableDictionary *storage;
  NSMutableArray *v13;
  NSMutableArray *didEvictHandlers;
  CNCache *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNCache;
  v8 = -[CNCache init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    boundingStrategies = v8->_boundingStrategies;
    v8->_boundingStrategies = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_resourceScheduler, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    storage = v8->_storage;
    v8->_storage = v11;

    if (objc_msgSend(v6, "count"))
    {
      v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      didEvictHandlers = v8->_didEvictHandlers;
      v8->_didEvictHandlers = v13;

    }
    v15 = v8;
  }

  return v8;
}

- (CNCache)initWithResourceScheduler:(id)a3
{
  return -[CNCache initWithBoundingStrategies:resourceScheduler:](self, "initWithBoundingStrategies:resourceScheduler:", MEMORY[0x1E0C9AA60], a3);
}

+ (CNScheduler)atomicCacheScheduler
{
  return (CNScheduler *)+[CNScheduler synchronousSerialDispatchQueueWithName:](CNScheduler, "synchronousSerialDispatchQueueWithName:", CFSTR("com.apple.contacts.foundation.cache"));
}

+ (CNScheduler)nonatomicCacheScheduler
{
  return +[CNScheduler immediateScheduler](CNScheduler, "immediateScheduler");
}

+ (id)boundingStrategyWithCapacity:(unint64_t)a3
{
  return -[_CNCacheFixedCapacityBoundingStrategy initWithCapacity:]([_CNCacheFixedCapacityBoundingStrategy alloc], "initWithCapacity:", a3);
}

- (void)addDidEvictHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CNCache boundingStrategies](self, "boundingStrategies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__CNCache_addDidEvictHandler___block_invoke;
    v7[3] = &unk_1E29B9380;
    v7[4] = self;
    v8 = v4;
    -[CNCache performWithResourceLock:](self, "performWithResourceLock:", v7);

  }
}

- (NSMutableArray)didEvictHandlers
{
  return self->_didEvictHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evictedKeysAndValues, 0);
  objc_storeStrong((id *)&self->_didEvictHandlers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_resourceScheduler, 0);
  objc_storeStrong((id *)&self->_boundingStrategies, 0);
}

+ (id)boundingStrategyWithTTL:(double)a3 renewalOptions:(unint64_t)a4 timeProvider:(id)a5
{
  id v7;
  _CNCacheFixedTTLBoundingStrategy *v8;

  v7 = a5;
  v8 = -[_CNCacheFixedTTLBoundingStrategy initWithTTL:renewalOptions:timeProvider:]([_CNCacheFixedTTLBoundingStrategy alloc], "initWithTTL:renewalOptions:timeProvider:", a4, v7, a3);

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CNCache allKeys](self, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("count of keys"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)boundingStrategyWithTTL:(double)a3
{
  return -[_CNCacheFixedTTLBoundingStrategy initWithTTL:]([_CNCacheFixedTTLBoundingStrategy alloc], "initWithTTL:", a3);
}

- (NSArray)allKeys
{
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __18__CNCache_allKeys__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  -[CNCache resultWithResourceLock:](self, "resultWithResourceLock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCache callDidEvictHandlersIfNecessary](self, "callDidEvictHandlersIfNecessary");
  return (NSArray *)v3;
}

id __18__CNCache_allKeys__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "resourceLock_validateAllKeys");
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)allObjects
{
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__CNCache_allObjects__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  -[CNCache resultWithResourceLock:](self, "resultWithResourceLock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCache callDidEvictHandlersIfNecessary](self, "callDidEvictHandlersIfNecessary");
  return (NSArray *)v3;
}

id __21__CNCache_allObjects__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "resourceLock_validateAllKeys");
  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)overestimatedCount
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__CNCache_overestimatedCount__block_invoke;
  v4[3] = &unk_1E29B9330;
  v4[4] = self;
  v4[5] = &v5;
  -[CNCache performWithResourceLock:](self, "performWithResourceLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __29__CNCache_overestimatedCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (void)removeAllObjects
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __27__CNCache_removeAllObjects__block_invoke;
  v2[3] = &unk_1E29B9358;
  v2[4] = self;
  -[CNCache performWithResourceLock:](self, "performWithResourceLock:", v2);
}

void __27__CNCache_removeAllObjects__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

void __30__CNCache_addDidEvictHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "didEvictHandlers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = _Block_copy(v2);
  objc_msgSend(v4, "addObject:", v3);

}

- (void)resourceLock_validateAllKeys
{
  void *v3;
  void *v4;
  id v5;

  -[CNCache storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "copy");

  -[CNCache resourceLock_validateKeys:](self, "resourceLock_validateKeys:", v5);
}

id __44__CNCache_resourceLock_evictObjectsForKeys___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPair pairWithFirst:second:](CNPair, "pairWithFirst:second:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(*(id *)(a1 + 32), "evictedKeysAndValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(*(id *)(a1 + 32), "didEvictHandlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return objc_msgSend(*(id *)(a1 + 32), "setEvictedKeysAndValues:", 0);
}

void __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke_3;
  v6[3] = &unk_1E29B9448;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_cn_each:", v6);

}

void __42__CNCache_callDidEvictHandlersIfNecessary__block_invoke_3(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "first");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "second");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, void *))a2)[2](v5, v7, v6);

}

- (void)setEvictedKeysAndValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
