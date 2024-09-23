@implementation HMISystemResourceUsageMonitorImpl

- (HMISystemResourceUsageMonitorImpl)initWithProductClass:(int64_t)a3 workQueue:(id)a4
{
  id v7;
  HMISystemResourceUsageMonitorImpl *v8;
  HMISystemResourceUsageMonitorImpl *v9;
  HMISystemResourceUsageMonitoriPad *v10;
  HMISystemResourceUsageMonitorProtocol *resourceUsageMonitor;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMISystemResourceUsageMonitorImpl *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMISystemResourceUsageMonitorImpl;
  v8 = -[HMISystemResourceUsageMonitorImpl init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workQueue, a4);
    if (a3 == 3)
    {
      v10 = -[HMISystemResourceUsageMonitoriPad initWithWorkQueue:]([HMISystemResourceUsageMonitoriPad alloc], "initWithWorkQueue:", v7);
      resourceUsageMonitor = v9->_resourceUsageMonitor;
      v9->_resourceUsageMonitor = (HMISystemResourceUsageMonitorProtocol *)v10;

    }
    if (!v9->_resourceUsageMonitor)
    {
      v12 = (void *)MEMORY[0x220735570]();
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        HMFProductClassToString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_INFO, "%{public}@Unsupported product class:%@ for system resource usage monitoring", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }
    v16 = v9;
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[HMISystemResourceUsageMonitorImpl workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMISystemResourceUsageMonitorImpl resourceUsageMonitor](self, "resourceUsageMonitor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v4);

}

- (HMISystemResourceUsageMonitorDelegate)delegate
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[HMISystemResourceUsageMonitorImpl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMISystemResourceUsageMonitorImpl resourceUsageMonitor](self, "resourceUsageMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMISystemResourceUsageMonitorDelegate *)v5;
}

- (void)start
{
  NSObject *v3;
  id v4;

  -[HMISystemResourceUsageMonitorImpl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMISystemResourceUsageMonitorImpl resourceUsageMonitor](self, "resourceUsageMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");

}

- (id)getCurrentSystemResourceUsage
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[HMISystemResourceUsageMonitorImpl workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMISystemResourceUsageMonitorImpl resourceUsageMonitor](self, "resourceUsageMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getCurrentSystemResourceUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMISystemResourceUsageMonitorProtocol)resourceUsageMonitor
{
  return (HMISystemResourceUsageMonitorProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_resourceUsageMonitor, 0);
}

@end
