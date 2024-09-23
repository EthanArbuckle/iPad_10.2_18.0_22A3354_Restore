@implementation DASessionInternal

- (DASessionInternal)initWithDelegate:(id)a3
{
  id v4;
  DASessionInternal *v5;
  DASessionInternal *v6;
  const char *ClassName;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *callbackQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DASessionInternal;
  v5 = -[DASessionInternal init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_delegate, v4);
    ClassName = object_getClassName(v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(ClassName, v8);
    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v9;

    dispatch_suspend((dispatch_object_t)v6->_callbackQueue);
    v6->_isCallbackQueueSuspended = 1;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  OS_dispatch_queue *callbackQueue;
  NSXPCProxyCreating *proxy;
  objc_super v9;

  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASessionInternal dealloc]", 49, CFSTR("Internal released"), v2, v3, v4, v5, (uint64_t)v9.receiver);
  -[DASessionInternal resume](self, "resume");
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0;

  proxy = self->_proxy;
  self->_proxy = 0;

  v9.receiver = self;
  v9.super_class = (Class)DASessionInternal;
  -[DASessionInternal dealloc](&v9, sel_dealloc);
}

- (void)dispatchBlockOnCallback:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *callbackQueue;
  uint64_t v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  v9 = v4;
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__DASessionInternal_dispatchBlockOnCallback___block_invoke;
    block[3] = &unk_24C327498;
    v13 = v4;
    dispatch_async(callbackQueue, block);

  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DASessionInternal dispatchBlockOnCallback:]", 62, CFSTR("Invalid callback queue"), v5, v6, v7, v8, v11);
  }

}

uint64_t __45__DASessionInternal_dispatchBlockOnCallback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)closeProxy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSXPCProxyCreating *proxy;
  uint64_t v8;

  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[DASessionInternal closeProxy]", 68, &stru_24C3287B0, v2, v3, v4, v5, v8);
  proxy = self->_proxy;
  self->_proxy = 0;

}

- (id)proxy
{
  DASessionInternal *v2;
  NSXPCProxyCreating *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_proxy;
  objc_sync_exit(v2);

  return v3;
}

- (void)setProxy:(id)a3
{
  DASessionInternal *v5;
  NSXPCProxyCreating *v6;

  v6 = (NSXPCProxyCreating *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_proxy != v6)
    objc_storeStrong((id *)&v5->_proxy, a3);
  objc_sync_exit(v5);

  -[DASessionInternal resume](v5, "resume");
}

- (void)resume
{
  if (self->_isCallbackQueueSuspended)
  {
    dispatch_resume((dispatch_object_t)self->_callbackQueue);
    self->_isCallbackQueueSuspended = 0;
  }
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[DASessionInternal proxy](self, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DASessionInternal synchronousRemoteObjectProxyWithErrorHandler:]", 105, CFSTR("Failed to get remote proxy"), v7, v8, v9, v10, v16);
    v11 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DAErrorString(216));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("DigitalAccessError"), 216, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v14);

  }
  return v6;
}

- (BOOL)isFirstInQueue
{
  return self->_isFirstInQueue;
}

- (void)setIsFirstInQueue:(BOOL)a3
{
  self->_isFirstInQueue = a3;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
