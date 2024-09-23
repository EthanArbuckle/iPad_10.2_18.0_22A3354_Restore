@implementation _BPSHandleEventsInner

- (_BPSHandleEventsInner)initWithDownstream:(id)a3 handleEvents:(id)a4
{
  id v7;
  id v8;
  _BPSHandleEventsInner *v9;
  _BPSHandleEventsInner *v10;
  void *v11;
  uint64_t v12;
  id receiveSubscription;
  void *v14;
  uint64_t v15;
  id receiveOutput;
  void *v17;
  uint64_t v18;
  id receiveCompletion;
  void *v20;
  uint64_t v21;
  id receiveCancel;
  void *v23;
  uint64_t v24;
  id receiveRequest;
  BPSSubscriptionStatus *v26;
  BPSSubscriptionStatus *status;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_BPSHandleEventsInner;
  v9 = -[_BPSHandleEventsInner init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_downstream, a3);
    objc_msgSend(v8, "receiveSubscription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    receiveSubscription = v10->_receiveSubscription;
    v10->_receiveSubscription = (id)v12;

    objc_msgSend(v8, "receiveOutput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    receiveOutput = v10->_receiveOutput;
    v10->_receiveOutput = (id)v15;

    objc_msgSend(v8, "receiveCompletion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    receiveCompletion = v10->_receiveCompletion;
    v10->_receiveCompletion = (id)v18;

    objc_msgSend(v8, "receiveCancel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    receiveCancel = v10->_receiveCancel;
    v10->_receiveCancel = (id)v21;

    objc_msgSend(v8, "receiveRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    receiveRequest = v10->_receiveRequest;
    v10->_receiveRequest = (id)v24;

    v26 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
    status = v10->_status;
    v10->_status = v26;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)cancel
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = objc_opt_class();
  _os_log_debug_impl(&dword_1A956A000, a2, OS_LOG_TYPE_DEBUG, "%@ - cancel", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  _BPSHandleEventsInner *v5;
  NSObject *v6;
  void (**v7)(void *, id);
  id receiveSubscription;
  id receiveOutput;
  id receiveCompletion;
  id receiveCancel;
  id receiveRequest;
  uint64_t v13;
  BPSSubscriptionStatus *status;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = objc_opt_class();
    _os_log_impl(&dword_1A956A000, v6, OS_LOG_TYPE_INFO, "%@ - completion", (uint8_t *)&v15, 0xCu);
  }

  os_unfair_lock_lock(&v5->_lock);
  v7 = (void (**)(void *, id))_Block_copy(v5->_receiveCompletion);
  if (v7)
  {
    os_unfair_lock_unlock(&v5->_lock);
    v7[2](v7, v4);
    os_unfair_lock_lock(&v5->_lock);
  }
  receiveSubscription = v5->_receiveSubscription;
  v5->_receiveSubscription = 0;

  receiveOutput = v5->_receiveOutput;
  v5->_receiveOutput = 0;

  receiveCompletion = v5->_receiveCompletion;
  v5->_receiveCompletion = 0;

  receiveCancel = v5->_receiveCancel;
  v5->_receiveCancel = 0;

  receiveRequest = v5->_receiveRequest;
  v5->_receiveRequest = 0;

  os_unfair_lock_unlock(&v5->_lock);
  -[BPSSubscriber receiveCompletion:](v5->_downstream, "receiveCompletion:", v4);
  os_unfair_lock_lock(&v5->_lock);
  +[BPSSubscriptionStatus terminal](BPSSubscriptionStatus, "terminal");
  v13 = objc_claimAutoreleasedReturnValue();
  status = v5->_status;
  v5->_status = (BPSSubscriptionStatus *)v13;

  os_unfair_lock_unlock(&v5->_lock);
}

- (int64_t)receiveInput:(id)a3
{
  _BPSHandleEventsInner *v4;
  id v5;
  void (**v6)(void *, id);
  int64_t v7;
  void *v8;
  void *v9;

  v4 = self;
  v5 = a3;
  os_unfair_lock_lock(&v4->_lock);
  v6 = (void (**)(void *, id))_Block_copy(v4->_receiveOutput);
  os_unfair_lock_unlock(&v4->_lock);
  if (v6)
    v6[2](v6, v5);
  v7 = -[BPSSubscriber receiveInput:](v4->_downstream, "receiveInput:", v5);

  v8 = _Block_copy(v4->_receiveRequest);
  v9 = v8;
  if (v7 >= 1 && v8 != 0)
    (*((void (**)(void *, int64_t))v8 + 2))(v8, v7);

  return v7;
}

- (void)receiveSubscription:(id)a3
{
  void (**v4)(void *, id);
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void (**)(void *, id))_Block_copy(self->_receiveSubscription);
  if (v4)
  {
    os_unfair_lock_unlock(&self->_lock);
    v4[2](v4, v5);
    os_unfair_lock_lock(&self->_lock);
  }
  if (-[BPSSubscriptionStatus state](self->_status, "state"))
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v5, "cancel");
  }
  else
  {
    -[BPSSubscriptionStatus setState:](self->_status, "setState:", 1);
    -[BPSSubscriptionStatus setSubscription:](self->_status, "setSubscription:", v5);
    os_unfair_lock_unlock(&self->_lock);
    -[BPSSubscriber receiveSubscription:](self->_downstream, "receiveSubscription:", self);
  }

}

- (void)requestDemand:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(void *, int64_t);
  void *v6;
  uint64_t v7;
  _BPSHandleEventsInner *v8;

  v8 = self;
  p_lock = &v8->_lock;
  os_unfair_lock_lock(&v8->_lock);
  v5 = (void (**)(void *, int64_t))_Block_copy(v8->_receiveRequest);
  if (v5)
  {
    os_unfair_lock_unlock(p_lock);
    v5[2](v5, a3);
    os_unfair_lock_lock(p_lock);
  }
  -[BPSSubscriptionStatus subscription](v8->_status, "subscription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BPSSubscriptionStatus state](v8->_status, "state");
  os_unfair_lock_unlock(p_lock);
  if (v7 == 1)
    objc_msgSend(v6, "requestDemand:", a3);

}

- (id)upstreamSubscriptions
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BPSSubscriptionStatus subscription](self->_status, "subscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_BPSHandleEventsInner upstreamSubscriptions].cold.1((uint64_t)self, v6);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong(&self->_receiveRequest, 0);
  objc_storeStrong(&self->_receiveCancel, 0);
  objc_storeStrong(&self->_receiveCompletion, 0);
  objc_storeStrong(&self->_receiveOutput, 0);
  objc_storeStrong(&self->_receiveSubscription, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (void)upstreamSubscriptions
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = objc_opt_class();
  _os_log_error_impl(&dword_1A956A000, a2, OS_LOG_TYPE_ERROR, "%@ - upstreamSubscriptions are nil", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
