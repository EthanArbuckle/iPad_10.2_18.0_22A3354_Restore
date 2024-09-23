@implementation NSSQLRowCache

- (void)dealloc
{
  const __CFDictionary *externalData;
  unint64_t Count;
  _QWORD *v5;
  _PFTask *v6;
  unint64_t v7;
  malloc_zone_t *v8;
  const void **v9;
  malloc_zone_t *v10;
  _DWORD *v11;
  objc_super v12;
  objc_super v13;

  if (self->_sqlCore)
  {
    self->_sqlCore = 0;
    externalData = (const __CFDictionary *)self->super._externalData;
    Count = CFDictionaryGetCount(externalData);
    v5 = 0;
    v6 = 0;
    if (Count >= 0x12C)
    {
      v7 = Count;
      v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
        v8 = malloc_default_zone();
      v9 = (const void **)malloc_type_zone_malloc(v8, 8 * v7, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(externalData, 0, v9);
      v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
        v10 = malloc_default_zone();
      v5 = malloc_type_zone_malloc(v10, 0x20uLL, 0x100004000313F17uLL);
      *v5 = v9;
      v5[1] = v7;
      v5[2] = 0;
      v6 = -[_PFTask initWithFunction:withArgument:andPriority:]([_PFTask alloc], "initWithFunction:withArgument:andPriority:", _deallocateSQLRowCacheOnBackgroundThread, v5, 0);
      do
      {
        v11 = *v9++;
        v11[4] |= 4u;
        --v7;
      }
      while (v7);
    }
    v13.receiver = self;
    v13.super_class = (Class)NSSQLRowCache;
    -[NSPersistentStoreCache dealloc](&v13, sel_dealloc);
    if (v6)
    {
      pthread_mutex_lock(&v6->lock);
      v5[2] = 1;
      pthread_cond_broadcast(&v6->condition);
      pthread_mutex_unlock(&v6->lock);

    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NSSQLRowCache;
    -[NSPersistentStoreCache dealloc](&v12, sel_dealloc);
  }
}

- (NSSQLRowCache)initWithPersistentStore:(id)a3
{
  NSSQLRowCache *result;
  objc_super v5;
  _QWORD v6[3];
  __int128 v7;

  v6[0] = 0;
  v6[1] = _PFfastRowRetain;
  v6[2] = _PFfastRowRelease;
  v7 = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 24);
  v5.receiver = self;
  v5.super_class = (Class)NSSQLRowCache;
  result = -[NSPersistentStoreCache initWithValueCallbacks:preserveToManyRelationships:](&v5, sel_initWithValueCallbacks_preserveToManyRelationships_, v6, 1);
  if (result)
    result->_sqlCore = (NSSQLCore *)a3;
  return result;
}

+ (void)initialize
{
  objc_opt_self();
}

- (id)sqlCore
{
  return self->_sqlCore;
}

@end
