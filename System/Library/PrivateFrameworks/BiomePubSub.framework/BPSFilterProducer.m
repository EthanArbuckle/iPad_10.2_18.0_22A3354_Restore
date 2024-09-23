@implementation BPSFilterProducer

- (BPSFilterProducer)initWithDownstream:(id)a3
{
  id v5;
  BPSFilterProducer *v6;
  BPSFilterProducer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSFilterProducer;
  v6 = -[BPSFilterProducer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downstream, a3);
    v7->_state = 0;
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
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
  BPSFilterProducer *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = objc_opt_class();
    _os_log_impl(&dword_1A956A000, v6, OS_LOG_TYPE_INFO, "%@ - completion", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_lock(&v5->_lock);
  v7 = -[BPSFilterProducer state](v5, "state");
  switch(v7)
  {
    case 2:
      goto LABEL_8;
    case 1:
      -[BPSFilterProducer setState:](v5, "setState:", 2);
      os_unfair_lock_unlock(&v5->_lock);
      -[BPSFilterProducer downstream](v5, "downstream");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "receiveCompletion:", v4);

      os_unfair_lock_lock(&v5->_lock);
      -[BPSFilterProducer setSubscription:](v5, "setSubscription:", 0);
LABEL_8:
      os_unfair_lock_unlock(&v5->_lock);
      break;
    case 0:
      os_unfair_lock_unlock(&v5->_lock);
      v8 = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid State: Received completion before receiving subscription"), 0);
      break;
  }

}

- (int64_t)receiveInput:(id)a3
{
  id v5;
  BPSFilterProducer *v6;
  os_unfair_lock_s *p_lock;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  uint64_t v14;
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

  v5 = a3;
  v6 = self;
  p_lock = &v6->_lock;
  os_unfair_lock_lock(&v6->_lock);
  v8 = -[BPSFilterProducer state](v6, "state");
  switch(v8)
  {
    case 2:
      os_unfair_lock_unlock(p_lock);
      break;
    case 1:
      os_unfair_lock_unlock(p_lock);
      -[BPSFilterProducer receiveNewValue:](v6, "receiveNewValue:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "state");
      if (v14)
      {
        if (v14 == 2)
        {
          os_unfair_lock_lock(p_lock);
          -[BPSFilterProducer setState:](v6, "setState:", 2);
          os_unfair_lock_unlock(p_lock);
          -[BPSFilterProducer subscription](v6, "subscription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "cancel");

          objc_msgSend(v11, "error");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[BPSFilterProducer downstream](v6, "downstream");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "receiveCompletion:", v24);

          goto LABEL_5;
        }
        if (v14 != 1)
        {
LABEL_5:

          break;
        }
        objc_msgSend(v11, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[BPSFilterProducer downstream](v6, "downstream");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v16, "receiveInput:", v17);

        }
        else
        {
          v12 = 1;
        }
      }
      else
      {
        os_unfair_lock_lock(p_lock);
        -[BPSFilterProducer setState:](v6, "setState:", 2);
        os_unfair_lock_unlock(p_lock);
        -[BPSFilterProducer subscription](v6, "subscription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "cancel");

        -[BPSFilterProducer downstream](v6, "downstream");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[BPSCompletion success](BPSCompletion, "success");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "receiveCompletion:", v20);

        v12 = 0;
      }

      goto LABEL_8;
    case 0:
      os_unfair_lock_unlock(p_lock);
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "raise:format:", v10, CFSTR("Invalid State: Received value before receiving subscription %@"), v11);
      goto LABEL_5;
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (void)receiveSubscription:(id)a3
{
  int64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[BPSFilterProducer state](self, "state");
  if ((unint64_t)(v4 - 1) < 2)
  {
    os_unfair_lock_unlock(&self->_lock);
    -[BPSFilterProducer subscription](self, "subscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");
LABEL_5:

    goto LABEL_6;
  }
  if (!v4)
  {
    -[BPSFilterProducer setState:](self, "setState:", 1);
    -[BPSFilterProducer setSubscription:](self, "setSubscription:", v6);
    os_unfair_lock_unlock(&self->_lock);
    -[BPSFilterProducer downstream](self, "downstream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "receiveSubscription:", self);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)cancel
{
  BPSFilterProducer *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[_BPSHandleEventsInner cancel].cold.1((uint64_t)v2, v3);

  os_unfair_lock_lock(&v2->_lock);
  v4 = -[BPSFilterProducer state](v2, "state");
  -[BPSFilterProducer setState:](v2, "setState:", 2);
  if (v4 == 1)
  {
    -[BPSFilterProducer subscription](v2, "subscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSFilterProducer setSubscription:](v2, "setSubscription:", 0);
    os_unfair_lock_unlock(&v2->_lock);
    objc_msgSend(v5, "cancel");

  }
  else
  {
    -[BPSFilterProducer setSubscription:](v2, "setSubscription:", 0);
    os_unfair_lock_unlock(&v2->_lock);
  }

}

- (void)requestDemand:(int64_t)a3
{
  BPSFilterProducer *v5;
  os_unfair_lock_s *p_lock;
  uint64_t v7;
  void *v8;
  void *v9;
  BPSFilterProducer *v10;

  v5 = self;
  v10 = v5;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("BPSFilterProducer.m"), 168, CFSTR("Negative or zero demand requested"));

    v5 = v10;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  v7 = -[BPSFilterProducer state](v10, "state");
  switch(v7)
  {
    case 2:
      os_unfair_lock_unlock(p_lock);
      break;
    case 1:
      os_unfair_lock_unlock(p_lock);
      -[BPSFilterProducer subscription](v10, "subscription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestDemand:", a3);

      break;
    case 0:
      os_unfair_lock_unlock(p_lock);
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid state: Received request before sending subscription"));
      break;
  }

}

- (id)upstreamSubscriptions
{
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[BPSFilterProducer subscription](self, "subscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BPSFilterProducer subscription](self, "subscription");
    v4 = objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[_BPSHandleEventsInner upstreamSubscriptions].cold.1((uint64_t)self, v4);
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
