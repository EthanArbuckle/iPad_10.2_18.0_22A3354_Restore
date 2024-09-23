@implementation HMDUserActivityType3BiomeStreamSubscriber

- (HMDUserActivityType3BiomeStreamSubscriber)initWithIdentifier:(id)a3 stream:(id)a4 filterEventBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDUserActivityType3BiomeStreamSubscriber *v12;
  HMDUserActivityType3BiomeStreamSubscriber *v13;
  void *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *biomeQueue;
  void *v20;
  id filterEventBlock;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMDUserActivityType3BiomeStreamSubscriber;
  v12 = -[HMDUserActivityType3BiomeStreamSubscriber init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_stream, a4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BiomeStreamSubscriberQueue-%@"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMDispatchQueueNameString();
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v16, v17);
    biomeQueue = v13->_biomeQueue;
    v13->_biomeQueue = (OS_dispatch_queue *)v18;

    v20 = _Block_copy(v11);
    filterEventBlock = v13->_filterEventBlock;
    v13->_filterEventBlock = v20;

  }
  return v13;
}

- (void)configureWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__HMDUserActivityType3BiomeStreamSubscriber_configureWithCompletion___block_invoke;
  v6[3] = &unk_24E784E40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMDUserActivityType3BiomeStreamSubscriber fetchMostRecentEventWithCompletion:](self, "fetchMostRecentEventWithCompletion:", v6);

}

- (void)registerForBiomeStreamWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location[2];

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE0CB48]);
  -[HMDUserActivityType3BiomeStreamSubscriber biomeQueue](self, "biomeQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:targetQueue:", v4, v6);
  -[HMDUserActivityType3BiomeStreamSubscriber setScheduler:](self, "setScheduler:", v7);

  objc_initWeak(location, self);
  -[HMDUserActivityType3BiomeStreamSubscriber stream](self, "stream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DSLPublisher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityType3BiomeStreamSubscriber scheduler](self, "scheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscribeOn:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke;
  v19[3] = &unk_24E784E68;
  objc_copyWeak(&v20, location);
  objc_msgSend(v11, "filterWithIsIncluded:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke_2;
  v17[3] = &unk_24E784E90;
  objc_copyWeak(&v18, location);
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke_3;
  v15[3] = &unk_24E784EB8;
  objc_copyWeak(&v16, location);
  objc_msgSend(v13, "sinkWithCompletion:receiveInput:", v17, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityType3BiomeStreamSubscriber setSink:](self, "setSink:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(location);

}

- (id)mostRecentEvent
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;

  if (-[HMDUserActivityType3BiomeStreamSubscriber isConfigured](self, "isConfigured"))
  {
    -[HMDUserActivityType3BiomeStreamSubscriber cachedMostRecentEvent](self, "cachedMostRecentEvent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HMDUserActivityType3BiomeStreamSubscriber isEvent:within24HoursInThePastOfDate:](self, "isEvent:within24HoursInThePastOfDate:", v3, v4);

    if (v5)
      v6 = v3;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)fetchMostRecentEventWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityType3BiomeStreamSubscriber biomeQueue](self, "biomeQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__HMDUserActivityType3BiomeStreamSubscriber_fetchMostRecentEventWithCompletion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

- (id)_fetchMostRecentEventFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;
  id location;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[3];
  char v29;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, -1, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, v6, 0, 0, 1);
  -[HMDUserActivityType3BiomeStreamSubscriber stream](self, "stream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "publisherWithOptions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__114107;
  v26 = __Block_byref_object_dispose__114108;
  v27 = 0;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke;
  v19[3] = &unk_24E784EE0;
  objc_copyWeak(&v20, &location);
  v19[4] = v28;
  objc_msgSend(v9, "filterWithIsIncluded:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke_2;
  v17[3] = &unk_24E784E90;
  objc_copyWeak(&v18, &location);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke_3;
  v15[3] = &unk_24E784F08;
  objc_copyWeak(&v16, &location);
  v15[4] = &v22;
  v12 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", v17, v15);

  v13 = (id)v23[5];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(v28, 8);
  return v13;
}

- (BOOL)isEvent:(id)a3 within24HoursInThePastOfDate:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;

  v5 = (objc_class *)MEMORY[0x24BDBCE60];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(v7, "timestamp");
  v10 = v9;

  v11 = (void *)objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:", v10);
  objc_msgSend(v6, "timeIntervalSinceDate:", v11);
  v13 = v12;

  v14 = v13 <= 86400.0 && v13 >= 0.0;
  return v14;
}

- (BOOL)isConfigured
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HMDUserActivityType3BiomeStreamSubscriber sink](self, "sink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDUserActivityType3BiomeStreamSubscriber scheduler](self, "scheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)unconfigure
{
  void *v3;

  -[HMDUserActivityType3BiomeStreamSubscriber sink](self, "sink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[HMDUserActivityType3BiomeStreamSubscriber setSink:](self, "setSink:", 0);
}

- (HMDUserActivityType3BiomeStreamSubscriberDelegate)delegate
{
  return (HMDUserActivityType3BiomeStreamSubscriberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void)setSink:(id)a3
{
  objc_storeStrong((id *)&self->_sink, a3);
}

- (OS_dispatch_queue)biomeQueue
{
  return self->_biomeQueue;
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (BMStream)stream
{
  return self->_stream;
}

- (BMStoreEvent)cachedMostRecentEvent
{
  return self->_cachedMostRecentEvent;
}

- (void)setCachedMostRecentEvent:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMostRecentEvent, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)filterEventBlock
{
  return self->_filterEventBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterEventBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cachedMostRecentEvent, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  int v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "filterEventBlock");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(WeakRetained, "filterEventBlock"),
        v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        v8 = ((uint64_t (**)(_QWORD, id))v7)[2](v7, v3),
        v7,
        v6,
        !v8)
    || (v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_BYTE *)(v9 + 24)))
  {
    v10 = 0;
  }
  else
  {
    v10 = 1;
    *(_BYTE *)(v9 + 24) = 1;
  }

  return v10;
}

void __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

}

void __75__HMDUserActivityType3BiomeStreamSubscriber__fetchMostRecentEventFromDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __80__HMDUserActivityType3BiomeStreamSubscriber_fetchMostRecentEventWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_fetchMostRecentEventFromDate:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "filterEventBlock");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v3);
  else
    v7 = 1;

  return v7;
}

void __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke_2(uint64_t a1)
{

}

void __82__HMDUserActivityType3BiomeStreamSubscriber_registerForBiomeStreamWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(WeakRetained, "isEvent:within24HoursInThePastOfDate:", v7, v4);

  if (v5)
  {
    objc_msgSend(WeakRetained, "setCachedMostRecentEvent:", v7);
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "biomeEventDidUpdate");

  }
}

uint64_t __69__HMDUserActivityType3BiomeStreamSubscriber_configureWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setCachedMostRecentEvent:", a2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForBiomeStreamWithIdentifier:", v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
