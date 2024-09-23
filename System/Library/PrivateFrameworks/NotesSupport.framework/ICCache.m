@implementation ICCache

void __28__ICCache_setObject_forKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mutableKeys");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", *(_QWORD *)(a1 + 40));

}

void __33__ICCache_setObject_forKey_cost___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mutableKeys");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", *(_QWORD *)(a1 + 40));

}

void __30__ICCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mutableKeys");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_removeNonNilObject:", *(_QWORD *)(a1 + 40));

}

- (NSMutableSet)mutableKeys
{
  return self->_mutableKeys;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICCache;
  -[ICCache setObject:forKey:](&v11, sel_setObject_forKey_, a3, v6);
  -[ICCache mutableKeysAccessQueue](self, "mutableKeysAccessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__ICCache_setObject_forKey___block_invoke;
  v9[3] = &unk_1EA823F20;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(v7, v9);

}

- (void)setObject:(id)a3 forKey:(id)a4 cost:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICCache;
  -[ICCache setObject:forKey:cost:](&v13, sel_setObject_forKey_cost_, a3, v8, a5);
  -[ICCache mutableKeysAccessQueue](self, "mutableKeysAccessQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__ICCache_setObject_forKey_cost___block_invoke;
  v11[3] = &unk_1EA823F20;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_sync(v9, v11);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCache;
  -[ICCache removeObjectForKey:](&v9, sel_removeObjectForKey_, v4);
  -[ICCache mutableKeysAccessQueue](self, "mutableKeysAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__ICCache_removeObjectForKey___block_invoke;
  v7[3] = &unk_1EA823F20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, v7);

}

- (OS_dispatch_queue)mutableKeysAccessQueue
{
  return self->_mutableKeysAccessQueue;
}

- (ICCache)init
{
  ICCache *v2;
  ICCache *v3;
  void *v4;
  uint64_t v5;
  NSMutableSet *mutableKeys;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *mutableKeysAccessQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICCache;
  v2 = -[ICCache init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ICCache registerForMemoryWarnings](v2, "registerForMemoryWarnings");
    objc_msgSend((id)objc_opt_class(), "cacheCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addPointer:", v3);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    mutableKeys = v3->_mutableKeys;
    v3->_mutableKeys = (NSMutableSet *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.notes.iccache", v7);
    mutableKeysAccessQueue = v3->_mutableKeysAccessQueue;
    v3->_mutableKeysAccessQueue = (OS_dispatch_queue *)v8;

  }
  return v3;
}

- (void)registerForMemoryWarnings
{
  dispatch_source_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v3 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, MEMORY[0x1E0C80D38]);
  -[ICCache setMemoryWarningEventSource:](self, "setMemoryWarningEventSource:", v3);

  objc_initWeak(&location, self);
  -[ICCache memoryWarningEventSource](self, "memoryWarningEventSource");
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __36__ICCache_registerForMemoryWarnings__block_invoke;
  v9 = &unk_1EA823F98;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v4, &v6);

  -[ICCache memoryWarningEventSource](self, "memoryWarningEventSource", v6, v7, v8, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (OS_dispatch_source)memoryWarningEventSource
{
  return self->_memoryWarningEventSource;
}

- (void)setMemoryWarningEventSource:(id)a3
{
  objc_storeStrong((id *)&self->_memoryWarningEventSource, a3);
}

+ (id)cacheCollection
{
  if (cacheCollection_onceToken != -1)
    dispatch_once(&cacheCollection_onceToken, &__block_literal_global_2);
  return (id)cacheCollection_sCacheCollection;
}

void __26__ICCache_cacheCollection__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cacheCollection_sCacheCollection;
  cacheCollection_sCacheCollection = v0;

}

- (void)dealloc
{
  objc_super v3;

  -[ICCache unregisterForMemoryWarnings](self, "unregisterForMemoryWarnings");
  v3.receiver = self;
  v3.super_class = (Class)ICCache;
  -[ICCache dealloc](&v3, sel_dealloc);
}

void __36__ICCache_registerForMemoryWarnings__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "receivedMemoryWarning");

}

- (void)unregisterForMemoryWarnings
{
  void *v3;
  NSObject *v4;

  -[ICCache memoryWarningEventSource](self, "memoryWarningEventSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICCache memoryWarningEventSource](self, "memoryWarningEventSource");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

  }
}

+ (void)purgeAllCaches
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[ICCache cacheCollection](ICCache, "cacheCollection", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeAllObjects");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)removeAllObjects
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICCache;
  -[ICCache removeAllObjects](&v5, sel_removeAllObjects);
  -[ICCache mutableKeysAccessQueue](self, "mutableKeysAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ICCache_removeAllObjects__block_invoke;
  block[3] = &unk_1EA823E80;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __27__ICCache_removeAllObjects__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mutableKeys");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (NSSet)allKeys
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[ICCache mutableKeysAccessQueue](self, "mutableKeysAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __18__ICCache_allKeys__block_invoke;
  v6[3] = &unk_1EA823D70;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __18__ICCache_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mutableKeys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeObjectsWithKeyContainingString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ICCache allKeys](self, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (v4)
        {
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v10, "containsString:", v4))
            -[ICCache removeObjectForKey:](self, "removeObjectForKey:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)setMutableKeys:(id)a3
{
  objc_storeStrong((id *)&self->_mutableKeys, a3);
}

- (void)setMutableKeysAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mutableKeysAccessQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableKeysAccessQueue, 0);
  objc_storeStrong((id *)&self->_mutableKeys, 0);
  objc_storeStrong((id *)&self->_memoryWarningEventSource, 0);
}

@end
