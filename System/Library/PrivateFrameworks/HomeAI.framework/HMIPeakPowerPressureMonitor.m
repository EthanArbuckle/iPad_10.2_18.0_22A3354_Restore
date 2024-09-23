@implementation HMIPeakPowerPressureMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_174 != -1)
    dispatch_once(&sharedInstance_onceToken_174, &__block_literal_global_175);
  return (id)sharedInstance_sharedInstance_173;
}

void __45__HMIPeakPowerPressureMonitor_sharedInstance__block_invoke()
{
  HMIPeakPowerPressureMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(HMIPeakPowerPressureMonitor);
  v1 = (void *)sharedInstance_sharedInstance_173;
  sharedInstance_sharedInstance_173 = (uint64_t)v0;

}

- (HMIPeakPowerPressureMonitor)init
{
  HMIPeakPowerPressureMonitor *v2;
  HMIPeakPowerPressureMonitor *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *notificationQueue;
  void *v9;
  int *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD handler[4];
  id v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)HMIPeakPowerPressureMonitor;
  v2 = -[HMIPeakPowerPressureMonitor init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    HMIDispatchQueueNameString(v2, 0);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)MEMORY[0x220735570]();
    v10 = v3;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v12;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Registering for Peak Power Pressure Notifications", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_initWeak((id *)buf, v10);
    v13 = v3->_notificationQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __35__HMIPeakPowerPressureMonitor_init__block_invoke;
    handler[3] = &unk_24DBEA0C8;
    objc_copyWeak(&v16, (id *)buf);
    notify_register_dispatch("com.apple.system.peakpowerpressurelevel", v10 + 4, v13, handler);
    objc_msgSend(v10, "_updatePeakPowerPressureLevel");
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __35__HMIPeakPowerPressureMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePeakPowerPressureLevel");

}

- (void)_updatePeakPowerPressureLevel
{
  uint64_t v3;
  int64_t v4;
  void *v5;
  HMIPeakPowerPressureMonitor *v6;
  NSObject *v7;
  void *v8;
  int64_t peakPowerPressureLevel;
  int64_t v10;
  int out_token;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  out_token = 0;
  v10 = 0;
  notify_register_check("com.apple.system.peakpowerpressurelevel", &out_token);
  notify_get_state(out_token, (uint64_t *)&v10);
  v3 = notify_cancel(out_token);
  v4 = v10;
  if (v10 <= 19)
  {
    if (!v10)
      goto LABEL_12;
    if (v10 == 10)
    {
      v4 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    switch(v10)
    {
      case 20:
        v4 = 2;
        goto LABEL_12;
      case 30:
        v4 = 3;
        goto LABEL_12;
      case 40:
        v4 = 4;
        goto LABEL_12;
    }
  }
  v4 = -1;
LABEL_12:
  self->_peakPowerPressureLevel = v4;
  v5 = (void *)MEMORY[0x220735570](v3);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    peakPowerPressureLevel = self->_peakPowerPressureLevel;
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2048;
    v15 = peakPowerPressureLevel;
    _os_log_impl(&dword_219D45000, v7, OS_LOG_TYPE_INFO, "%{public}@Peak Power Pressure Level is now: %ld", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_osPeakPowerPressureLevelNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)HMIPeakPowerPressureMonitor;
  -[HMIPeakPowerPressureMonitor dealloc](&v3, sel_dealloc);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)peakPowerPressureLevel
{
  return self->_peakPowerPressureLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end
