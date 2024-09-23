@implementation LACThreadSafeCollection

+ (id)weakObjectsCollection
{
  return -[LACThreadSafeCollection initWithWeakObjects:]([LACThreadSafeCollection alloc], "initWithWeakObjects:", 1);
}

+ (id)strongObjectsCollection
{
  return -[LACThreadSafeCollection initWithWeakObjects:]([LACThreadSafeCollection alloc], "initWithWeakObjects:", 0);
}

- (LACThreadSafeCollection)initWithWeakObjects:(BOOL)a3
{
  LACThreadSafeCollection *v4;
  LACThreadSafeCollection *v5;
  NSHashTable *v6;
  NSHashTable *objects;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LACThreadSafeCollection;
  v4 = -[LACThreadSafeCollection init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_weakObjects = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (NSHashTable *)objc_alloc_init(MEMORY[0x24BDD15C0]);
    }
    objects = v5->_objects;
    v5->_objects = v6;

    v5->_objectsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)append:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__LACThreadSafeCollection_append___block_invoke;
  v6[3] = &unk_2510C1DC8;
  v7 = v4;
  v5 = v4;
  -[LACThreadSafeCollection _synchronizedObjects:](self, "_synchronizedObjects:", v6);

}

uint64_t __34__LACThreadSafeCollection_append___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)remove:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__LACThreadSafeCollection_remove___block_invoke;
  v6[3] = &unk_2510C1DC8;
  v7 = v4;
  v5 = v4;
  -[LACThreadSafeCollection _synchronizedObjects:](self, "_synchronizedObjects:", v6);

}

uint64_t __34__LACThreadSafeCollection_remove___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (int64_t)count
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __32__LACThreadSafeCollection_count__block_invoke;
  v4[3] = &unk_2510C2090;
  v4[4] = self;
  v4[5] = &v5;
  -[LACThreadSafeCollection _synchronizedObjects:](self, "_synchronizedObjects:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__LACThreadSafeCollection_count__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 20))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if (*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i))
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "count");
  }

}

- (void)forEach:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __35__LACThreadSafeCollection_forEach___block_invoke;
  v13[3] = &unk_2510C1D50;
  v13[4] = &v14;
  -[LACThreadSafeCollection _synchronizedObjects:](self, "_synchronizedObjects:", v13);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = (id)v15[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v20, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v14, 8);
}

void __35__LACThreadSafeCollection_forEach___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_synchronizedObjects:(id)a3
{
  os_unfair_lock_s *p_objectsLock;
  void (**v5)(id, NSHashTable *);

  p_objectsLock = &self->_objectsLock;
  v5 = (void (**)(id, NSHashTable *))a3;
  os_unfair_lock_lock(p_objectsLock);
  v5[2](v5, self->_objects);

  os_unfair_lock_unlock(p_objectsLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
