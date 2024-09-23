@implementation _COMediaSystemLeaderObserver

- (_COMediaSystemLeaderObserver)initWithDispatchQueue:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  _COMediaSystemLeaderObserver *v9;
  _COMediaSystemLeaderObserver *v10;
  uint64_t v11;
  id block;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_COMediaSystemLeaderObserver;
  v9 = -[_COMediaSystemLeaderObserver init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    v11 = objc_msgSend(v8, "copy");
    block = v10->_block;
    v10->_block = (id)v11;

  }
  return v10;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
