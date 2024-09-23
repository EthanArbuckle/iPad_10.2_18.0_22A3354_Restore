@implementation CATBlockCancellable

- (CATBlockCancellable)init
{
  return -[CATBlockCancellable initWithCancellables:](self, "initWithCancellables:", MEMORY[0x24BDBD1A8]);
}

- (CATBlockCancellable)initWithCancellables:(id)a3
{
  void *v4;
  id v5;
  CATBlockCancellable *v6;
  _QWORD v8[4];
  id v9;

  v4 = (void *)objc_msgSend(a3, "copy");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__CATBlockCancellable_initWithCancellables___block_invoke;
  v8[3] = &unk_24C1C5A60;
  v9 = v4;
  v5 = v4;
  v6 = -[CATBlockCancellable initWithCancellationBlock:](self, "initWithCancellationBlock:", v8);

  return v6;
}

uint64_t __44__CATBlockCancellable_initWithCancellables___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cat_forEach:", &__block_literal_global_15);
}

uint64_t __44__CATBlockCancellable_initWithCancellables___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

- (CATBlockCancellable)initWithCancellationBlock:(id)a3
{
  id v4;
  CATBlockCancellable *v5;
  uint64_t v6;
  id cancellationBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATBlockCancellable;
  v5 = -[CATBlockCancellable init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x20BD10A78](v4);
    cancellationBlock = v5->_cancellationBlock;
    v5->_cancellationBlock = (id)v6;

  }
  return v5;
}

- (void)cancel
{
  void *v3;
  void (**v4)(void);

  -[CATBlockCancellable cancellationBlock](self, "cancellationBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CATBlockCancellable cancellationBlock](self, "cancellationBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    -[CATBlockCancellable setCancellationBlock:](self, "setCancellationBlock:", 0);
    v4[2]();

  }
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (void)setCancellationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationBlock, 0);
}

@end
