@implementation AXMVisionEngineCache

- (AXMVisionEngineCache)initWithCacheSize:(int64_t)a3
{
  AXMVisionEngineCache *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *cacheQueue;
  uint64_t v8;
  NSMutableDictionary *cacheQueue_results;
  uint64_t v10;
  NSMutableOrderedSet *cacheQueue_orderedKeys;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXMVisionEngineCache;
  v4 = -[AXMVisionEngineCache init](&v13, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("cacheQueue", v5);
    cacheQueue = v4->_cacheQueue;
    v4->_cacheQueue = (OS_dispatch_queue *)v6;

    v4->_cacheQueue_maxItems = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    cacheQueue_results = v4->_cacheQueue_results;
    v4->_cacheQueue_results = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v10 = objc_claimAutoreleasedReturnValue();
    cacheQueue_orderedKeys = v4->_cacheQueue_orderedKeys;
    v4->_cacheQueue_orderedKeys = (NSMutableOrderedSet *)v10;

  }
  return v4;
}

- (id)description
{
  NSObject *cacheQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__AXMVisionEngineCache_description__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__AXMVisionEngineCache_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AXMVisionEngineCache<%p>: %ld items"), *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)debugDescription
{
  NSObject *cacheQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AXMVisionEngineCache_debugDescription__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __40__AXMVisionEngineCache_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("AXMVisionEngineCache<%p>: %ld items\n"), *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__AXMVisionEngineCache_debugDescription__block_invoke_2;
  v8[3] = &unk_1E625D9A8;
  v8[4] = v5;
  return objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);
}

uint64_t __40__AXMVisionEngineCache_debugDescription__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendFormat:", CFSTR("---\n  Key:%@\n  Result:%@\n"), a2, a3);
}

- (int64_t)cacheSize
{
  NSObject *cacheQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  cacheQueue = self->_cacheQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AXMVisionEngineCache_cacheSize__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cacheQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__AXMVisionEngineCache_cacheSize__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cacheQueue_cacheSize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_cacheQueue_cacheSize
{
  return self->_cacheQueue_maxItems;
}

- (id)resultForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *cacheQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5;
    v16 = __Block_byref_object_dispose__5;
    v17 = 0;
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__AXMVisionEngineCache_resultForKey___block_invoke;
    block[3] = &unk_1E625D048;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(cacheQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __37__AXMVisionEngineCache_resultForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_cacheQueue_resultForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_cacheQueue_resultForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_cacheQueue_results, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableOrderedSet removeObject:](self->_cacheQueue_orderedKeys, "removeObject:", v4);
    -[NSMutableOrderedSet addObject:](self->_cacheQueue_orderedKeys, "addObject:", v4);
    AXMediaLogEngineCache();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AXMVisionEngineCache _cacheQueue_resultForKey:].cold.1((uint64_t)v4, v6);

  }
  return v5;
}

- (void)setResult:(id)a3 forKey:(id)a4
{
  id v6;
  NSObject *cacheQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__AXMVisionEngineCache_setResult_forKey___block_invoke;
    block[3] = &unk_1E625D9D0;
    block[4] = self;
    v10 = v8;
    v11 = v6;
    dispatch_sync(cacheQueue, block);

  }
}

uint64_t __41__AXMVisionEngineCache_setResult_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cacheQueue_setResult:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_cacheQueue_setResult:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSMutableOrderedSet **p_cacheQueue_orderedKeys;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[NSMutableDictionary setObject:forKey:](self->_cacheQueue_results, "setObject:forKey:", v6, v7);
    p_cacheQueue_orderedKeys = &self->_cacheQueue_orderedKeys;
    -[NSMutableOrderedSet removeObject:](self->_cacheQueue_orderedKeys, "removeObject:", v7);
    -[NSMutableOrderedSet addObject:](self->_cacheQueue_orderedKeys, "addObject:", v7);
    AXMediaLogEngineCache();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AXMVisionEngineCache _cacheQueue_setResult:forKey:].cold.3((uint64_t)v7, (id *)&self->_cacheQueue_orderedKeys);

    if ((unint64_t)-[NSMutableOrderedSet count](self->_cacheQueue_orderedKeys, "count") > self->_cacheQueue_maxItems)
    {
      -[NSMutableOrderedSet firstObject](self->_cacheQueue_orderedKeys, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](self->_cacheQueue_results, "removeObjectForKey:", v10);
      -[NSMutableOrderedSet removeObject:](self->_cacheQueue_orderedKeys, "removeObject:", v10);
      AXMediaLogEngineCache();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[AXMVisionEngineCache _cacheQueue_setResult:forKey:].cold.2((uint64_t)v10, (id *)p_cacheQueue_orderedKeys);

    }
  }
  else
  {
    AXMediaLogEngineCache();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[AXMVisionEngineCache _cacheQueue_setResult:forKey:].cold.1((uint64_t)v7, (uint64_t)self);

    -[NSMutableDictionary removeObjectForKey:](self->_cacheQueue_results, "removeObjectForKey:", v7);
    -[NSMutableOrderedSet removeObject:](self->_cacheQueue_orderedKeys, "removeObject:", v7);
  }

}

- (void)purgeCache
{
  NSObject *cacheQueue;
  _QWORD block[5];

  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AXMVisionEngineCache_purgeCache__block_invoke;
  block[3] = &unk_1E625CCC0;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
}

void __34__AXMVisionEngineCache_purgeCache__block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  AXMediaLogEngineCache();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __34__AXMVisionEngineCache_purgeCache__block_invoke_cold_1(v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue_results, 0);
  objc_storeStrong((id *)&self->_cacheQueue_orderedKeys, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

- (void)_cacheQueue_resultForKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_DEBUG, "Result found for key: %p. moving to newest position", (uint8_t *)&v2, 0xCu);
}

- (void)_cacheQueue_setResult:(uint64_t)a1 forKey:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a2 + 24), "count");
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B0E3B000, v2, v3, "set nil result. removing key: %p. %ld items remain", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7();
}

- (void)_cacheQueue_setResult:(uint64_t)a1 forKey:(id *)a2 .cold.2(uint64_t a1, id *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_3(a1, a2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B0E3B000, v2, v3, "cache size too big. evicted key: %p. %ld items remain", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7();
}

- (void)_cacheQueue_setResult:(uint64_t)a1 forKey:(id *)a2 .cold.3(uint64_t a1, id *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_3(a1, a2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1B0E3B000, v2, v3, "set new result. adding key: %p. %ld items remain", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_7();
}

void __34__AXMVisionEngineCache_purgeCache__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_DEBUG, "purge cache of all keys", v1, 2u);
}

@end
