@implementation _MFNetworkObserver

- (void)execute
{
  dispatch_async((dispatch_queue_t)self->_queue, self->_block);
}

- (_MFNetworkObserver)initWithBlock:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _MFNetworkObserver *v8;
  void *v9;
  id block;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_MFNetworkObserver;
  v8 = -[_MFNetworkObserver init](&v12, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v6);
    block = v8->_block;
    v8->_block = v9;

    objc_storeStrong((id *)&v8->_queue, a4);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
