@implementation LockScreenStateObserver

- (LockScreenStateObserver)initWithCallbackQueue:(id)a3 observer:(id)a4
{
  id v7;
  id v8;
  LockScreenStateObserver *v9;
  LockScreenStateObserver *v10;
  NSObject *callbackQueue;
  uint64_t v12;
  LockScreenStateObserver *v13;
  LockScreenStateObserver *v14;
  _QWORD v16[4];
  LockScreenStateObserver *v17;
  _QWORD handler[4];
  LockScreenStateObserver *v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)LockScreenStateObserver;
  v9 = -[LockScreenStateObserver init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v7)
      __assert_rtn("-[LockScreenStateObserver initWithCallbackQueue:observer:]", "LockScreenStateObserver.m", 27, "callbackQueue != nil");
    if (!v8)
      __assert_rtn("-[LockScreenStateObserver initWithCallbackQueue:observer:]", "LockScreenStateObserver.m", 28, "observer != nil");
    objc_storeStrong((id *)&v9->_callbackQueue, a3);
    objc_storeStrong((id *)&v10->_observer, a4);
    v10->_lockToken = 0;
    callbackQueue = v10->_callbackQueue;
    v12 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__LockScreenStateObserver_initWithCallbackQueue_observer___block_invoke;
    handler[3] = &unk_1E5F8E740;
    v13 = v10;
    v19 = v13;
    notify_register_dispatch("com.apple.springboard.lockstate", &v10->_lockToken, callbackQueue, handler);
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __58__LockScreenStateObserver_initWithCallbackQueue_observer___block_invoke_2;
    v16[3] = &unk_1E5F8EC18;
    v14 = v13;
    v17 = v14;
    if (initWithCallbackQueue_observer__onceToken != -1)
    {
      dispatch_once(&initWithCallbackQueue_observer__onceToken, v16);
      v14 = v17;
    }

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

uint64_t __58__LockScreenStateObserver_initWithCallbackQueue_observer___block_invoke(uint64_t a1)
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24), &state64);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = state64 != 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "LockScreenStateChanging:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
}

uint64_t __58__LockScreenStateObserver_initWithCallbackQueue_observer___block_invoke_2(uint64_t a1)
{
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24), &state64);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = state64 != 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "LockScreenStateChanging:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 28));
}

@end
