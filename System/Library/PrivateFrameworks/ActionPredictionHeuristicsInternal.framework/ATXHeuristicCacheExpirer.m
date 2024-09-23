@implementation ATXHeuristicCacheExpirer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationEntries, 0);
}

- (void)expire
{
  _opaque_pthread_mutex_t *p_lock;
  NSMutableSet *v4;
  NSMutableSet *v5;
  NSMutableSet *expirationEntries;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = self->_expirationEntries;
  v5 = (NSMutableSet *)objc_opt_new();
  expirationEntries = self->_expirationEntries;
  self->_expirationEntries = v5;

  pthread_mutex_unlock(p_lock);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "cache", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "heuristicName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_expire:postNotification:", v14, 1);

      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[ATXHeuristicCacheExpirer _stop](self, "_stop");
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)ATXHeuristicCacheExpirer;
  -[ATXHeuristicCacheExpirer dealloc](&v3, sel_dealloc);
}

- (void)stopExpiring:(id)a3 cache:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;
  NSMutableSet *expirationEntries;
  ATXHeuristicCacheExpirationEntry *v10;

  if (a4)
  {
    p_lock = &self->_lock;
    v7 = a4;
    v8 = a3;
    pthread_mutex_lock(p_lock);
    expirationEntries = self->_expirationEntries;
    v10 = -[ATXHeuristicCacheExpirationEntry initWithHeuristic:cache:]([ATXHeuristicCacheExpirationEntry alloc], "initWithHeuristic:cache:", v8, v7);

    -[NSMutableSet removeObject:](expirationEntries, "removeObject:", v10);
    if (!-[NSMutableSet count](self->_expirationEntries, "count"))
      -[ATXHeuristicCacheExpirer _stop](self, "_stop");
    pthread_mutex_unlock(p_lock);
  }
}

- (ATXHeuristicCacheExpirer)init
{
  ATXHeuristicCacheExpirer *v2;
  uint64_t v3;
  NSMutableSet *expirationEntries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXHeuristicCacheExpirer;
  v2 = -[ATXHeuristicCacheExpirer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    expirationEntries = v2->_expirationEntries;
    v2->_expirationEntries = (NSMutableSet *)v3;

    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)startExpiring:(id)a3 cache:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;
  NSMutableSet *expirationEntries;
  ATXHeuristicCacheExpirationEntry *v10;

  if (a4)
  {
    p_lock = &self->_lock;
    v7 = a4;
    v8 = a3;
    pthread_mutex_lock(p_lock);
    expirationEntries = self->_expirationEntries;
    v10 = -[ATXHeuristicCacheExpirationEntry initWithHeuristic:cache:]([ATXHeuristicCacheExpirationEntry alloc], "initWithHeuristic:cache:", v8, v7);

    -[NSMutableSet addObject:](expirationEntries, "addObject:", v10);
    if (-[NSMutableSet count](self->_expirationEntries, "count"))
      -[ATXHeuristicCacheExpirer _start](self, "_start");
    pthread_mutex_unlock(p_lock);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
