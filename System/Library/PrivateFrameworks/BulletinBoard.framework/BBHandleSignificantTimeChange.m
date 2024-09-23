@implementation BBHandleSignificantTimeChange

void ___BBHandleSignificantTimeChange_block_invoke()
{
  void *v0;

  v0 = (void *)MEMORY[0x212B94804]();
  objc_msgSend((id)__server, "_handleSignificantTimeChange");
  objc_autoreleasePoolPop(v0);
}

@end
