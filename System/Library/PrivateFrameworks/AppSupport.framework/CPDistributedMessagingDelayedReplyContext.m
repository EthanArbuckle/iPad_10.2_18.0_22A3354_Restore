@implementation CPDistributedMessagingDelayedReplyContext

- (CPDistributedMessagingDelayedReplyContext)initWithReplyPort:(unsigned int)a3 portPassing:(BOOL)a4
{
  CPDistributedMessagingDelayedReplyContext *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPDistributedMessagingDelayedReplyContext;
  result = -[CPDistributedMessagingDelayedReplyContext init](&v7, sel_init);
  if (result)
  {
    result->_replyPort = a3;
    result->_portPassing = a4;
  }
  return result;
}

- (void)dealloc
{
  mach_port_name_t replyPort;
  objc_super v4;

  replyPort = self->_replyPort;
  if (replyPort + 1 >= 2)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], replyPort);
  v4.receiver = self;
  v4.super_class = (Class)CPDistributedMessagingDelayedReplyContext;
  -[CPDistributedMessagingDelayedReplyContext dealloc](&v4, sel_dealloc);
}

- (unsigned)replyPort
{
  return self->_replyPort;
}

- (void)setReplyPort:(unsigned int)a3
{
  self->_replyPort = a3;
}

- (BOOL)portPassing
{
  return self->_portPassing;
}

- (void)setPortPassing:(BOOL)a3
{
  self->_portPassing = a3;
}

@end
