@implementation FCThreadSafeMapTable

uint64_t __46__FCThreadSafeMapTable_readWriteWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return result;
}

- (void)readWithAccessor:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__FCThreadSafeMapTable_readWithAccessor___block_invoke;
  v7[3] = &unk_1E463B2D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __41__FCThreadSafeMapTable_readWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return result;
}

- (void)readWriteWithAccessor:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__FCThreadSafeMapTable_readWriteWithAccessor___block_invoke;
  v7[3] = &unk_1E463B2D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

+ (id)strongToWeakObjectsMapTable
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
}

- (FCThreadSafeMapTable)initWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4 capacity:(unint64_t)a5
{
  FCThreadSafeMapTable *v8;
  uint64_t v9;
  NFUnfairLock *lock;
  uint64_t v11;
  NSMapTable *mapTable;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FCThreadSafeMapTable;
  v8 = -[FCThreadSafeMapTable init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    lock = v8->_lock;
    v8->_lock = (NFUnfairLock *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", a3, a4, a5);
    mapTable = v8->_mapTable;
    v8->_mapTable = (NSMapTable *)v11;

  }
  return v8;
}

- (FCThreadSafeMapTable)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCThreadSafeMapTable init]";
    v9 = 2080;
    v10 = "FCThreadSafeCollections.m";
    v11 = 1024;
    v12 = 537;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCThreadSafeMapTable init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

+ (FCThreadSafeMapTable)mapTableWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4
{
  return (FCThreadSafeMapTable *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithKeyOptions:valueOptions:capacity:", a3, a4, 0);
}

- (id)objectForKey:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  id v7;
  _QWORD v9[5];
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
  v15 = __Block_byref_object_copy__86;
  v16 = __Block_byref_object_dispose__86;
  v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__FCThreadSafeMapTable_objectForKey___block_invoke;
  v9[3] = &unk_1E463AD58;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __37__FCThreadSafeMapTable_objectForKey___block_invoke(_QWORD *a1)
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

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__FCThreadSafeMapTable_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __43__FCThreadSafeMapTable_removeObjectForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NFUnfairLock *lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__FCThreadSafeMapTable_setObject_forKey___block_invoke;
  v11[3] = &unk_1E463B228;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v11);

}

uint64_t __41__FCThreadSafeMapTable_setObject_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKey:", a1[5], a1[6]);
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  FCThreadSafeMapTable *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FCThreadSafeMapTable_addEntriesFromDictionary___block_invoke;
  v7[3] = &unk_1E463AD10;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __49__FCThreadSafeMapTable_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__FCThreadSafeMapTable_addEntriesFromDictionary___block_invoke_2;
  v3[3] = &unk_1E46430E0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __49__FCThreadSafeMapTable_addEntriesFromDictionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", a3, a2);
}

- (unint64_t)count
{
  NFUnfairLock *lock;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__FCThreadSafeMapTable_count__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__FCThreadSafeMapTable_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)removeAllObjects
{
  NFUnfairLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__FCThreadSafeMapTable_removeAllObjects__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v3);
}

uint64_t __40__FCThreadSafeMapTable_removeAllObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (id)subdictionaryForKeys:(id)a3
{
  return -[FCThreadSafeMapTable subdictionaryForKeys:passingTest:](self, "subdictionaryForKeys:passingTest:", a3, &__block_literal_global_186);
}

uint64_t __45__FCThreadSafeMapTable_subdictionaryForKeys___block_invoke()
{
  return 1;
}

- (id)subdictionaryForKeys:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NFUnfairLock *lock;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  FCThreadSafeMapTable *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  lock = self->_lock;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__FCThreadSafeMapTable_subdictionaryForKeys_passingTest___block_invoke;
  v16[3] = &unk_1E46464B0;
  v17 = v6;
  v18 = self;
  v20 = v7;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

void __57__FCThreadSafeMapTable_subdictionaryForKeys_passingTest___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKey:", v7, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
          objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapTable, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
