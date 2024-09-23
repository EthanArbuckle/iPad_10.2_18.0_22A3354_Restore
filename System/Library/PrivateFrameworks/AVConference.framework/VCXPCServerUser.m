@implementation VCXPCServerUser

- (int)eventLogLevel
{
  return self->_eventLogLevel;
}

- (OS_dispatch_queue)queue
{
  return self->queue;
}

- (id)block
{
  return self->block;
}

- (VCXPCServerUser)init
{
  VCXPCServerUser *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCXPCServerUser;
  result = -[VCXPCServerUser init](&v3, sel_init);
  if (result)
    result->_eventLogLevel = 7;
  return result;
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
  v4.super_class = (Class)VCXPCServerUser;
  -[VCXPCServerUser dealloc](&v4, sel_dealloc);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setEventLogLevel:(int)a3
{
  self->_eventLogLevel = a3;
}

@end
