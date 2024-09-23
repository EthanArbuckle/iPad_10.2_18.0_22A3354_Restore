@implementation CalCancellableSearch

- (CalCancellableSearch)initWithCancellationBlock:(id)a3
{
  id v4;
  CalCancellableSearch *v5;
  CalCancellableSearch *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CalCancellableSearch;
  v5 = -[CalCancellableSearch init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CalCancellableSearch setCancellationBlock:](v5, "setCancellationBlock:", v4);

  return v6;
}

- (void)cancel
{
  void *v3;
  void (**v4)(void);

  -[CalCancellableSearch cancellationBlock](self, "cancellationBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CalCancellableSearch cancellationBlock](self, "cancellationBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
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
