@implementation SOAsynchronousBlockOperation

- (SOAsynchronousBlockOperation)initWithBlock:(id)a3
{
  id v4;
  SOAsynchronousBlockOperation *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOAsynchronousBlockOperation;
  v5 = -[SOAsynchronousOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x2199EB378](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (void)main
{
  void (**v3)(_QWORD, _QWORD);
  _QWORD v4[5];

  -[SOAsynchronousBlockOperation block](self, "block");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__SOAsynchronousBlockOperation_main__block_invoke;
  v4[3] = &unk_24D3EC258;
  v4[4] = self;
  ((void (**)(_QWORD, _QWORD *))v3)[2](v3, v4);

}

uint64_t __36__SOAsynchronousBlockOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

- (id)block
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
