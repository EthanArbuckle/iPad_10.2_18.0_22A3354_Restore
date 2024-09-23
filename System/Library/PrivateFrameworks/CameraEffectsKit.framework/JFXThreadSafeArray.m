@implementation JFXThreadSafeArray

- (JFXThreadSafeArray)init
{
  JFXThreadSafeArray *v2;
  id v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXThreadSafeArray;
  v2 = -[JFXThreadSafeArray init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[JFXThreadSafeArray setArray:](v2, "setArray:", v3);

    v4 = dispatch_queue_create("com.apple.threadsafearrayconcurrentqueuelabel", MEMORY[0x24BDAC9C0]);
    -[JFXThreadSafeArray setConcurrentQueue:](v2, "setConcurrentQueue:", v4);

  }
  return v2;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[JFXThreadSafeArray array](self, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)addObject:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__JFXThreadSafeArray_addObject___block_invoke;
    block[3] = &unk_24EE57AA8;
    block[4] = self;
    v7 = v5;
    dispatch_barrier_sync(v4, block);

  }
}

void __32__JFXThreadSafeArray_addObject___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (id)objectAtIndex:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  v14 = 0;
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__JFXThreadSafeArray_objectAtIndex___block_invoke;
  block[3] = &unk_24EE598D8;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __36__JFXThreadSafeArray_objectAtIndex___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  v4 = *(_QWORD *)(a1 + 48);

  if (v3 > v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__JFXThreadSafeArray_indexOfObject___block_invoke;
  block[3] = &unk_24EE58190;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __36__JFXThreadSafeArray_indexOfObject___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "indexOfObject:", *(_QWORD *)(a1 + 40));

}

- (id)objectsAtIndexes:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__JFXThreadSafeArray_objectsAtIndexes___block_invoke;
  block[3] = &unk_24EE58190;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __39__JFXThreadSafeArray_objectsAtIndexes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsAtIndexes:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v7;

  -[JFXThreadSafeArray objectAtIndex:](self, "objectAtIndex:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (a4 <= a3)
  {
    -[JFXThreadSafeArray insertObject:atIndex:](self, "insertObject:atIndex:", v7, a4);
    -[JFXThreadSafeArray removeObjectAtIndex:](self, "removeObjectAtIndex:", a3 + 1);
  }
  else
  {
    -[JFXThreadSafeArray removeObjectAtIndex:](self, "removeObjectAtIndex:", a3);
    -[JFXThreadSafeArray insertObject:atIndex:](self, "insertObject:atIndex:", v7, a4);
  }

}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  JFXThreadSafeArray *v11;
  unint64_t v12;

  v6 = a3;
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__JFXThreadSafeArray_insertObject_atIndex___block_invoke;
  block[3] = &unk_24EE583F8;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_barrier_sync(v7, block);

}

void __43__JFXThreadSafeArray_insertObject_atIndex___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "array");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__JFXThreadSafeArray_removeObjectAtIndex___block_invoke;
  v6[3] = &unk_24EE58078;
  v6[4] = self;
  v6[5] = a3;
  dispatch_barrier_sync(v5, v6);

}

void __42__JFXThreadSafeArray_removeObjectAtIndex___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v2 < v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", *(_QWORD *)(a1 + 40));

  }
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  JFXThreadSafeArray *v11;
  unint64_t v12;

  v6 = a4;
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__JFXThreadSafeArray_replaceObjectAtIndex_withObject___block_invoke;
  block[3] = &unk_24EE583F8;
  v11 = self;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_barrier_sync(v7, block);

}

void __54__JFXThreadSafeArray_replaceObjectAtIndex_withObject___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  id v5;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v2 < v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "array");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

    }
  }
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
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
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__JFXThreadSafeArray_containsObject___block_invoke;
  block[3] = &unk_24EE58190;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __37__JFXThreadSafeArray_containsObject___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeObject:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__JFXThreadSafeArray_removeObject___block_invoke;
    block[3] = &unk_24EE57AA8;
    block[4] = self;
    v7 = v5;
    dispatch_barrier_sync(v4, block);

  }
}

void __35__JFXThreadSafeArray_removeObject___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeAllObjects
{
  NSObject *v3;
  _QWORD block[5];

  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__JFXThreadSafeArray_removeAllObjects__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_barrier_sync(v3, block);

}

void __38__JFXThreadSafeArray_removeAllObjects__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (unint64_t)count
{
  NSObject *v3;
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
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__JFXThreadSafeArray_count__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __27__JFXThreadSafeArray_count__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (void)sortUsingSelector:(SEL)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__JFXThreadSafeArray_sortUsingSelector___block_invoke;
  v6[3] = &unk_24EE58078;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

void __40__JFXThreadSafeArray_sortUsingSelector___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortUsingSelector:", *(_QWORD *)(a1 + 40));

}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__JFXThreadSafeArray_enumerateObjectsUsingBlock___block_invoke;
  block[3] = &unk_24EE580A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

void __49__JFXThreadSafeArray_enumerateObjectsUsingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", *(_QWORD *)(a1 + 40));

}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__JFXThreadSafeArray_enumerateObjectsWithOptions_usingBlock___block_invoke;
  block[3] = &unk_24EE59900;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_barrier_sync(v7, block);

}

void __61__JFXThreadSafeArray_enumerateObjectsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsWithOptions:usingBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)removeObjectsInArray:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__JFXThreadSafeArray_removeObjectsInArray___block_invoke;
    block[3] = &unk_24EE57AA8;
    block[4] = self;
    v7 = v5;
    dispatch_barrier_sync(v4, block);

  }
}

void __43__JFXThreadSafeArray_removeObjectsInArray___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));

}

- (id)copyOfArray
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
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = 0;
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__JFXThreadSafeArray_copyOfArray__block_invoke;
  v6[3] = &unk_24EE57A80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__JFXThreadSafeArray_copyOfArray__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)sortedArrayUsingComparator:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  -[JFXThreadSafeArray concurrentQueue](self, "concurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__JFXThreadSafeArray_sortedArrayUsingComparator___block_invoke;
  block[3] = &unk_24EE59928;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__JFXThreadSafeArray_sortedArrayUsingComparator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
  objc_storeStrong((id *)&self->_array, a3);
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setConcurrentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_array, 0);
}

@end
