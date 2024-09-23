@implementation FCPauseRingsSampleObserver

- (FCPauseRingsSampleObserver)initWithProfile:(id)a3
{
  id v4;
  FCPauseRingsSampleObserver *v5;
  FCPauseRingsSampleObserver *v6;
  uint64_t v7;
  OS_dispatch_queue *serviceQueue;
  id WeakRetained;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCPauseRingsSampleObserver;
  v5 = -[FCPauseRingsSampleObserver init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HDCreateSerialUtilityDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    serviceQueue = v6->_serviceQueue;
    v6->_serviceQueue = (OS_dispatch_queue *)v7;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, v6->_serviceQueue);

  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "pauseRingsScheduleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forDataType:", self, v5);

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  dispatch_async((dispatch_queue_t)self->_serviceQueue, &__block_literal_global);
}

uint64_t __50__FCPauseRingsSampleObserver_samplesAdded_anchor___block_invoke()
{
  return notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0D220C0], "UTF8String"));
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  dispatch_async((dispatch_queue_t)self->_serviceQueue, &__block_literal_global_188);
}

uint64_t __63__FCPauseRingsSampleObserver_samplesOfTypesWereRemoved_anchor___block_invoke()
{
  return notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0D220C0], "UTF8String"));
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "pauseRingsScheduleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forDataType:", self, v5);

  v6.receiver = self;
  v6.super_class = (Class)FCPauseRingsSampleObserver;
  -[FCPauseRingsSampleObserver dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end
