@implementation __IOGCFastPathReader

- (void)dealloc
{
  IOGCFastPathReaderInterface **readerInterface;
  __CFAllocator *allocator;
  objc_super v5;

  kdebug_trace();
  readerInterface = self->readerInterface;
  if (readerInterface)
  {
    ((void (*)(IOGCFastPathReaderInterface **))(*readerInterface)->var3)(readerInterface);
    self->readerInterface = 0;
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
    v5.super_class = (Class)__IOGCFastPathReader;
    -[__IOGCFastPathReader dealloc](&v5, sel_dealloc);
  }
  kdebug_trace();
}

- (id)description
{
  IOGCFastPathReaderInterface **readerInterface;
  uint64_t (*var7)(void);
  __IOGCFastPathInputQueue *queue;
  unint64_t providerID;

  readerInterface = self->readerInterface;
  if (readerInterface)
  {
    if (*readerInterface)
    {
      var7 = (uint64_t (*)(void))(*readerInterface)->var7;
      if (var7)
        return (id)var7();
    }
  }
  queue = self->queue;
  if (queue)
  {
    providerID = queue->client->providerID;
    queue = (__IOGCFastPathInputQueue *)queue->queueID;
  }
  else
  {
    providerID = 0;
  }
  return +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("IOGCFastPathReader %#010llx / %#010llx"), providerID, queue);
}

@end
