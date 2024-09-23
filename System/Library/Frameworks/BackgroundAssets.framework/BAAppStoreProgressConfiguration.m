@implementation BAAppStoreProgressConfiguration

- (BAAppStoreProgressConfiguration)init
{
  BAAppStoreProgressConfiguration *v2;
  BAAppStoreProgressConfiguration *v3;
  uint64_t v4;
  NSSet *appBundleIdentifiers;
  id updateHandler;
  qos_class_t v7;
  uint64_t v8;
  OS_dispatch_queue *handlerQueue;
  uint64_t v10;
  NSMutableDictionary *duplicateEventCache;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BAAppStoreProgressConfiguration;
  v2 = -[BAAppStoreProgressConfiguration init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    appBundleIdentifiers = v3->_appBundleIdentifiers;
    v3->_appBundleIdentifiers = (NSSet *)v4;

    updateHandler = v3->_updateHandler;
    v3->_updateHandler = 0;

    v7 = qos_class_self();
    dispatch_get_global_queue(v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    handlerQueue = v3->_handlerQueue;
    v3->_handlerQueue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new();
    duplicateEventCache = v3->_duplicateEventCache;
    v3->_duplicateEventCache = (NSMutableDictionary *)v10;

  }
  return v3;
}

- (BAAppStoreProgressConfiguration)initWithCoder:(id)a3
{
  id v4;
  BAAppStoreProgressConfiguration *v5;
  BAAppStoreProgressConfiguration *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSSet *appBundleIdentifiers;
  uint64_t v12;
  NSMutableDictionary *duplicateEventCache;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BAAppStoreProgressConfiguration;
  v5 = -[BAAppStoreProgressConfiguration init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("BA_AppBundleIdentifiers"));
    v10 = objc_claimAutoreleasedReturnValue();
    appBundleIdentifiers = v6->_appBundleIdentifiers;
    v6->_appBundleIdentifiers = (NSSet *)v10;

    v12 = objc_opt_new();
    duplicateEventCache = v6->_duplicateEventCache;
    v6->_duplicateEventCache = (NSMutableDictionary *)v12;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend(v5, "encodeObject:forKey:", self->_appBundleIdentifiers, CFSTR("BA_AppBundleIdentifiers"));

  os_unfair_lock_unlock(p_lock);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAppBundleIdentifiers:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *appBundleIdentifiers;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (NSSet *)objc_msgSend(v4, "copy");
  appBundleIdentifiers = self->_appBundleIdentifiers;
  self->_appBundleIdentifiers = v5;

  v7 = (void *)MEMORY[0x2207536C4]();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_duplicateEventCache, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allKeys](self->_duplicateEventCache, "allKeys", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (!-[NSSet containsObject:](self->_appBundleIdentifiers, "containsObject:", v14))
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[NSMutableDictionary removeObjectsForKeys:](self->_duplicateEventCache, "removeObjectsForKeys:", v8);
  objc_autoreleasePoolPop(v7);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setUpdateHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  id updateHandler;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_msgSend(v5, "copy");

  updateHandler = self->_updateHandler;
  self->_updateHandler = v6;

  os_unfair_lock_unlock(p_lock);
}

- (id)appBundleIdentifiers
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (id *)v1[4];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)setHandlerQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *handlerQueue;

  v4 = (OS_dispatch_queue *)a3;
  os_unfair_lock_lock(&self->_lock);
  handlerQueue = self->_handlerQueue;
  self->_handlerQueue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)invokeHandlerWithAppBundleIdentifier:(void *)a3 progressInfo:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v7 = *(id *)(a1 + 16);
    v8 = _Block_copy(*(const void **)(a1 + 24));
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    if ((objc_msgSend(v9, "isEqual:", v6) & 1) == 0 && v8)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __85__BAAppStoreProgressConfiguration_invokeHandlerWithAppBundleIdentifier_progressInfo___block_invoke;
      block[3] = &unk_24DDBF1B0;
      v13 = v8;
      v11 = v5;
      v12 = v6;
      dispatch_async(v7, block);

    }
  }

}

uint64_t __85__BAAppStoreProgressConfiguration_invokeHandlerWithAppBundleIdentifier_progressInfo___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateEventCache, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifiers, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end
