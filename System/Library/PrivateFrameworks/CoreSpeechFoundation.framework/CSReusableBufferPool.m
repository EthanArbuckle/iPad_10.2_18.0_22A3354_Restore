@implementation CSReusableBufferPool

- (CSReusableBufferPool)initWithConfiguration:(id)a3
{
  id v5;
  CSReusableBufferPool *v6;
  CSReusableBufferPool *v7;
  NSMutableArray *v8;
  NSMutableArray *recycledBackingStores;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSReusableBufferPool;
  v6 = -[CSReusableBufferPool init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recycledBackingStores = v7->_recycledBackingStores;
    v7->_recycledBackingStores = v8;

  }
  return v7;
}

- (id)dataWithBytes:(const void *)a3 length:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[CSReusableBufferPool _getAvailableBackingStore](self, "_getAvailableBackingStore");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (id)v8;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[CSReusableBufferPool _createNewBackingStore](self, "_createNewBackingStore");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    if (!v9)
    {
LABEL_6:
      v13 = 0;
      goto LABEL_7;
    }
  }
  if (!objc_msgSend(v9, "configureWithBytes:length:", a3, a4))
    goto LABEL_6;
  objc_initWeak(&location, self);
  v10 = objc_alloc(MEMORY[0x1E0C99D50]);
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "bytes");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__CSReusableBufferPool_dataWithBytes_length___block_invoke;
  v15[3] = &unk_1E6880B48;
  objc_copyWeak(&v17, &location);
  v9 = v11;
  v16 = v9;
  v13 = (void *)objc_msgSend(v10, "initWithBytesNoCopy:length:deallocator:", v12, a4, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
LABEL_7:

  return v13;
}

- (void)cleanup
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[CSReusableBufferPool _checkIdleBackingStores](self, "_checkIdleBackingStores");
  os_unfair_lock_unlock(p_lock);
}

- (void)handleUsedBackingStore:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[CSReusableBufferPool _recycleUsedBackingStore:](self, "_recycleUsedBackingStore:", v5);

  -[CSReusableBufferPool _checkIdleBackingStores](self, "_checkIdleBackingStores");
  os_unfair_lock_unlock(p_lock);
}

- (id)_getAvailableBackingStore
{
  void *v3;

  -[NSMutableArray lastObject](self->_recycledBackingStores, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[NSMutableArray removeLastObject](self->_recycledBackingStores, "removeLastObject");
  return v3;
}

- (id)_createNewBackingStore
{
  CSReusablePrivateMemoryBackingStore *v3;

  if (-[CSReusableBufferPool _canCreateNewBackingStore](self, "_canCreateNewBackingStore"))
  {
    v3 = -[CSReusablePrivateMemoryBackingStore initWithBufferSize:]([CSReusablePrivateMemoryBackingStore alloc], "initWithBufferSize:", -[CSReusableBufferPoolConfiguration backingStoreCapacity](self->_configuration, "backingStoreCapacity"));
    ++self->_numberOfBackingStores;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_canCreateNewBackingStore
{
  unint64_t v3;

  v3 = -[CSReusableBufferPoolConfiguration maximumNumberOfBackingStores](self->_configuration, "maximumNumberOfBackingStores");
  return !v3 || self->_numberOfBackingStores < v3;
}

- (void)_recycleUsedBackingStore:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setRecycleHostTime:", mach_absolute_time());
  -[NSMutableArray addObject:](self->_recycledBackingStores, "addObject:", v4);

}

- (void)_checkIdleBackingStores
{
  unint64_t numberOfBackingStores;
  double v4;
  double v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  numberOfBackingStores = self->_numberOfBackingStores;
  if (numberOfBackingStores > -[CSReusableBufferPoolConfiguration minimalNumberOfBackingStores](self->_configuration, "minimalNumberOfBackingStores"))
  {
    -[CSReusableBufferPoolConfiguration backingStoreIdleTimeout](self->_configuration, "backingStoreIdleTimeout");
    if (v4 != 0.0)
    {
      v5 = v4;
      if (-[NSMutableArray count](self->_recycledBackingStores, "count"))
      {
        v6 = mach_absolute_time();
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v7 = self->_recycledBackingStores;
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
        {
          v9 = v8;
          v10 = 0;
          v11 = *(_QWORD *)v17;
          while (2)
          {
            v12 = 0;
            v15 = v10 + v9;
            do
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v7);
              v13 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "recycleHostTime");
              if (_CSMachAbsoluteTimeRate_onceToken != -1)
                dispatch_once(&_CSMachAbsoluteTimeRate_onceToken, &__block_literal_global_313);
              if (*(double *)&_CSMachAbsoluteTimeRate_rate * (double)(v6 - v13) / 1000000000.0 <= v5)
              {
                v14 = v10 + v12;
                goto LABEL_17;
              }
              ++v12;
            }
            while (v9 != v12);
            v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            v14 = v15;
            v10 = v15;
            if (v9)
              continue;
            break;
          }
LABEL_17:

          if (v14)
            -[NSMutableArray removeObjectsInRange:](self->_recycledBackingStores, "removeObjectsInRange:", 0, v14);
        }
        else
        {

        }
      }
    }
  }
}

- (CSReusableBufferPoolConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_recycledBackingStores, 0);
}

void __45__CSReusableBufferPool_dataWithBytes_length___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleUsedBackingStore:", *(_QWORD *)(a1 + 32));

}

@end
