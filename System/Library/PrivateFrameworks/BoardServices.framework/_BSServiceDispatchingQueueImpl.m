@implementation _BSServiceDispatchingQueueImpl

- (id)backingQueueIfExists
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)assertBarrierOnQueue
{
  BSDispatchQueueAssertBarrier();
}

- (void)performAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void)performAsync:(id)a3 withHandoff:(id)a4
{
  xpc_dictionary_handoff_reply();
}

- (id)initWithQueue:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_BSServiceDispatchingQueueImpl;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

@end
