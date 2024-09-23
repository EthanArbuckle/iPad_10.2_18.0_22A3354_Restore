@implementation CSSiriAssertionMonitor

- (CSSiriAssertionMonitor)init
{
  CSSiriAssertionMonitor *v2;
  CSSiriAssertionMonitor *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CSSiriAssertionMonitor;
  v2 = -[CSEventMonitor init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_assertionState = 0;
    v4 = dispatch_queue_create("CSSiriAssertionMonitor queue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSSiriAssertionMonitor init]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring: siri assertion enable/disable", buf, 0xCu);
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[CSSiriAssertionMonitor _stopMonitoring](self, "_stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)CSSiriAssertionMonitor;
  -[CSEventMonitor dealloc](&v3, sel_dealloc);
}

- (void)_stopMonitoring
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSSiriAssertionMonitor _stopMonitoring]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring: siri assertion enable/disable", (uint8_t *)&v3, 0xCu);
  }
}

- (void)enableAssertionReceived
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CSSiriAssertionMonitor_enableAssertionReceived__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)disableAssertionReceived
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CSSiriAssertionMonitor_disableAssertionReceived__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_notifyObserver:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__CSSiriAssertionMonitor__notifyObserver___block_invoke;
  v3[3] = &unk_1E7C27E50;
  v3[4] = self;
  v4 = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (void)_notifyObserverBacklightOn:(BOOL)a3 atHostTime:(unint64_t)a4
{
  _QWORD v4[6];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__CSSiriAssertionMonitor__notifyObserverBacklightOn_atHostTime___block_invoke;
  v4[3] = &unk_1E7C24770;
  v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v4);
}

- (BOOL)isEnabled
{
  return self->_assertionState == 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

void __64__CSSiriAssertionMonitor__notifyObserverBacklightOn_atHostTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "CSSiriAssertionMonitor:didReceiveBacklightOnEnabled:atHostTime:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __42__CSSiriAssertionMonitor__notifyObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "CSSiriAssertionMonitor:didReceiveEnabled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

void __50__CSSiriAssertionMonitor_disableAssertionReceived__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSiriAssertionMonitor disableAssertionReceived]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s did receive disable assertion", (uint8_t *)&v4, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 24) != 1)
  {
    *(_BYTE *)(v3 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", objc_msgSend(*(id *)(a1 + 32), "isEnabled"));
  }
}

void __49__CSSiriAssertionMonitor_enableAssertionReceived__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSiriAssertionMonitor enableAssertionReceived]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s did receive enable assertion", (uint8_t *)&v4, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 24) != 2)
  {
    *(_BYTE *)(v3 + 24) = 2;
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", objc_msgSend(*(id *)(a1 + 32), "isEnabled"));
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2671 != -1)
    dispatch_once(&sharedInstance_onceToken_2671, &__block_literal_global_2672);
  return (id)sharedInstance__sharedInstance_2673;
}

void __40__CSSiriAssertionMonitor_sharedInstance__block_invoke()
{
  CSSiriAssertionMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSSiriAssertionMonitor);
  v1 = (void *)sharedInstance__sharedInstance_2673;
  sharedInstance__sharedInstance_2673 = (uint64_t)v0;

}

@end
