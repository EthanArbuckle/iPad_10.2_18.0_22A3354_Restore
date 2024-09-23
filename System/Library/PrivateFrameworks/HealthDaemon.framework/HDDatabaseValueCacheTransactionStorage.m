@implementation HDDatabaseValueCacheTransactionStorage

- (HDDatabaseValueCacheTransactionStorage)init
{
  HDDatabaseValueCacheTransactionStorage *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDatabaseValueCacheTransactionStorage;
  v2 = -[HDDatabaseValueCacheTransactionStorage init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cache = v2->_cache;
    v2->_cache = v3;

    v2->_cacheScope = 0;
    v2->_didRemoveAllObjects = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
