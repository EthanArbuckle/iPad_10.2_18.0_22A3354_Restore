@implementation ScreenStateObserver

- (ScreenStateObserver)initWithCallbackQueue:(id)a3 observer:(id)a4
{
  id v7;
  id v8;
  ScreenStateObserver *v9;
  ScreenStateObserver *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  void *v13;
  NSObject *callbackQueue;
  _QWORD block[4];
  ScreenStateObserver *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ScreenStateObserver;
  v9 = -[ScreenStateObserver init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v7)
      __assert_rtn("-[ScreenStateObserver initWithCallbackQueue:observer:]", "ScreenStateObserver.m", 28, "callbackQueue != nil");
    if (!v8)
      __assert_rtn("-[ScreenStateObserver initWithCallbackQueue:observer:]", "ScreenStateObserver.m", 29, "observer != nil");
    objc_storeStrong((id *)&v9->_observer, a4);
    objc_storeStrong((id *)&v10->_callbackQueue, a3);
    v11 = dispatch_queue_create("com.apple.AttentionAwareness.BacklightServices.Observer", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    v10->_displayState = 1;
    objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:", v10);

    callbackQueue = v10->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__ScreenStateObserver_initWithCallbackQueue_observer___block_invoke;
    block[3] = &unk_1E5F8EC18;
    v17 = v10;
    dispatch_async(callbackQueue, block);

  }
  return v10;
}

- (void)backlight:(id)a3 performingEvent:(id)a4
{
  int IsActive;
  NSObject *callbackQueue;
  _QWORD block[5];

  objc_msgSend(a4, "state", a3);
  IsActive = BLSBacklightStateIsActive();
  if (self->_displayState != IsActive)
  {
    self->_displayState = IsActive;
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__ScreenStateObserver_backlight_performingEvent___block_invoke;
    block[3] = &unk_1E5F8EC18;
    block[4] = self;
    dispatch_async(callbackQueue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __49__ScreenStateObserver_backlight_performingEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "screenStateChanging:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __54__ScreenStateObserver_initWithCallbackQueue_observer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "screenStateChanging:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16));
}

@end
