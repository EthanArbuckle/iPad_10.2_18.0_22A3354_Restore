@implementation HMFNetManager

+ (HMFNetManager)sharedManager
{
  if (_MergedGlobals_1_0 != -1)
    dispatch_once(&_MergedGlobals_1_0, &__block_literal_global_25);
  return (HMFNetManager *)(id)qword_1ED0132E0;
}

void __30__HMFNetManager_sharedManager__block_invoke()
{
  HMFNetManager *v0;
  void *v1;

  v0 = objc_alloc_init(HMFNetManager);
  v1 = (void *)qword_1ED0132E0;
  qword_1ED0132E0 = (uint64_t)v0;

}

- (HMFNetManager)initWithWiFiManager:(id)a3
{
  id v5;
  HMFNetManager *v6;
  HMFNetManager *v7;
  const char *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *clientQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMFNetManager;
  v6 = -[HMFNetManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = (const char *)HMFDispatchQueueName(v6, 0);
    v9 = dispatch_queue_create(v8, 0);
    clientQueue = v7->_clientQueue;
    v7->_clientQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v7->_wifiManager, a3);
  }

  return v7;
}

- (HMFNetManager)init
{
  void *v3;
  HMFNetManager *v4;

  +[HMFWiFiManager sharedManager](HMFWiFiManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMFNetManager initWithWiFiManager:](self, "initWithWiFiManager:", v3);

  return v4;
}

- (void)registerWoWAssertionForObject:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[HMFNetManager clientQueue](self, "clientQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__HMFNetManager_registerWoWAssertionForObject___block_invoke;
    v6[3] = &unk_1E3B37CA8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __47__HMFNetManager_registerWoWAssertionForObject___block_invoke(uint64_t a1)
{
  void *v2;
  _HMFNetManagerWoWAssertion *v3;
  _HMFNetManagerWoWAssertion *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1A1AC355C]();
  objc_msgSend(*(id *)(a1 + 32), "wowAssertion");
  v3 = (_HMFNetManagerWoWAssertion *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [_HMFNetManagerWoWAssertion alloc];
    objc_msgSend(*(id *)(a1 + 32), "wifiManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[_HMFNetManagerWoWAssertion initWithWifiManager:](v4, "initWithWifiManager:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setWowAssertion:", v3);
  }
  objc_setAssociatedObject(*(id *)(a1 + 40), "HMF.wowAssertionKey", v3, (void *)1);

  objc_autoreleasePoolPop(v2);
}

- (void)deregisterWoWAssertionForObject:(id)a3
{
  if (a3)
    objc_setAssociatedObject(a3, "HMF.wowAssertionKey", 0, (void *)1);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (_HMFNetManagerWoWAssertion)wowAssertion
{
  return (_HMFNetManagerWoWAssertion *)objc_loadWeakRetained((id *)&self->_wowAssertion);
}

- (void)setWowAssertion:(id)a3
{
  objc_storeWeak((id *)&self->_wowAssertion, a3);
}

- (HMFWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_destroyWeak((id *)&self->_wowAssertion);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end
