@implementation CarPlayStateObserver

- (CarPlayStateObserver)initWithCallbackQueue:(id)a3 observer:(id)a4
{
  id v7;
  id v8;
  CarPlayStateObserver *v9;
  CarPlayStateObserver *v10;
  uint64_t v11;
  CARSessionStatus *carSessionStatus;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CarPlayStateObserver;
  v9 = -[CarPlayStateObserver init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v7)
      __assert_rtn("-[CarPlayStateObserver initWithCallbackQueue:observer:]", "CarPlayStateObserver.m", 26, "callbackQueue != nil");
    if (!v8)
      __assert_rtn("-[CarPlayStateObserver initWithCallbackQueue:observer:]", "CarPlayStateObserver.m", 27, "observer != nil");
    objc_storeStrong((id *)&v9->_observer, a4);
    objc_storeStrong((id *)&v10->_callbackQueue, a3);
    v10->_carPlayConnected = 0;
    v11 = objc_opt_new();
    carSessionStatus = v10->_carSessionStatus;
    v10->_carSessionStatus = (CARSessionStatus *)v11;

    -[CARSessionStatus addSessionObserver:](v10->_carSessionStatus, "addSessionObserver:", v10);
    -[CarPlayStateObserver setCarPlayState:](v10, "setCarPlayState:", -[CarPlayStateObserver getCarPlayState](v10, "getCarPlayState"));
  }

  return v10;
}

- (BOOL)getCarPlayState
{
  NSObject *callbackQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  callbackQueue = self->_callbackQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__CarPlayStateObserver_getCarPlayState__block_invoke;
  v5[3] = &unk_1E5F8EAC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async(callbackQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCarPlayState:(BOOL)a3
{
  NSObject *callbackQueue;
  _QWORD block[5];

  if (self->_carPlayConnected != a3)
  {
    self->_carPlayConnected = a3;
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__CarPlayStateObserver_setCarPlayState___block_invoke;
    block[3] = &unk_1E5F8EC18;
    block[4] = self;
    dispatch_async(callbackQueue, block);
  }
}

- (void)sessionDidConnect:(id)a3
{
  -[CarPlayStateObserver setCarPlayState:](self, "setCarPlayState:", 1);
}

- (void)sessionDidDisconnect:(id)a3
{
  -[CarPlayStateObserver setCarPlayState:](self, "setCarPlayState:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

uint64_t __40__CarPlayStateObserver_setCarPlayState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "carPlayStateChanging:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
}

void __39__CarPlayStateObserver_getCarPlayState__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "currentSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

@end
