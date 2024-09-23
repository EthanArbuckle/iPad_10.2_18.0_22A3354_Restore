@implementation NRBypassQueue

- (void)resume
{
  os_unfair_lock_s *p_lock;
  NRBypassQueue *v3;

  p_lock = &self->_lock;
  v3 = self;
  os_unfair_lock_lock_with_options();
  if (v3->_suspended)
  {
    v3->_suspended = 0;
    dispatch_resume((dispatch_object_t)v3->_suspendableQueue);
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)suspend
{
  os_unfair_lock_s *p_lock;
  NRBypassQueue *v3;

  p_lock = &self->_lock;
  v3 = self;
  os_unfair_lock_lock_with_options();
  if (!v3->_suspended)
  {
    v3->_suspended = 1;
    dispatch_suspend((dispatch_object_t)v3->_suspendableQueue);
  }
  os_unfair_lock_unlock(p_lock);

}

- (NRBypassQueue)init
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NRBypassQueue;
  v2 = -[NRBypassQueue init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.nanoregistry.bypass.queue", v3);
    v5 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v4;

    v6 = dispatch_queue_create_with_target_V2("com.apple.nanoregistry.suspendable.queue", v3, *((dispatch_queue_t *)v2 + 2));
    v7 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v6;

    *((_DWORD *)v2 + 7) = 0;
  }
  return (NRBypassQueue *)v2;
}

- (void)enqueueBlock:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_suspendableQueue, a3);
}

- (void)enqueueBypassBlockAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_bypassQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bypassQueue, 0);
  objc_storeStrong((id *)&self->_suspendableQueue, 0);
}

- (void)enqueueBlockAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_suspendableQueue, a3);
}

- (void)enqueueBypassBlock:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_bypassQueue, a3);
}

@end
