@implementation HMIThermalPressureMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_147 != -1)
    dispatch_once(&sharedInstance_onceToken_147, &__block_literal_global_148);
  return (id)sharedInstance_sharedInstance_146;
}

void __43__HMIThermalPressureMonitor_sharedInstance__block_invoke()
{
  HMIThermalPressureMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(HMIThermalPressureMonitor);
  v1 = (void *)sharedInstance_sharedInstance_146;
  sharedInstance_sharedInstance_146 = (uint64_t)v0;

}

- (HMIThermalPressureMonitor)init
{
  HMIThermalPressureMonitor *v2;
  HMIThermalPressureMonitor *v3;
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
  v17.super_class = (Class)HMIThermalPressureMonitor;
  v2 = -[HMIThermalPressureMonitor init](&v17, sel_init);
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
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Registering for Thermal Pressure Notifications", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_initWeak((id *)buf, v10);
    v13 = v3->_notificationQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __33__HMIThermalPressureMonitor_init__block_invoke;
    handler[3] = &unk_24DBEA0C8;
    objc_copyWeak(&v16, (id *)buf);
    notify_register_dispatch((const char *)*MEMORY[0x24BDAE948], v10 + 4, v13, handler);
    objc_msgSend(v10, "_updateThermalPressureLevel");
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __33__HMIThermalPressureMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateThermalPressureLevel");

}

- (void)_updateThermalPressureLevel
{
  void *v3;
  HMIThermalPressureMonitor *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  unint64_t thermalPressureLevel;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  int out_token;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  out_token = 0;
  v11 = 0;
  notify_register_check((const char *)*MEMORY[0x24BDAE948], &out_token);
  notify_get_state(out_token, &v11);
  notify_cancel(out_token);
  self->_thermalPressureLevel = _mapOSThermalLevelToHMIThermalLevel(v11);
  v3 = (void *)MEMORY[0x220735570]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    thermalPressureLevel = self->_thermalPressureLevel;
    if (thermalPressureLevel > 6)
      v9 = CFSTR("HMIThermalPressureLevelNominal");
    else
      v9 = off_24DBEA168[thermalPressureLevel];
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_INFO, "%{public}@Thermal Pressure Level is now: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("HMIThermalPressureLevelDidChangeNotification"), v4);

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_osThermalPressureLevelNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)HMIThermalPressureMonitor;
  -[HMIThermalPressureMonitor dealloc](&v3, sel_dealloc);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)thermalPressureLevel
{
  return self->_thermalPressureLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end
