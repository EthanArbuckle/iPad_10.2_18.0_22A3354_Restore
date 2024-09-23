@implementation BBPowerChanged

void ___BBPowerChanged_block_invoke()
{
  void *v0;

  v0 = (void *)MEMORY[0x212B94804]();
  objc_msgSend((id)__server, "_handleSystemSleep");
  objc_autoreleasePoolPop(v0);
}

void ___BBPowerChanged_block_invoke_2()
{
  void *v0;

  v0 = (void *)MEMORY[0x212B94804]();
  objc_msgSend((id)__server, "_handleSystemWake");
  objc_autoreleasePoolPop(v0);
}

@end
