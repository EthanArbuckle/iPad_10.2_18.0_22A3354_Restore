@implementation XPCClientUser

- (int)eventLogLevel
{
  return self->_eventLogLevel;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setEventLogLevel:(int)a3
{
  self->_eventLogLevel = a3;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (XPCClientUser)init
{
  XPCClientUser *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)XPCClientUser;
  result = -[XPCClientUser init](&v3, sel_init);
  if (result)
    result->_eventLogLevel = 7;
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->queue;
}

- (id)block
{
  return self->block;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  queue = self->queue;
  if (queue)
    dispatch_release(queue);

  v4.receiver = self;
  v4.super_class = (Class)XPCClientUser;
  -[XPCClientUser dealloc](&v4, sel_dealloc);
}

@end
