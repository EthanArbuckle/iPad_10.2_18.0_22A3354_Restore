@implementation HAPBTLECentralManager

- (HAPBTLECentralManager)init
{
  HAPBTLECentralManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  CBCentralManager *centralManager;
  NSMutableSet *v7;
  NSMutableSet *delegates;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HAPBTLECentralManager;
  v2 = -[HAPBTLECentralManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.HAPBTLECentralManager", v3);
    workQueue = v2->workQueue;
    v2->workQueue = (OS_dispatch_queue *)v4;

    centralManager = v2->centralManager;
    v2->centralManager = 0;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    delegates = v2->delegates;
    v2->delegates = v7;

    v2->state = 0;
  }
  return v2;
}

- (id)_getCentralManager
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  -[HAPBTLECentralManager centralManager](self, "centralManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C97728]);
    -[HAPBTLECentralManager workQueue](self, "workQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithDelegate:queue:", self, v5);
    -[HAPBTLECentralManager setCentralManager:](self, "setCentralManager:", v6);

    -[HAPBTLECentralManager centralManager](self, "centralManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPBTLECentralManager setState:](self, "setState:", objc_msgSend(v7, "state"));

  }
  return -[HAPBTLECentralManager centralManager](self, "centralManager");
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "state");
  -[HAPBTLECentralManager setState:](self, "setState:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HAPBTLECentralManager delegates](self, "delegates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "centralManagerDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didUpdateBTLEState:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)registerCentralManagerDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HAPBTLECentralManager *v9;

  v4 = a3;
  -[HAPBTLECentralManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HAPBTLECentralManager_registerCentralManagerDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)workQueue
{
  return self->workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->workQueue, a3);
}

- (CBCentralManager)centralManager
{
  return self->centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->centralManager, a3);
}

- (NSMutableSet)delegates
{
  return self->delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->delegates, a3);
}

- (int64_t)state
{
  return self->state;
}

- (void)setState:(int64_t)a3
{
  self->state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->delegates, 0);
  objc_storeStrong((id *)&self->centralManager, 0);
  objc_storeStrong((id *)&self->workQueue, 0);
}

void __56__HAPBTLECentralManager_registerCentralManagerDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  HAPComponent *v6;

  v6 = -[HAPComponent initWithDelegate:]([HAPComponent alloc], "initWithDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "delegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 40), "_getCentralManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");
  if (objc_msgSend(*(id *)(a1 + 40), "state"))
  {
    -[HAPComponent centralManagerDelegate](v6, "centralManagerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didUpdateBTLEState:", v4);

  }
}

+ (id)getInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HAPBTLECentralManager_getInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getInstance_onceToken != -1)
    dispatch_once(&getInstance_onceToken, block);
  return (id)getInstance_hapCentralManager;
}

void __36__HAPBTLECentralManager_getInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)getInstance_hapCentralManager;
  getInstance_hapCentralManager = (uint64_t)v1;

}

@end
