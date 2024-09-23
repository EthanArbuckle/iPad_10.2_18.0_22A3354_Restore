@implementation BPSTimeWindowProducer

- (BPSTimeWindowProducer)initWithDateInterval:(id)a3 aggregator:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  BPSTimeWindowProducer *v12;
  BPSTimeWindowProducer *v13;
  uint64_t v14;
  id accumulator;
  uint64_t v16;
  id closure;
  BPSSubscriptionStatus *v18;
  BPSSubscriptionStatus *status;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BPSTimeWindowProducer;
  v12 = -[BPSTimeWindowProducer init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_dateInterval, a3);
    objc_msgSend(v10, "accumulator");
    v14 = objc_claimAutoreleasedReturnValue();
    accumulator = v13->_accumulator;
    v13->_accumulator = (id)v14;

    objc_msgSend(v10, "closure");
    v16 = objc_claimAutoreleasedReturnValue();
    closure = v13->_closure;
    v13->_closure = (id)v16;

    objc_storeStrong((id *)&v13->_identifier, a5);
    v18 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
    status = v13->_status;
    v13->_status = v18;

    v13->_downstreamRequested = 0;
  }

  return v13;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)metadata
{
  return -[BPSTimeWindowMetadata initWithDateInterval:]([BPSTimeWindowMetadata alloc], "initWithDateInterval:", self->_dateInterval);
}

- (void)receiveCompletion:(id)a3
{
  BPSTimeWindowProducer *v4;
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
  BPSTimeWindowProducer *v5;
  os_unfair_lock_s *p_lock;
  id closure;
  id v8;
  void (**v9)(void *, id, id);
  uint64_t v10;
  id accumulator;

  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSSubscriptionStatus state](v5->_status, "state") == 1)
  {
    closure = v5->_closure;
    v8 = v5->_accumulator;
    v9 = (void (**)(void *, id, id))_Block_copy(closure);
    os_unfair_lock_unlock(p_lock);
    v9[2](v9, v8, v4);
    v10 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock(p_lock);
    accumulator = v5->_accumulator;
    v5->_accumulator = (id)v10;

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
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
  BPSTimeWindowProducer *v8;
  id v9;

  v9 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[BPSSubscriptionStatus state](self->_status, "state");
  if (v5 == 2 || v5 == 1)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v9, "cancel");
    goto LABEL_6;
  }
  v6 = v9;
  if (!v5)
  {
    -[BPSSubscriptionStatus setState:](self->_status, "setState:", 1);
    -[BPSSubscriptionStatus setSubscription:](self->_status, "setSubscription:", v9);
    -[BPSWindow downstream](self, "downstream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self;
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v7, "receiveSubscription:", v8);

    objc_msgSend(v9, "requestDemand:", 0x7FFFFFFFFFFFFFFFLL);
LABEL_6:
    v6 = v9;
  }

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v3;
  BPSTimeWindowProducer *v4;

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
  void *v5;
  BPSTimeWindowProducer *v6;

  v6 = self;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("BPSTimeWindowProducer.m"), 207, CFSTR("Expecting demand to be greater than 0"));

  }
  os_unfair_lock_lock(&v6->_lock);
  if (-[BPSSubscriptionStatus state](v6->_status, "state") == 1)
    v6->_downstreamRequested = 1;
  os_unfair_lock_unlock(&v6->_lock);

}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
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
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
