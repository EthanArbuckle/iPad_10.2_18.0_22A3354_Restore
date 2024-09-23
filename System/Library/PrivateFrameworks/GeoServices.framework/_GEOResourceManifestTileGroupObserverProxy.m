@implementation _GEOResourceManifestTileGroupObserverProxy

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

- (_GEOResourceManifestTileGroupObserverProxy)init
{
  _GEOResourceManifestTileGroupObserverProxy *v2;
  _GEOResourceManifestTileGroupObserverProxy *v3;
  _GEOResourceManifestTileGroupObserverProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GEOResourceManifestTileGroupObserverProxy;
  v2 = -[_GEOResourceManifestTileGroupObserverProxy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_observersLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)forEachObserver:(void *)a3 finished:
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = (void *)v6;
  if (a1 && v5 | v6)
  {
    v8 = *(NSObject **)(a1 + 24);
    v9 = v8;
    if (!v8)
    {
      v9 = MEMORY[0x1E0C80D38];
      v10 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71___GEOResourceManifestTileGroupObserverProxy_forEachObserver_finished___block_invoke;
    block[3] = &unk_1E1C05508;
    block[4] = a1;
    v12 = (id)v5;
    v13 = v7;
    dispatch_async(v9, block);
    if (!v8)

  }
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
  v12.super_class = (Class)_GEOResourceManifestTileGroupObserverProxy;
  -[_GEOResourceManifestTileGroupObserverProxy description](&v12, sel_description);
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

@end
