@implementation BMDSLSubscribeOn

- (BOOL)completed
{
  os_unfair_recursive_lock_lock_with_options();
  LOBYTE(self) = self->_cancelled;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (id)nextEvent
{
  BPSPublisher *currentPublisher;
  void *v4;

  os_unfair_recursive_lock_lock_with_options();
  currentPublisher = self->_currentPublisher;
  if (currentPublisher)
  {
    -[BPSPublisher nextEvent](currentPublisher, "nextEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v4;
}

void __40__BMDSLSubscribeOn_startWithSubscriber___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_recursive_lock_lock_with_options();
    objc_storeStrong(WeakRetained + 1, a2);
    os_unfair_recursive_lock_unlock();
    objc_msgSend(*(id *)(a1 + 32), "requestNextEvents");
  }

}

- (BMDSLSubscribeOn)initWithUpstream:(id)a3 scheduler:(id)a4
{
  id v7;
  id v8;
  BMDSLSubscribeOn *v9;
  BMDSLSubscribeOn *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLSubscribeOn;
  v9 = -[BMDSLSubscribeOn init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    objc_storeStrong((id *)&v10->_scheduler, a4);
    v10->_cancelled = 0;
    v10->_lock = 0;
  }

  return v10;
}

- (void)subscribe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BPSSubscribeOnInner *v7;

  v4 = a3;
  v7 = -[_BPSSubscribeOnInner initWithDownstream:]([_BPSSubscribeOnInner alloc], "initWithDownstream:", v4);
  -[BMDSLSubscribeOn scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDSLSubscribeOn upstream](self, "upstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribeWithDSLGraph:forSubscriber:", v6, v4);

  objc_msgSend(v4, "receiveSubscription:", v7);
}

- (id)startWithSubscriber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[BMDSLSubscribeOn scheduler](self, "scheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDSLSubscribeOn upstream](self, "upstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__BMDSLSubscribeOn_startWithSubscriber___block_invoke;
  v9[3] = &unk_1E5E36420;
  objc_copyWeak(&v11, &location);
  v7 = v4;
  v10 = v7;
  objc_msgSend(v5, "subscribeWithDSLGraph:publisherBlock:", v6, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return 0;
}

- (void)cancel
{
  void *v3;

  -[BMDSLSubscribeOn scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  os_unfair_recursive_lock_lock_with_options();
  self->_cancelled = 1;
  os_unfair_recursive_lock_unlock();
}

- (void)reset
{
  void *v3;
  BPSPublisher *currentPublisher;

  -[BMDSLSubscribeOn scheduler](self, "scheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  os_unfair_recursive_lock_lock_with_options();
  currentPublisher = self->_currentPublisher;
  self->_currentPublisher = 0;

  self->_cancelled = 0;
  os_unfair_recursive_lock_unlock();
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (BMDSLScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_currentPublisher, 0);
}

@end
