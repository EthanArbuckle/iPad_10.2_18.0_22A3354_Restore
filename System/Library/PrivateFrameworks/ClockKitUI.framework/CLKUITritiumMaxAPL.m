@implementation CLKUITritiumMaxAPL

uint64_t __CLKUITritiumMaxAPL_block_invoke()
{
  const char *v0;

  v0 = (const char *)objc_msgSend(CFSTR("com.apple.NanoTimeKit.MaxAPLChanged"), "UTF8String");
  return notify_register_dispatch(v0, (int *)&CLKUITritiumMaxAPL_notifyToken, MEMORY[0x1E0C80D38], &__block_literal_global_3);
}

void __CLKUITritiumMaxAPL_block_invoke_2()
{
  _MergedGlobals = 0;
}

@end
