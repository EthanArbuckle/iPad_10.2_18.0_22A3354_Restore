@implementation CSAttSiriStateMonitor

- (CSAttSiriStateMonitor)init
{
  CSAttSiriStateMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSAttSiriStateMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSAttSiriStateMonitor queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_attendingState = 0;
  }
  return v2;
}

- (unint64_t)getAttendingState
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CSAttSiriStateMonitor_getAttendingState__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)updateState:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__CSAttSiriStateMonitor_updateState___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (BOOL)isAttending
{
  return -[CSAttSiriStateMonitor getAttendingState](self, "getAttendingState") != 0;
}

- (BOOL)isAttendingForDictation
{
  return -[CSAttSiriStateMonitor getAttendingState](self, "getAttendingState") == 2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)attendingState
{
  return self->_attendingState;
}

- (void)setAttendingState:(unint64_t)a3
{
  self->_attendingState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __37__CSAttSiriStateMonitor_updateState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setAttendingState:", *(_QWORD *)(a1 + 40));
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSAttSiriStateMonitor updateState:]_block_invoke";
    v9 = 2048;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Updating attSiri state to: %lu", buf, 0x16u);
  }
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__CSAttSiriStateMonitor_updateState___block_invoke_2;
  v6[3] = &unk_1E7C29250;
  v6[4] = v4;
  return objc_msgSend(v4, "enumerateObserversInQueue:", v6);
}

void __37__CSAttSiriStateMonitor_updateState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "attSiriStateMonitor:didRecieveAttSiriStateChange:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "attendingState"));

}

uint64_t __42__CSAttSiriStateMonitor_getAttendingState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "attendingState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14312 != -1)
    dispatch_once(&sharedInstance_onceToken_14312, &__block_literal_global_14313);
  return (id)sharedInstance_sharedInstance_14314;
}

void __39__CSAttSiriStateMonitor_sharedInstance__block_invoke()
{
  CSAttSiriStateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAttSiriStateMonitor);
  v1 = (void *)sharedInstance_sharedInstance_14314;
  sharedInstance_sharedInstance_14314 = (uint64_t)v0;

}

@end
