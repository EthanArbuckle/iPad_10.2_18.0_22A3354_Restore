@implementation IOGPUMetalResourcePool

- (BOOL)updateResourcePurgeability
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  IOGPUMetalPooledResource *v5;
  _IOGPUMetalResourcePoolPrivate *p_priv;
  uint64_t v7;
  IOGPUMetalPooledResource *v8;
  id *tqe_prev;
  IOGPUMetalPooledResource *tqe_next;
  IOGPUMetalPooledResource *v11;
  IOGPUMetalPooledResource *tqh_first;
  id *p_tqe_next;

  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  if (self->_priv.nonvolatileQueue.tqh_first)
  {
    v4 = mach_absolute_time();
    v5 = (IOGPUMetalPooledResource *)**((_QWORD **)self->_priv.nonvolatileQueue.tqh_last + 1);
    if (v5)
    {
      p_priv = &self->_priv;
      v7 = v4 - self->age_to_purge;
      do
      {
        if (v5->_priv.time_added >= v7)
          break;
        v8 = (IOGPUMetalPooledResource *)**((_QWORD **)v5->_priv.entry.tqe_prev + 1);
        -[IOGPUMetalResource setPurgeableState:](v5, "setPurgeableState:", 3);
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

- (void)purge
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  -[IOGPUMetalResourcePool purgeWithLock](self, "purgeWithLock");
  os_unfair_lock_unlock(p_lock);
}

- (void)purgeWithLock
{
  IOGPUMetalPooledResource *tqh_first;
  id *tqe_prev;
  IOGPUMetalPooledResource *tqe_next;
  IOGPUMetalPooledResource *v6;
  IOGPUMetalPooledResource *v7;
  id *v8;
  IOGPUMetalPooledResource *v9;
  IOGPUMetalPooledResource *v10;

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

- (IOGPUMetalResourcePool)initWithDevice:(id)a3 resourceClass:(Class)a4 resourceArgs:(const IOGPUNewResourceArgs *)a5 resourceArgsSize:(unsigned int)a6 options:(id)a7
{
  IOGPUMetalResourcePool *v11;
  IOGPUMetalResourcePool *v12;
  IOGPUNewResourceArgs *v13;
  mach_timebase_info info;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)IOGPUMetalResourcePool;
  v11 = -[IOGPUMetalResourcePool init](&v16, sel_init, a3, a4, a5, *(_QWORD *)&a6, a7);
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
    if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
      -[IOGPUMetalResourcePool initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:].cold.2();
    if (a6 <= 0x57)
      -[IOGPUMetalResourcePool initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:].cold.1();
    v12->_resourceArgsSize = a6;
    v13 = (IOGPUNewResourceArgs *)malloc_type_malloc(a6, 0x765E4F4CuLL);
    v12->_resourceArgs = v13;
    memcpy(v13, a5, v12->_resourceArgsSize);
    v12->_resourceArgs->var0.var10 |= 0x4000u;
    info = 0;
    mach_timebase_info(&info);
    v12->age_to_purge = 1000000000 * (unint64_t)info.denom / info.numer;
    v12->generation = 0;
  }
  return v12;
}

- (void)setResourceArgs:(const IOGPUNewResourceArgs *)a3 resourceArgsSize:(unsigned int)a4
{
  size_t v7;
  os_unfair_lock_s *p_lock;
  IOGPUNewResourceArgs *v9;

  if (a4 <= 0x57)
    -[IOGPUMetalResourcePool setResourceArgs:resourceArgsSize:].cold.1();
  v7 = a4;
  p_lock = &self->_priv.lock;
  os_unfair_lock_lock(&self->_priv.lock);
  -[IOGPUMetalResourcePool purgeWithLock](self, "purgeWithLock");
  free(self->_resourceArgs);
  self->_resourceArgsSize = a4;
  v9 = (IOGPUNewResourceArgs *)malloc_type_malloc(v7, 0x51A1A2A9uLL);
  self->_resourceArgs = v9;
  memcpy(v9, a3, self->_resourceArgsSize);
  self->_resourceArgs->var0.var10 |= 0x4000u;
  ++self->generation;
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  objc_super v3;

  -[IOGPUMetalResourcePool purgeWithLock](self, "purgeWithLock");
  free(self->_resourceArgs);
  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalResourcePool;
  -[IOGPUMetalResourcePool dealloc](&v3, sel_dealloc);
}

- (int)availableCount
{
  return self->_priv.count;
}

- (IOGPUNewResourceArgs)resourceArgs
{
  return self->_resourceArgs;
}

- (unsigned)resourceArgsSize
{
  return self->_resourceArgsSize;
}

- (void)initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:.cold.1()
{
  __assert_rtn("-[IOGPUMetalResourcePool initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:]", "IOGPUMetalResourcePool.m", 41, "resourceArgsSize >= sizeof(*resourceArgs)");
}

- (void)initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:.cold.2()
{
  __assert_rtn("-[IOGPUMetalResourcePool initWithDevice:resourceClass:resourceArgs:resourceArgsSize:options:]", "IOGPUMetalResourcePool.m", 40, "[(Class)resourceClass isSubclassOfClass:[IOGPUMetalPooledResource class]]");
}

- (void)setResourceArgs:resourceArgsSize:.cold.1()
{
  __assert_rtn("-[IOGPUMetalResourcePool setResourceArgs:resourceArgsSize:]", "IOGPUMetalResourcePool.m", 65, "resourceArgsSize >= sizeof(*resourceArgs)");
}

@end
