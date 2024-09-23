@implementation _BPSMulticastInner

- (_BPSMulticastInner)initWithDownstream:(id)a3
{
  id v5;
  _BPSMulticastInner *v6;
  _BPSMulticastInner *v7;
  BPSSubscriptionStatus *v8;
  BPSSubscriptionStatus *status;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BPSMulticastInner;
  v6 = -[_BPSMulticastInner init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downstream, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
    status = v7->_status;
    v7->_status = v8;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_BPSMulticastInner;
  -[_BPSMulticastInner dealloc](&v2, sel_dealloc);
}

- (void)receiveSubscription:(id)a3
{
  os_unfair_lock_s *p_lock;
  BPSSubscriber *downstream;
  _BPSMulticastInner *v6;
  BPSSubscriber *v7;

  p_lock = &self->_lock;
  v7 = (BPSSubscriber *)a3;
  os_unfair_lock_lock(p_lock);
  if (-[BPSSubscriptionStatus state](self->_status, "state"))
  {
    os_unfair_lock_unlock(p_lock);
    -[BPSSubscriber cancel](v7, "cancel");
  }
  else
  {
    -[BPSSubscriptionStatus setState:](self->_status, "setState:", 1);
    -[BPSSubscriptionStatus setSubscription:](self->_status, "setSubscription:", v7);

    downstream = self->_downstream;
    v6 = self;
    v7 = downstream;
    os_unfair_lock_unlock(p_lock);
    -[BPSSubscriber receiveSubscription:](v7, "receiveSubscription:", v6);

  }
}

- (int64_t)receiveInput:(id)a3
{
  id v4;
  _BPSMulticastInner *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = self;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_BPSMulticastInner receiveInput:].cold.1((uint64_t)v4, v6);

  os_unfair_lock_lock(&v5->_lock);
  v7 = -[BPSSubscriptionStatus state](v5->_status, "state");
  os_unfair_lock_unlock(&v5->_lock);
  if (v7 == 1)
  {
    -[_BPSMulticastInner downstream](v5, "downstream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "receiveInput:", v4);

    if (v9 > 0)
    {
      -[BPSSubscriptionStatus subscription](v5->_status, "subscription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "requestDemand:", v9);

    }
  }

  return 0;
}

- (void)requestDemand:(int64_t)a3
{
  _BPSMulticastInner *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  id *p_isa;

  v5 = self;
  p_isa = (id *)&v5->super.super.super.isa;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, p_isa, CFSTR("BPSMulticast.m"), 86, CFSTR("Expecting demand to be greater than 0"));

    v5 = (_BPSMulticastInner *)p_isa;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (objc_msgSend(p_isa[2], "state") == 1)
  {
    objc_msgSend(p_isa[2], "subscription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v7, "requestDemand:", a3);

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)receiveCompletion:(id)a3
{
  id v4;
  _BPSMulticastInner *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = (id)objc_opt_class();
    v7 = v11;
    _os_log_impl(&dword_1A956A000, v6, OS_LOG_TYPE_INFO, "%@ - completion", (uint8_t *)&v10, 0xCu);

  }
  os_unfair_lock_lock(&v5->_lock);
  v8 = -[BPSSubscriptionStatus state](v5->_status, "state");
  os_unfair_lock_unlock(&v5->_lock);
  if (v8 == 1)
  {
    -[_BPSMulticastInner downstream](v5, "downstream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "receiveCompletion:", v4);

    os_unfair_lock_lock(&v5->_lock);
    -[BPSSubscriptionStatus setState:](v5->_status, "setState:", 2);
    os_unfair_lock_unlock(&v5->_lock);
  }

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v3;
  _BPSMulticastInner *v4;

  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if (-[BPSSubscriptionStatus state](v4->_status, "state") == 1)
  {
    -[BPSSubscriptionStatus setState:](v4->_status, "setState:", 2);
    os_unfair_lock_unlock(p_lock);
    -[BPSSubscriptionStatus subscription](v4->_status, "subscription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (void)receiveInput:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A956A000, a2, OS_LOG_TYPE_DEBUG, "receiving: %@", (uint8_t *)&v2, 0xCu);
}

@end
