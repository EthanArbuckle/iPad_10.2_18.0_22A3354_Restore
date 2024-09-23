@implementation _GEOExperimentConfigurationObserverProxy

- (_GEOExperimentConfigurationObserverProxy)init
{
  _GEOExperimentConfigurationObserverProxy *v2;
  _GEOExperimentConfigurationObserverProxy *v3;
  _GEOExperimentConfigurationObserverProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GEOExperimentConfigurationObserverProxy;
  v2 = -[_GEOExperimentConfigurationObserverProxy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_observersLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  NSObject *queue;
  const char *label;
  os_unfair_lock_s *p_observersLock;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  objc_super v12;

  queue = self->_queue;
  if (queue)
    label = dispatch_queue_get_label(queue);
  else
    label = 0;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock_with_options();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)_GEOExperimentConfigurationObserverProxy;
  -[_GEOExperimentConfigurationObserverProxy description](&v12, sel_description);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = "(unknown)";
  if (label)
    v9 = label;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@, queue: %s, observers: %@"), v7, v9, self->_observers);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_observersLock);
  return v10;
}

- (void)registerObserver:(id)a3
{
  void *v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x18D764E2C]();
  os_unfair_lock_lock_with_options();
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_observersLock);
  objc_autoreleasePoolPop(v4);

}

- (void)unregisterObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x18D764E2C]();
  os_unfair_lock_lock_with_options();
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  os_unfair_lock_unlock(&self->_observersLock);
  objc_autoreleasePoolPop(v4);

}

- (void)forEachObserver:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    v6 = queue;
    if (!queue)
    {
      v6 = MEMORY[0x1E0C80D38];
      v7 = MEMORY[0x1E0C80D38];
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60___GEOExperimentConfigurationObserverProxy_forEachObserver___block_invoke;
    v8[3] = &unk_1E1BFFBF0;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v6, v8);
    if (!queue)

  }
}

- (unint64_t)observersCount
{
  os_unfair_lock_s *p_observersLock;
  unint64_t v4;

  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSHashTable count](self->_observers, "count");
  os_unfair_lock_unlock(p_observersLock);
  return v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
