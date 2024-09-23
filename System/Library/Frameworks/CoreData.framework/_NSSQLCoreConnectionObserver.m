@implementation _NSSQLCoreConnectionObserver

- (void)dealloc
{
  int token;
  NSObject *queue;
  objc_super v5;

  token = self->_token;
  if (token != -1)
  {
    notify_cancel(token);
    self->_token = -1;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  objc_storeWeak((id *)&self->_core, 0);
  v5.receiver = self;
  v5.super_class = (Class)_NSSQLCoreConnectionObserver;
  -[_NSSQLCoreConnectionObserver dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_core);
}

@end
