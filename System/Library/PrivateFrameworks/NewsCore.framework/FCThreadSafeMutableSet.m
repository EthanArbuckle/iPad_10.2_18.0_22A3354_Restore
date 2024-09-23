@implementation FCThreadSafeMutableSet

uint64_t __35__FCThreadSafeMutableSet_unionSet___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unionSet:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (NSSet)readOnlySet
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
  v5[2] = __37__FCThreadSafeMutableSet_readOnlySet__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (FCThreadSafeMutableSet)init
{
  FCThreadSafeMutableSet *v2;
  NFUnfairLock *v3;
  NFUnfairLock *lock;
  NSMutableSet *v5;
  NSMutableSet *set;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCThreadSafeMutableSet;
  v2 = -[FCThreadSafeMutableSet init](&v8, sel_init);
  if (v2)
  {
    v3 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E0D60B18]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    set = v2->_set;
    v2->_set = v5;

  }
  return v2;
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
  v5[2] = __36__FCThreadSafeMutableSet_allObjects__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)unionSet:(id)a3
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
  v7[2] = __35__FCThreadSafeMutableSet_unionSet___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

void __37__FCThreadSafeMutableSet_readOnlySet__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __36__FCThreadSafeMutableSet_allObjects__block_invoke(uint64_t a1)
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
  v7[2] = __36__FCThreadSafeMutableSet_addObject___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __36__FCThreadSafeMutableSet_addObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)addObjectsFromArray:(id)a3
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
  v7[2] = __46__FCThreadSafeMutableSet_addObjectsFromArray___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __46__FCThreadSafeMutableSet_addObjectsFromArray___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
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
  v7[2] = __39__FCThreadSafeMutableSet_removeObject___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __39__FCThreadSafeMutableSet_removeObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObjectsInSet:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  FCThreadSafeMutableSet *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__FCThreadSafeMutableSet_removeObjectsInSet___block_invoke;
  v7[3] = &unk_1E463AD10;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

void __45__FCThreadSafeMutableSet_removeObjectsInSet___block_invoke(uint64_t a1)
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)removeObjectsInArray:(id)a3
{
  id v4;
  NFUnfairLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;
  FCThreadSafeMutableSet *v9;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__FCThreadSafeMutableSet_removeObjectsInArray___block_invoke;
  v7[3] = &unk_1E463AD10;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

void __47__FCThreadSafeMutableSet_removeObjectsInArray___block_invoke(uint64_t a1)
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

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
  v8[2] = __41__FCThreadSafeMutableSet_containsObject___block_invoke;
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

uint64_t __41__FCThreadSafeMutableSet_containsObject___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)enumerateObjectsUsingBlock:(id)a3
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
  v7[2] = __53__FCThreadSafeMutableSet_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E463B790;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __53__FCThreadSafeMutableSet_enumerateObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enumerateObjectsUsingBlock:", *(_QWORD *)(a1 + 40));
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
  v7[2] = __43__FCThreadSafeMutableSet_readWithAccessor___block_invoke;
  v7[3] = &unk_1E463B2D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __43__FCThreadSafeMutableSet_readWithAccessor___block_invoke(uint64_t a1)
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
  v7[2] = __48__FCThreadSafeMutableSet_readWriteWithAccessor___block_invoke;
  v7[3] = &unk_1E463B2D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __48__FCThreadSafeMutableSet_readWriteWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return result;
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
  v5[2] = __31__FCThreadSafeMutableSet_count__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__FCThreadSafeMutableSet_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isEmpty
{
  return -[FCThreadSafeMutableSet count](self, "count") == 0;
}

@end
