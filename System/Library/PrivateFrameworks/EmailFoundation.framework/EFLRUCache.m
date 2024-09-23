@implementation EFLRUCache

- (EFLRUCache)initWithCapacity:(unint64_t)a3
{
  EFLRUCache *v4;
  EFLRUCache *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *nodesByKey;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EFLRUCache;
  v4 = -[EFLRUCache init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_capacity = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nodesByKey = v5->_nodesByKey;
    v5->_nodesByKey = v6;

    v5->_size = 0;
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __17__EFLRUCache_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1)
    dispatch_once(&log_onceToken_4, block);
  return (OS_os_log *)(id)log_log_4;
}

void __17__EFLRUCache_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;

}

- (void)addObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  _EFLRUCacheNode *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[EFLRUCache nodesByKey](self, "nodesByKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[EFLRUCache log](EFLRUCache, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[EFLRUCache addObject:forKey:].cold.1(v10);

  }
  else
  {
    v11 = -[EFLRUCache size](self, "size");
    if (v11 >= -[EFLRUCache capacity](self, "capacity"))
      -[EFLRUCache _pruneLastObject](self, "_pruneLastObject");
    v12 = -[_EFLRUCacheNode initWithKey:element:]([_EFLRUCacheNode alloc], "initWithKey:element:", v7, v6);
    -[EFLRUCache nodesByKey](self, "nodesByKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v7);

    -[EFLRUCache setSize:](self, "setSize:", -[EFLRUCache size](self, "size") + 1);
    -[EFLRUCache lastNode](self, "lastNode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v12;
    if (!v14)
      -[EFLRUCache setLastNode:](self, "setLastNode:", v12);
  }
  -[EFLRUCache _pushToTop:](self, "_pushToTop:", v9);

  os_unfair_lock_unlock(&self->_lock);
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[EFLRUCache nodesByKey](self, "nodesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[EFLRUCache _pushToTop:](self, "_pushToTop:", v6);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v6, "element");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _EFLRUCacheNode *lastNode;
  _EFLRUCacheNode *firstNode;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[EFLRUCache nodesByKey](self, "nodesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "setNext:", 0, (_QWORD)v14);
        objc_msgSend(v10, "setPrevious:", 0);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  lastNode = self->_lastNode;
  self->_lastNode = 0;

  firstNode = self->_firstNode;
  self->_firstNode = 0;

  -[EFLRUCache nodesByKey](self, "nodesByKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[EFLRUCache setSize:](self, "setSize:", 0);
  os_unfair_lock_unlock(p_lock);
}

- (void)_pushToTop:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "next");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previous");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNext:", v4);

  objc_msgSend(v7, "setPrevious:", 0);
  -[EFLRUCache firstNode](self, "firstNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNext:", v6);
  objc_msgSend(v6, "setPrevious:", v7);
  -[EFLRUCache setFirstNode:](self, "setFirstNode:", v7);

}

- (void)_pruneLastObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[EFLRUCache lastNode](self, "lastNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "previous");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFLRUCache nodesByKey](self, "nodesByKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

    objc_msgSend(v4, "setNext:", 0);
    -[EFLRUCache setLastNode:](self, "setLastNode:", v4);
    -[EFLRUCache setSize:](self, "setSize:", -[EFLRUCache size](self, "size") - 1);

    v3 = v7;
  }

}

- (NSString)ef_publicDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, Capacity: %lu, Size: %lu "), self, -[EFLRUCache capacity](self, "capacity"), -[EFLRUCache size](self, "size"));
}

- (unint64_t)test_size
{
  void *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFLRUCache.m"), 132, CFSTR("%s can only be called from unit tests"), "-[EFLRUCache test_size]");

  }
  return -[EFLRUCache size](self, "size");
}

- (id)test_firstNode
{
  void *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFLRUCache.m"), 137, CFSTR("%s can only be called from unit tests"), "-[EFLRUCache test_firstNode]");

  }
  return -[EFLRUCache firstNode](self, "firstNode");
}

- (id)test_lastNode
{
  void *v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFLRUCache.m"), 142, CFSTR("%s can only be called from unit tests"), "-[EFLRUCache test_lastNode]");

  }
  return -[EFLRUCache lastNode](self, "lastNode");
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (NSMutableDictionary)nodesByKey
{
  return self->_nodesByKey;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (_EFLRUCacheNode)firstNode
{
  return self->_firstNode;
}

- (void)setFirstNode:(id)a3
{
  objc_storeStrong((id *)&self->_firstNode, a3);
}

- (_EFLRUCacheNode)lastNode
{
  return self->_lastNode;
}

- (void)setLastNode:(id)a3
{
  objc_storeStrong((id *)&self->_lastNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNode, 0);
  objc_storeStrong((id *)&self->_firstNode, 0);
  objc_storeStrong((id *)&self->_nodesByKey, 0);
}

- (void)addObject:(os_log_t)log forKey:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B106E000, log, OS_LOG_TYPE_ERROR, "Attempting to add object that already exist", v1, 2u);
}

@end
