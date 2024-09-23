@implementation DNDSMemoryCachedBackingStore

- (DNDSMemoryCachedBackingStore)initWithUnderlyingBackingStore:(id)a3
{
  id v5;
  DNDSMemoryCachedBackingStore *v6;
  DNDSMemoryCachedBackingStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSMemoryCachedBackingStore;
  v6 = -[DNDSMemoryCachedBackingStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingBackingStore, a3);
    objc_msgSend(v5, "setDelegate:", v7);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)readRecordWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  DNDSBackingStoreRecord *v6;
  DNDSBackingStoreRecord *cache;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_cache)
  {
    -[DNDSBackingStore readRecordWithError:](self->_underlyingBackingStore, "readRecordWithError:", a3);
    v6 = (DNDSBackingStoreRecord *)objc_claimAutoreleasedReturnValue();
    cache = self->_cache;
    self->_cache = v6;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_cache;
}

- (unint64_t)writeRecord:(id)a3 error:(id *)a4
{
  return -[DNDSMemoryCachedBackingStore writeRecord:writePartition:error:](self, "writeRecord:writePartition:error:", a3, 1, a4);
}

- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  unint64_t v9;
  DNDSBackingStoreRecord *v10;
  DNDSBackingStoreRecord *cache;

  v6 = a4;
  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((-[DNDSBackingStoreRecord isEqual:](self->_cache, "isEqual:", v8) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v10 = (DNDSBackingStoreRecord *)objc_msgSend(v8, "copyWithZone:", 0);
    cache = self->_cache;
    self->_cache = v10;

    v9 = -[DNDSBackingStore writeRecord:writePartition:error:](self->_underlyingBackingStore, "writeRecord:writePartition:error:", v8, v6, a5);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (void)purgeCache
{
  os_unfair_lock_s *p_lock;
  DNDSBackingStoreRecord *cache;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cache = self->_cache;
  self->_cache = 0;

  os_unfair_lock_unlock(p_lock);
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  -[DNDSMemoryCachedBackingStore delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backingStore:migrateDictionaryRepresentation:fromVersionNumber:toVersionNumber:", v11, v10, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (DNDSCachedBackingStoreDelegate)delegate
{
  return (DNDSCachedBackingStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_underlyingBackingStore, 0);
}

@end
