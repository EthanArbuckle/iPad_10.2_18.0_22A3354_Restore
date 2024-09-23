@implementation INImageProxyInjectionOperation

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

void __39__INImageProxyInjectionOperation_start__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void (**v6)(void);
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isExecuting"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 249) = 0;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isExecuting"));
  objc_msgSend(*(id *)(a1 + 32), "copyReturnBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "copyReturnBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("isFinished"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 248) = 1;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("isFinished"));
  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

- (id)copyReturnBlock
{
  return self->_copyReturnBlock;
}

- (void)setInjector:(id)a3
{
  objc_storeStrong((id *)&self->_injector, a3);
}

- (void)setImageProxyRequestBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setCopyReturnBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)start
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  self->_isExecuting = 1;
  -[INImageProxyInjectionOperation injector](self, "injector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INImageProxyInjectionOperation imageProxyRequestBlock](self, "imageProxyRequestBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__INImageProxyInjectionOperation_start__block_invoke;
  v5[3] = &unk_1E22924C0;
  v5[4] = self;
  objc_msgSend(v3, "_injectProxiesForImages:completion:", v4, v5);

}

- (INImageProxyInjecting)injector
{
  return self->_injector;
}

- (id)imageProxyRequestBlock
{
  return self->_imageProxyRequestBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_copyReturnBlock, 0);
  objc_storeStrong(&self->_imageProxyRequestBlock, 0);
  objc_storeStrong((id *)&self->_injector, 0);
}

- (BOOL)isAsynchronous
{
  return 1;
}

@end
