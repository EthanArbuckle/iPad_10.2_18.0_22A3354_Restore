@implementation HMDUserActivityType3FocusListener

- (HMDUserActivityType3FocusListener)initWithIdentifier:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  HMDUserActivityType3FocusListener *v8;
  void *v9;
  HMDUserActivityType3BiomeStreamSubscriber *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HMDUserActivityType3BiomeStreamSubscriber *biomeSubscriber;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDUserActivityType3FocusListener;
  v8 = -[HMDUserActivityType3FocusListener init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("HAS.T3.F.%@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v8->_dataSource, a4);
    v10 = [HMDUserActivityType3BiomeStreamSubscriber alloc];
    BiomeLibrary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UserFocus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ComputedMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDUserActivityType3BiomeStreamSubscriber initWithIdentifier:stream:filterEventBlock:](v10, "initWithIdentifier:stream:filterEventBlock:", v9, v13, &__block_literal_global_108338);
    biomeSubscriber = v8->_biomeSubscriber;
    v8->_biomeSubscriber = (HMDUserActivityType3BiomeStreamSubscriber *)v14;

  }
  return v8;
}

- (void)configureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDUserActivityType3FocusListener biomeSubscriber](self, "biomeSubscriber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDUserActivityType3FocusListener_configureWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "configureWithCompletion:", v7);

}

- (void)unconfigure
{
  id v2;

  -[HMDUserActivityType3FocusListener biomeSubscriber](self, "biomeSubscriber");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unconfigure");

}

- (BOOL)isConfigured
{
  void *v2;
  char v3;

  -[HMDUserActivityType3FocusListener biomeSubscriber](self, "biomeSubscriber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConfigured");

  return v3;
}

- (HMDUserType3Focus)focus
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDUserType3Focus *v10;

  -[HMDUserActivityType3FocusListener dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[HMDUserActivityType3FocusListener isConfigured](self, "isConfigured"))
  {
    -[HMDUserActivityType3FocusListener biomeSubscriber](self, "biomeSubscriber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mostRecentEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "eventBody");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x24BDBCE60]);
      objc_msgSend(v6, "timestamp");
      v9 = (void *)objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
      v10 = -[HMDUserType3Focus initWithEnabled:updatedTime:userActionTriggered:]([HMDUserType3Focus alloc], "initWithEnabled:updatedTime:userActionTriggered:", objc_msgSend(v7, "starting"), v9, objc_msgSend(v7, "updateReason") == 1);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)biomeEventDidUpdate
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserActivityType3FocusListener dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HMDUserActivityType3FocusListener_biomeEventDidUpdate__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (HMDUserActivityType3FocusListenerDelegate)delegate
{
  return (HMDUserActivityType3FocusListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDHomeActivityStateManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (HMDUserActivityType3BiomeStreamSubscriber)biomeSubscriber
{
  return self->_biomeSubscriber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeSubscriber, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __56__HMDUserActivityType3FocusListener_biomeEventDidUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "biomeSubscriber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mostRecentEvent");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusDidTrigger");

  }
}

uint64_t __61__HMDUserActivityType3FocusListener_configureWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "biomeSubscriber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

BOOL __67__HMDUserActivityType3FocusListener_initWithIdentifier_dataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  int v5;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "semanticType");
  return v5 == 3;
}

@end
