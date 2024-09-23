@implementation AMSDispatchAsync

uint64_t __AMSDispatchAsync_block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)AMSSetLogKey();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
