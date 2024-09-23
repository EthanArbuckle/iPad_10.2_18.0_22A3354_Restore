@implementation MIBUReaderService

- (MIBUReaderService)initWithDelegate:(id)a3
{
  id v4;
  MIBUReaderService *v5;
  MIBUReaderService *v6;
  MIBUDeviceNFC *v7;
  id v8;
  void *v9;
  void *v10;
  dispatch_queue_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MIBUReaderService;
  v5 = -[MIBUReaderService init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MIBUReaderService setDelegate:](v5, "setDelegate:", v4);
    -[MIBUReaderService setRunLoop:](v6, "setRunLoop:", 0);
    v7 = objc_alloc_init(MIBUDeviceNFC);
    -[MIBUReaderService setDevice:](v6, "setDevice:", v7);

    v8 = objc_alloc_init(MEMORY[0x24BDD1710]);
    -[MIBUReaderService setServiceQueue:](v6, "setServiceQueue:", v8);

    -[MIBUReaderService serviceQueue](v6, "serviceQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaxConcurrentOperationCount:", 1);

    -[MIBUReaderService serviceQueue](v6, "serviceQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", CFSTR("com.apple.mobileinboxupdate.service_queue"));

    v11 = dispatch_queue_create("com.apple.mibu_device_queue", MEMORY[0x24BDAC9C0]);
    -[MIBUReaderService setDeviceQueue:](v6, "setDeviceQueue:", v11);

  }
  return v6;
}

- (void)start
{
  MIBUReaderService *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[5];

  v2 = self;
  objc_sync_enter(v2);
  -[MIBUReaderService serviceQueue](v2, "serviceQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "operationCount");

  if (v4)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_10);
    v5 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_222C3F000, v5, OS_LOG_TYPE_DEFAULT, "MIBUService thread already running, ignoring start call...", v8, 2u);
    }
  }
  else
  {
    -[MIBUReaderService serviceQueue](v2, "serviceQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __26__MIBUReaderService_start__block_invoke;
    v9[3] = &unk_24EB55A60;
    v9[4] = v2;
    objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addOperation:", v7);

  }
  objc_sync_exit(v2);

}

uint64_t __26__MIBUReaderService_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

void __26__MIBUReaderService_start__block_invoke_2()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)terminate
{
  MIBUReaderService *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  __CFRunLoop *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  -[MIBUReaderService serviceQueue](v2, "serviceQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "operationCount");

  if (v4)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_15_0);
    v5 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222C3F000, v5, OS_LOG_TYPE_DEFAULT, "Terminating MobileInBoxUpdate service thread...", buf, 2u);
    }
    -[MIBUReaderService runLoop](v2, "runLoop");
    v6 = (__CFRunLoop *)objc_claimAutoreleasedReturnValue();
    CFRunLoopStop(v6);

    -[MIBUReaderService device](v2, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endSession");

    -[MIBUReaderService serviceQueue](v2, "serviceQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "waitUntilAllOperationsAreFinished");

  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_17_0);
    v9 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_222C3F000, v9, OS_LOG_TYPE_DEFAULT, "MIBUService thread not running, ignoring termination call...", v10, 2u);
    }
  }
  objc_sync_exit(v2);

}

void __30__MIBUReaderService_terminate__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __30__MIBUReaderService_terminate__block_invoke_16()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)run
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  MIBUReaderService *v12;
  id v13;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_18_0);
  v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222C3F000, v3, OS_LOG_TYPE_DEFAULT, "MobileInBoxUpdate service thread started", buf, 2u);
  }
  -[MIBUReaderService deviceQueue](self, "deviceQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __24__MIBUReaderService_run__block_invoke_19;
  v11 = &unk_24EB55B28;
  objc_copyWeak(&v13, &location);
  v12 = self;
  dispatch_async(v4, &v8);

  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_22_2);
  v5 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222C3F000, v5, OS_LOG_TYPE_DEFAULT, "Starting run loop", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBUReaderService setRunLoop:](self, "setRunLoop:", v6);

  -[MIBUReaderService runLoop](self, "runLoop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "run");

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __24__MIBUReaderService_run__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __24__MIBUReaderService_run__block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "startSession");

  if (v4)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceDidConnect:", v6);

  }
  else
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_20_1);
    v7 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      __24__MIBUReaderService_run__block_invoke_19_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    objc_msgSend(WeakRetained, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceDidNotConnect");

  }
}

void __24__MIBUReaderService_run__block_invoke_2()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __24__MIBUReaderService_run__block_invoke_21()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (MIBUReaderServiceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (MIBUDeviceNFC)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSOperationQueue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceQueue, a3);
}

- (OS_dispatch_queue)deviceQueue
{
  return self->_deviceQueue;
}

- (void)setDeviceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_deviceQueue, a3);
}

- (NSRunLoop)runLoop
{
  return self->_runLoop;
}

- (void)setRunLoop:(id)a3
{
  objc_storeStrong((id *)&self->_runLoop, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_deviceQueue, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __24__MIBUReaderService_run__block_invoke_19_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, a1, a3, "MIBUReaderService failed to start NFC session", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
