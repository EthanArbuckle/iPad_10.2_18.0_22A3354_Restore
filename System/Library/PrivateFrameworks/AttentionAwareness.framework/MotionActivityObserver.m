@implementation MotionActivityObserver

- (MotionActivityObserver)initWithCallbackQueue:(id)a3 observer:(id)a4
{
  id v7;
  id v8;
  MotionActivityObserver *v9;
  MotionActivityObserver *v10;
  NSOperationQueue *v11;
  NSOperationQueue *operationQueue;
  NSObject *callbackQueue;
  uint64_t v14;
  MotionActivityObserver *v15;
  CMMotionActivityManager *v16;
  CMMotionActivityManager *motionActivityManager;
  CMMotionActivityManager *v18;
  NSOperationQueue *v19;
  _QWORD v21[4];
  MotionActivityObserver *v22;
  _QWORD block[4];
  MotionActivityObserver *v24;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MotionActivityObserver;
  v9 = -[MotionActivityObserver init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v7)
      __assert_rtn("-[MotionActivityObserver initWithCallbackQueue:observer:]", "MotionActivityObserver.m", 30, "callbackQueue != nil");
    if (!v8)
      __assert_rtn("-[MotionActivityObserver initWithCallbackQueue:observer:]", "MotionActivityObserver.m", 31, "observer != nil");
    objc_storeStrong((id *)&v9->_callbackQueue, a3);
    objc_storeStrong((id *)&v10->_observer, a4);
    v10->_isDeviceStationary = 0;
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v11;

    callbackQueue = v10->_callbackQueue;
    v14 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke;
    block[3] = &unk_1E5F8EC18;
    v15 = v10;
    v24 = v15;
    dispatch_async(callbackQueue, block);
    v16 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x1E0CA5660]);
    motionActivityManager = v15->_motionActivityManager;
    v15->_motionActivityManager = v16;

    v18 = v15->_motionActivityManager;
    v19 = v10->_operationQueue;
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke_2;
    v21[3] = &unk_1E5F8E6F0;
    v22 = v15;
    -[CMMotionActivityManager startActivityUpdatesToQueue:withHandler:](v18, "startActivityUpdatesToQueue:withHandler:", v19, v21);

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

uint64_t __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "MotionStateChanging:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
}

void __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[1];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke_3;
  v7[3] = &unk_1E5F8EC40;
  v8 = v4;
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __57__MotionActivityObserver_initWithCallbackQueue_observer___block_invoke_3(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40);
  result = objc_msgSend(*(id *)(a1 + 40), "stationary");
  if (v2 != (_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(*(id *)(a1 + 40), "stationary");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "MotionStateChanging:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  }
  return result;
}

@end
