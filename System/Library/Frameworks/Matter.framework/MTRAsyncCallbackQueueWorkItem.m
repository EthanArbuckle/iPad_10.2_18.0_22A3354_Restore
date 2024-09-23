@implementation MTRAsyncCallbackQueueWorkItem

- (MTRAsyncCallbackQueueWorkItem)initWithQueue:(dispatch_queue_t)queue
{
  NSObject *v5;
  MTRAsyncCallbackQueueWorkItem *v6;
  MTRAsyncCallbackQueueWorkItem *v7;
  objc_super v9;

  v5 = queue;
  v9.receiver = self;
  v9.super_class = (Class)MTRAsyncCallbackQueueWorkItem;
  v6 = -[MTRAsyncCallbackQueueWorkItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_queue, queue);
  }

  return v7;
}

- (void)_invalidate
{
  id readyHandler;
  id cancelHandler;

  readyHandler = self->_readyHandler;
  self->_readyHandler = 0;

  cancelHandler = self->_cancelHandler;
  self->_cancelHandler = 0;

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend__invalidate(self, v4, v5);
  os_unfair_lock_unlock(p_lock);
}

- (void)markEnqueued
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_enqueued = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)setReadyHandler:(MTRAsyncCallbackReadyHandler)readyHandler
{
  void *v4;
  id v5;
  id v6;

  v6 = readyHandler;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_enqueued)
  {
    v4 = (void *)MEMORY[0x23493EEA8](v6);
    v5 = self->_readyHandler;
    self->_readyHandler = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)setCancelHandler:(dispatch_block_t)cancelHandler
{
  void *v4;
  id v5;
  id v6;

  v6 = cancelHandler;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_enqueued)
  {
    v4 = (void *)MEMORY[0x23493EEA8](v6);
    v5 = self->_cancelHandler;
    self->_cancelHandler = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)endWork
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;

  objc_msgSend_workQueue(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endWork_(v4, v5, (uint64_t)self);

  objc_msgSend_invalidate(self, v6, v7);
}

- (void)retryWork
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_workQueue(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_retryWork_(v5, v4, (uint64_t)self);

}

- (void)callReadyHandlerWithContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend_queue(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_234042F00;
  v9[3] = &unk_2504EE768;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x23493EEA8](self->_cancelHandler);
  objc_msgSend__invalidate(self, v5, v6);
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    objc_msgSend_queue(self, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_234043068;
    block[3] = &unk_2504F0208;
    v11 = v4;
    dispatch_async(v9, block);

  }
}

- (MTRAsyncCallbackReadyHandler)readyHandler
{
  return self->_readyHandler;
}

- (dispatch_block_t)cancelHandler
{
  return self->_cancelHandler;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (MTRAsyncCallbackWorkQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (BOOL)enqueued
{
  return self->_enqueued;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_readyHandler, 0);
}

@end
