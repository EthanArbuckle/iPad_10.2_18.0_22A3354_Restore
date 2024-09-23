@implementation MFMessageStoreObjectCache

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong(&self->_keyGenerator, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)setKeyGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MFMessageStoreObjectCache)initWithCapacity:(unint64_t)a3
{
  MFMessageStoreObjectCache *v4;
  NSLock *v5;
  NSLock *lock;
  uint64_t v7;
  NSMutableDictionary *cache;
  MFMessageStoreObjectCache *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFMessageStoreObjectCache;
  v4 = -[MFMessageStoreObjectCache init](&v11, sel_init);
  if (v4)
  {
    v5 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v4->_lock;
    v4->_lock = v5;

    v4->_capacity = 4 * a3;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v4->_capacity);
    cache = v4->_cache;
    v4->_cache = (NSMutableDictionary *)v7;

    v9 = v4;
  }

  return v4;
}

- (id)description
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  -[MFMessageStoreObjectCache debugDescription](self, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)debugDescription
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t capacity;
  void *v15;
  void *v16;
  MFMessageStoreObjectCache *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableDictionary count](self->_cache, "count");
  v18 = self;
  -[NSMutableDictionary allValues](self->_cache, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v5);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v20;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ [%lu]"), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10), objc_msgSend(v7, "countForObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10)));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = objc_opt_class();
  capacity = v18->_capacity;
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p> capacity %lu, size %lu, distribution (%@)"), v13, v18, capacity, v3, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_nts_evictObject
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  NSMutableDictionary *cache;
  void *v7;
  id v8;

  if (_nts_evictObject_onceToken != -1)
    dispatch_once(&_nts_evictObject_onceToken, &__block_literal_global_3);
  v3 = -[NSMutableDictionary count](self->_cache, "count");
  v4 = arc4random() % v3;
  -[NSMutableDictionary allKeys](self->_cache, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cache = self->_cache;
  v8 = v5;
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](cache, "removeObjectForKey:", v7);

}

- (void)_nts_setObject:(id)a3 forKey:(id)a4
{
  id v6;
  unint64_t capacity;
  id v8;

  v8 = a3;
  v6 = a4;
  capacity = self->_capacity;
  if (capacity <= -[NSMutableDictionary count](self->_cache, "count"))
    -[MFMessageStoreObjectCache _nts_evictObject](self, "_nts_evictObject");
  -[NSMutableDictionary setObject:forKey:](self->_cache, "setObject:forKey:", v8, v6);

}

- (void)setObject:(id)a3 forMessage:(id)a4 kind:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  -[NSLock lock](self->_lock, "lock");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (*((uint64_t (**)(void))self->_keyGenerator + 2))());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageStoreObjectCache _nts_setObject:forKey:](self, "_nts_setObject:forKey:", v9, v8);

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)addObject:(id)a3 forMessage:(id)a4 kind:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSMutableDictionary *cache;
  void *v11;
  id v12;
  uint64_t (**comparator)(id, id, id);
  NSMutableDictionary *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  -[NSLock lock](self->_lock, "lock");
  v9 = (*((uint64_t (**)(void))self->_keyGenerator + 2))();
  cache = self->_cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cache, "objectForKeyedSubscript:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 && v12)
  {
    comparator = (uint64_t (**)(id, id, id))self->_comparator;
    if (!comparator || comparator[2](comparator, v12, v7) != -1)
      goto LABEL_9;
    v14 = self->_cache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v15);

    v12 = 0;
  }
  if (v7 && !v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageStoreObjectCache _nts_setObject:forKey:](self, "_nts_setObject:forKey:", v7, v16);

    v12 = v7;
  }
LABEL_9:
  -[NSLock unlock](self->_lock, "unlock");

  return v12;
}

- (void)removeObjectForMessage:(id)a3 kind:(int64_t)a4
{
  uint64_t v5;
  NSMutableDictionary *cache;
  void *v7;
  id v8;

  v8 = a3;
  -[NSLock lock](self->_lock, "lock");
  v5 = (*((uint64_t (**)(void))self->_keyGenerator + 2))();
  cache = self->_cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](cache, "removeObjectForKey:", v7);

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)removeAllObjectsForMessage:(id)a3
{
  uint64_t i;
  uint64_t v5;
  NSMutableDictionary *cache;
  void *v7;
  id v8;

  v8 = a3;
  -[NSLock lock](self->_lock, "lock");
  for (i = 0; i != 32; i += 8)
  {
    v5 = (*((uint64_t (**)(void))self->_keyGenerator + 2))();
    cache = self->_cache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](cache, "removeObjectForKey:", v7);

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (id)objectForMessage:(id)a3 kind:(int64_t)a4
{
  id v5;
  uint64_t v6;
  NSMutableDictionary *cache;
  void *v8;
  void *v9;

  v5 = a3;
  -[NSLock lock](self->_lock, "lock");
  v6 = (*((uint64_t (**)(void))self->_keyGenerator + 2))();
  cache = self->_cache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cache, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_lock, "unlock");
  return v9;
}

- (void)flush
{
  -[NSLock lock](self->_lock, "lock");
  -[NSMutableDictionary removeAllObjects](self->_cache, "removeAllObjects");
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)keyGenerator
{
  return self->_keyGenerator;
}

- (id)comparator
{
  return self->_comparator;
}

@end
