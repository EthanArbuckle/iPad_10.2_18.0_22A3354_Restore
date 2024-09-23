@implementation CMContinuityCaptureThermalMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_11);
  return (id)_thermalMonitor;
}

void __51__CMContinuityCaptureThermalMonitor_sharedInstance__block_invoke()
{
  CMContinuityCaptureThermalMonitor *v0;
  dispatch_queue_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v0 = [CMContinuityCaptureThermalMonitor alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.continuitycapture.thermalmonitor", v4);
  v2 = -[CMContinuityCaptureThermalMonitor initWithQueue:](v0, "initWithQueue:", v1);
  v3 = (void *)_thermalMonitor;
  _thermalMonitor = v2;

}

- (CMContinuityCaptureThermalMonitor)initWithQueue:(id)a3
{
  id v5;
  CMContinuityCaptureThermalMonitor *v6;
  CMContinuityCaptureThermalMonitor *v7;
  CMContinuityCaptureThermalMonitor *v8;
  NSObject *v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMContinuityCaptureThermalMonitor;
  v6 = -[CMContinuityCaptureThermalMonitor init](&v11, sel_init);
  v7 = v6;
  if (!v6)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_queue, a3);
  v7->_registrationToken = -1;
  if (!-[CMContinuityCaptureThermalMonitor setupNotification](v7, "setupNotification"))
  {
    CMContinuityCaptureLog(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureThermalMonitor initWithQueue:].cold.1(v10);

    goto LABEL_8;
  }
  v8 = v7;
LABEL_4:

  return v8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)thermalLevel
{
  return self->_thermalLevel;
}

- (BOOL)invalidated
{
  CMContinuityCaptureThermalMonitor *v2;
  BOOL invalidated;

  v2 = self;
  objc_sync_enter(v2);
  invalidated = v2->_invalidated;
  objc_sync_exit(v2);

  return invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  CMContinuityCaptureThermalMonitor *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_invalidated = a3;
  objc_sync_exit(obj);

}

+ (void)invalidate
{
  if ((objc_msgSend((id)_thermalMonitor, "invalidated") & 1) == 0)
  {
    objc_msgSend((id)_thermalMonitor, "invalidate");
    objc_msgSend((id)_thermalMonitor, "setInvalidated:", 1);
  }
}

- (void)invalidate
{
  if (notify_is_valid_token(self->_registrationToken))
    notify_cancel(self->_registrationToken);
}

- (BOOL)setupNotification
{
  void (**v3)(_QWORD, _QWORD);
  int *p_registrationToken;
  uint32_t v5;
  _QWORD v7[4];
  id v8;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke;
  v7[3] = &unk_24F06C7A8;
  objc_copyWeak(&v8, &location);
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2A7CB0](v7);
  p_registrationToken = &self->_registrationToken;
  v5 = notify_register_dispatch((const char *)*MEMORY[0x24BDAE940], &self->_registrationToken, (dispatch_queue_t)self->_queue, v3);
  if (!v5)
    v3[2](v3, *p_registrationToken);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5 == 0;
}

void __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  uint32_t state;
  int v6;
  NSObject *v7;
  id *v8;
  id WeakRetained;
  NSObject *v10;
  _QWORD block[4];
  id v12[2];
  uint64_t state64;

  v4 = (void *)MEMORY[0x22E2A7B00]();
  state64 = 0;
  state = notify_get_state(a2, &state64);
  if (state)
  {
    v6 = state;
    CMContinuityCaptureLog(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke_cold_1(v6, v7);
    goto LABEL_6;
  }
  v8 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v10 = *((_QWORD *)WeakRetained + 3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke_3;
    block[3] = &unk_24F06C780;
    objc_copyWeak(v12, v8);
    v12[1] = (id)state64;
    dispatch_async(v10, block);
    objc_destroyWeak(v12);
LABEL_6:

  }
  objc_autoreleasePoolPop(v4);
}

void __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_thermalNotification:", *(unsigned int *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_thermalNotification:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = 3;
  v6 = 2;
  if (a3 <= 1)
    v6 = a3 == 0;
  if (a3 <= 4)
    v5 = v6;
  if (a3 <= 9)
    v7 = v5;
  else
    v7 = 4;
  if (v7 != self->_thermalLevel)
  {
    -[CMContinuityCaptureThermalMonitor willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("thermalLevel"));
    self->_thermalLevel = v7;
    -[CMContinuityCaptureThermalMonitor didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("thermalLevel"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithQueue:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_227C5D000, log, OS_LOG_TYPE_ERROR, "Unable to setup thermal monitor", v1, 2u);
}

void __54__CMContinuityCaptureThermalMonitor_setupNotification__block_invoke_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_227C5D000, a2, OS_LOG_TYPE_ERROR, "Unable to get notification state: %d", (uint8_t *)v2, 8u);
}

@end
