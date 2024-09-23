@implementation CKMultiDict

- (CKMultiDict)init
{
  CKMultiDict *v2;
  id v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *lockQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMultiDict;
  v2 = -[CKMultiDict init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKMultiDict setDictionary:](v2, "setDictionary:", v3);
    v4 = dispatch_queue_create(0, 0);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (id)description
{
  NSObject *lockQueue;
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
  v9 = __Block_byref_object_copy__71;
  v10 = __Block_byref_object_dispose__71;
  v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__CKMultiDict_description__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__CKMultiDict_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)pushObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *lockQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CKMultiDict_pushObject_forKey___block_invoke;
  block[3] = &unk_1E274A0B8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(lockQueue, block);

}

void __33__CKMultiDict_pushObject_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 48));

}

- (id)peekObjectForKey:(id)a3
{
  id v4;
  NSObject *lockQueue;
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
  v15 = __Block_byref_object_copy__71;
  v16 = __Block_byref_object_dispose__71;
  v17 = 0;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CKMultiDict_peekObjectForKey___block_invoke;
  block[3] = &unk_1E274A090;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(lockQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __32__CKMultiDict_peekObjectForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)popObjectForKey:(id)a3
{
  id v4;
  NSObject *lockQueue;
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
  v15 = __Block_byref_object_copy__71;
  v16 = __Block_byref_object_dispose__71;
  v17 = 0;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CKMultiDict_popObjectForKey___block_invoke;
  block[3] = &unk_1E274B950;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(lockQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __31__CKMultiDict_popObjectForKey___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (_QWORD *)a1[4];
  v3 = v2[2];
  if (v3)
  {
    v2[2] = v3 - 1;
    v2 = (_QWORD *)a1[4];
  }
  objc_msgSend(v2, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", a1[5]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lastObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    objc_msgSend(v8, "removeLastObject");

}

- (id)headObjectForKey:(id)a3
{
  id v4;
  NSObject *lockQueue;
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
  v15 = __Block_byref_object_copy__71;
  v16 = __Block_byref_object_dispose__71;
  v17 = 0;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CKMultiDict_headObjectForKey___block_invoke;
  block[3] = &unk_1E274B950;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(lockQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __32__CKMultiDict_headObjectForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)dequeueObjectForKey:(id)a3
{
  id v4;
  NSObject *lockQueue;
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
  v15 = __Block_byref_object_copy__71;
  v16 = __Block_byref_object_dispose__71;
  v17 = 0;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CKMultiDict_dequeueObjectForKey___block_invoke;
  block[3] = &unk_1E274B950;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(lockQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __35__CKMultiDict_dequeueObjectForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(v6, "removeObjectAtIndex:", 0);
  }

}

- (id)objectsForKey:(id)a3
{
  id v4;
  NSObject *lockQueue;
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__71;
  v17 = __Block_byref_object_dispose__71;
  v18 = 0;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CKMultiDict_objectsForKey___block_invoke;
  block[3] = &unk_1E274A090;
  v12 = &v13;
  block[4] = self;
  v6 = v4;
  v11 = v6;
  dispatch_sync(lockQueue, block);
  if (objc_msgSend((id)v14[5], "count"))
    v7 = (void *)v14[5];
  else
    v7 = 0;
  v8 = v7;

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __29__CKMultiDict_objectsForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)removeObjectsForKey:(id)a3
{
  id v4;
  NSObject *lockQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lockQueue = self->_lockQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__CKMultiDict_removeObjectsForKey___block_invoke;
  v7[3] = &unk_1E274A108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(lockQueue, v7);

}

void __35__CKMultiDict_removeObjectsForKey___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) -= objc_msgSend(v2, "count");

  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllObjects
{
  NSObject *lockQueue;
  _QWORD block[5];

  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CKMultiDict_removeAllObjects__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(lockQueue, block);
}

void __31__CKMultiDict_removeAllObjects__block_invoke(uint64_t a1)
{
  id v1;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (unint64_t)count
{
  NSObject *lockQueue;
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
  lockQueue = self->_lockQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__CKMultiDict_count__block_invoke;
  v5[3] = &unk_1E27564A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __20__CKMultiDict_count__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (id)allKeys
{
  NSObject *lockQueue;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__71;
  v12 = __Block_byref_object_dispose__71;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  lockQueue = self->_lockQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__CKMultiDict_allKeys__block_invoke;
  v7[3] = &unk_1E27590C0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(lockQueue, v7);
  if (objc_msgSend((id)v9[5], "count"))
    v4 = (void *)v9[5];
  else
    v4 = 0;
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __22__CKMultiDict_allKeys__block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "dictionary");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __22__CKMultiDict_allKeys__block_invoke_2;
  v3[3] = &unk_1E27594E0;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __22__CKMultiDict_allKeys__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);

}

- (OS_dispatch_queue)lockQueue
{
  return self->_lockQueue;
}

- (void)setLockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lockQueue, a3);
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_lockQueue, 0);
}

@end
