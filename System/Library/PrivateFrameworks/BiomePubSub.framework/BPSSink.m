@implementation BPSSink

- (BPSSink)initWithReceiveBookmarkCompletion:(id)a3 receiveInput:(id)a4
{
  id v6;
  id v7;
  BPSSink *v8;
  BPSSink *v9;
  uint64_t v10;
  id receivedCompletion;
  uint64_t v12;
  id receivedValue;
  BPSSubscriptionStatus *v14;
  BPSSubscriptionStatus *status;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BPSSink;
  v8 = -[BPSSink init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_demand = 0x7FFFFFFFFFFFFFFFLL;
    v10 = objc_msgSend(v6, "copy");
    receivedCompletion = v9->_receivedCompletion;
    v9->_receivedCompletion = (id)v10;

    v12 = objc_msgSend(v7, "copy");
    receivedValue = v9->_receivedValue;
    v9->_receivedValue = (id)v12;

    *(_QWORD *)&v9->_lock._os_unfair_lock_opaque = 0;
    v9->_rlock.ourl_count = 0;
    v14 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
    status = v9->_status;
    v9->_status = v14;

  }
  return v9;
}

- (void)completeWithError:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (!-[BPSSink finished](self, "finished"))
  {
    -[BPSSink publisher](self, "publisher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EEAF4F80);

    if (v5)
    {
      -[BPSSink publisher](self, "publisher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bookmarkNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    -[BPSSink publisher](self, "publisher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reset");

    -[BPSSink receivedCompletion](self, "receivedCompletion");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v11)
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:");
    else
      +[BPSCompletion success](BPSCompletion, "success");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v9)[2](v9, v10, v7);

    -[BPSSink setFinished:](self, "setFinished:", 1);
    -[BPSSink setPublisher:](self, "setPublisher:", 0);

  }
  os_unfair_recursive_lock_unlock();

}

- (void)requestNextEvents
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;

  os_unfair_recursive_lock_lock_with_options();
  if (!-[BPSSink finished](self, "finished"))
  {
    -[BPSSink publisher](self, "publisher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nextEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      do
      {
        v5 = (void *)MEMORY[0x1AF415D18]();
        -[BPSSink receivedValue](self, "receivedValue");
        v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v6)[2](v6, v4);

        -[BPSSink publisher](self, "publisher");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "nextEvent");
        v8 = objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v5);
        v4 = (void *)v8;
      }
      while (v8);
    }
    -[BPSSink publisher](self, "publisher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "completed");

    if (v10)
      -[BPSSink completeWithError:](self, "completeWithError:", 0);
  }
  os_unfair_recursive_lock_unlock();
}

- (BPSPublisher)publisher
{
  return self->_publisher;
}

- (BOOL)finished
{
  return self->_finished;
}

- (id)receivedValue
{
  return self->_receivedValue;
}

- (id)receivedCompletion
{
  return self->_receivedCompletion;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void)subscribeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[BPSSink setPublisher:](self, "setPublisher:", v4);
  -[BPSSink publisher](self, "publisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startWithSubscriber:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BPSSink completeWithError:](self, "completeWithError:", v6);
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v7 = (void *)getBMDSLSubscribeOnClass_softClass;
    v13 = getBMDSLSubscribeOnClass_softClass;
    if (!getBMDSLSubscribeOnClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getBMDSLSubscribeOnClass_block_invoke;
      v9[3] = &unk_1E554D078;
      v9[4] = &v10;
      __getBMDSLSubscribeOnClass_block_invoke((uint64_t)v9);
      v7 = (void *)v11[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v10, 8);
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[BPSSink requestNextEvents](self, "requestNextEvents");
  }
  os_unfair_recursive_lock_unlock();

}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong(&self->_receivedValue, 0);
  objc_storeStrong(&self->_receivedCompletion, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (BPSSink)initWithReceiveBookmarkedCompletion:(id)a3 receiveInput:(id)a4
{
  id v6;
  id v7;
  id v8;
  BPSSink *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__BPSSink_BMBookmark__initWithReceiveBookmarkedCompletion_receiveInput___block_invoke;
  v11[3] = &unk_1E554CCE8;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v12 = v8;
  v9 = -[BPSSink initWithReceiveCompletion:receiveInput:](self, "initWithReceiveCompletion:receiveInput:", v11, v7);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __72__BPSSink_BMBookmark__initWithReceiveBookmarkedCompletion_receiveInput___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (id)objc_msgSend(WeakRetained, "newBookmark");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)newBookmark
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  -[BPSSink status](self, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EEAF3EE8);

  if (v5)
  {
    -[BPSSink status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscription");
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)-[NSObject newBookmark](v7, "newBookmark");
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[BPSSink(BMBookmark) newBookmark].cold.1((uint64_t)v8, v9);

  }
  else
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BPSDrivableSink(BMBookmark) newBookmark].cold.2(self, v7);
    v8 = 0;
  }

  return v8;
}

- (BPSSink)initWithReceiveCompletion:(id)a3 receiveInput:(id)a4
{
  id v6;
  id v7;
  BPSSink *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__BPSSink_initWithReceiveCompletion_receiveInput___block_invoke;
  v10[3] = &unk_1E554CE60;
  v11 = v6;
  v7 = v6;
  v8 = -[BPSSink initWithReceiveBookmarkCompletion:receiveInput:](self, "initWithReceiveBookmarkCompletion:receiveInput:", v10, a4);

  return v8;
}

uint64_t __50__BPSSink_initWithReceiveCompletion_receiveInput___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)receiveSubscription:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  -[BPSSink status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (v6)
  {
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v9, "cancel");
  }
  else
  {
    -[BPSSink status](self, "status");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setState:", 1);

    -[BPSSink status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSubscription:", v9);

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v9, "requestDemand:", -[BPSSink demand](self, "demand"));
  }

}

- (void)receiveCompletion:(id)a3
{
  BPSSink *v4;
  id v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  v4 = self;
  v5 = a3;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BPSSink receiveCompletion:].cold.1();

  -[BPSSink receivedCompletion](v4, "receivedCompletion");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))v7)[2](v7, v5, 0);

  os_unfair_lock_lock(&v4->_lock);
  +[BPSSubscriptionStatus terminal](BPSSubscriptionStatus, "terminal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSSink setStatus:](v4, "setStatus:", v8);

  os_unfair_lock_unlock(&v4->_lock);
}

- (int64_t)receiveInput:(id)a3
{
  BPSSink *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);

  v4 = self;
  v5 = a3;
  -[BPSSink receivedValue](v4, "receivedValue");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, v5);

  return 0;
}

- (void)cancel
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_1A956A000, v0, v1, "%@ - cancel", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_cancel
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[BPSSink publisher](self, "publisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSSink _cancelPublisher:](self, "_cancelPublisher:", v3);

  -[BPSSink completeWithError:](self, "completeWithError:", 0);
  os_unfair_recursive_lock_unlock();
}

- (void)_cancelPublisher:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "performSelector:", sel_cancel);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v4, "upstreamPublishers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[BPSSink _cancelPublisher:](self, "_cancelPublisher:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void)setReceivedCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setReceivedValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (void)receiveCompletion:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_1A956A000, v0, v1, "%@ - completion", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
