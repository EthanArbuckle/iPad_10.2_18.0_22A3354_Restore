@implementation __IOGCFastPathControlQueue

- (void)dealloc
{
  IOGCFastPathControlQueueInterface **queueInterface;
  __CFAllocator *allocator;
  objc_super v5;

  queueInterface = self->queueInterface;
  if (queueInterface)
  {
    (*((void (**)(IOGCFastPathControlQueueInterface **, SEL))*queueInterface + 3))(queueInterface, a2);
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
    v5.receiver = self;
    v5.super_class = (Class)__IOGCFastPathControlQueue;
    -[__IOGCFastPathControlQueue dealloc](&v5, sel_dealloc);
  }
}

- (id)description
{
  IOGCFastPathControlQueueInterface **queueInterface;
  uint64_t (*v4)(void);
  objc_super v6;

  queueInterface = self->queueInterface;
  if (queueInterface)
  {
    if (*queueInterface)
    {
      v4 = (uint64_t (*)(void))*((_QWORD *)*queueInterface + 5);
      if (v4)
        return (id)v4();
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)__IOGCFastPathControlQueue;
  return -[__IOGCFastPathControlQueue description](&v6, sel_description);
}

@end
