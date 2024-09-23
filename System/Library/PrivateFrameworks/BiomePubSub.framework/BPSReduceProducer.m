@implementation BPSReduceProducer

- (BPSReduceProducer)initWithDownstream:(id)a3 initial:(id)a4 reduce:(id)a5
{
  id v9;
  id v10;
  id v11;
  BPSReduceProducer *v12;
  BPSReduceProducer *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id initial;
  void *v18;
  id reduce;
  BPSSubscriptionStatus *v20;
  BPSSubscriptionStatus *status;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BPSReduceProducer;
  v12 = -[BPSReduceProducer init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downstream, a3);
    +[BPSReduceProducer safeMutableCopy:](BPSReduceProducer, "safeMutableCopy:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v13->_result;
    v13->_result = (id)v14;

    +[BPSReduceProducer safeMutableCopy:](BPSReduceProducer, "safeMutableCopy:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    initial = v13->_initial;
    v13->_initial = (id)v16;

    v18 = _Block_copy(v11);
    reduce = v13->_reduce;
    v13->_reduce = v18;

    v13->_downstreamRequested = 0;
    v13->_cancelled = 0;
    v13->_completed = 0;
    v13->_upstreamCompleted = 0;
    v13->_empty = 0;
    v20 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
    status = v13->_status;
    v13->_status = v20;

    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (id)receiveNewValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Override %@ in a subclass"), v6);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v8);
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  BPSReduceProducer *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = objc_opt_class();
    _os_log_impl(&dword_1A956A000, v6, OS_LOG_TYPE_INFO, "%@ - completion", (uint8_t *)&v18, 0xCu);
  }

  os_unfair_lock_lock(&v5->_lock);
  -[BPSReduceProducer status](v5, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");

  if (v8 != 1)
  {
LABEL_15:
    os_unfair_lock_unlock(&v5->_lock);
    goto LABEL_16;
  }
  -[BPSReduceProducer status](v5, "status");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setState:", 2);

  v10 = objc_msgSend(v4, "state");
  if (v10 == 1)
  {
    if (!-[BPSReduceProducer cancelled](v5, "cancelled")
      && !-[BPSReduceProducer completed](v5, "completed")
      && !-[BPSReduceProducer upstreamCompleted](v5, "upstreamCompleted"))
    {
      -[BPSReduceProducer setUpstreamCompleted:](v5, "setUpstreamCompleted:", 1);
      -[BPSReduceProducer setCompleted:](v5, "setCompleted:", 1);
      os_unfair_lock_unlock(&v5->_lock);
      objc_msgSend(v4, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSReduceProducer downstream](v5, "downstream");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v12);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    goto LABEL_15;
  }
  if (!v10)
  {
    if (!-[BPSReduceProducer cancelled](v5, "cancelled")
      && !-[BPSReduceProducer completed](v5, "completed")
      && !-[BPSReduceProducer upstreamCompleted](v5, "upstreamCompleted"))
    {
      -[BPSReduceProducer setUpstreamCompleted:](v5, "setUpstreamCompleted:", 1);
      if (-[BPSReduceProducer downstreamRequested](v5, "downstreamRequested")
        || -[BPSReduceProducer empty](v5, "empty"))
      {
        v11 = 1;
        -[BPSReduceProducer setCompleted:](v5, "setCompleted:", 1);
      }
      else
      {
        v11 = 0;
      }
      -[BPSReduceProducer result](v5, "result");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&v5->_lock);
      if (!v11)
        goto LABEL_24;
      if (v12)
      {
        -[BPSReduceProducer downstream](v5, "downstream");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "receiveInput:", v12);

      }
      -[BPSReduceProducer downstream](v5, "downstream");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[BPSCompletion success](BPSCompletion, "success");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_23:
      v16 = (void *)v14;
      objc_msgSend(v13, "receiveCompletion:", v14);

LABEL_24:
      os_unfair_lock_lock(&v5->_lock);
      -[BPSReduceProducer status](v5, "status");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSubscription:", 0);

      os_unfair_lock_unlock(&v5->_lock);
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

}

- (int64_t)receiveInput:(id)a3
{
  id v4;
  BPSReduceProducer *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int64_t v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  -[BPSReduceProducer status](v5, "status");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "state");

  if (v8 == 1)
  {
    -[BPSReduceProducer setEmpty:](v5, "setEmpty:", 0);
    os_unfair_lock_unlock(p_lock);
    -[BPSReduceProducer receiveNewValue:](v5, "receiveNewValue:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "state");
    switch(v10)
    {
      case 0:
        os_unfair_lock_lock(p_lock);
        -[BPSReduceProducer setUpstreamCompleted:](v5, "setUpstreamCompleted:", 1);
        v13 = -[BPSReduceProducer downstreamRequested](v5, "downstreamRequested");
        if (v13)
          -[BPSReduceProducer setCompleted:](v5, "setCompleted:", 1);
        -[BPSReduceProducer status](v5, "status");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setState:", 2);

        -[BPSReduceProducer result](v5, "result");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_unlock(p_lock);
        -[BPSReduceProducer status](v5, "status");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "subscription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "cancel");

        if (v13)
        {
          if (v15)
          {
            -[BPSReduceProducer downstream](v5, "downstream");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "receiveInput:", v15);

          }
          -[BPSReduceProducer downstream](v5, "downstream");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[BPSCompletion success](BPSCompletion, "success");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "receiveCompletion:", v20);

        }
        v12 = 0;

        goto LABEL_18;
      case 2:
        os_unfair_lock_lock(p_lock);
        -[BPSReduceProducer setUpstreamCompleted:](v5, "setUpstreamCompleted:", 1);
        -[BPSReduceProducer setCompleted:](v5, "setCompleted:", 1);
        os_unfair_lock_unlock(p_lock);
        -[BPSReduceProducer status](v5, "status");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setState:", 2);

        -[BPSReduceProducer status](v5, "status");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "subscription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "cancel");

        -[BPSReduceProducer downstream](v5, "downstream");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "receiveCompletion:", v26);

        break;
      case 1:
        break;
      default:
        __biome_log_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          -[BPSReduceProducer receiveInput:].cold.1((uint64_t)v5, v9, v11);

        v12 = 1;
        goto LABEL_18;
    }
    v12 = 0;
LABEL_18:

    goto LABEL_19;
  }
  os_unfair_lock_unlock(p_lock);
  v12 = 0;
LABEL_19:

  return v12;
}

- (void)receiveSubscription:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[BPSReduceProducer status](self, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5)
  {
    os_unfair_lock_unlock(&self->_lock);
    -[BPSReduceProducer status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

  }
  else
  {
    -[BPSReduceProducer status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setState:", 1);

    -[BPSReduceProducer status](self, "status");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSubscription:", v11);

    os_unfair_lock_unlock(&self->_lock);
    -[BPSReduceProducer downstream](self, "downstream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "receiveSubscription:", self);

    objc_msgSend(v11, "requestDemand:", 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (void)cancel
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A956A000, a2, OS_LOG_TYPE_DEBUG, "%@ - cancel", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)requestDemand:(int64_t)a3
{
  BPSReduceProducer *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BPSReduceProducer *v12;

  v5 = self;
  v12 = v5;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("BPSReduceProducer.m"), 226, CFSTR("Negative or zero demand requested"));

    v5 = v12;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSReduceProducer downstreamRequested](v12, "downstreamRequested")
    || -[BPSReduceProducer cancelled](v12, "cancelled")
    || -[BPSReduceProducer completed](v12, "completed")
    || (-[BPSReduceProducer setDownstreamRequested:](v12, "setDownstreamRequested:", 1),
        !-[BPSReduceProducer upstreamCompleted](v12, "upstreamCompleted")))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[BPSReduceProducer setCompleted:](v12, "setCompleted:", 1);
    -[BPSReduceProducer result](v12, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      -[BPSReduceProducer downstream](v12, "downstream");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "receiveInput:", v7);

    }
    -[BPSReduceProducer downstream](v12, "downstream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[BPSCompletion success](BPSCompletion, "success");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "receiveCompletion:", v10);

  }
}

+ (id)safeMutableCopy:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (id)objc_msgSend(v3, "mutableCopy");
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (id)upstreamSubscriptions
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[BPSReduceProducer status](self, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BPSReduceProducer status](self, "status");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject subscription](v5, "subscription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BPSReduceProducer upstreamSubscriptions].cold.1((uint64_t)self, v5);
    v7 = (void *)MEMORY[0x1E0C9AA60];
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
  id v14;
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
  -[BPSReduceProducer upstreamSubscriptions](self, "upstreamSubscriptions");
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
  v14 = self->_result;
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[BMBookmarkNode initWithValue:upstreams:name:](v13, "initWithValue:upstreams:name:", v14, v3, v16);

  return v17;
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong(&self->_result, a3);
}

- (id)initial
{
  return self->_initial;
}

- (void)setInitial:(id)a3
{
  objc_storeStrong(&self->_initial, a3);
}

- (id)reduce
{
  return self->_reduce;
}

- (void)setReduce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (BOOL)downstreamRequested
{
  return self->_downstreamRequested;
}

- (void)setDownstreamRequested:(BOOL)a3
{
  self->_downstreamRequested = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)upstreamCompleted
{
  return self->_upstreamCompleted;
}

- (void)setUpstreamCompleted:(BOOL)a3
{
  self->_upstreamCompleted = a3;
}

- (BOOL)empty
{
  return self->_empty;
}

- (void)setEmpty:(BOOL)a3
{
  self->_empty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong(&self->_reduce, 0);
  objc_storeStrong(&self->_initial, 0);
  objc_storeStrong(&self->_result, 0);
}

- (void)receiveInput:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v5 = 138412546;
  v6 = OUTLINED_FUNCTION_3();
  v7 = 2048;
  v8 = objc_msgSend(a2, "state");
  _os_log_fault_impl(&dword_1A956A000, a3, OS_LOG_TYPE_FAULT, "%@ - BPSResultState - %ld is unrecognized", (uint8_t *)&v5, 0x16u);
}

- (void)upstreamSubscriptions
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1A956A000, a2, OS_LOG_TYPE_ERROR, "%@ - Subscritpion shouldn't be nil while generating bookmark", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
