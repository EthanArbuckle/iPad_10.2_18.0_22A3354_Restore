@implementation MTLIOAccelResourcePool

- (MTLIOAccelResourcePool)initWithDevice:(id)a3 resourceClass:(Class)a4 resourceArgs:(const IOAccelNewResourceArgs *)a5 resourceArgsSize:(unsigned int)a6 options:(id)a7
{
  MTLIOAccelResourcePool *v11;
  MTLIOAccelResourcePool *v12;
  IOAccelNewResourceArgs *v13;
  mach_timebase_info info;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTLIOAccelResourcePool;
  v11 = -[MTLIOAccelResourcePool init](&v16, sel_init, a3, a4, a5, *(_QWORD *)&a6, a7);
  v12 = v11;
  if (v11)
  {
    v11->_priv.volatileQueue.tqh_first = 0;
    v11->_priv.nonvolatileQueue.tqh_first = 0;
    v11->_priv.volatileQueue.tqh_last = (id *)&v11->_priv.volatileQueue.tqh_first;
    v11->_priv.nonvolatileQueue.tqh_last = (id *)&v11->_priv.nonvolatileQueue.tqh_first;
    *(_QWORD *)&v11->_priv.lock._os_unfair_lock_opaque = 0;
    v11->_resourceClass = a4;
    v11->_device = (MTLDevice *)a3;
    v11->_resourceArgsSize = a6;
    v13 = (IOAccelNewResourceArgs *)malloc_type_malloc(a6, 0x89AEB6C9uLL);
    v12->_resourceArgs = v13;
    memcpy(v13, a5, v12->_resourceArgsSize);
    info = 0;
    mach_timebase_info(&info);
    v12->age_to_purge = 1000000000 * (unint64_t)info.denom / info.numer;
    v12->generation = 0;
  }
  return v12;
}

- (void)setResourceArgs:(const IOAccelNewResourceArgs *)a3 resourceArgsSize:(unsigned int)a4
{
  os_unfair_lock_s *p_lock;
  IOAccelNewResourceArgs *v8;

  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  -[MTLIOAccelResourcePool purgeWithLock](self, "purgeWithLock");
  free(self->_resourceArgs);
  self->_resourceArgsSize = a4;
  v8 = (IOAccelNewResourceArgs *)malloc_type_malloc(a4, 0x6CBF7FAAuLL);
  self->_resourceArgs = v8;
  memcpy(v8, a3, self->_resourceArgsSize);
  ++self->generation;
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  objc_super v3;

  -[MTLIOAccelResourcePool purgeWithLock](self, "purgeWithLock");
  free(self->_resourceArgs);
  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelResourcePool;
  -[MTLIOAccelResourcePool dealloc](&v3, sel_dealloc);
}

- (int)availableCount
{
  return self->_priv.count;
}

- (void)purgeWithLock
{
  MTLIOAccelPooledResource *tqh_first;
  id *tqe_prev;
  MTLIOAccelPooledResource *tqe_next;
  MTLIOAccelPooledResource *v6;
  MTLIOAccelPooledResource *v7;
  id *v8;
  MTLIOAccelPooledResource *v9;
  MTLIOAccelPooledResource *v10;

  tqh_first = self->_priv.volatileQueue.tqh_first;
  if (tqh_first)
  {
    do
    {
      tqe_next = tqh_first->_priv.entry.tqe_next;
      tqe_prev = tqh_first->_priv.entry.tqe_prev;
      if (tqe_next)
      {
        tqe_next->_priv.entry.tqe_prev = tqe_prev;
        v6 = tqh_first->_priv.entry.tqe_next;
        tqe_prev = tqh_first->_priv.entry.tqe_prev;
      }
      else
      {
        v6 = 0;
        self->_priv.volatileQueue.tqh_last = tqe_prev;
      }
      *tqe_prev = v6;
      --self->_priv.count;

      tqh_first = tqe_next;
    }
    while (tqe_next);
  }
  v7 = self->_priv.nonvolatileQueue.tqh_first;
  if (v7)
  {
    do
    {
      v9 = v7->_priv.entry.tqe_next;
      v8 = v7->_priv.entry.tqe_prev;
      if (v9)
      {
        v9->_priv.entry.tqe_prev = v8;
        v10 = v7->_priv.entry.tqe_next;
        v8 = v7->_priv.entry.tqe_prev;
      }
      else
      {
        v10 = 0;
        self->_priv.nonvolatileQueue.tqh_last = v8;
      }
      *v8 = v10;
      --self->_priv.count;

      v7 = v9;
    }
    while (v9);
  }
}

- (void)purge
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  -[MTLIOAccelResourcePool purgeWithLock](self, "purgeWithLock");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)updateResourcePurgeability
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  MTLIOAccelPooledResource *v5;
  _MTLIOAccelResourcePoolPrivate *p_priv;
  uint64_t v7;
  MTLIOAccelPooledResource *v8;
  id *tqe_prev;
  MTLIOAccelPooledResource *tqe_next;
  MTLIOAccelPooledResource *v11;
  MTLIOAccelPooledResource *tqh_first;
  id *p_tqe_next;

  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  if (self->_priv.nonvolatileQueue.tqh_first)
  {
    v4 = mach_absolute_time();
    v5 = (MTLIOAccelPooledResource *)**((_QWORD **)self->_priv.nonvolatileQueue.tqh_last + 1);
    if (v5)
    {
      p_priv = &self->_priv;
      v7 = v4 - self->age_to_purge;
      do
      {
        if (v5->_priv.time_added >= v7)
          break;
        v8 = (MTLIOAccelPooledResource *)**((_QWORD **)v5->_priv.entry.tqe_prev + 1);
        -[MTLIOAccelResource setPurgeableState:](v5, "setPurgeableState:", 3);
        tqe_next = v5->_priv.entry.tqe_next;
        tqe_prev = v5->_priv.entry.tqe_prev;
        if (tqe_next)
        {
          tqe_next->_priv.entry.tqe_prev = tqe_prev;
          v11 = v5->_priv.entry.tqe_next;
          tqe_prev = v5->_priv.entry.tqe_prev;
        }
        else
        {
          v11 = 0;
          self->_priv.nonvolatileQueue.tqh_last = tqe_prev;
        }
        *tqe_prev = v11;
        tqh_first = p_priv->volatileQueue.tqh_first;
        v5->_priv.entry.tqe_next = p_priv->volatileQueue.tqh_first;
        p_tqe_next = (id *)&v5->_priv.entry.tqe_next;
        if (tqh_first)
          tqh_first->_priv.entry.tqe_prev = p_tqe_next;
        else
          self->_priv.volatileQueue.tqh_last = p_tqe_next;
        p_priv->volatileQueue.tqh_first = v5;
        v5->_priv.entry.tqe_prev = (id *)&p_priv->volatileQueue.tqh_first;
        v5 = v8;
      }
      while (v8);
    }
    os_unfair_lock_unlock(p_lock);
    return self->_priv.nonvolatileQueue.tqh_first != 0;
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    return 0;
  }
}

- (IOAccelNewResourceArgs)resourceArgs
{
  return self->_resourceArgs;
}

- (unsigned)resourceArgsSize
{
  return self->_resourceArgsSize;
}

@end
