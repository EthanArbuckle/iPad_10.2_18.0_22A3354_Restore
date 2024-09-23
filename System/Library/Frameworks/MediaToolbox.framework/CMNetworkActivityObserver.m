@implementation CMNetworkActivityObserver

- (id)initForActivityMonitor:(id)a3
{
  CMNetworkActivityObserver *v4;
  CMNetworkActivityObserver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMNetworkActivityObserver;
  v4 = -[CMNetworkActivityObserver init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_activityMonitor, a3);
    v5->_valid = 1;
  }
  return v5;
}

- (CMNetworkActivityMonitor)activityMonitor
{
  return (CMNetworkActivityMonitor *)objc_loadWeak((id *)&self->_activityMonitor);
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_activityMonitor, 0);
  -[CMNetworkActivityObserver invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CMNetworkActivityObserver;
  -[CMNetworkActivityObserver dealloc](&v3, sel_dealloc);
}

- (void)unregisterObservations
{
  int cmActivityToken;
  int cmActivityPollingToken;

  self->_registered = 0;
  cmActivityToken = self->_cmActivityToken;
  if (cmActivityToken)
  {
    notify_cancel(cmActivityToken);
    self->_cmActivityToken = 0;
  }
  cmActivityPollingToken = self->_cmActivityPollingToken;
  if (cmActivityPollingToken)
  {
    notify_cancel(cmActivityPollingToken);
    self->_cmActivityPollingToken = 0;
  }
}

- (void)_pollWithInterval:(double)a3 networkActivityDidCompleteBlock:(id)a4
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CMNetworkActivityObserver__pollWithInterval_networkActivityDidCompleteBlock___block_invoke;
  block[3] = &unk_1E2F8BF68;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __79__CMNetworkActivityObserver__pollWithInterval_networkActivityDidCompleteBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  dispatch_time_t v5;
  _QWORD block[4];
  __int128 v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v2 + 16);
  v3 = (int *)(v2 + 16);
  if (v4 || !notify_register_check("com.apple.coremedia.network_activity", v3))
  {
    v5 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__CMNetworkActivityObserver__pollWithInterval_networkActivityDidCompleteBlock___block_invoke_2;
    block[3] = &unk_1E2F8BF68;
    v8 = *(_QWORD *)(a1 + 48);
    v7 = *(_OWORD *)(a1 + 32);
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unregisterObservations");
  }
}

uint64_t __79__CMNetworkActivityObserver__pollWithInterval_networkActivityDidCompleteBlock___block_invoke_2(uint64_t a1)
{
  int *v2;
  int check;

  if (!objc_msgSend(*(id *)(a1 + 32), "activityMonitor"))
    return objc_msgSend(*(id *)(a1 + 32), "unregisterObservations");
  check = 0;
  notify_check(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16), &check);
  v2 = *(int **)(a1 + 32);
  if (check)
    return objc_msgSend(v2, "_pollWithInterval:networkActivityDidCompleteBlock:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  notify_cancel(v2[4]);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)registerObservations
{
  _QWORD handler[5];

  if (!self->_registered && self->_valid)
  {
    self->_registered = 1;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __49__CMNetworkActivityObserver_registerObservations__block_invoke;
    handler[3] = &unk_1E2F7CF80;
    handler[4] = self;
    notify_register_dispatch("com.apple.coremedia.network_activity", &self->_cmActivityToken, MEMORY[0x1E0C80D38], handler);
  }
}

uint64_t __49__CMNetworkActivityObserver_registerObservations__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "activityMonitor");
  if (!v2)
    return objc_msgSend(*(id *)(a1 + 32), "unregisterObservations");
  v3 = v2;
  objc_msgSend(v2, "setNetworkIsActive:", 1);
  objc_msgSend(*(id *)(a1 + 32), "unregisterObservations");
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__CMNetworkActivityObserver_registerObservations__block_invoke_2;
  v6[3] = &unk_1E2F8AEF0;
  v6[4] = v3;
  v6[5] = v4;
  return objc_msgSend(v4, "_pollWithInterval:networkActivityDidCompleteBlock:", v6, 0.5);
}

uint64_t __49__CMNetworkActivityObserver_registerObservations__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNetworkIsActive:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "registerObservations");
}

- (void)invalidate
{
  self->_valid = 0;
  -[CMNetworkActivityObserver unregisterObservations](self, "unregisterObservations");
}

+ (id)registeredObserverForActivityMonitor:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForActivityMonitor:", a3);
  objc_msgSend(v3, "registerObservations");
  return v3;
}

@end
