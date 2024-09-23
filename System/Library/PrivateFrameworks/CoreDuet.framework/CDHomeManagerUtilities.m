@implementation CDHomeManagerUtilities

void __41___CDHomeManagerUtilities_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x193FEE914]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_4;
  sharedInstance__pasExprOnceResult_4 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
