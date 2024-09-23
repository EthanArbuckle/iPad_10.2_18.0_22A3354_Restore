@implementation NRMockXPCProxy

- (uint64_t)initWithBlahBlahBlahTarget:(void *)a3 queue:(char)a4 async:
{
  id v8;
  id v9;

  v8 = a3;
  if (a1)
  {
    objc_storeWeak((id *)(a1 + 24), a2);
    objc_storeStrong((id *)(a1 + 8), a3);
    *(_BYTE *)(a1 + 16) = a4;
    v9 = (id)a1;
  }

  return a1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_msgSend(WeakRetained, "methodSignatureForSelector:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  NSObject *queue;
  id *v6;
  NSObject *v7;
  _QWORD v8[4];
  _QWORD v9[2];
  _QWORD block[4];
  _QWORD v11[2];
  _QWORD v12[5];
  id WeakRetained;

  v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy_;
  v12[4] = __Block_byref_object_dispose_;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  if (self->_async)
  {
    objc_msgSend(v4, "retainArguments");
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__NRMockXPCProxy_forwardInvocation___block_invoke;
    block[3] = &unk_1E4494F20;
    v6 = (id *)v11;
    v11[0] = v4;
    v11[1] = v12;
    dispatch_async(queue, block);
  }
  else
  {
    v7 = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__NRMockXPCProxy_forwardInvocation___block_invoke_2;
    v8[3] = &unk_1E4494F20;
    v6 = (id *)v9;
    v9[0] = v4;
    v9[1] = v12;
    dispatch_sync(v7, v8);
  }

  _Block_object_dispose(v12, 8);
}

uint64_t __36__NRMockXPCProxy_forwardInvocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __36__NRMockXPCProxy_forwardInvocation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
