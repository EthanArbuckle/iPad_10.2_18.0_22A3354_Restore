@implementation AMSHashAndLogCacheMisses

void __AMSHashAndLogCacheMisses_block_invoke()
{
  AMSLRUCache *v0;
  void *v1;

  v0 = -[AMSLRUCache initWithMaxSize:]([AMSLRUCache alloc], "initWithMaxSize:", 25);
  v1 = (void *)qword_1ECEAD2D8;
  qword_1ECEAD2D8 = (uint64_t)v0;

}

@end
