@implementation FCCacheCoordinatorGCDSerialLock

- (void)performReadSync:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_queue, a3);
}

- (FCCacheCoordinatorGCDSerialLock)init
{
  FCCacheCoordinatorGCDSerialLock *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCCacheCoordinatorGCDSerialLock;
  v2 = -[FCCacheCoordinatorGCDSerialLock init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("FCCacheCoordinatorGCDSerialLock.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)performWriteSync:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
