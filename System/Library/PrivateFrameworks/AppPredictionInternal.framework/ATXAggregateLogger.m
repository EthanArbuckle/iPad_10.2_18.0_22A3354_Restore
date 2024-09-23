@implementation ATXAggregateLogger

void __37___ATXAggregateLogger_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_36;
  sharedInstance__pasExprOnceResult_36 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
