@implementation _DKSyncCompositeOperation

- (_DKSyncCompositeOperation)init
{
  return -[_DKSyncCompositeOperation initWithParent:](self, "initWithParent:", 0);
}

- (_DKSyncCompositeOperation)initWithParent:(id)a3
{
  id v4;
  _DKSyncCompositeOperation *v5;
  _DKSyncCompositeOperation *v6;
  uint64_t v7;
  NSHashTable *children;
  uint64_t v9;
  NSMutableArray *errors;
  void *v11;
  void *v12;
  id v13;
  _DKSyncCompositeOperation *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _DKSyncCompositeOperation *v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_DKSyncCompositeOperation;
  v5 = -[_DKSyncOperation init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    children = v6->_children;
    v6->_children = (NSHashTable *)v7;

    v9 = objc_opt_new();
    errors = v6->_errors;
    v6->_errors = (NSMutableArray *)v9;

    if (v4)
    {
      objc_storeWeak((id *)&v6->_parent, v4);
      objc_msgSend(v4, "childOperationWasAdded:", v6);
      +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __44___DKSyncCompositeOperation_initWithParent___block_invoke;
      v20 = &unk_1E26E4B78;
      v13 = v4;
      v21 = v13;
      v14 = v6;
      v22 = v14;
      objc_msgSend(v11, "addObserver:name:sender:queue:usingBlock:", v14, CFSTR("_DKSyncOperationStateDidChangeNotification"), v13, v12, &v17);

      if (objc_msgSend(v13, "isCancelled", v17, v18, v19, v20))
      {
        -[_DKSyncCompositeOperation cancel](v14, "cancel");
      }
      else
      {
        if ((objc_msgSend(v13, "isExecuting") & 1) != 0)
          v15 = 1;
        else
          v15 = objc_msgSend(v13, "isFinished");
        -[_DKSyncCompositeOperation setReadyToStart:](v14, "setReadyToStart:", v15);
      }

    }
    else
    {
      -[_DKSyncCompositeOperation setReadyToStart:](v6, "setReadyToStart:", 1);
    }
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_DKSyncCompositeOperation _shutdownOperation](self, "_shutdownOperation");
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncCompositeOperation;
  -[_DKSyncOperation dealloc](&v3, sel_dealloc);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setReadyToStart:(BOOL)a3
{
  -[_DKSyncCompositeOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isReady"));
  atomic_store(a3, (unsigned __int8 *)&self->_isReadyToStart);
  -[_DKSyncCompositeOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isReady"));
}

- (BOOL)isReady
{
  unsigned __int8 v3;
  BOOL v4;
  objc_super v6;

  v3 = atomic_load((unsigned __int8 *)&self->_isReadyToStart);
  v6.receiver = self;
  v6.super_class = (Class)_DKSyncCompositeOperation;
  if (-[_DKSyncCompositeOperation isReady](&v6, sel_isReady))
    v4 = (v3 & 1) == 0;
  else
    v4 = 1;
  if (v4)
    return -[_DKSyncCompositeOperation isCancelled](self, "isCancelled");
  else
    return 1;
}

- (void)childOperationWasAdded:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_children, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)childOperation:(id)a3 didEndWithErrors:(id)a4
{
  id v6;
  NSUInteger v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable removeObject:](self->_children, "removeObject:", v6);

  v7 = -[NSHashTable count](self->_children, "count");
  if (objc_msgSend(v9, "count"))
  {
    -[_DKSyncCompositeOperation errors](self, "errors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
  os_unfair_lock_unlock(&self->_lock);
  if (!v7
    && -[_DKSyncCompositeOperation isAsynchronous](self, "isAsynchronous")
    && (-[_DKSyncCompositeOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[_DKSyncCompositeOperation endOperation](self, "endOperation");
  }

}

- (void)_shutdownOperation
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained)
  {
    objc_storeWeak((id *)&self->_parent, 0);
    os_unfair_lock_unlock(p_lock);
    +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:sender:", self, CFSTR("_DKSyncOperationStateDidChangeNotification"), WeakRetained);
    -[_DKSyncCompositeOperation errors](self, "errors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "childOperation:didEndWithErrors:", self, v5);

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)endOperation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKSyncCompositeOperation;
  -[_DKSyncOperation endOperation](&v3, sel_endOperation);
  -[_DKSyncCompositeOperation _shutdownOperation](self, "_shutdownOperation");
}

- (void)cancel
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)_DKSyncCompositeOperation;
  -[_DKSyncCompositeOperation cancel](&v13, sel_cancel);
  os_unfair_lock_lock(&self->_lock);
  v3 = (void *)-[NSHashTable copy](self->_children, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "cancel", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

  -[_DKSyncCompositeOperation _shutdownOperation](self, "_shutdownOperation");
}

- (NSMutableArray)errors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 288, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
