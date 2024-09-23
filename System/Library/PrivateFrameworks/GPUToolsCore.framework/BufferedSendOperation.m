@implementation BufferedSendOperation

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BufferedSendOperation;
  -[BufferedSendOperation dealloc](&v3, sel_dealloc);
}

- (DYTransportMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (DYTransportMessage)replyTo
{
  return self->_replyTo;
}

- (void)setReplyTo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (id)replyBlock
{
  return self->_replyBlock;
}

- (void)setReplyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
