@implementation _BMDSLStatePublisherInner

- (_BMDSLStatePublisherInner)initWithDownstream:(id)a3 state:(id)a4 DSLState:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BMDSLStatePublisherInner *v12;
  _BMDSLStatePublisherInner *v13;
  uint64_t v14;
  BPSSubscriptionStatus *status;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_BMDSLStatePublisherInner;
  v12 = -[_BMDSLStatePublisherInner init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_downstream, a3);
    objc_storeStrong((id *)&v13->_state, a4);
    objc_storeStrong((id *)&v13->_DSLState, a5);
    objc_msgSend(MEMORY[0x1E0D02480], "awaitingSubscription");
    v14 = objc_claimAutoreleasedReturnValue();
    status = v13->_status;
    v13->_status = (BPSSubscriptionStatus *)v14;

  }
  return v13;
}

- (void)receiveSubscription:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  BPSSubscriptionStatus *v6;
  BPSSubscriptionStatus *status;
  id v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (BPSSubscriptionStatus *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02480]), "initWithState:subscription:", 1, v5);

  status = self->_status;
  self->_status = v6;

  -[_BMDSLStatePublisherInner downstream](self, "downstream");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v8, "receiveSubscription:", self);

}

- (int64_t)receiveInput:(id)a3
{
  BMDSLStateValue *v4;
  _BMDSLStatePublisherInner *v5;
  BMDSLStateValue *state;
  BMDSLStateValue *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BPSSubscriber *v14;
  int64_t v15;

  v4 = (BMDSLStateValue *)a3;
  v5 = self;
  os_unfair_lock_lock(&v5->_lock);
  state = v5->_state;
  if (!state)
    state = v4;
  v7 = state;
  -[BMDSLState upstreamCombinedState](v5->_DSLState, "upstreamCombinedState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[BMDSLState key](v5->_DSLState, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v7, v10, 0);

  v12 = v11;
  v13 = v12;
  if (v8)
  {
    objc_msgSend(v8, "reduceWithNext:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[BMDSLState setCombinedValue:](v5->_DSLState, "setCombinedValue:", v13);
  v14 = v5->_downstream;
  os_unfair_lock_unlock(&v5->_lock);
  v15 = -[BPSSubscriber receiveInput:](v14, "receiveInput:", v4);

  return v15;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  _BMDSLStatePublisherInner *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char isKindOfClass;
  BMDSLState *DSLState;
  id v23;
  void *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  BPSSubscriptionStatus *status;
  BPSSubscriber *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSSubscriptionStatus state](v5->_status, "state") == 1)
  {
    -[BPSSubscriptionStatus subscription](v5->_status, "subscription");
    v6 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v6;
    if (v6)
    {
      v41[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C9AA60];
    }
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if ((objc_msgSend(v14, "conformsToProtocol:", &unk_1EEE180C0) & 1) != 0)
          {
            v15 = objc_msgSend(v14, "newBookmark");
            if (v15)
              goto LABEL_18;
          }
          else
          {
            __biome_log_for_category();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v14;
              _os_log_error_impl(&dword_1AEB18000, v16, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v15 = objc_claimAutoreleasedReturnValue();
LABEL_18:
          v17 = (void *)v15;
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v11);
    }

    -[BMDSLState combinedValue](v5->_DSLState, "combinedValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDSLState value](v5->_DSLState, "value");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        DSLState = v5->_DSLState;
        v23 = v18;
        -[BMDSLState key](DSLState, "key");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
    }
    v26 = objc_alloc(MEMORY[0x1E0D02420]);
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v26, "initWithValue:upstreams:name:", v25, v8, v28);
    -[_BMDSLStatePublisherInner setCompletionBookmark:](v5, "setCompletionBookmark:", v29);

    objc_msgSend(MEMORY[0x1E0D02480], "terminal");
    v30 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (BPSSubscriptionStatus *)v30;

    v32 = v5->_downstream;
    os_unfair_lock_unlock(&v5->_lock);
    -[BPSSubscriber receiveCompletion:](v32, "receiveCompletion:", v4);

  }
  else
  {
    os_unfair_lock_unlock(&v5->_lock);
  }

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v3;
  uint64_t v4;
  BPSSubscriptionStatus *status;
  _BMDSLStatePublisherInner *v6;

  v6 = self;
  p_lock = &v6->_lock;
  os_unfair_lock_lock(&v6->_lock);
  if (-[BPSSubscriptionStatus state](v6->_status, "state") == 1)
  {
    -[BPSSubscriptionStatus subscription](v6->_status, "subscription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D02480], "terminal");
    v4 = objc_claimAutoreleasedReturnValue();
    status = v6->_status;
    v6->_status = (BPSSubscriptionStatus *)v4;

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v3, "cancel");

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

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
  -[BPSSubscriptionStatus subscription](self->_status, "subscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (void)requestDemand:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  _BMDSLStatePublisherInner *v6;

  v6 = self;
  p_lock = &v6->_lock;
  os_unfair_lock_lock(&v6->_lock);
  if (-[BPSSubscriptionStatus state](v6->_status, "state") == 1)
  {
    -[BPSSubscriptionStatus subscription](v6->_status, "subscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v5, "requestDemand:", a3);

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (id)newBookmark
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_BMDSLStatePublisherInner completionBookmark](self, "completionBookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (BMDSLStateValue)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (BMDSLState)DSLState
{
  return self->_DSLState;
}

- (void)setDSLState:(id)a3
{
  objc_storeStrong((id *)&self->_DSLState, a3);
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (BMBookmarkNode)completionBookmark
{
  return self->_completionBookmark;
}

- (void)setCompletionBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_completionBookmark, a3);
}

- (BOOL)sentInitialState
{
  return self->_sentInitialState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBookmark, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_DSLState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
