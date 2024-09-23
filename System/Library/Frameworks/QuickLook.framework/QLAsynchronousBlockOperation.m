@implementation QLAsynchronousBlockOperation

- (QLAsynchronousBlockOperation)initWithBlock:(id)a3
{
  id v4;
  QLAsynchronousBlockOperation *v5;
  void *v6;
  id block;
  QLAsynchronousBlockOperation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLAsynchronousBlockOperation;
  v5 = -[QLAsynchronousBlockOperation init](&v10, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    block = v5->_block;
    v5->_block = v6;

    v8 = v5;
  }

  return v5;
}

- (void)main
{
  void (**block)(id, _QWORD *);
  id v4;
  _QWORD v5[5];

  if (-[QLAsynchronousBlockOperation isCancelled](self, "isCancelled"))
  {
    -[QLAsynchronousOperation finish](self, "finish");
  }
  else
  {
    block = (void (**)(id, _QWORD *))self->_block;
    if (block)
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __36__QLAsynchronousBlockOperation_main__block_invoke;
      v5[3] = &unk_24C724B00;
      v5[4] = self;
      block[2](block, v5);
      v4 = self->_block;
      self->_block = 0;

    }
  }
}

uint64_t __36__QLAsynchronousBlockOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
