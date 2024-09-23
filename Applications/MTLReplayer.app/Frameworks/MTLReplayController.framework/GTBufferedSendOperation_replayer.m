@implementation GTBufferedSendOperation_replayer

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTBufferedSendOperation_replayer;
  -[GTBufferedSendOperation_replayer dealloc](&v3, "dealloc");
}

- (GTTransportMessage_replayer)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (GTTransportMessage_replayer)replyTo
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
  self->_replyBlock = a3;
}

@end
