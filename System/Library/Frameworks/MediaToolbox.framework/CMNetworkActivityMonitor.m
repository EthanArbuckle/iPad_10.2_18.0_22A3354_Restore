@implementation CMNetworkActivityMonitor

+ (id)sharedActivityMonitor
{
  if (sharedActivityMonitor_onceToken != -1)
    dispatch_once(&sharedActivityMonitor_onceToken, &__block_literal_global_104);
  return (id)sharedActivityMonitor_sharedInstance;
}

CMNetworkActivityMonitor *__49__CMNetworkActivityMonitor_sharedActivityMonitor__block_invoke()
{
  CMNetworkActivityMonitor *result;

  result = objc_alloc_init(CMNetworkActivityMonitor);
  sharedActivityMonitor_sharedInstance = (uint64_t)result;
  return result;
}

- (CMNetworkActivityMonitor)init
{
  CMNetworkActivityMonitor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMNetworkActivityMonitor;
  v2 = -[CMNetworkActivityMonitor init](&v4, sel_init);
  if (v2)
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("CMNetworkActivityMonitor-instanceQueue", 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CMNetworkActivityMonitor setCMObserver:](self, "setCMObserver:", 0);
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)CMNetworkActivityMonitor;
  -[CMNetworkActivityMonitor dealloc](&v3, sel_dealloc);
}

- (void)setCMObserver:(id)a3
{
  CMNetworkActivityObserver *cmObserver;

  cmObserver = self->_cmObserver;
  if (cmObserver != a3)
  {
    -[CMNetworkActivityObserver invalidate](cmObserver, "invalidate");

    self->_cmObserver = (CMNetworkActivityObserver *)a3;
  }
}

- (void)beginMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CMNetworkActivityMonitor_beginMonitoring__block_invoke;
  block[3] = &unk_1E2F88548;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __43__CMNetworkActivityMonitor_beginMonitoring__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setMonitoringActiveCount:", objc_msgSend(*(id *)(a1 + 32), "monitoringActiveCount") + 1);
  result = objc_msgSend(*(id *)(a1 + 32), "monitoringActiveCount");
  if (result == 1)
    return objc_msgSend(*(id *)(a1 + 32), "setCMObserver:", +[CMNetworkActivityObserver registeredObserverForActivityMonitor:](CMNetworkActivityObserver, "registeredObserverForActivityMonitor:", *(_QWORD *)(a1 + 32)));
  return result;
}

- (void)endMonitoring
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CMNetworkActivityMonitor_endMonitoring__block_invoke;
  block[3] = &unk_1E2F88548;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __41__CMNetworkActivityMonitor_endMonitoring__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setMonitoringActiveCount:", objc_msgSend(*(id *)(a1 + 32), "monitoringActiveCount") - 1);
  result = objc_msgSend(*(id *)(a1 + 32), "monitoringActiveCount");
  if (!result)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "cmObserver"), "invalidate");
    return objc_msgSend(*(id *)(a1 + 32), "setCMObserver:", 0);
  }
  return result;
}

- (void)setNetworkIsActive:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CMNetworkActivityMonitor_setNetworkIsActive___block_invoke;
  v4[3] = &unk_1E2F8B030;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

uint64_t __47__CMNetworkActivityMonitor_setNetworkIsActive___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 16))
  {
    *(_BYTE *)(v2 + 16) = v1;
    return SBSSetAllApplicationsShowProgress();
  }
  return result;
}

- (CMNetworkActivityObserver)cmObserver
{
  return self->_cmObserver;
}

- (int64_t)showingNetworkActivityCount
{
  return self->_showingNetworkActivityCount;
}

- (void)setShowingNetworkActivityCount:(int64_t)a3
{
  self->_showingNetworkActivityCount = a3;
}

- (int64_t)monitoringActiveCount
{
  return self->_monitoringActiveCount;
}

- (void)setMonitoringActiveCount:(int64_t)a3
{
  self->_monitoringActiveCount = a3;
}

- (BOOL)networkIsActive
{
  return self->_networkIsActive;
}

@end
