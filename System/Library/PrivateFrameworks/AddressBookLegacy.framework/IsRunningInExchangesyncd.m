@implementation IsRunningInExchangesyncd

uint64_t __IsRunningInExchangesyncd_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(CFSTR("com.apple.exchangesyncd"), "isEqualToString:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"));
  if ((_DWORD)result)
    IsRunningInExchangesyncd_isRunningInExchangesyncd = 1;
  return result;
}

@end
