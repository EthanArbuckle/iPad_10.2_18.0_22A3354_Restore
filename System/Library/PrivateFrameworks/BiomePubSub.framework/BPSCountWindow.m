@implementation BPSCountWindow

- (BPSCountWindow)initWithCapacity:(unint64_t)a3 aggregator:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  BPSCountWindow *v11;
  BPSCountWindow *v12;
  uint64_t v13;
  id accumulator;
  uint64_t v15;
  id closure;
  BPSSubscriptionStatus *v17;
  BPSSubscriptionStatus *status;
  void *v20;
  objc_super v21;

  v9 = a4;
  v10 = a5;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSCountWindowAssigner.m"), 40, CFSTR("Expecting capacity to be greater than 0"));

  }
  v21.receiver = self;
  v21.super_class = (Class)BPSCountWindow;
  v11 = -[BPSCountWindow init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_capacity = a3;
    objc_msgSend(v9, "accumulator");
    v13 = objc_claimAutoreleasedReturnValue();
    accumulator = v12->_accumulator;
    v12->_accumulator = (id)v13;

    objc_msgSend(v9, "closure");
    v15 = objc_claimAutoreleasedReturnValue();
    closure = v12->_closure;
    v12->_closure = (id)v15;

    objc_storeStrong((id *)&v12->_identifier, a5);
    v12->_currentCount = 0;
    v17 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
    status = v12->_status;
    v12->_status = v17;

    v12->_downstreamRequested = 0;
  }

  return v12;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)metadata
{
  return -[BPSCountWindowMetadata initWithCurrentCount:]([BPSCountWindowMetadata alloc], "initWithCurrentCount:", self->_currentCount);
}

- (void)receiveCompletion:(id)a3
{
  BPSCountWindow *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if (-[BPSSubscriptionStatus state](v4->_status, "state") == 1)
  {
    -[BPSSubscriptionStatus setState:](v4->_status, "setState:", 2);
    -[BPSWindow downstream](v4, "downstream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "state");
    if (v7 == 1)
    {
      os_unfair_lock_unlock(p_lock);
      objc_msgSend(v11, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "receiveCompletion:", v10);

    }
    else
    {
      if (v7)
      {
LABEL_11:

        goto LABEL_12;
      }
      if (v4->_downstreamRequested)
      {
        v8 = v4->_accumulator;
        os_unfair_lock_unlock(p_lock);
        objc_msgSend(v6, "receiveInput:", v8);

      }
      else
      {
        os_unfair_lock_unlock(p_lock);
      }
      +[BPSCompletion success](BPSCompletion, "success");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "receiveCompletion:", v9);
    }

    goto LABEL_11;
  }
  os_unfair_lock_unlock(p_lock);
LABEL_12:

}

- (int64_t)receiveInput:(id)a3
{
  id v4;
  BPSCountWindow *v5;
  os_unfair_lock_s *p_lock;
  unint64_t currentCount;
  id closure;
  id v9;
  void (**v10)(void *, id, id);
  uint64_t v11;
  id accumulator;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSSubscriptionStatus state](v5->_status, "state") != 1)
    goto LABEL_7;
  currentCount = v5->_currentCount;
  if (currentCount < v5->_capacity)
  {
    v5->_currentCount = currentCount + 1;
    closure = v5->_closure;
    v9 = v5->_accumulator;
    v10 = (void (**)(void *, id, id))_Block_copy(closure);
    os_unfair_lock_unlock(p_lock);
    v10[2](v10, v9, v4);
    v11 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock(p_lock);
    accumulator = v5->_accumulator;
    v5->_accumulator = (id)v11;

  }
  if (v5->_downstreamRequested && v5->_currentCount == v5->_capacity)
  {
    -[BPSSubscriptionStatus setState:](v5->_status, "setState:", 2);
    -[BPSWindow downstream](v5, "downstream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSSubscriptionStatus subscription](v5->_status, "subscription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5->_accumulator;
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v13, "receiveInput:", v15);

    +[BPSCompletion success](BPSCompletion, "success");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "receiveCompletion:", v16);

    objc_msgSend(v14, "cancel");
  }
  else
  {
LABEL_7:
    os_unfair_lock_unlock(p_lock);
  }

  return 0;
}

- (void)receiveSubscription:(id)a3
{
  os_unfair_lock_s *p_lock;
  int64_t v5;
  void *v6;
  void *v7;
  unint64_t capacity;
  BPSCountWindow *v9;
  id v10;

  v10 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[BPSSubscriptionStatus state](self->_status, "state");
  if (v5 == 2 || v5 == 1)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v10, "cancel");
    goto LABEL_6;
  }
  v6 = v10;
  if (!v5)
  {
    -[BPSSubscriptionStatus setState:](self->_status, "setState:", 1);
    -[BPSSubscriptionStatus setSubscription:](self->_status, "setSubscription:", v10);
    -[BPSWindow downstream](self, "downstream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    capacity = self->_capacity;
    v9 = self;
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v7, "receiveSubscription:", v9);

    objc_msgSend(v10, "requestDemand:", capacity);
LABEL_6:
    v6 = v10;
  }

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v3;
  BPSCountWindow *v4;

  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if (-[BPSSubscriptionStatus state](v4->_status, "state") == 1)
  {
    -[BPSSubscriptionStatus setState:](v4->_status, "setState:", 2);
    -[BPSSubscriptionStatus subscription](v4->_status, "subscription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v3, "cancel");

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)requestDemand:(int64_t)a3
{
  BPSCountWindow *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  BPSSubscriptionStatus *status;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BPSCountWindow *v13;

  v5 = self;
  v13 = v5;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("BPSCountWindowAssigner.m"), 192, CFSTR("Expecting demand to be greater than 0"));

    v5 = v13;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSSubscriptionStatus state](v13->_status, "state") == 1
    && (v13->_downstreamRequested = 1, v13->_currentCount == v13->_capacity))
  {
    -[BPSSubscriptionStatus setState:](v13->_status, "setState:", 2);
    -[BPSWindow downstream](v13, "downstream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    status = v13->_status;
    v9 = v13->_accumulator;
    -[BPSSubscriptionStatus subscription](status, "subscription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v7, "receiveInput:", v9);

    +[BPSCompletion success](BPSCompletion, "success");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "receiveCompletion:", v11);

    objc_msgSend(v10, "cancel");
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unint64_t)currentCount
{
  return self->_currentCount;
}

- (id)accumulator
{
  return self->_accumulator;
}

- (id)closure
{
  return self->_closure;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_closure, 0);
  objc_storeStrong(&self->_accumulator, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
