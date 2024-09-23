@implementation BPSSessionWindow

- (BPSSessionWindow)initWithDateInterval:(id)a3 gap:(double)a4 timestamp:(id)a5 aggregator:(id)a6 identifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BPSSessionWindow *v17;
  BPSSessionWindow *v18;
  uint64_t v19;
  id timestamp;
  uint64_t v21;
  id accumulator;
  uint64_t v23;
  id closure;
  BPSSubscriptionStatus *v25;
  BPSSubscriptionStatus *status;
  objc_super v28;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)BPSSessionWindow;
  v17 = -[BPSSessionWindow init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v17->_dateInterval, a3);
    v18->_gap = a4;
    v19 = objc_msgSend(v14, "copy");
    timestamp = v18->_timestamp;
    v18->_timestamp = (id)v19;

    objc_msgSend(v15, "accumulator");
    v21 = objc_claimAutoreleasedReturnValue();
    accumulator = v18->_accumulator;
    v18->_accumulator = (id)v21;

    objc_msgSend(v15, "closure");
    v23 = objc_claimAutoreleasedReturnValue();
    closure = v18->_closure;
    v18->_closure = (id)v23;

    objc_storeStrong((id *)&v18->_identifier, a7);
    v25 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
    status = v18->_status;
    v18->_status = v25;

    v18->_downstreamRequested = 0;
  }

  return v18;
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
  BPSSessionWindow *v4;
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
  BPSSessionWindow *v5;
  os_unfair_lock_s *p_lock;
  id closure;
  id v8;
  void (**v9)(void *, id, id);
  void (**v10)(void *, id);
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSDateInterval *dateInterval;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id obj;

  v4 = a3;
  v5 = self;
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSSubscriptionStatus state](v5->_status, "state") == 1)
  {
    closure = v5->_closure;
    v8 = v5->_accumulator;
    v9 = (void (**)(void *, id, id))_Block_copy(closure);
    v10 = (void (**)(void *, id))_Block_copy(v5->_timestamp);
    os_unfair_lock_unlock(p_lock);
    v10[2](v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v8, v4);
    obj = (id)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_lock(p_lock);
    if (-[NSDateInterval containsDate:](v5->_dateInterval, "containsDate:", v11))
    {
      v12 = obj;
      objc_storeStrong(&v5->_accumulator, obj);
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      v14 = v13;
      -[NSDateInterval startDate](v5->_dateInterval, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v17 = v14 - v16 + v5->_gap + -0.0001;

      v18 = objc_alloc(MEMORY[0x1E0CB3588]);
      -[NSDateInterval startDate](v5->_dateInterval, "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "initWithStartDate:duration:", v19, v17);
      dateInterval = v5->_dateInterval;
      v5->_dateInterval = (NSDateInterval *)v20;

      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      -[BPSSubscriptionStatus setState:](v5->_status, "setState:", 2);
      -[BPSWindow downstream](v5, "downstream");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSSubscriptionStatus subscription](v5->_status, "subscription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v5->_accumulator;
      os_unfair_lock_unlock(p_lock);
      objc_msgSend(v22, "receiveInput:", v24);

      +[BPSCompletion success](BPSCompletion, "success");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "receiveCompletion:", v25);

      objc_msgSend(v23, "cancel");
      v12 = obj;
    }

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
  BPSSessionWindow *v8;
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
  BPSSessionWindow *v4;

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
  BPSSessionWindow *v6;

  v6 = self;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("BPSSessionWindowAssigner.m"), 196, CFSTR("Expecting demand to be greater than 0"));

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

- (double)gap
{
  return self->_gap;
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
  objc_storeStrong(&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
