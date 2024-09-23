@implementation HMDUserActivityType3ScheduleListener

- (HMDUserActivityType3ScheduleListener)initWithIdentifier:(id)a3 dataSource:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDUserActivityType3BiomeStreamSubscriber *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDUserActivityType3BiomeStreamSubscriber *v14;
  HMDUserActivityType3ScheduleFactory *v15;
  HMDUserActivityType3ScheduleListener *v16;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("HAS.T3.S.%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [HMDUserActivityType3BiomeStreamSubscriber alloc];
  BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Sleep");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ScheduleState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDUserActivityType3BiomeStreamSubscriber initWithIdentifier:stream:filterEventBlock:](v10, "initWithIdentifier:stream:filterEventBlock:", v9, v13, 0);

  v15 = objc_alloc_init(HMDUserActivityType3ScheduleFactory);
  v16 = -[HMDUserActivityType3ScheduleListener initWithIdentifier:dataSource:biomeStreamSubscriber:factory:](self, "initWithIdentifier:dataSource:biomeStreamSubscriber:factory:", v8, v7, v14, v15);

  return v16;
}

- (HMDUserActivityType3ScheduleListener)initWithIdentifier:(id)a3 dataSource:(id)a4 biomeStreamSubscriber:(id)a5 factory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDUserActivityType3ScheduleListener *v14;
  HMDUserActivityType3ScheduleListener *v15;
  id v16;
  void *v17;
  uint64_t v18;
  HKSPSleepStore *store;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDUserActivityType3ScheduleListener;
  v14 = -[HMDUserActivityType3ScheduleListener init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_dataSource, v11);
    objc_storeStrong((id *)&v15->_biomeSubscriber, a5);
    objc_storeStrong((id *)&v15->_factory, a6);
    v16 = objc_alloc(MEMORY[0x24BEA9950]);
    HKSPGenerateSleepStoreIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithIdentifier:", v17);
    store = v15->_store;
    v15->_store = (HKSPSleepStore *)v18;

  }
  return v15;
}

- (void)configureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserActivityType3ScheduleListener biomeSubscriber](self, "biomeSubscriber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDUserActivityType3ScheduleListener_configureWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "configureWithCompletion:", v7);

}

- (void)unconfigure
{
  void *v3;
  id v4;

  -[HMDUserActivityType3ScheduleListener biomeSubscriber](self, "biomeSubscriber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unconfigure");

  -[HMDUserActivityType3ScheduleListener store](self, "store");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (BOOL)isConfigured
{
  void *v3;
  void *v4;
  char v5;

  -[HMDUserActivityType3ScheduleListener store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDUserActivityType3ScheduleListener biomeSubscriber](self, "biomeSubscriber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isConfigured");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HMDUserActivityType3Schedule)schedule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[HMDUserActivityType3ScheduleListener isConfigured](self, "isConfigured"))
  {
    -[HMDUserActivityType3ScheduleListener biomeSubscriber](self, "biomeSubscriber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mostRecentEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDUserActivityType3ScheduleListener factory](self, "factory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleFromBiomeEvent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (HMDUserActivityType3Schedule *)v6;
}

- (void)biomeEventDidUpdate
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserActivityType3ScheduleListener dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMDUserActivityType3ScheduleListener_biomeEventDidUpdate__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (HMDUserActivityType3ScheduleListenerDelegate)delegate
{
  return (HMDUserActivityType3ScheduleListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (HKSPSleepStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (HMDHomeActivityStateManagerDataSource)dataSource
{
  return (HMDHomeActivityStateManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_queue);
}

- (HMDUserActivityType3BiomeStreamSubscriber)biomeSubscriber
{
  return self->_biomeSubscriber;
}

- (HMDUserActivityType3ScheduleFactory)factory
{
  return self->_factory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_biomeSubscriber, 0);
  objc_destroyWeak((id *)&self->_queue);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __59__HMDUserActivityType3ScheduleListener_biomeEventDidUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "biomeSubscriber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mostRecentEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "factory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleFromBiomeEvent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "stateChangedReason");
    if (v6 == 2)
    {
      objc_msgSend(v7, "userDidUpdateSchedule");
    }
    else if (v6 == 1)
    {
      objc_msgSend(v7, "scheduleStateDidAutomaticallyUpdate");
    }
  }

}

uint64_t __64__HMDUserActivityType3ScheduleListener_configureWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "biomeSubscriber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
