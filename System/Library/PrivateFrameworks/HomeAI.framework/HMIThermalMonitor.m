@implementation HMIThermalMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  return (id)sharedInstance_sharedInstance;
}

void __35__HMIThermalMonitor_sharedInstance__block_invoke()
{
  HMIThermalMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(HMIThermalMonitor);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (HMIThermalMonitor)init
{
  HMIThermalMonitor *v2;
  HMIThermalMonitor *v3;
  uint64_t v4;
  NSMutableDictionary *services;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *notificationQueue;
  void *v11;
  int *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD handler[4];
  id v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)HMIThermalMonitor;
  v2 = -[HMIThermalMonitor init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_client = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    services = v3->_services;
    v3->_services = (NSMutableDictionary *)v4;

    v3->_thermalLevel = 0;
    HMIDispatchQueueNameString(v3, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)MEMORY[0x220735570]();
    v12 = v3;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Registering for Thermal Level Notifications", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_initWeak((id *)buf, v12);
    v15 = v3->_notificationQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __25__HMIThermalMonitor_init__block_invoke;
    handler[3] = &unk_24DBEA0C8;
    objc_copyWeak(&v18, (id *)buf);
    notify_register_dispatch((const char *)*MEMORY[0x24BDAE940], v12 + 4, v15, handler);
    objc_msgSend(v12, "_updateThermalLevel");
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __25__HMIThermalMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateThermalLevel");

}

- (BOOL)readValueFromSensor:(int)a3 value:(double *)a4
{
  uint64_t v5;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  __IOHIDEventSystemClient *client;
  const __CFAllocator *v11;
  CFDictionaryRef v12;
  const __CFArray *v13;
  const __CFArray *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  int v20;
  int valuePtr;
  int v22;
  void *values;
  CFTypeRef cf;
  CFTypeRef v25;
  void *keys[2];
  const __CFString *v27;
  uint64_t v28;

  v5 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMIThermalMonitor services](self, "services");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  client = (__IOHIDEventSystemClient *)objc_claimAutoreleasedReturnValue();

  if (!client)
  {
    client = self->_client;
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (!client)
    {
      client = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
      self->_client = client;
      if (!client)
        goto LABEL_23;
    }
    valuePtr = 65280;
    v22 = v5;
    v20 = 5;
    *(_OWORD *)keys = xmmword_24DBEA150;
    v27 = CFSTR("LocationID");
    values = CFNumberCreate(v11, kCFNumberSInt32Type, &valuePtr);
    cf = CFNumberCreate(v11, kCFNumberSInt32Type, &v20);
    v25 = CFNumberCreate(v11, kCFNumberSInt32Type, &v22);
    v12 = CFDictionaryCreate(v11, (const void **)keys, (const void **)&values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!v12)
    {
      v18 = 0;
      client = 0;
      goto LABEL_22;
    }
    if (values)
      CFRelease(values);
    if (cf)
      CFRelease(cf);
    if (v25)
      CFRelease(v25);
    IOHIDEventSystemClientSetMatching();
    v13 = IOHIDEventSystemClientCopyServices(client);
    v14 = v13;
    if (v13)
    {
      client = CFArrayGetCount(v13) < 1 ? 0 : (__IOHIDEventSystemClient *)CFArrayGetValueAtIndex(v14, 0);
      CFRelease(v14);
    }
    else
    {
      client = 0;
    }
    CFRelease(v12);
    if (!client)
    {
LABEL_23:
      v18 = 0;
      goto LABEL_22;
    }
    client = -[HMIThermalMonitorService initWithService:]([HMIThermalMonitorService alloc], "initWithService:", client);
    -[HMIThermalMonitor services](self, "services");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", client, v16);

  }
  if (a4)
  {
    -[__IOHIDEventSystemClient readValue](client, "readValue");
    *(_QWORD *)a4 = v17;
  }
  v18 = 1;
LABEL_22:

  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (BOOL)readMaxValue:(double *)a3
{
  uint64_t v5;
  double v6;
  double v8;

  v5 = 0;
  v6 = 0.0;
  do
  {
    v8 = 0.0;
    -[HMIThermalMonitor readValueFromSensor:value:](self, "readValueFromSensor:value:", dword_219E9CE78[v5], &v8);
    if (v6 < v8)
      v6 = v8;
    ++v5;
  }
  while (v5 != 8);
  if (a3)
    *a3 = v6;
  return 1;
}

- (void)_updateThermalLevel
{
  uint64_t v3;
  void *v4;
  HMIThermalMonitor *v5;
  NSObject *v6;
  void *v7;
  unint64_t thermalLevel;
  uint64_t v9;
  int out_token;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  out_token = 0;
  v9 = 0;
  notify_register_check((const char *)*MEMORY[0x24BDAE940], &out_token);
  notify_get_state(out_token, &v9);
  v3 = notify_cancel(out_token);
  self->_thermalLevel = v9;
  v4 = (void *)MEMORY[0x220735570](v3);
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    thermalLevel = self->_thermalLevel;
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2048;
    v14 = thermalLevel;
    _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_INFO, "%{public}@Thermal Level is now: %lu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)dealloc
{
  __IOHIDEventSystemClient *client;
  objc_super v4;

  notify_cancel(self->_thermalLevelNotificationToken);
  client = self->_client;
  if (client)
    CFRelease(client);
  v4.receiver = self;
  v4.super_class = (Class)HMIThermalMonitor;
  -[HMIThermalMonitor dealloc](&v4, sel_dealloc);
}

- (unint64_t)thermalLevel
{
  return self->_thermalLevel;
}

- (NSMutableDictionary)services
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end
