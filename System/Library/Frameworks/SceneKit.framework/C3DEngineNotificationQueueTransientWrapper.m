@implementation C3DEngineNotificationQueueTransientWrapper

- (void)setEngineNotificationQueue:(__C3DEngineNotificationQueue *)a3
{
  objc_storeWeak(&self->_queue, a3);
}

- (__C3DEngineNotificationQueue)engineNotificationQueue
{
  return (__C3DEngineNotificationQueue *)objc_loadWeak(&self->_queue);
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->_queue, 0);
  v3.receiver = self;
  v3.super_class = (Class)C3DEngineNotificationQueueTransientWrapper;
  -[C3DEngineNotificationQueueTransientWrapper dealloc](&v3, sel_dealloc);
}

@end
