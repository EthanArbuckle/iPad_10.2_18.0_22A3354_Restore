@implementation CTCallCenter

- (CTCallCenter)initWithQueue:(dispatch_queue_s *)a3
{
  NSObject *fObj;

  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  fObj = self->clientQueue.fObj.fObj;
  self->clientQueue.fObj.fObj = (dispatch_object_s *)a3;
  if (fObj)
    dispatch_release(fObj);
  return -[CTCallCenter init](self, "init");
}

- (CTCallCenter)init
{
  CTCallCenter *v2;
  CTCallCenter *v3;
  dispatch_queue_t v4;
  NSObject *v5;
  NSObject *global_queue;
  NSObject *v7;
  NSObject *fObj;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CTCallCenter;
  v2 = -[CTCallCenter init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    if (!v2->clientQueue.fObj.fObj)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v7 = global_queue;
      if (global_queue)
      {
        dispatch_retain(global_queue);
        fObj = v3->clientQueue.fObj.fObj;
        v3->clientQueue.fObj.fObj = (dispatch_object_s *)v7;
        if (fObj)
          dispatch_release(fObj);
      }
      else
      {
        v3->clientQueue.fObj.fObj = 0;
      }
    }
    v4 = dispatch_queue_create("CTCallCenter", 0);
    v5 = v3->_queue.fObj.fObj;
    v3->_queue.fObj.fObj = (dispatch_object_s *)v4;
    if (v5)
      dispatch_release(v5);
    v3->_currentCalls = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (CUTWeakLinkClass())
    {
      v3->_callKitObserver = (CXCallObserver *)objc_opt_new();
      if (!-[CTCallCenter calculateCallStateChanges_sync:](v3, "calculateCallStateChanges_sync:", 0))
        syslog(3, "Could not successfully update call center during initialization, CTCallCenter: %s.", -[NSString UTF8String](-[CTCallCenter description](v3, "description"), "UTF8String"));
      -[CTCallCenter initialize](v3, "initialize");
    }
    else
    {
      syslog(3, "CXCallObserver could not be weak linked. Return nil.");
      return 0;
    }
  }
  return v3;
}

- (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CTCallCenter_initialize__block_invoke;
  block[3] = &unk_1E1530FA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, block);
}

uint64_t __26__CTCallCenter_initialize__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "callKitObserver"), "setDelegate:queue:", *(_QWORD *)(a1 + 32), 0);
}

- (void)handleCallStatusChange_sync:(id)a3
{
  id v4;
  void *v5;
  NSSet *currentCalls;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v4 = +[CTCall callForCXCall:](CTCall, "callForCXCall:", a3);
  if (v4)
  {
    v5 = v4;
    currentCalls = self->_currentCalls;
    v7 = -[NSSet member:](currentCalls, "member:", v4);
    v8 = (void *)objc_msgSend(v5, "callState");
    if (v7)
    {
      if ((objc_msgSend(v8, "isEqualToString:", objc_msgSend(v7, "callState")) & 1) == 0)
      {
        -[NSSet removeObject:](currentCalls, "removeObject:", v7);
        if ((objc_msgSend((id)objc_msgSend(v5, "callState"), "isEqualToString:", CFSTR("CTCallStateDisconnected")) & 1) != 0)
          goto LABEL_8;
        goto LABEL_7;
      }
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CTCallStateDisconnected")) & 1) == 0)
    {
LABEL_7:
      -[NSSet addObject:](currentCalls, "addObject:", v5);
LABEL_8:
      v9 = v5;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __44__CTCallCenter_handleCallStatusChange_sync___block_invoke;
      v10[3] = &unk_1E1530FD0;
      v10[4] = self;
      v10[5] = v5;
      dispatch_async((dispatch_queue_t)self->clientQueue.fObj.fObj, v10);
    }

  }
}

void __44__CTCallCenter_handleCallStatusChange_sync___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  CXCallObserver *callKitObserver;
  objc_super v4;

  callKitObserver = self->_callKitObserver;
  if (callKitObserver)

  v4.receiver = self;
  v4.super_class = (Class)CTCallCenter;
  -[CTCallCenter dealloc](&v4, sel_dealloc);
}

- (void)callEventHandler
{
  NSObject *fObj;
  _QWORD v4[5];
  _QWORD *v5;
  _QWORD block[6];
  void *v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__CTCallCenter_callEventHandler__block_invoke;
  v4[3] = &unk_1E1530FF8;
  v4[4] = self;
  v5 = v4;
  fObj = self->_queue.fObj.fObj;
  v7 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIU13block_pointerFU13block_pointerFvP6CTCallEvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS7_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v7;
  block[5] = &v5;
  dispatch_sync(fObj, block);
  return v7;
}

uint64_t __32__CTCallCenter_callEventHandler__block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
}

- (void)setCallEventHandler:(void *)callEventHandler
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__CTCallCenter_setCallEventHandler___block_invoke;
  v3[3] = &unk_1E1531020;
  v3[4] = self;
  v3[5] = callEventHandler;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, v3);
}

void __36__CTCallCenter_setCallEventHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 32) != v2)
  {
    v4 = *(id *)(v3 + 32);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(v2, "copyWithZone:", 0);

  }
}

- (BOOL)getCurrentCallSetFromServer_sync:(id)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)MEMORY[0x186DBA8B0](self, a2);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = -[CXCallObserver calls](-[CTCallCenter callKitObserver](self, "callKitObserver", 0), "calls");
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = +[CTCall callForCXCall:](CTCall, "callForCXCall:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          if (v11)
            objc_msgSend(a3, "addObject:", v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    objc_autoreleasePoolPop(v5);
  }
  return a3 != 0;
}

- (BOOL)calculateCallStateChanges_sync:(id)a3
{
  id v5;
  NSSet *currentCalls;
  id v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSEnumerator *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSEnumerator *v22;
  uint64_t v23;
  id v24;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  currentCalls = self->_currentCalls;
  v7 = a3;
  if (!a3)
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = -[CTCallCenter getCurrentCallSetFromServer_sync:](self, "getCurrentCallSetFromServer_sync:", v8);
  if (v9)
  {
    if (objc_msgSend(v8, "count"))
    {
      v10 = (void *)objc_msgSend(v8, "objectEnumerator");
      v11 = objc_msgSend(v10, "nextObject");
      if (v11)
      {
        v12 = (void *)v11;
        while (1)
        {
          v13 = -[NSSet member:](currentCalls, "member:", v12);
          if (!v13)
            goto LABEL_10;
          v14 = v13;
          if ((objc_msgSend((id)objc_msgSend(v13, "callState"), "isEqualToString:", objc_msgSend(v12, "callState")) & 1) == 0)
            break;
LABEL_13:
          v12 = (void *)objc_msgSend(v10, "nextObject");
          if (!v12)
            goto LABEL_14;
        }
        -[NSSet removeObject:](currentCalls, "removeObject:", v14);
LABEL_10:
        if ((objc_msgSend((id)objc_msgSend(v12, "callState"), "isEqualToString:", CFSTR("CTCallStateDisconnected")) & 1) == 0)
          -[NSSet addObject:](currentCalls, "addObject:", v12);
        objc_msgSend(v7, "addObject:", v12);
        goto LABEL_13;
      }
LABEL_14:
      v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v16 = -[NSSet objectEnumerator](currentCalls, "objectEnumerator");
      v17 = -[NSEnumerator nextObject](v16, "nextObject");
      if (v17)
      {
        v18 = v17;
        do
        {
          if (!objc_msgSend(v8, "member:", v18))
            objc_msgSend(v15, "addObject:", v18);
          v18 = -[NSEnumerator nextObject](v16, "nextObject");
        }
        while (v18);
      }
      if (objc_msgSend(v15, "count"))
      {
        v19 = (void *)objc_msgSend(v15, "objectEnumerator");
        v20 = objc_msgSend(v19, "nextObject");
        if (v20)
        {
          v21 = (void *)v20;
          do
          {
            if (a3)
            {
              objc_msgSend(v21, "setCallState:", CFSTR("CTCallStateDisconnected"));
              objc_msgSend(a3, "addObject:", v21);
            }
            -[NSSet removeObject:](currentCalls, "removeObject:", v21);
            v21 = (void *)objc_msgSend(v19, "nextObject");
          }
          while (v21);
        }
      }

    }
    else if (-[NSSet count](currentCalls, "count"))
    {
      v22 = -[NSSet objectEnumerator](currentCalls, "objectEnumerator");
      v23 = -[NSEnumerator nextObject](v22, "nextObject");
      if (v23)
      {
        v24 = (id)v23;
        do
        {
          objc_msgSend(v24, "setCallState:", CFSTR("CTCallStateDisconnected"));
          objc_msgSend(v7, "addObject:", v24);
          v24 = -[NSEnumerator nextObject](v22, "nextObject");
        }
        while (v24);
      }
      -[NSSet removeAllObjects](currentCalls, "removeAllObjects");
    }
  }

  if (!a3 && v7)
  return v9;
}

- (NSSet)currentCalls
{
  NSObject *fObj;
  _QWORD v4[5];
  _QWORD *v5;
  _QWORD block[6];
  NSSet *v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__CTCallCenter_currentCalls__block_invoke;
  v4[3] = &unk_1E1531048;
  v4[4] = self;
  v5 = v4;
  fObj = self->_queue.fObj.fObj;
  v7 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIU13block_pointerFP5NSSetvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v7;
  block[5] = &v5;
  dispatch_sync(fObj, block);
  return v7;
}

uint64_t __28__CTCallCenter_currentCalls__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 32))
  {
    objc_msgSend((id)v2, "calculateCallStateChanges_sync:", 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = objc_msgSend(*(id *)(v2 + 24), "count");
  if (result)
    return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  return result;
}

- (void)setCurrentCalls:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__CTCallCenter_setCurrentCalls___block_invoke;
  v3[3] = &unk_1E1530FD0;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, v3);
}

void __32__CTCallCenter_setCurrentCalls___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = *(_QWORD *)(a1 + 32);
}

- (void)broadcastCallStateChangesIfNeededWithFailureLogMessage:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__CTCallCenter_broadcastCallStateChangesIfNeededWithFailureLogMessage___block_invoke;
  v3[3] = &unk_1E1530FD0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, v3);
}

void __71__CTCallCenter_broadcastCallStateChangesIfNeededWithFailureLogMessage___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD block[6];

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if ((objc_msgSend(*(id *)(a1 + 32), "calculateCallStateChanges_sync:", v2) & 1) != 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    {
      if (objc_msgSend(v2, "count"))
      {
        v3 = (void *)objc_msgSend(v2, "objectEnumerator");
        v4 = objc_msgSend(v3, "nextObject");
        if (v4)
        {
          v5 = MEMORY[0x1E0C809B0];
          do
          {
            v6 = *(_QWORD *)(a1 + 32);
            block[0] = v5;
            block[1] = 3221225472;
            block[2] = __71__CTCallCenter_broadcastCallStateChangesIfNeededWithFailureLogMessage___block_invoke_2;
            block[3] = &unk_1E1530FD0;
            block[4] = v6;
            block[5] = v4;
            dispatch_async(*(dispatch_queue_t *)(v6 + 16), block);
            v4 = objc_msgSend(v3, "nextObject");
          }
          while (v4);
        }
      }
    }
  }
  else
  {
    syslog(3, "%s", (const char *)objc_msgSend(*(id *)(a1 + 40), "UTF8String"));
  }

}

uint64_t __71__CTCallCenter_broadcastCallStateChangesIfNeededWithFailureLogMessage___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

- (NSString)description
{
  NSObject *fObj;
  _QWORD v4[5];
  _QWORD *v5;
  _QWORD block[6];
  NSString *v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__CTCallCenter_description__block_invoke;
  v4[3] = &unk_1E1531070;
  v4[4] = self;
  v5 = v4;
  fObj = self->_queue.fObj.fObj;
  v7 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIU13block_pointerFP8NSStringvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v7;
  block[5] = &v5;
  dispatch_sync(fObj, block);
  return v7;
}

uint64_t __27__CTCallCenter_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CTCallCenter(%p): {\n\tcurrentCalls: %@\tcallEventHandler: %p\n}\n"), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), objc_msgSend(*(id *)(a1 + 32), "callEventHandler"));
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CTCallCenter_callObserver_callChanged___block_invoke;
  block[3] = &unk_1E1531098;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, block);
}

void __41__CTCallCenter_callObserver_callChanged___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "handleCallStatusChange_sync:", *(_QWORD *)(a1 + 48));
  else
    syslog(3, "Error: Call Center is null. Dropping call update.");
}

- (CXCallObserver)callKitObserver
{
  return (CXCallObserver *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCallKitObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  NSObject *fObj;
  NSObject *v4;

  fObj = self->clientQueue.fObj.fObj;
  if (fObj)
    dispatch_release(fObj);
  v4 = self->_queue.fObj.fObj;
  if (v4)
    dispatch_release(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
