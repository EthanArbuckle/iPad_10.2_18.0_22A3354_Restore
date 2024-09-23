@implementation DNDAWDMetricsService

- (DNDAWDMetricsService)initWithClientIdentifier:(id)a3
{
  id v4;
  DNDAWDMetricsService *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  DNDStateService *notificationsStateService;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DNDAWDMetricsService;
  v5 = -[DNDAWDMetricsService init](&v12, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.donotdisturb.kit.AWDMetricService", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BE2D738], "serviceForClientIdentifier:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    notificationsStateService = v5->_notificationsStateService;
    v5->_notificationsStateService = (DNDStateService *)v9;

    v5->_lockState = 0;
  }

  return v5;
}

- (void)resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__DNDAWDMetricsService_resume__block_invoke;
  block[3] = &unk_24CF51578;
  block[4] = self;
  dispatch_async(queue, block);
}

void __30__DNDAWDMetricsService_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addStateUpdateListener:withCompletionHandler:", *(_QWORD *)(a1 + 32), &__block_literal_global_2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "queryCurrentStateWithError:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (void)handleTransitionToUILocked:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__DNDAWDMetricsService_handleTransitionToUILocked___block_invoke;
  v4[3] = &unk_24CF516E0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __51__DNDAWDMetricsService_handleTransitionToUILocked___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = 1;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v1;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_postAWDMetric");
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__DNDAWDMetricsService_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v8[3] = &unk_24CF515C0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __71__DNDAWDMetricsService_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 40), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_postAWDMetric");
}

- (unint64_t)_queue_currentAWDMetricState
{
  uint64_t v3;

  v3 = -[DNDState suppressionState](self->_currentState, "suppressionState");
  if (v3 == 2)
  {
    if (self->_lockState == 1)
      return 2;
    else
      return 1;
  }
  else if (v3 == 1)
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

- (void)_queue_postAWDMetric
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentState)
  {
    if (self->_lockState)
    {
      -[DNDAWDMetricsService _queue_currentAWDMetricState](self, "_queue_currentAWDMetricState");
      AWDPostSimpleMetricWithInteger();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_notificationsStateService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
