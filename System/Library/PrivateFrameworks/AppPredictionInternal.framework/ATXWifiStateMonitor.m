@implementation ATXWifiStateMonitor

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3, &__block_literal_global_57);
  return (id)sharedInstance__pasExprOnceResult_8;
}

void __37__ATXWifiStateMonitor_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_8;
  sharedInstance__pasExprOnceResult_8 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXWifiStateMonitor)init
{
  ATXWifiStateMonitor *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _QWORD block[4];
  ATXWifiStateMonitor *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATXWifiStateMonitor;
  v2 = -[ATXWifiStateMonitor init](&v13, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__ATXWifiStateMonitor_init__block_invoke;
    block[3] = &unk_1E82DAC38;
    v12 = v2;
    dispatch_async(v9, block);

  }
  return v2;
}

uint64_t __27__ATXWifiStateMonitor_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)_start
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Could not get WiFi device list", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (NSString)SSID
{
  NSObject *queue;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v13 = 0;
  v14[0] = &v13;
  v14[1] = 0x3032000000;
  v14[2] = __Block_byref_object_copy__25;
  v14[3] = __Block_byref_object_dispose__25;
  v15 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __27__ATXWifiStateMonitor_SSID__block_invoke;
  v12[3] = &unk_1E82DACD8;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(queue, v12);
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ATXWifiStateMonitor SSID].cold.1((uint64_t)v14, v3, v4, v5, v6, v7, v8, v9);

  v10 = *(id *)(v14[0] + 40);
  _Block_object_dispose(&v13, 8);

  return (NSString *)v10;
}

void __27__ATXWifiStateMonitor_SSID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
    goto LABEL_2;
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    if (v4 > -1800.0)
    {
      v2 = *(_QWORD *)(a1 + 32);
LABEL_2:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 32));
    }
  }
}

- (void)dealloc
{
  const void *v3;
  __WiFiManagerClient *manager;
  __CFRunLoop *Main;
  __CFRunLoop *v6;
  objc_super v7;
  _QWORD block[5];

  if (self->_device)
  {
    WiFiDeviceClientRegisterExtendedLinkCallback();
    CFRelease(self->_device);
  }
  if (self->_manager)
  {
    CFRunLoopGetMain();
    v3 = (const void *)*MEMORY[0x1E0C9B270];
    WiFiManagerClientUnscheduleFromRunLoop();
    manager = self->_manager;
    Main = CFRunLoopGetMain();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__ATXWifiStateMonitor_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = manager;
    CFRunLoopPerformBlock(Main, v3, block);
    v6 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)ATXWifiStateMonitor;
  -[ATXWifiStateMonitor dealloc](&v7, sel_dealloc);
}

void __30__ATXWifiStateMonitor_dealloc__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_lastSeenSSID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)SSID
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "Current SSID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
