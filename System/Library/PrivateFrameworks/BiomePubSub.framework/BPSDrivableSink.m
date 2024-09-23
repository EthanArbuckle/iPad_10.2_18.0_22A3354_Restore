@implementation BPSDrivableSink

- (BPSDrivableSink)initWithReceiveBookmarkCompletion:(id)a3 shouldContinue:(id)a4
{
  id v6;
  id v7;
  BPSDrivableSink *v8;
  uint64_t v9;
  id receivedCompletion;
  uint64_t v11;
  id shouldContinue;
  BPSSubscriptionStatus *v13;
  BPSSubscriptionStatus *status;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BPSDrivableSink;
  v8 = -[BPSDrivableSink init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    receivedCompletion = v8->_receivedCompletion;
    v8->_receivedCompletion = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    shouldContinue = v8->_shouldContinue;
    v8->_shouldContinue = (id)v11;

    *(_QWORD *)&v8->_lock._os_unfair_lock_opaque = 0;
    v8->_rlock.ourl_count = 0;
    v13 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
    status = v8->_status;
    v8->_status = v13;

  }
  return v8;
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
  -[BPSDrivableSink setPublisher:](self, "setPublisher:", v4);
  -[BPSDrivableSink publisher](self, "publisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startWithSubscriber:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BPSDrivableSink completeWithError:](self, "completeWithError:", v6);
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v7 = (void *)getBMDSLSubscribeOnClass_softClass_0;
    v13 = getBMDSLSubscribeOnClass_softClass_0;
    if (!getBMDSLSubscribeOnClass_softClass_0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getBMDSLSubscribeOnClass_block_invoke_0;
      v9[3] = &unk_1E554D078;
      v9[4] = &v10;
      __getBMDSLSubscribeOnClass_block_invoke_0((uint64_t)v9);
      v7 = (void *)v11[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v10, 8);
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[BPSDrivableSink requestNextEvents](self, "requestNextEvents");
  }
  os_unfair_recursive_lock_unlock();

}

- (void)requestNextEvents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;

  os_unfair_recursive_lock_lock_with_options();
  if (!-[BPSDrivableSink finished](self, "finished"))
  {
    -[BPSDrivableSink publisher](self, "publisher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nextEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      while (1)
      {
        v5 = (void *)MEMORY[0x1AF415D18]();
        -[BPSDrivableSink shouldContinue](self, "shouldContinue");
        v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v7 = ((uint64_t (**)(_QWORD, void *))v6)[2](v6, v4);

        if (!v7)
          break;
        -[BPSDrivableSink publisher](self, "publisher");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "nextEvent");
        v9 = objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v5);
        v4 = (void *)v9;
        if (!v9)
          goto LABEL_5;
      }
      objc_autoreleasePoolPop(v5);
      -[BPSDrivableSink completeWithError:](self, "completeWithError:", 0);

    }
    else
    {
LABEL_5:
      -[BPSDrivableSink publisher](self, "publisher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "completed");

      if (v11)
        -[BPSDrivableSink completeWithError:](self, "completeWithError:", 0);
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (BOOL)finished
{
  return self->_finished;
}

- (id)shouldContinue
{
  return self->_shouldContinue;
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
  if (!-[BPSDrivableSink finished](self, "finished"))
  {
    -[BPSDrivableSink publisher](self, "publisher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EEAF4F80);

    if (v5)
    {
      -[BPSDrivableSink publisher](self, "publisher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bookmarkNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    -[BPSDrivableSink publisher](self, "publisher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reset");

    -[BPSDrivableSink receivedCompletion](self, "receivedCompletion");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v11)
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:");
    else
      +[BPSCompletion success](BPSCompletion, "success");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v9)[2](v9, v10, v7);

    -[BPSDrivableSink setFinished:](self, "setFinished:", 1);
    -[BPSDrivableSink setPublisher:](self, "setPublisher:", 0);

  }
  os_unfair_recursive_lock_unlock();

}

- (BPSPublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (id)receivedCompletion
{
  return self->_receivedCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong(&self->_shouldContinue, 0);
  objc_storeStrong(&self->_receivedCompletion, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

- (BPSDrivableSink)initWithReceiveBookmarkedCompletion:(id)a3 shouldContinue:(id)a4
{
  id v6;
  id v7;
  id v8;
  BPSDrivableSink *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__BPSDrivableSink_BMBookmark__initWithReceiveBookmarkedCompletion_shouldContinue___block_invoke;
  v11[3] = &unk_1E554CCE8;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v12 = v8;
  v9 = -[BPSDrivableSink initWithReceiveCompletion:shouldContinue:](self, "initWithReceiveCompletion:shouldContinue:", v11, v7);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __82__BPSDrivableSink_BMBookmark__initWithReceiveBookmarkedCompletion_shouldContinue___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(WeakRetained, "newBookmark");

  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __82__BPSDrivableSink_BMBookmark__initWithReceiveBookmarkedCompletion_shouldContinue___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  -[BPSDrivableSink status](self, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EEAF3EE8);

  if (v5)
  {
    -[BPSDrivableSink status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscription");
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)-[NSObject newBookmark](v7, "newBookmark");
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __82__BPSDrivableSink_BMBookmark__initWithReceiveBookmarkedCompletion_shouldContinue___block_invoke_cold_1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

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

- (BPSDrivableSink)initWithReceiveCompletion:(id)a3 shouldContinue:(id)a4
{
  id v6;
  id v7;
  BPSDrivableSink *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__BPSDrivableSink_initWithReceiveCompletion_shouldContinue___block_invoke;
  v10[3] = &unk_1E554CE60;
  v11 = v6;
  v7 = v6;
  v8 = -[BPSDrivableSink initWithReceiveBookmarkCompletion:shouldContinue:](self, "initWithReceiveBookmarkCompletion:shouldContinue:", v10, a4);

  return v8;
}

uint64_t __60__BPSDrivableSink_initWithReceiveCompletion_shouldContinue___block_invoke(uint64_t a1)
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
  -[BPSDrivableSink status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (v6)
  {
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v9, "cancel");
  }
  else
  {
    -[BPSDrivableSink status](self, "status");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setState:", 1);

    -[BPSDrivableSink status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSubscription:", v9);

    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v9, "requestDemand:", 1);
  }

}

- (void)receiveCompletion:(id)a3
{
  id v4;
  BPSDrivableSink *v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  v4 = a3;
  v5 = self;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BPSSink receiveCompletion:].cold.1();

  os_unfair_lock_lock(&v5->_lock);
  if (!-[BPSDrivableSink finished](v5, "finished"))
  {
    os_unfair_lock_unlock(&v5->_lock);
    -[BPSDrivableSink receivedCompletion](v5, "receivedCompletion");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v7)[2](v7, v4, 0);

    os_unfair_lock_lock(&v5->_lock);
    -[BPSDrivableSink setFinished:](v5, "setFinished:", 1);
    +[BPSSubscriptionStatus terminal](BPSSubscriptionStatus, "terminal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSDrivableSink setStatus:](v5, "setStatus:", v8);

  }
  os_unfair_lock_unlock(&v5->_lock);

}

- (int64_t)receiveInput:(id)a3
{
  BPSDrivableSink *v4;
  id v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;
  int64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;

  v4 = self;
  v5 = a3;
  -[BPSDrivableSink shouldContinue](v4, "shouldContinue");
  v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v5);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[BPSDrivableSink receivedCompletion](v4, "receivedCompletion");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    +[BPSCompletion success](BPSCompletion, "success");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v10, 0);

    -[BPSDrivableSink cancel](v4, "cancel");
    os_unfair_lock_lock(&v4->_lock);
    -[BPSDrivableSink setFinished:](v4, "setFinished:", 1);
    os_unfair_lock_unlock(&v4->_lock);
    v8 = 0;
  }

  return v8;
}

- (void)cancel
{
  void *v3;
  int v4;
  BPSDrivableSink *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[BPSDrivableSink publisher](self, "publisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BPSPipelineSupportsPullBasedPublishers(v3);

  if (v4)
  {
    -[BPSDrivableSink _cancel](self, "_cancel");
  }
  else
  {
    v5 = self;
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[BPSSink cancel].cold.1();

    os_unfair_lock_lock(&v5->_lock);
    -[BPSDrivableSink status](v5, "status");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 == 1)
    {
      -[BPSDrivableSink status](v5, "status");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subscription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[BPSSubscriptionStatus terminal](BPSSubscriptionStatus, "terminal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSDrivableSink setStatus:](v5, "setStatus:", v11);

      os_unfair_lock_unlock(&v5->_lock);
      objc_msgSend(v10, "cancel");

    }
    else
    {
      os_unfair_lock_unlock(&v5->_lock);
    }

  }
}

- (void)_cancel
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[BPSDrivableSink publisher](self, "publisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSDrivableSink _cancelPublisher:](self, "_cancelPublisher:", v3);

  -[BPSDrivableSink completeWithError:](self, "completeWithError:", 0);
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
        -[BPSDrivableSink _cancelPublisher:](self, "_cancelPublisher:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
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

- (void)setShouldContinue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

void __82__BPSDrivableSink_BMBookmark__initWithReceiveBookmarkedCompletion_shouldContinue___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A956A000, a2, a3, "Creating bookmark:\n%@", a5, a6, a7, a8, 2u);
}

@end
