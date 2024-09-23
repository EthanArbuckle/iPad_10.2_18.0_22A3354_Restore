@implementation BPSBufferInner

- (BPSBufferInner)initWithDownstream:(id)a3 size:(unint64_t)a4 prefetch:(unint64_t)a5 whenFull:(unint64_t)a6
{
  id v11;
  BPSBufferInner *v12;
  BPSBufferInner *v13;
  uint64_t v14;
  NSMutableArray *values;
  BPSSubscriptionStatus *v16;
  BPSSubscriptionStatus *status;
  objc_super v19;

  v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BPSBufferInner;
  v12 = -[BPSBufferInner init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downstream, a3);
    v13->_size = a4;
    v13->_prefetch = a5;
    v13->_whenFull = a6;
    v13->_lock._os_unfair_lock_opaque = 0;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    values = v13->_values;
    v13->_values = (NSMutableArray *)v14;

    v16 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
    status = v13->_status;
    v13->_status = v16;

  }
  return v13;
}

- (void)requestDemand:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  _BOOL4 recursion;
  uint64_t v7;
  BPSBufferInner *v8;

  v8 = self;
  p_lock = &v8->_lock;
  os_unfair_lock_lock(&v8->_lock);
  if (-[BPSSubscriptionStatus state](v8->_status, "state") == 1)
  {
    -[BPSSubscriptionStatus subscription](v8->_status, "subscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_downstreamDemand += a3;
    recursion = v8->_recursion;
    os_unfair_lock_unlock(p_lock);
    if (!recursion)
    {
      v7 = -[BPSBufferInner _drain](v8, "_drain");
      if (v7 >= 1)
        objc_msgSend(v5, "requestDemand:", v7);
    }

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v3;
  uint64_t v4;
  BPSSubscriptionStatus *status;
  uint64_t v6;
  NSMutableArray *values;
  BPSBufferInner *v8;

  v8 = self;
  p_lock = &v8->_lock;
  os_unfair_lock_lock(&v8->_lock);
  if (-[BPSSubscriptionStatus state](v8->_status, "state") == 1)
  {
    -[BPSSubscriptionStatus subscription](v8->_status, "subscription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[BPSSubscriptionStatus terminal](BPSSubscriptionStatus, "terminal");
    v4 = objc_claimAutoreleasedReturnValue();
    status = v8->_status;
    v8->_status = (BPSSubscriptionStatus *)v4;

    v6 = objc_opt_new();
    values = v8->_values;
    v8->_values = (NSMutableArray *)v6;

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v3, "cancel");

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)receiveSubscription:(id)a3
{
  BPSSubscriptionStatus *v4;
  BPSSubscriptionStatus *status;
  unint64_t prefetch;
  unint64_t size;
  id v8;

  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (-[BPSSubscriptionStatus state](self->_status, "state"))
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v8, "cancel");
  }
  else
  {
    v4 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 1, v8);
    status = self->_status;
    self->_status = v4;

    prefetch = self->_prefetch;
    if (prefetch == 1)
    {
      size = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (prefetch)
    {
      size = 0;
    }
    else
    {
      size = self->_size;
    }
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v8, "requestDemand:", size);
    -[BPSSubscriber receiveSubscription:](self->_downstream, "receiveSubscription:", self);
  }

}

- (int64_t)receiveInput:(id)a3
{
  id v4;
  BPSBufferInner *v5;
  os_unfair_lock_s *p_lock;
  int64_t v7;
  unint64_t whenFull;

  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSSubscriptionStatus state](v5->_status, "state") == 1 && -[BPSCompletion state](v5->_terminal, "state") != 1)
  {
    if (-[NSMutableArray count](v5->_values, "count") >= v5->_size)
    {
      whenFull = v5->_whenFull;
      if (!whenFull)
      {
LABEL_11:
        os_unfair_lock_unlock(p_lock);
        v7 = -[BPSBufferInner _drain](v5, "_drain");
        goto LABEL_12;
      }
      if (whenFull == 1 && -[NSMutableArray count](v5->_values, "count"))
        -[NSMutableArray removeObjectAtIndex:](v5->_values, "removeObjectAtIndex:", 0);
    }
    if (-[NSMutableArray count](v5->_values, "count") < v5->_size)
      -[NSMutableArray addObject:](v5->_values, "addObject:", v4);
    goto LABEL_11;
  }
  os_unfair_lock_unlock(p_lock);
  v7 = 0;
LABEL_12:

  return v7;
}

- (void)receiveCompletion:(id)a3
{
  BPSBufferInner *v5;
  os_unfair_lock_s *p_lock;
  uint64_t v7;
  BPSSubscriptionStatus *status;
  id v9;

  v9 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSSubscriptionStatus state](v5->_status, "state") == 1)
  {
    if (!v5->_terminal)
    {
      objc_storeStrong((id *)&v5->_terminal, a3);
      os_unfair_lock_unlock(p_lock);
      -[BPSBufferInner _drain](v5, "_drain");
      goto LABEL_6;
    }
    +[BPSSubscriptionStatus terminal](BPSSubscriptionStatus, "terminal");
    v7 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (BPSSubscriptionStatus *)v7;

  }
  os_unfair_lock_unlock(p_lock);
LABEL_6:

}

- (int64_t)_drain
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  int64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  BPSCompletion *terminal;
  BPSSubscriptionStatus *v16;
  BPSSubscriptionStatus *v17;
  BPSSubscriber *downstream;
  void *v19;
  void *v20;
  BPSSubscriptionStatus *v21;
  BPSSubscriptionStatus *status;
  uint64_t v23;
  os_unfair_lock_s *lock;
  int64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[BPSSubscriptionStatus state](self->_status, "state") == 1)
  {
    v5 = 0;
    v23 = 0;
    lock = p_lock;
    while (self->_downstreamDemand)
    {
      if (!-[NSMutableArray count](self->_values, "count") && self->_terminal)
      {
        +[BPSSubscriptionStatus terminal](BPSSubscriptionStatus, "terminal");
        v21 = (BPSSubscriptionStatus *)objc_claimAutoreleasedReturnValue();
        status = self->_status;
        self->_status = v21;

        os_unfair_lock_unlock(p_lock);
        -[BPSSubscriber receiveCompletion:](self->_downstream, "receiveCompletion:", self->_terminal);
        return v5;
      }
      -[BPSBufferInner _lockedPopWithDemand:](self, "_lockedPopWithDemand:", self->_downstreamDemand, v23);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_downstreamDemand -= objc_msgSend(v6, "count");
      if (!objc_msgSend(v6, "count"))
      {
        os_unfair_lock_unlock(p_lock);

        return v5;
      }
      v25 = v5;
      self->_recursion = 1;
      os_unfair_lock_unlock(p_lock);
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(v7);
            v3 += -[BPSSubscriber receiveInput:](self->_downstream, "receiveInput:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          }
          v10 += v9;
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v9);
      }
      else
      {
        v10 = 0;
      }

      if (self->_prefetch)
        v13 = 0;
      else
        v13 = v10;
      p_lock = lock;
      os_unfair_lock_lock(lock);
      self->_recursion = 0;
      if (v3 >= 1)
        self->_downstreamDemand += v3;
      v5 = v13 + v25;
      os_unfair_lock_unlock(lock);

      os_unfair_lock_lock(lock);
      v3 = v23;
      if (-[BPSSubscriptionStatus state](self->_status, "state") != 1)
        goto LABEL_24;
    }
    terminal = self->_terminal;
    if (terminal && -[BPSCompletion state](terminal, "state") == 1)
    {
      +[BPSSubscriptionStatus terminal](BPSSubscriptionStatus, "terminal");
      v16 = (BPSSubscriptionStatus *)objc_claimAutoreleasedReturnValue();
      v17 = self->_status;
      self->_status = v16;

      os_unfair_lock_unlock(p_lock);
      downstream = self->_downstream;
      -[BPSCompletion error](self->_terminal, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSSubscriber receiveCompletion:](downstream, "receiveCompletion:", v20);

      return v5;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_24:
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)_lockedPopWithDemand:(int64_t)a3
{
  int64_t v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *values;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || -[NSMutableArray count](self->_values, "count") <= (unint64_t)a3)
  {
    v7 = self->_values;
    v8 = (NSMutableArray *)objc_opt_new();
    values = self->_values;
    self->_values = v8;

  }
  else
  {
    v5 = a3 - 1;
    if (a3 < 1)
    {
      v7 = 0;
    }
    else
    {
      -[NSMutableArray subarrayWithRange:](self->_values, "subarrayWithRange:", 0, a3 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");

      -[NSMutableArray removeObjectsInRange:](self->_values, "removeObjectsInRange:", 0, v5);
    }
  }
  return v7;
}

- (id)newBookmark
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  BMBookmarkNode *v13;
  NSMutableArray *values;
  objc_class *v15;
  void *v16;
  BMBookmarkNode *v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[BPSBufferInner upstreamSubscriptions](self, "upstreamSubscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EEAF3EE8) & 1) != 0)
        {
          v10 = objc_msgSend(v9, "newBookmark");
          if (v10)
            goto LABEL_13;
        }
        else
        {
          __biome_log_for_category();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v9;
            _os_log_error_impl(&dword_1A956A000, v11, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v12 = (void *)v10;
        objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

  v13 = [BMBookmarkNode alloc];
  values = self->_values;
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[BMBookmarkNode initWithValue:upstreams:name:](v13, "initWithValue:upstreams:name:", values, v3, v16);

  return v17;
}

- (id)upstreamSubscriptions
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[BPSSubscriptionStatus state](self->_status, "state") == 1)
  {
    -[BPSSubscriptionStatus subscription](self->_status, "subscription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    return MEMORY[0x1E0C9AA60];
  }
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unint64_t)prefetch
{
  return self->_prefetch;
}

- (void)setPrefetch:(unint64_t)a3
{
  self->_prefetch = a3;
}

- (unint64_t)whenFull
{
  return self->_whenFull;
}

- (void)setWhenFull:(unint64_t)a3
{
  self->_whenFull = a3;
}

- (int64_t)downstreamDemand
{
  return self->_downstreamDemand;
}

- (void)setDownstreamDemand:(int64_t)a3
{
  self->_downstreamDemand = a3;
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (BOOL)recursion
{
  return self->_recursion;
}

- (void)setRecursion:(BOOL)a3
{
  self->_recursion = a3;
}

- (BPSCompletion)terminal
{
  return self->_terminal;
}

- (void)setTerminal:(id)a3
{
  objc_storeStrong((id *)&self->_terminal, a3);
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
