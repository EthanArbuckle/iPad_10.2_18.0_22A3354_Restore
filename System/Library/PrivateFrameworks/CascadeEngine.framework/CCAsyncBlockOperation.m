@implementation CCAsyncBlockOperation

- (CCAsyncBlockOperation)initWithAsyncOperationBlock:(id)a3
{
  id v4;
  CCAsyncBlockOperation *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCAsyncBlockOperation;
  v5 = -[CCAsyncBlockOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v5->_executing = 0;
    v5->_finished = 0;
  }

  return v5;
}

- (void)start
{
  void (**v3)(_QWORD, _QWORD);
  _QWORD v4[5];

  if ((-[CCAsyncBlockOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[CCAsyncBlockOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = 1;
    -[CCAsyncBlockOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[CCAsyncBlockOperation block](self, "block");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __30__CCAsyncBlockOperation_start__block_invoke;
    v4[3] = &unk_25098A6F0;
    v4[4] = self;
    ((void (**)(_QWORD, _QWORD *))v3)[2](v3, v4);

  }
}

uint64_t __30__CCAsyncBlockOperation_start__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isExecuting"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 249) = 0;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isExecuting"));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isFinished"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 250) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isFinished"));
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
