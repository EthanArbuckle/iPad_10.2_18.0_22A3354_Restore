@implementation SUUIPassKitCoreFramework

void *__SUUIPassKitCoreFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PassKitCore.framework/PassKitCore", 1);
  SUUIPassKitCoreFramework_sHandle = (uint64_t)result;
  return result;
}

@end
