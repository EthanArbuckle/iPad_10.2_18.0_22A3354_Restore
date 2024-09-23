@implementation DYTransportSource

- (DYTransportSource)init
{
  -[DYTransportSource doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)_initWithQueue:(id)a3 transport:(id)a4
{
  DYTransportSource *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *queue;
  _QWORD block[5];
  objc_super v14;

  if (!a3)
    dy_abort("queue cannot be NULL", a2, 0, a4);
  if (!a4)
    dy_abort("transport cannot be nil", a2);
  v14.receiver = self;
  v14.super_class = (Class)DYTransportSource;
  v6 = -[DYTransportSource init](&v14, sel_init);
  if (v6)
  {
    v6->_transport = (DYTransport *)a4;
    v7 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v6)), v6, CFSTR("manager")), "UTF8String");
    v8 = dispatch_queue_create_with_target_V2(v7, 0, (dispatch_queue_t)a3);
    v6->_queue = (OS_dispatch_queue *)v8;
    dispatch_suspend(v8);
    v9 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v6)), v6, CFSTR("message")), "UTF8String");
    v10 = dispatch_queue_create_with_target_V2(v9, 0, (dispatch_queue_t)a3);
    v6->_mqueue = (OS_dispatch_queue *)v10;
    dispatch_suspend(v10);
    queue = v6->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__DYTransportSource__initWithQueue_transport___block_invoke;
    block[3] = &unk_250D62318;
    block[4] = v6;
    dispatch_async(queue, block);
  }
  return v6;
}

void __46__DYTransportSource__initWithQueue_transport___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_register");
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)dealloc
{
  NSObject *mqueue;
  NSObject *queue;
  objc_super v5;

  mqueue = self->_mqueue;
  if (mqueue)
  {
    dispatch_release(mqueue);
    self->_mqueue = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DYTransportSource;
  -[DYTransportSource dealloc](&v5, sel_dealloc);
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_queue);
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_queue);
}

- (void)cancel
{
  int *p_state;
  unsigned int v4;
  NSObject *queue;
  _QWORD block[5];

  p_state = &self->_state;
  do
    v4 = __ldaxr((unsigned int *)p_state);
  while (__stlxr(v4 | 1, (unsigned int *)p_state));
  if ((v4 & 1) == 0)
  {
    dispatch_suspend((dispatch_object_t)self->_mqueue);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__DYTransportSource_cancel__block_invoke;
    block[3] = &unk_250D62318;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __27__DYTransportSource_cancel__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancel");
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
}

- (BOOL)cancelled
{
  char v2;

  __dmb(0xBu);
  v2 = atomic_load((unsigned int *)&self->_state);
  return v2 & 1;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  uint64_t v4;
  NSObject *queue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "copy");
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__DYTransportSource_setMessageHandler___block_invoke;
  v6[3] = &unk_250D62AF8;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

void __39__DYTransportSource_setMessageHandler___block_invoke(uint64_t a1)
{
  char v1;

  v1 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(a1 + 40);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  }
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  uint64_t v4;
  NSObject *queue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "copy");
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__DYTransportSource_setCancellationHandler___block_invoke;
  v6[3] = &unk_250D62AF8;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

void __44__DYTransportSource_setCancellationHandler___block_invoke(uint64_t a1)
{
  char v1;

  v1 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 40);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  }
}

- (id)registrationHandler
{
  return self->_registrationHandler;
}

- (void)setRegistrationHandler:(id)a3
{
  uint64_t v4;
  NSObject *queue;
  _QWORD v6[6];

  v4 = objc_msgSend(a3, "copy");
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__DYTransportSource_setRegistrationHandler___block_invoke;
  v6[3] = &unk_250D62AF8;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

void __44__DYTransportSource_setRegistrationHandler___block_invoke(uint64_t a1)
{
  char v1;
  uint64_t v3;
  char v4;
  NSObject *v5;
  _QWORD block[5];

  v1 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 56));
  if ((v1 & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v3 + 24))
    {
      v4 = atomic_load((unsigned int *)(v3 + 56));
      v3 = *(_QWORD *)(a1 + 32);
      if ((v4 & 2) != 0)
      {
        v5 = *(NSObject **)(v3 + 40);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __44__DYTransportSource_setRegistrationHandler___block_invoke_2;
        block[3] = &unk_250D62318;
        block[4] = v3;
        dispatch_async(v5, block);
        v3 = *(_QWORD *)(a1 + 32);
      }
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 40);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  }
}

uint64_t __44__DYTransportSource_setRegistrationHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callRegistrationHandler");
}

- (void)_callRegistrationHandler
{
  char v2;
  void (**registrationHandler)(id, SEL);

  v2 = atomic_load((unsigned int *)&self->_state);
  if ((v2 & 1) == 0)
  {
    registrationHandler = (void (**)(id, SEL))self->_registrationHandler;
    if (registrationHandler)
    {
      registrationHandler[2](registrationHandler, a2);

      self->_registrationHandler = 0;
    }
  }
}

- (void)_register
{
  int *p_state;
  char v3;
  unsigned int v5;
  NSObject *mqueue;
  _QWORD block[5];

  p_state = &self->_state;
  v3 = atomic_load((unsigned int *)&self->_state);
  if ((v3 & 1) == 0)
  {
    if (-[DYTransport _activateSource:](self->_transport, "_activateSource:", self))
    {
      do
        v5 = __ldaxr((unsigned int *)p_state);
      while (__stlxr(v5 | 2, (unsigned int *)p_state));
      mqueue = self->_mqueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __30__DYTransportSource__register__block_invoke;
      block[3] = &unk_250D62318;
      block[4] = self;
      dispatch_async(mqueue, block);
    }
    else
    {
      -[DYTransportSource cancel](self, "cancel");
    }
  }
}

uint64_t __30__DYTransportSource__register__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callRegistrationHandler");
}

- (void)_callCancellationHandler
{
  void (**cancellationHandler)(id, SEL);

  cancellationHandler = (void (**)(id, SEL))self->_cancellationHandler;
  if (cancellationHandler)
  {
    cancellationHandler[2](cancellationHandler, a2);

    self->_cancellationHandler = 0;
  }

  self->_transport = 0;
}

- (void)_cancel
{
  NSObject *mqueue;
  _QWORD block[5];

  -[DYTransport _cancelSource:](self->_transport, "_cancelSource:", self);

  self->_messageHandler = 0;
  self->_registrationHandler = 0;
  mqueue = self->_mqueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__DYTransportSource__cancel__block_invoke;
  block[3] = &unk_250D62318;
  block[4] = self;
  dispatch_async(mqueue, block);
}

uint64_t __28__DYTransportSource__cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callCancellationHandler");
}

- (void)_dispatch:(id)a3
{
  NSObject *mqueue;
  _QWORD v4[6];

  mqueue = self->_mqueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__DYTransportSource__dispatch___block_invoke;
  v4[3] = &unk_250D622A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mqueue, v4);
}

uint64_t __31__DYTransportSource__dispatch___block_invoke(uint64_t result)
{
  char v1;
  uint64_t v2;

  v1 = atomic_load((unsigned int *)(*(_QWORD *)(result + 32) + 56));
  if ((v1 & 1) == 0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    if (v2)
      return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(*(_QWORD *)(result + 32) + 8), *(_QWORD *)(result + 40));
  }
  return result;
}

- (DYTransport)transport
{
  return self->_transport;
}

@end
