@implementation __IOGCFastPathInputQueue

- (void)dealloc
{
  id cancelHandler;
  NSObject *queue;
  IOGCFastPathInputQueueInterface **queueInterface;
  __CFAllocator *allocator;
  objc_super v7;

  kdebug_trace();
  if (self->_dispatchMach)
  {
    dispatch_mach_cancel();
    dispatch_release((dispatch_object_t)self->_dispatchMach);
    self->_dispatchMach = 0;
  }
  cancelHandler = self->_cancelHandler;
  if (cancelHandler)
  {
    _Block_release(cancelHandler);
    self->_cancelHandler = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  queueInterface = self->queueInterface;
  if (queueInterface)
  {
    ((void (*)(IOGCFastPathInputQueueInterface **))(*queueInterface)->var3)(queueInterface);
    self->queueInterface = 0;
  }

  allocator = self->allocator;
  if (allocator)
  {
    objc_destructInstance(self);
    CFAllocatorDeallocate(allocator, self);
    CFRelease(allocator);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)__IOGCFastPathInputQueue;
    -[__IOGCFastPathInputQueue dealloc](&v7, sel_dealloc);
  }
  kdebug_trace();
}

- (id)description
{
  IOGCFastPathInputQueueInterface **queueInterface;
  uint64_t (*var7)(IOGCFastPathInputQueueInterface **, SEL);
  __IOGCFastPathClient *client;

  queueInterface = self->queueInterface;
  if (queueInterface)
  {
    if (*queueInterface)
    {
      var7 = (uint64_t (*)(IOGCFastPathInputQueueInterface **, SEL))(*queueInterface)->var7;
      if (var7)
        return (id)var7(self->queueInterface, a2);
    }
  }
  client = self->client;
  if (client)
    client = (__IOGCFastPathClient *)client->providerID;
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("IOGCFastPathInputQueue %#010llx / %#010llx"), client, self->queueID);
}

@end
