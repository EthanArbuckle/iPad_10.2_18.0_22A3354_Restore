@implementation MFWeakObjectCache

- (id)objectForKey:(id)a3
{
  -[MFWeakObjectCache objectForKey:shouldGenerate:wasCached:](self, "objectForKey:shouldGenerate:wasCached:", a3, 1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectForKey:(id)a3 shouldGenerate:(BOOL)a4 wasCached:(BOOL *)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  MFWeakObjectCache *v16;
  id v17;
  _MFWeakObjectCacheRef *v18;
  BOOL v19;
  void *v21;

  v6 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", 0);

  -[NSLock lock](self->_lock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "reference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = v12;
      if (!a5)
        goto LABEL_17;
      goto LABEL_13;
    }
    -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", v10);

  }
  if (v6)
  {
    (*((void (**)(void))self->_block + 2))();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D46158], "weakReferenceWithObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFWeakObjectCache.m"), 106, CFSTR("couldn't create a weak reference for %@"), v13);

      }
      v15 = v13;
      v16 = self;
      v17 = v10;
      v18 = objc_alloc_init(_MFWeakObjectCacheRef);
      -[_MFWeakObjectCacheRef setCache:](v18, "setCache:", v16);
      -[_MFWeakObjectCacheRef setKey:](v18, "setKey:", v17);
      objc_setAssociatedObject(v15, v16, v18, (void *)1);

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictionary, "setObject:forKeyedSubscript:", v14, v17);
      if (!a5)
        goto LABEL_17;
    }
    else
    {
      v14 = 0;
      if (!a5)
        goto LABEL_17;
    }
    v19 = 0;
    goto LABEL_16;
  }
  v14 = 0;
  v13 = 0;
  if (a5)
  {
LABEL_13:
    v19 = 1;
LABEL_16:
    *a5 = v19;
  }
LABEL_17:
  -[NSLock unlock](self->_lock, "unlock");

  return v13;
}

- (MFWeakObjectCache)initWithBlock:(id)a3
{
  id v4;
  MFWeakObjectCache *v5;
  MFWeakObjectCache *v6;
  uint64_t v7;
  id block;
  NSLock *v9;
  NSLock *lock;
  NSMutableDictionary *v11;
  void *dictionary;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MFWeakObjectCache;
  v5 = -[MFWeakObjectCache init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(v4, "copy");
      block = v6->_block;
      v6->_block = (id)v7;

      v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      lock = v6->_lock;
      v6->_lock = v9;

      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      dictionary = v6->_dictionary;
      v6->_dictionary = v11;
    }
    else
    {
      dictionary = v5;
      v6 = 0;
    }

  }
  return v6;
}

- (id)objectForKey:(id)a3 wasCached:(BOOL *)a4
{
  -[MFWeakObjectCache objectForKey:shouldGenerate:wasCached:](self, "objectForKey:shouldGenerate:wasCached:", a3, 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeObjectForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[NSLock lock](self->_lock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    _removeDestructionHandler(v5, self);
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", v7);
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)removeAllObjects
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_dictionary, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "reference");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
          _removeDestructionHandler(v7, self);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  -[NSMutableDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
  -[NSLock unlock](self->_lock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
