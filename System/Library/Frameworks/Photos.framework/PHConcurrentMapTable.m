@implementation PHConcurrentMapTable

- (PHConcurrentMapTable)init
{
  PHConcurrentMapTable *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *isolationQueue;
  uint64_t v5;
  NSMapTable *protectedTable;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHConcurrentMapTable;
  v2 = -[PHConcurrentMapTable init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("PHConcurrentMapTable read/write isolation queue", MEMORY[0x1E0C80D50]);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    protectedTable = v2->_protectedTable;
    v2->_protectedTable = (NSMapTable *)v5;

  }
  return v2;
}

- (void)_dispatchIsolatedWriteAsync:(id)a3
{
  pl_dispatch_barrier_async();
}

- (void)_dispatchIsolatedWriteSync:(id)a3
{
  pl_dispatch_barrier_sync();
}

- (void)_dispatchIsolatedRead:(id)a3
{
  pl_dispatch_sync();
}

- (id)objectForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__40547;
  v15 = __Block_byref_object_dispose__40548;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__PHConcurrentMapTable_objectForKey___block_invoke;
  v8[3] = &unk_1E35DEE50;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[PHConcurrentMapTable _dispatchIsolatedRead:](self, "_dispatchIsolatedRead:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PHConcurrentMapTable_removeObjectForKey___block_invoke;
  v6[3] = &unk_1E35DF9E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PHConcurrentMapTable _dispatchIsolatedWriteAsync:](self, "_dispatchIsolatedWriteAsync:", v6);

}

- (BOOL)tryRemoveObjectForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PHConcurrentMapTable_tryRemoveObjectForKey___block_invoke;
  v7[3] = &unk_1E35DEE50;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[PHConcurrentMapTable _dispatchIsolatedWriteSync:](self, "_dispatchIsolatedWriteSync:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
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
  v10[2] = __41__PHConcurrentMapTable_setObject_forKey___block_invoke;
  v10[3] = &unk_1E35DFAF8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PHConcurrentMapTable _dispatchIsolatedWriteAsync:](self, "_dispatchIsolatedWriteAsync:", v10);

}

- (unint64_t)count
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
  v4[2] = __29__PHConcurrentMapTable_count__block_invoke;
  v4[3] = &unk_1E35DF920;
  v4[4] = self;
  v4[5] = &v5;
  -[PHConcurrentMapTable _dispatchIsolatedRead:](self, "_dispatchIsolatedRead:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)removeAllObjects
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__PHConcurrentMapTable_removeAllObjects__block_invoke;
  v2[3] = &unk_1E35DF110;
  v2[4] = self;
  -[PHConcurrentMapTable _dispatchIsolatedWriteAsync:](self, "_dispatchIsolatedWriteAsync:", v2);
}

- (id)allKeys
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__PHConcurrentMapTable_allKeys__block_invoke;
  v8[3] = &unk_1E35DF9E8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[PHConcurrentMapTable _dispatchIsolatedRead:](self, "_dispatchIsolatedRead:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedTable, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

void __31__PHConcurrentMapTable_allKeys__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __40__PHConcurrentMapTable_removeAllObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

uint64_t __29__PHConcurrentMapTable_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __41__PHConcurrentMapTable_setObject_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[5], a1[6]);
}

uint64_t __46__PHConcurrentMapTable_tryRemoveObjectForKey___block_invoke(_QWORD *a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v2 != 0;

  return objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);
}

uint64_t __43__PHConcurrentMapTable_removeObjectForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __37__PHConcurrentMapTable_objectForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)mapTable
{
  return objc_alloc_init(PHConcurrentMapTable);
}

@end
