@implementation MSVCallback

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)block
{
  return self->_block;
}

+ (id)callbackWithQueue:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  MSVCallback *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MSVCallback);
  -[MSVCallback setBlock:](v7, "setBlock:", v6);

  if (v5)
  {
    -[MSVCallback setQueue:](v7, "setQueue:", v5);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVCallback setQueue:](v7, "setQueue:", v8);

  }
  return v7;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)invoke
{
  id v3;
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = self->_block;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AFBD28](v3, a2);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __21__MSVCallback_invoke__block_invoke;
    block[3] = &unk_1E43E9ED0;
    v8 = v4;
    v6 = v4;
    dispatch_async(queue, block);

  }
}

- (void)invokeWithObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  if (self->_block)
  {
    v5 = (void *)MEMORY[0x1A1AFBD28]();
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__MSVCallback_invokeWithObject___block_invoke;
    v8[3] = &unk_1E43E9EF8;
    v10 = v5;
    v9 = v4;
    v7 = v5;
    dispatch_async(queue, v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

uint64_t __32__MSVCallback_invokeWithObject___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __21__MSVCallback_invoke__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
