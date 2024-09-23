@implementation EFLazyCache

- (void)_exchangeOriginalObject:(id)a3 forKey:(id)a4 withObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSCache *storage;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSCache objectForKey:](self->_storage, "objectForKey:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v12)
  {
    storage = self->_storage;
    if (v9)
      -[NSCache setObject:forKey:](storage, "setObject:forKey:", v9, v8);
    else
      -[NSCache removeObjectForKey:](storage, "removeObjectForKey:", v8);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (id)objectForKey:(id)a3 generator:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  char isKindOfClass;
  id v10;
  id v11;
  _EFLazyCacheConditionLock *v12;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  while (1)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    -[NSCache objectForKey:](self->_storage, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v10 = v8;
      v11 = (isKindOfClass & 1) != 0 ? 0 : v10;
      v12 = (isKindOfClass & 1) != 0 ? (_EFLazyCacheConditionLock *)v10 : 0;
    }
    else
    {
      v12 = -[_EFLazyCacheConditionLock initWithCondition:]([_EFLazyCacheConditionLock alloc], "initWithCondition:", 0);
      -[NSCache setObject:forKey:](self->_storage, "setObject:forKey:", v12, v6);
      v11 = 0;
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
    if (v11)
      break;
    if (-[NSConditionLock tryLockWhenCondition:](v12, "tryLockWhenCondition:", 0))
    {
      v7[2](v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[EFLazyCache _exchangeOriginalObject:forKey:withObject:](self, "_exchangeOriginalObject:forKey:withObject:", v12, v6, v11);
      -[NSConditionLock unlockWithCondition:](v12, "unlockWithCondition:", 1);
      break;
    }
    -[_EFLazyCacheConditionLock incrementWaiterCount](v12, "incrementWaiterCount");
    -[NSConditionLock lockWhenCondition:](v12, "lockWhenCondition:", 1);
    -[NSConditionLock unlock](v12, "unlock");
    -[_EFLazyCacheConditionLock decrementWaiterCount](v12, "decrementWaiterCount");

  }
  return v11;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v6;
  id WeakRetained;
  NSCache *v8;

  v8 = (NSCache *)a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (self->_storage == v8 && (*(_BYTE *)&self->_flags & 1) != 0)
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "lazyCache:willEvictObject:", self, v6);

  }
}

- (EFLazyCache)init
{
  return -[EFLazyCache initWithCountLimit:](self, "initWithCountLimit:", 20);
}

- (id)cachedObjectForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[EFLazyCache storedObjectForKey:](self, "storedObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (id)storedObjectForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSCache objectForKey:](self->_storage, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSCache setDelegate:](self->_storage, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)EFLazyCache;
  -[EFLazyCache dealloc](&v3, sel_dealloc);
}

- (EFLazyCache)initWithCountLimit:(unint64_t)a3
{
  EFLazyCache *v4;
  NSRecursiveLock *v5;
  NSRecursiveLock *lock;
  NSCache *v7;
  NSCache *storage;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EFLazyCache;
  v4 = -[EFLazyCache init](&v10, sel_init);
  if (v4)
  {
    v5 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v4->_lock;
    v4->_lock = v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    storage = v4->_storage;
    v4->_storage = v7;

    -[NSCache setCountLimit:](v4->_storage, "setCountLimit:", a3);
    -[NSCache setDelegate:](v4->_storage, "setDelegate:", v4);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    v5 = obj;
  }

}

- (void)removeAllObjects
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSCache removeAllObjects](self->_storage, "removeAllObjects");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)removeObjectForKey:(id)a3
{
  id v4;

  v4 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSCache removeObjectForKey:](self->_storage, "removeObjectForKey:", v4);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (EFLazyCacheDelegate)delegate
{
  return (EFLazyCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)waiterCountForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[EFLazyCache storedObjectForKey:](self, "storedObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "waiterCount");
  else
    v4 = 0;

  return v4;
}

@end
