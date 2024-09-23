@implementation NFPendingPromise

- (NFPendingPromise)init
{
  NFPendingPromise *v2;
  NFPromise *v3;
  NFPendingPromise *v4;
  uint64_t v5;
  NFPromise *promise;
  _QWORD v8[4];
  NFPendingPromise *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NFPendingPromise;
  v2 = -[NFPendingPromise init](&v10, sel_init);
  if (v2)
  {
    v3 = [NFPromise alloc];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __24__NFPendingPromise_init__block_invoke;
    v8[3] = &unk_24CE71F88;
    v4 = v2;
    v9 = v4;
    v5 = -[NFPromise initWithResolver:](v3, "initWithResolver:", v8);
    promise = v4->_promise;
    v4->_promise = (NFPromise *)v5;

  }
  return v2;
}

void __24__NFPendingPromise_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = MEMORY[0x212BF7858](a2);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v6;

  v9 = MEMORY[0x212BF7858](v5);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v9;

}

- (NFPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
  objc_storeStrong((id *)&self->_promise, a3);
}

- (id)resolve
{
  return self->_resolve;
}

- (void)setResolve:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)reject
{
  return self->_reject;
}

- (void)setReject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reject, 0);
  objc_storeStrong(&self->_resolve, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

@end
