@implementation EFResourcePool

- (void)releaseResource:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "unlock");
  os_unfair_lock_lock(&self->_handleResourceLock);
  if (objc_msgSend(v4, "returnResource"))
  {
    -[EFQueue dequeueObject:](self->_activeResources, "dequeueObject:", v4);
    -[NSMutableSet addObject:](self->_inactiveResources, "addObject:", v4);
  }
  os_unfair_lock_unlock(&self->_handleResourceLock);

}

- (id)acquireResource
{
  os_unfair_lock_s *p_handleResourceLock;
  void *v5;
  void *v7;

  p_handleResourceLock = &self->_handleResourceLock;
  os_unfair_lock_lock(&self->_handleResourceLock);
  -[NSMutableSet anyObject](self->_inactiveResources, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableSet removeObject:](self->_inactiveResources, "removeObject:", v5);
  }
  else if (!self->_uncreatedResourcesCount || (v5 = (void *)objc_opt_new(), --self->_uncreatedResourcesCount, !v5))
  {
    -[EFQueue dequeue](self->_activeResources, "dequeue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFResource.m"), 76, CFSTR("No active resources in the queue and no uncreated resources."));

    }
  }
  -[EFQueue enqueue:](self->_activeResources, "enqueue:", v5);
  objc_msgSend(v5, "holdResource");
  os_unfair_lock_unlock(p_handleResourceLock);
  objc_msgSend(v5, "lock");
  return v5;
}

- (EFResourcePool)initWithCount:(unint64_t)a3
{
  EFResourcePool *v5;
  EFResourcePool *v6;
  uint64_t v7;
  EFQueue *activeResources;
  uint64_t v9;
  NSMutableSet *inactiveResources;
  void *v13;
  objc_super v14;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFResource.m"), 44, CFSTR("Pool should not be initialized with a count of 0"));

  }
  v14.receiver = self;
  v14.super_class = (Class)EFResourcePool;
  v5 = -[EFResourcePool init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_handleResourceLock._os_unfair_lock_opaque = 0;
    v5->_uncreatedResourcesCount = a3;
    +[EFQueue boundedQueueWithCapacity:overflowHandler:](EFQueue, "boundedQueueWithCapacity:overflowHandler:", a3, &__block_literal_global_26);
    v7 = objc_claimAutoreleasedReturnValue();
    activeResources = v6->_activeResources;
    v6->_activeResources = (EFQueue *)v7;

    v9 = objc_opt_new();
    inactiveResources = v6->_inactiveResources;
    v6->_inactiveResources = (NSMutableSet *)v9;

  }
  return v6;
}

void __32__EFResourcePool_initWithCount___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[EFResourcePool initWithCount:]_block_invoke");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("EFResource.m"), 51, CFSTR("Queue is over capacity. Active resources in queue should not exceed pool count provided"));

}

- (unint64_t)uncreatedResourcesCount
{
  return self->_uncreatedResourcesCount;
}

- (void)setUncreatedResourcesCount:(unint64_t)a3
{
  self->_uncreatedResourcesCount = a3;
}

- (EFQueue)activeResources
{
  return self->_activeResources;
}

- (NSMutableSet)inactiveResources
{
  return self->_inactiveResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveResources, 0);
  objc_storeStrong((id *)&self->_activeResources, 0);
}

@end
