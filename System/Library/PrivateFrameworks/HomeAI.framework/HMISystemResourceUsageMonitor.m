@implementation HMISystemResourceUsageMonitor

- (HMISystemResourceUsageMonitor)init
{
  HMISystemResourceUsageMonitor *v2;
  void *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  NSObject *v10;
  HMISystemResourceUsageMonitorImpl *v11;
  HMISystemResourceUsageMonitorImpl *systemResourceUsageMonitorImpl;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HMISystemResourceUsageMonitor;
  v2 = -[HMISystemResourceUsageMonitor init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "productClass");

    HMIDispatchQueueNameString(v2, 0);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v6, v7);

    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v8;
    v10 = v8;

    v11 = -[HMISystemResourceUsageMonitorImpl initWithProductClass:workQueue:]([HMISystemResourceUsageMonitorImpl alloc], "initWithProductClass:workQueue:", v4, v10);
    systemResourceUsageMonitorImpl = v2->_systemResourceUsageMonitorImpl;
    v2->_systemResourceUsageMonitorImpl = v11;

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMISystemResourceUsageMonitor workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__HMISystemResourceUsageMonitor_setDelegate___block_invoke;
  v7[3] = &unk_24DBE9C40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__HMISystemResourceUsageMonitor_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "systemResourceUsageMonitorImpl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", v1);

}

- (HMISystemResourceUsageMonitorDelegate)delegate
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[HMISystemResourceUsageMonitor workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMISystemResourceUsageMonitor systemResourceUsageMonitorImpl](self, "systemResourceUsageMonitorImpl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMISystemResourceUsageMonitorDelegate *)v5;
}

- (id)getCurrentSystemResourceUsage
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[HMISystemResourceUsageMonitor workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__HMISystemResourceUsageMonitor_getCurrentSystemResourceUsage__block_invoke;
  v6[3] = &unk_24DBE9C68;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __62__HMISystemResourceUsageMonitor_getCurrentSystemResourceUsage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "systemResourceUsageMonitorImpl");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getCurrentSystemResourceUsage");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[HMISystemResourceUsageMonitor workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HMISystemResourceUsageMonitor_start__block_invoke;
  block[3] = &unk_24DBE9C90;
  block[4] = self;
  dispatch_async(v3, block);

}

void __38__HMISystemResourceUsageMonitor_start__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "systemResourceUsageMonitorImpl");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "start");

}

- (HMISystemResourceUsageMonitorImpl)systemResourceUsageMonitorImpl
{
  return (HMISystemResourceUsageMonitorImpl *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_systemResourceUsageMonitorImpl, 0);
}

@end
