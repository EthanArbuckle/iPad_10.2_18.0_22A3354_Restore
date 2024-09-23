@implementation IDSDaemonResponseHandler

- (IDSDaemonResponseHandler)initWithBlock:(id)a3 queue:(id)a4
{
  return -[IDSDaemonResponseHandler initWithBlock:queue:isSync:](self, "initWithBlock:queue:isSync:", a3, a4, 0);
}

- (IDSDaemonResponseHandler)initWithBlock:(id)a3 queue:(id)a4 isSync:(BOOL)a5
{
  id v8;
  id v9;
  IDSDaemonResponseHandler *v10;
  IDSDaemonResponseHandler *v11;
  uint64_t v12;
  id block;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IDSDaemonResponseHandler;
  v10 = -[IDSDaemonResponseHandler init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a4);
    v12 = objc_msgSend(v8, "copy");
    block = v11->_block;
    v11->_block = (id)v12;

    v11->_isSync = a5;
  }

  return v11;
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isSync
{
  return self->_isSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
