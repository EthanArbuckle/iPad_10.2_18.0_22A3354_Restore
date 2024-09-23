@implementation NSXPCStoreServerPerConnectionCache

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

- (NSXPCStoreServerPerConnectionCache)initWithCoordinator:(id)a3
{
  NSXPCStoreServerPerConnectionCache *v4;
  NSSQLitePrefetchRequestCache *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSXPCStoreServerPerConnectionCache;
  v4 = -[NSXPCStoreServerPerConnectionCache init](&v7, sel_init);
  if (v4)
  {
    v4->_coordinator = (NSPersistentStoreCoordinator *)a3;
    v5 = -[NSSQLitePrefetchRequestCache initWithSQLCore:]([NSSQLitePrefetchRequestCache alloc], "initWithSQLCore:", objc_msgSend((id)objc_msgSend(a3, "persistentStores"), "lastObject"));
    v4->_generationTokenMap = 0;
    v4->_transaction = 0;
    v4->_prefetchRequestCache = v5;
  }
  return v4;
}

- (void)dealloc
{
  OS_os_transaction *transaction;
  objc_super v4;

  transaction = self->_transaction;
  if (transaction)
  {

    self->_transaction = 0;
  }

  self->_coordinator = 0;
  self->_generationTokenMap = 0;

  self->_prefetchRequestCache = 0;
  self->_clientIdentifier = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSXPCStoreServerPerConnectionCache;
  -[NSXPCStoreServerPerConnectionCache dealloc](&v4, sel_dealloc);
}

- (uint64_t)localGenerationForRemoteGeneration:(id *)a1
{
  uint64_t v2;
  uint64_t v5;

  v2 = 0;
  if (a1 && a2)
  {
    objc_sync_enter(a1);
    v5 = objc_msgSend(a1[3], "objectForKey:", a2);
    if (v5)
      v2 = *(_QWORD *)(v5 + 8);
    else
      v2 = 0;
    objc_sync_exit(a1);
  }
  return v2;
}

- (void)registerQueryGeneration:(uint64_t)a3 forRemoteGeneration:
{
  void *v5;
  id v6;
  char *v7;
  _NSGenerationTokenMapEntry *v8;
  unsigned int *v9;
  unsigned int v10;
  objc_super v11;

  if (result)
  {
    v5 = result;
    objc_sync_enter(result);
    v6 = (id)*((_QWORD *)v5 + 3);
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *((_QWORD *)v5 + 3) = v6;
    }
    if (!objc_msgSend(v6, "count") && !*((_QWORD *)v5 + 4))
      *((_QWORD *)v5 + 4) = os_transaction_create();
    v7 = (char *)objc_msgSend(*((id *)v5 + 3), "objectForKey:", a3);
    if (v7)
      goto LABEL_12;
    v8 = [_NSGenerationTokenMapEntry alloc];
    if (v8)
    {
      v11.receiver = v8;
      v11.super_class = (Class)_NSGenerationTokenMapEntry;
      v7 = (char *)objc_msgSendSuper2(&v11, sel_init);
      if (v7)
      {
        *((_QWORD *)v7 + 1) = a2;
        *((_DWORD *)v7 + 4) = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(*((id *)v5 + 3), "setObject:forKey:", v7, a3);

    if (v7)
    {
LABEL_12:
      v9 = (unsigned int *)(v7 + 16);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    return (void *)objc_sync_exit(v5);
  }
  return result;
}

- (id)releaseQueryGenerationForRemoteGeneration:(id *)result
{
  id *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;

  if (result)
  {
    v3 = result;
    objc_sync_enter(result);
    v4 = objc_msgSend(v3[3], "objectForKey:", a2);
    if (v4)
    {
      v5 = (unsigned int *)(v4 + 16);
      do
        v6 = __ldxr(v5);
      while (__stxr(v6 - 1, v5));
      v7 = *v5;
      if (v7)
      {
        if ((v7 & 0x80000000) != 0)
        {
          v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "refCount can't be negative");
          _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, v16);
          v15 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            LOWORD(v16) = 0;
            _os_log_fault_impl(&dword_18A253000, v15, OS_LOG_TYPE_FAULT, "CoreData: refCount can't be negative", (uint8_t *)&v16, 2u);
          }
        }
      }
      else
      {
        objc_msgSend(v3[3], "removeObjectForKey:", a2);
      }
    }
    if (v3[4])
    {
      if (!objc_msgSend(v3[3], "count"))
      {

        v3[4] = 0;
      }
    }
    return (id *)objc_sync_exit(v3);
  }
  return result;
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return -[NSSQLitePrefetchRequestCache inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:](self->_prefetchRequestCache, "inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:", a3, a4);
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return -[NSSQLitePrefetchRequestCache manyToOnePrefetchRequestForRelationshipNamed:onEntity:](self->_prefetchRequestCache, "manyToOnePrefetchRequestForRelationshipNamed:onEntity:", a3, a4);
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return -[NSSQLitePrefetchRequestCache manyToManyPrefetchRequestsForRelationshipNamed:onEntity:](self->_prefetchRequestCache, "manyToManyPrefetchRequestsForRelationshipNamed:onEntity:", a3, a4);
}

- (_QWORD)setClientIdentifier:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[6];
    if (v4)
    {

      v3[6] = 0;
    }
    result = a2;
    v3[6] = result;
  }
  return result;
}

@end
