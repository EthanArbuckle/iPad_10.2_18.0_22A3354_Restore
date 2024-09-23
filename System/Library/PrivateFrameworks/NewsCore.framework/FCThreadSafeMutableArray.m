@implementation FCThreadSafeMutableArray

uint64_t __38__FCThreadSafeMutableArray_addObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__FCThreadSafeMutableArray_readWriteWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

uint64_t __48__FCThreadSafeMutableArray_addObjectsFromArray___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

void __41__FCThreadSafeMutableArray_readOnlyArray__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __39__FCThreadSafeMutableArray_firstObject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)readOnlyArray
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
  v5[2] = __41__FCThreadSafeMutableArray_readOnlyArray__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (FCThreadSafeMutableArray)init
{
  FCThreadSafeMutableArray *v2;
  NFUnfairLock *v3;
  NFUnfairLock *lock;
  NSMutableArray *v5;
  NSMutableArray *array;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCThreadSafeMutableArray;
  v2 = -[FCThreadSafeMutableArray init](&v8, sel_init);
  if (v2)
  {
    v3 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E0D60B18]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    array = v2->_array;
    v2->_array = v5;

  }
  return v2;
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
  v7[2] = __48__FCThreadSafeMutableArray_addObjectsFromArray___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

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
  v7[2] = __38__FCThreadSafeMutableArray_addObject___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

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
  v7[2] = __50__FCThreadSafeMutableArray_readWriteWithAccessor___block_invoke;
  v7[3] = &unk_1E463B2D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

- (id)firstObject
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
  v5[2] = __39__FCThreadSafeMutableArray_firstObject__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)removeFirstObject
{
  NFUnfairLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__FCThreadSafeMutableArray_removeFirstObject__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v3);
}

uint64_t __45__FCThreadSafeMutableArray_removeFirstObject__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "fc_removeFirstObject");
}

- (void)removeAllObjects
{
  NFUnfairLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__FCThreadSafeMutableArray_removeAllObjects__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v3);
}

uint64_t __44__FCThreadSafeMutableArray_removeAllObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
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
  v7[2] = __55__FCThreadSafeMutableArray_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E463B790;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v7);

}

uint64_t __55__FCThreadSafeMutableArray_enumerateObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enumerateObjectsUsingBlock:", *(_QWORD *)(a1 + 40));
}

- (id)lastObject
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
  v5[2] = __38__FCThreadSafeMutableArray_lastObject__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__FCThreadSafeMutableArray_lastObject__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)firstObjectPassingTest:(id)a3
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
  v9[2] = __51__FCThreadSafeMutableArray_firstObjectPassingTest___block_invoke;
  v9[3] = &unk_1E46456A8;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  -[NFUnfairLock performWithLockSync:](lock, "performWithLockSync:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __51__FCThreadSafeMutableArray_firstObjectPassingTest___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "fc_firstObjectPassingTest:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
