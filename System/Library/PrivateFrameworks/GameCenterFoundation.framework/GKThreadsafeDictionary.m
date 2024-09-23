@implementation GKThreadsafeDictionary

uint64_t __45__GKThreadsafeDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)writeToDictionary:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__GKThreadsafeDictionary_writeToDictionary___block_invoke;
  v7[3] = &unk_1E75B1BF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(queue, v7);

}

void __39__GKThreadsafeDictionary_objectForKey___block_invoke(_QWORD *a1)
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

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *queue;
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
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__GKThreadsafeDictionary_objectForKey___block_invoke;
  block[3] = &unk_1E75B5EA0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (GKThreadsafeDictionary)initWithName:(id)a3
{
  id v4;
  GKThreadsafeDictionary *v5;
  const char *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *dictionary;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKThreadsafeDictionary;
  v5 = -[GKThreadsafeDictionary init](&v12, sel_init);
  if (v5)
  {
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    v7 = dispatch_queue_create(v6, MEMORY[0x1E0C80D50]);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v5->_dictionary;
    v5->_dictionary = v9;

  }
  return v5;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__GKThreadsafeDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E75B1A28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(queue, v7);

}

uint64_t __43__GKThreadsafeDictionary_setObject_forKey___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

uint64_t __44__GKThreadsafeDictionary_writeToDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)objectForKeyWillReplace:(id)a3 objectProducerBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__12;
  v18[4] = __Block_byref_object_dispose__12;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__GKThreadsafeDictionary_objectForKeyWillReplace_objectProducerBlock___block_invoke;
  block[3] = &unk_1E75B5EF0;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v20;
  v17 = v18;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_sync(queue, block);
  v11 = (id)v21[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __70__GKThreadsafeDictionary_objectForKeyWillReplace_objectProducerBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v5 = a1[6];
    if (v5)
    {
      (*(void (**)(void))(v5 + 16))();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1[8] + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v9 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
      if (v9)
        objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v9, a1[5]);
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v10 = a1[6];
    if (v10)
    {
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1[7] + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v14 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      if (v14)
        objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v14, a1[5]);
    }
  }
}

void __59__GKThreadsafeDictionary_objectForKey_objectProducerBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    v5 = a1[6];
    if (v5)
    {
      (*(void (**)(void))(v5 + 16))();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1[7] + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v9 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      if (v9)
        objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v9, a1[5]);
    }
  }
}

- (id)objectForKey:(id)a3 objectProducerBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__GKThreadsafeDictionary_objectForKey_objectProducerBlock___block_invoke;
  v13[3] = &unk_1E75B5EC8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__GKThreadsafeDictionary_setObject_forKey___block_invoke;
  block[3] = &unk_1E75B1A78;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_barrier_async(queue, block);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)GKThreadsafeDictionary;
  -[GKThreadsafeDictionary description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@"), v4, self->_queue, self->_dictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allObjects
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__GKThreadsafeDictionary_allObjects__block_invoke;
  v5[3] = &unk_1E75B32E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__GKThreadsafeDictionary_allObjects__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeObjectsForKeys:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__GKThreadsafeDictionary_removeObjectsForKeys___block_invoke;
  v7[3] = &unk_1E75B1A28;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(queue, v7);

}

uint64_t __47__GKThreadsafeDictionary_removeObjectsForKeys___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectsForKeys:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllObjects
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__GKThreadsafeDictionary_removeAllObjects__block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_barrier_async(queue, block);
}

uint64_t __42__GKThreadsafeDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (void)readFromDictionary:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__GKThreadsafeDictionary_readFromDictionary___block_invoke;
  block[3] = &unk_1E75B1BF0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __45__GKThreadsafeDictionary_readFromDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)allKeys
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__GKThreadsafeDictionary_allKeys__block_invoke;
  v5[3] = &unk_1E75B32E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__GKThreadsafeDictionary_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dictionaryCopy
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__GKThreadsafeDictionary_dictionaryCopy__block_invoke;
  v5[3] = &unk_1E75B32E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__GKThreadsafeDictionary_dictionaryCopy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

@end
