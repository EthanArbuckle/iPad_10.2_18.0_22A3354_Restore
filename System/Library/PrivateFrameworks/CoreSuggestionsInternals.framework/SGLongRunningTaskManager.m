@implementation SGLongRunningTaskManager

- (SGLongRunningTaskManager)init
{
  SGLongRunningTaskManager *v2;
  uint64_t v3;
  NSHashTable *tasks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGLongRunningTaskManager;
  v2 = -[SGLongRunningTaskManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    tasks = v2->_tasks;
    v2->_tasks = (NSHashTable *)v3;

    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)SGLongRunningTaskManager;
  -[SGLongRunningTaskManager dealloc](&v3, sel_dealloc);
}

- (id)task
{
  SGLongRunningTask *v3;

  v3 = -[SGLongRunningTask initWithDeadline:manager:]([SGLongRunningTask alloc], "initWithDeadline:manager:", 0, self);
  pthread_mutex_lock(&self->_lock);
  -[NSHashTable addObject:](self->_tasks, "addObject:", v3);
  pthread_mutex_unlock(&self->_lock);
  return v3;
}

- (id)taskWithDeadline:(double)a3
{
  SGLongRunningTask *v5;
  void *v6;
  SGLongRunningTask *v7;

  v5 = [SGLongRunningTask alloc];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", a3);
  v7 = -[SGLongRunningTask initWithDeadline:manager:](v5, "initWithDeadline:manager:", v6, self);

  pthread_mutex_lock(&self->_lock);
  -[NSHashTable addObject:](self->_tasks, "addObject:", v7);
  pthread_mutex_unlock(&self->_lock);
  return v7;
}

- (void)unregister:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSHashTable removeObject:](self->_tasks, "removeObject:", v5);

  pthread_mutex_unlock(p_lock);
}

- (void)tellCurrentTasksToDefer
{
  _opaque_pthread_mutex_t *p_lock;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_tasks;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "requestDefer", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  pthread_mutex_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
}

+ (SGLongRunningTaskManager)sharedInstance
{
  if (sharedInstance__pasOnceToken9 != -1)
    dispatch_once(&sharedInstance__pasOnceToken9, &__block_literal_global_80_11903);
  return (SGLongRunningTaskManager *)(id)sharedInstance__pasExprOnceResult_79;
}

void __42__SGLongRunningTaskManager_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_79;
  sharedInstance__pasExprOnceResult_79 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
