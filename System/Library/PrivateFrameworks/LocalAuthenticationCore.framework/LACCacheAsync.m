@implementation LACCacheAsync

- (LACCacheAsync)initWithTimeout:(double)a3 block:(id)a4
{
  id v6;
  LACCacheAsync *v7;
  void *v8;
  id block;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LACCacheAsync;
  v7 = -[LACCache initWithTimeout:](&v11, sel_initWithTimeout_, a3);
  if (v7)
  {
    v8 = _Block_copy(v6);
    block = v7->_block;
    v7->_block = v8;

  }
  return v7;
}

- (void)valueWithParameter:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void (**block)(id, id, _QWORD *);
  _QWORD v10[4];
  id v11;
  void (**v12)(id, void *, _QWORD);
  id v13;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[LACCache cachedValueWithParameter:](self, "cachedValueWithParameter:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    block = (void (**)(id, id, _QWORD *))self->_block;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__LACCacheAsync_valueWithParameter_completion___block_invoke;
    v10[3] = &unk_2510C2710;
    objc_copyWeak(&v13, &location);
    v11 = v6;
    v12 = v7;
    block[2](block, v11, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __47__LACCacheAsync_valueWithParameter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setCachedValue:withParameter:", v8, *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
