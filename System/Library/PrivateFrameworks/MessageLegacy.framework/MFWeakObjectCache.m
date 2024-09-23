@implementation MFWeakObjectCache

- (MFWeakObjectCache)initWithBlock:(id)a3
{
  MFWeakObjectCache *v4;
  MFWeakObjectCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFWeakObjectCache;
  v4 = -[MFWeakObjectCache init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_block = _Block_copy(a3);
      v5->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      v5->_dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  _Block_release(self->_block);

  v3.receiver = self;
  v3.super_class = (Class)MFWeakObjectCache;
  -[MFWeakObjectCache dealloc](&v3, sel_dealloc);
}

- (id)objectForKey:(id)a3
{
  return -[MFWeakObjectCache objectForKey:shouldGenerate:wasCached:](self, "objectForKey:shouldGenerate:wasCached:", a3, 1, 0);
}

- (id)objectForKey:(id)a3 wasCached:(BOOL *)a4
{
  return -[MFWeakObjectCache objectForKey:shouldGenerate:wasCached:](self, "objectForKey:shouldGenerate:wasCached:", a3, 1, a4);
}

- (id)objectForKey:(id)a3 shouldGenerate:(BOOL)a4 wasCached:(BOOL *)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v6 = a4;
  v9 = (id)objc_msgSend(a3, "copyWithZone:", 0);
  -[NSLock lock](self->_lock, "lock");
  v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v9);
  if (v10)
  {
    v11 = (void *)objc_msgSend(v10, "reference");
    if (v11)
      goto LABEL_12;
    -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", v9);
  }
  if (v6)
  {
    v11 = (void *)(*((uint64_t (**)(void))self->_block + 2))();
    if (v11)
    {
      v12 = objc_msgSend(MEMORY[0x1E0D46158], "weakReferenceWithObject:", v11);
      if (!v12)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFWeakObjectCache.m"), 106, CFSTR("couldn't create a weak reference for %@"), v11);
      objc_setAssociatedObject(v11, self, -[MFWeakObjectCache weakObjectCacheRefForKey:](self, "weakObjectCacheRefForKey:", v9), (void *)1);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictionary, "setObject:forKeyedSubscript:", v12, v9);
    }
    if (a5)
    {
      v13 = 0;
LABEL_14:
      *a5 = v13;
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v11 = 0;
LABEL_12:
  if (a5)
  {
    v13 = 1;
    goto LABEL_14;
  }
LABEL_15:
  -[NSLock unlock](self->_lock, "unlock");
  return v11;
}

- (void)removeObjectForKey:(id)a3
{
  void *v5;
  void *v6;

  -[NSLock lock](self->_lock, "lock");
  v5 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3), "retainedReference");
  v6 = v5;
  if (v5)
  {
    objc_msgSend(objc_getAssociatedObject(v5, self), "setCache:", 0);
    objc_setAssociatedObject(v6, self, 0, (void *)1);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", a3);

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)weakObjectCacheRefForKey:(id)a3
{
  _MFWeakObjectCacheRef *v5;

  v5 = objc_alloc_init(_MFWeakObjectCacheRef);
  -[_MFWeakObjectCacheRef setCache:](v5, "setCache:", self);
  -[_MFWeakObjectCacheRef setKey:](v5, "setKey:", a3);
  return v5;
}

@end
