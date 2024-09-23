@implementation _BPSAbstractCombineLatest

- (_BPSAbstractCombineLatest)initWithDownstream:(id)a3 upstreamCount:(unint64_t)a4
{
  id v7;
  _BPSAbstractCombineLatest *v8;
  _BPSAbstractCombineLatest *v9;
  uint64_t v10;
  NSMutableArray *subscriptions;
  uint64_t v12;
  NSMutableArray *buffers;
  NSMutableArray *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_BPSAbstractCombineLatest;
  v8 = -[_BPSAbstractCombineLatest init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_downstream, a3);
    v9->_upstreamCount = a4;
    v9->_recursion = 0;
    v9->_finished = 0;
    v9->_errored = 0;
    v9->_cancelled = 0;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    subscriptions = v9->_subscriptions;
    v9->_subscriptions = (NSMutableArray *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    buffers = v9->_buffers;
    v9->_buffers = (NSMutableArray *)v12;

    v9->_demand = 0;
    v9->_lock._os_unfair_lock_opaque = 0;
    for (v9->_downstreamLock = 0; a4; --a4)
    {
      v14 = v9->_subscriptions;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v14, "addObject:", v15);

      v16 = v9->_buffers;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v16, "addObject:", v17);

    }
  }

  return v9;
}

- (void)requestDemand:(int64_t)a3
{
  _BPSAbstractCombineLatest *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = self;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("BPSCombineLatest.m"), 66, CFSTR("Expecting demand to be greater than 0"));

  }
  os_unfair_lock_lock(&v5->_lock);
  if (-[_BPSAbstractCombineLatest cancelled](v5, "cancelled") || -[_BPSAbstractCombineLatest finished](v5, "finished"))
  {
    os_unfair_lock_unlock(&v5->_lock);
  }
  else
  {
    -[_BPSAbstractCombineLatest subscriptions](v5, "subscriptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    -[_BPSAbstractCombineLatest setDemand:](v5, "setDemand:", -[_BPSAbstractCombineLatest demand](v5, "demand") + a3);
    os_unfair_lock_unlock(&v5->_lock);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
          objc_msgSend(MEMORY[0x1E0C99E38], "null", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqual:", v14);

          if ((v15 & 1) == 0)
            objc_msgSend(v13, "requestDemand:", a3);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
}

- (void)receiveSubscription:(id)a3 atIndex:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (-[_BPSAbstractCombineLatest upstreamCount](self, "upstreamCount") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSCombineLatest.m"), 89, CFSTR("Index should be less than upstream count"));

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[_BPSAbstractCombineLatest cancelled](self, "cancelled"))
    goto LABEL_6;
  -[_BPSAbstractCombineLatest subscriptions](self, "subscriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
LABEL_6:
    os_unfair_lock_unlock(&self->_lock);
    NSLog(CFSTR("Should cancel subscription here..."));
    objc_msgSend(v14, "cancel");
  }
  else
  {
    -[_BPSAbstractCombineLatest subscriptions](self, "subscriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:atIndexedSubscript:", v14, a4);

    os_unfair_lock_unlock(p_lock);
  }

}

- (int64_t)receiveInput:(id)a3 atIndex:(unint64_t)a4
{
  id v7;
  _BPSAbstractCombineLatest *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = self;
  if (-[_BPSAbstractCombineLatest upstreamCount](v8, "upstreamCount") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("BPSCombineLatest.m"), 105, CFSTR("Index should be less than upstream count"));

  }
  os_unfair_lock_lock(&v8->_lock);
  if (-[_BPSAbstractCombineLatest cancelled](v8, "cancelled") || -[_BPSAbstractCombineLatest finished](v8, "finished"))
    goto LABEL_22;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("BPSCombineLatest.m"), 113, CFSTR("value can't be nil"));

  }
  -[_BPSAbstractCombineLatest buffers](v8, "buffers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:atIndexedSubscript:", v7, a4);

  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  -[_BPSAbstractCombineLatest buffers](v8, "buffers", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_17;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_17:

  if (-[_BPSAbstractCombineLatest recursion](v8, "recursion")
    || (-[_BPSAbstractCombineLatest demand](v8, "demand") < 1 ? (v14 = 1) : (v14 = v11), (v14 & 1) != 0))
  {
LABEL_22:
    os_unfair_lock_unlock(&v8->_lock);
  }
  else
  {
    -[_BPSAbstractCombineLatest setDemand:](v8, "setDemand:", -[_BPSAbstractCombineLatest demand](v8, "demand") - 1);
    -[_BPSAbstractCombineLatest buffers](v8, "buffers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&v8->_lock);
    -[_BPSAbstractCombineLatest convertValues:](v8, "convertValues:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&v8->_lock);
    -[_BPSAbstractCombineLatest setRecursion:](v8, "setRecursion:", 1);
    os_unfair_lock_unlock(&v8->_lock);
    os_unfair_recursive_lock_lock_with_options();
    -[_BPSAbstractCombineLatest downstream](v8, "downstream");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "receiveInput:", v17);

    os_unfair_recursive_lock_unlock();
    os_unfair_lock_lock(&v8->_lock);
    -[_BPSAbstractCombineLatest setRecursion:](v8, "setRecursion:", 0);
    if (v19 >= 1)
      -[_BPSAbstractCombineLatest setDemand:](v8, "setDemand:", -[_BPSAbstractCombineLatest demand](v8, "demand") + v19);
    os_unfair_lock_unlock(&v8->_lock);

  }
  return 0;
}

- (void)receiveCompletion:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  _BPSAbstractCombineLatest *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[5];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v6, "state");
  if (v8 == 1)
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)objc_opt_class();
      v28 = v27;
      objc_msgSend(v6, "error");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v27;
      v33 = 2048;
      v34 = a4;
      v35 = 2112;
      v36 = v29;
      _os_log_error_impl(&dword_1A956A000, v16, OS_LOG_TYPE_ERROR, "%@ - Complete at index: %lud with error: %@", buf, 0x20u);

    }
    os_unfair_lock_lock(&v7->_lock);
    -[_BPSAbstractCombineLatest setFinished:](v7, "setFinished:", 1);
    -[_BPSAbstractCombineLatest setErrored:](v7, "setErrored:", 1);
    v17 = (void *)MEMORY[0x1E0C99D20];
    -[_BPSAbstractCombineLatest subscriptions](v7, "subscriptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "arrayWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count"))
    {
      v20 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_BPSAbstractCombineLatest subscriptions](v7, "subscriptions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:atIndexedSubscript:", v21, v20);

        ++v20;
      }
      while (objc_msgSend(v19, "count") > v20);
    }
    if (-[_BPSAbstractCombineLatest upstreamCount](v7, "upstreamCount"))
    {
      v23 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_BPSAbstractCombineLatest buffers](v7, "buffers");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:atIndexedSubscript:", v24, v23);

        ++v23;
      }
      while (v23 < -[_BPSAbstractCombineLatest upstreamCount](v7, "upstreamCount"));
    }
    os_unfair_lock_unlock(&v7->_lock);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __55___BPSAbstractCombineLatest_receiveCompletion_atIndex___block_invoke;
    v30[3] = &__block_descriptor_40_e32_v32__0__BPSSubscription_8Q16_B24l;
    v30[4] = a4;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v30);
    os_unfair_recursive_lock_lock_with_options();
    -[_BPSAbstractCombineLatest downstream](v7, "downstream");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "receiveCompletion:", v6);

    os_unfair_recursive_lock_unlock();
  }
  else if (!v8)
  {
    os_unfair_lock_lock(&v7->_lock);
    if (-[_BPSAbstractCombineLatest finished](v7, "finished"))
      goto LABEL_18;
    -[_BPSAbstractCombineLatest setFinishCount:](v7, "setFinishCount:", -[_BPSAbstractCombineLatest finishCount](v7, "finishCount") + 1);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BPSAbstractCombineLatest subscriptions](v7, "subscriptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:atIndexedSubscript:", v9, a4);

    v11 = -[_BPSAbstractCombineLatest finishCount](v7, "finishCount");
    if (v11 != -[_BPSAbstractCombineLatest upstreamCount](v7, "upstreamCount"))
    {
LABEL_18:
      os_unfair_lock_unlock(&v7->_lock);
    }
    else
    {
      -[_BPSAbstractCombineLatest setFinished:](v7, "setFinished:", 1);
      if (-[_BPSAbstractCombineLatest upstreamCount](v7, "upstreamCount"))
      {
        v12 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_BPSAbstractCombineLatest buffers](v7, "buffers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:atIndexedSubscript:", v13, v12);

          ++v12;
        }
        while (v12 < -[_BPSAbstractCombineLatest upstreamCount](v7, "upstreamCount"));
      }
      os_unfair_lock_unlock(&v7->_lock);
      os_unfair_recursive_lock_lock_with_options();
      -[_BPSAbstractCombineLatest downstream](v7, "downstream");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "receiveCompletion:", v6);

      os_unfair_recursive_lock_unlock();
    }
  }

}

- (id)convertValues:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Abstract Method"), &stru_1E554E0D0);
  return 0;
}

- (void)cancel
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_debug_impl(&dword_1A956A000, a2, OS_LOG_TYPE_DEBUG, "%@ - Cancel", (uint8_t *)&v4, 0xCu);

}

- (unint64_t)upstreamCount
{
  return self->_upstreamCount;
}

- (void)setUpstreamCount:(unint64_t)a3
{
  self->_upstreamCount = a3;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (NSMutableArray)buffers
{
  return self->_buffers;
}

- (void)setBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_buffers, a3);
}

- (BOOL)recursion
{
  return self->_recursion;
}

- (void)setRecursion:(BOOL)a3
{
  self->_recursion = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)errored
{
  return self->_errored;
}

- (void)setErrored:(BOOL)a3
{
  self->_errored = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (unint64_t)finishCount
{
  return self->_finishCount;
}

- (void)setFinishCount:(unint64_t)a3
{
  self->_finishCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
