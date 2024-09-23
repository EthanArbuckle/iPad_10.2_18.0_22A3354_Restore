@implementation FCThreadSafeHashTable

+ (FCThreadSafeHashTable)hashTableWithOptions:(unint64_t)a3
{
  return (FCThreadSafeHashTable *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:capacity:", a3, 0);
}

- (FCThreadSafeHashTable)initWithOptions:(unint64_t)a3 capacity:(unint64_t)a4
{
  FCThreadSafeHashTable *v6;
  uint64_t v7;
  NFUnfairLock *lock;
  uint64_t v9;
  NSHashTable *hashTable;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FCThreadSafeHashTable;
  v6 = -[FCThreadSafeHashTable init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    lock = v6->_lock;
    v6->_lock = (NFUnfairLock *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", a3, a4);
    hashTable = v6->_hashTable;
    v6->_hashTable = (NSHashTable *)v9;

  }
  return v6;
}

- (FCThreadSafeHashTable)init
{
  return -[FCThreadSafeHashTable initWithOptions:capacity:](self, "initWithOptions:capacity:", 0, 0);
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
  v5[2] = __30__FCThreadSafeHashTable_count__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__FCThreadSafeHashTable_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)addObject:(id)a3
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
  v7[2] = __35__FCThreadSafeHashTable_addObject___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __35__FCThreadSafeHashTable_addObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObject:(id)a3
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
  v7[2] = __38__FCThreadSafeHashTable_removeObject___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __38__FCThreadSafeHashTable_removeObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllObjects
{
  NFUnfairLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__FCThreadSafeHashTable_removeAllObjects__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v3);
}

uint64_t __41__FCThreadSafeHashTable_removeAllObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (NSArray)allObjects
{
  NFUnfairLock *lock;
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
  v9 = __Block_byref_object_copy__86;
  v10 = __Block_byref_object_dispose__86;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__FCThreadSafeHashTable_allObjects__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __35__FCThreadSafeHashTable_allObjects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allObjects");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)containsObject:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__FCThreadSafeHashTable_containsObject___block_invoke;
  v8[3] = &unk_1E463AD58;
  v10 = &v11;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

uint64_t __40__FCThreadSafeHashTable_containsObject___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashTable, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
