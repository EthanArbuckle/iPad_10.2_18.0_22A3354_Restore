@implementation AMSDispatchAsyncGlobal

uint64_t __AMSDispatchAsyncGlobal_block_invoke(uint64_t a1)
{
  id v2;

  v2 = AMSSetLogKey(*(void **)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
