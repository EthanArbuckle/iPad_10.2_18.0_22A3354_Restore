@implementation FMConcurrentMutableArray

- (FMConcurrentMutableArray)init
{
  return -[FMConcurrentMutableArray initWithArray:](self, "initWithArray:", MEMORY[0x1E0C9AA60]);
}

- (FMConcurrentMutableArray)initWithArray:(id)a3
{
  id v4;
  FMConcurrentMutableArray *v5;
  uint64_t v6;
  NSMutableArray *underlyingArray;
  FMReadWriteLock *v8;
  FMReadWriteLock *lock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMConcurrentMutableArray;
  v5 = -[FMConcurrentMutableArray init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    underlyingArray = v5->_underlyingArray;
    v5->_underlyingArray = (NSMutableArray *)v6;

    v8 = -[FMReadWriteLock initWithLockName:]([FMReadWriteLock alloc], "initWithLockName:", CFSTR("FMConcurrentMutableArray"));
    lock = v5->_lock;
    v5->_lock = v8;

  }
  return v5;
}

- (unint64_t)count
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[FMConcurrentMutableArray lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__FMConcurrentMutableArray_count__block_invoke;
  v6[3] = &unk_1E5E0DD78;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWithReadLock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __33__FMConcurrentMutableArray_count__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingArray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  -[FMConcurrentMutableArray lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__FMConcurrentMutableArray_objectAtIndex___block_invoke;
  v8[3] = &unk_1E5E0DDA0;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  objc_msgSend(v5, "performWithReadLock:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __42__FMConcurrentMutableArray_objectAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "underlyingArray");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FMConcurrentMutableArray lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__FMConcurrentMutableArray_addObject___block_invoke;
  v7[3] = &unk_1E5E0DDC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithWriteLock:", v7);

}

void __38__FMConcurrentMutableArray_addObject___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingArray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[FMConcurrentMutableArray lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__FMConcurrentMutableArray_insertObject_atIndex___block_invoke;
  v9[3] = &unk_1E5E0DDF0;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "performWithWriteLock:", v9);

}

void __49__FMConcurrentMutableArray_insertObject_atIndex___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingArray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertObject:atIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[FMConcurrentMutableArray lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__FMConcurrentMutableArray_removeObjectAtIndex___block_invoke;
  v6[3] = &unk_1E5E0DE18;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "performWithWriteLock:", v6);

}

void __48__FMConcurrentMutableArray_removeObjectAtIndex___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "underlyingArray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectAtIndex:", *(_QWORD *)(a1 + 40));

}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[FMConcurrentMutableArray lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__FMConcurrentMutableArray_replaceObjectAtIndex_withObject___block_invoke;
  v9[3] = &unk_1E5E0DDF0;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  objc_msgSend(v7, "performWithWriteLock:", v9);

}

void __60__FMConcurrentMutableArray_replaceObjectAtIndex_withObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "underlyingArray");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:atIndexedSubscript:", v2, *(_QWORD *)(a1 + 48));

}

- (id)nativeArray
{
  void *v3;
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
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[FMConcurrentMutableArray lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__FMConcurrentMutableArray_nativeArray__block_invoke;
  v6[3] = &unk_1E5E0DD78;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWithReadLock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__FMConcurrentMutableArray_nativeArray__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "underlyingArray");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableArray)underlyingArray
{
  return self->_underlyingArray;
}

- (void)setUnderlyingArray:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingArray, a3);
}

- (FMReadWriteLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_underlyingArray, 0);
}

@end
