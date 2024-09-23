@implementation SUUICoreTelephonyFramework

void *__SUUICoreTelephonyFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 1);
  SUUICoreTelephonyFramework_sHandle = (uint64_t)result;
  return result;
}

@end
