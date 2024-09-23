@implementation HMNetworkConnection

void __46___HMNetworkConnection_setPathChangedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _HMNetworkPath *v4;

  v3 = a2;
  v4 = -[_HMNetworkPath initWithNwPath:]([_HMNetworkPath alloc], "initWithNwPath:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
