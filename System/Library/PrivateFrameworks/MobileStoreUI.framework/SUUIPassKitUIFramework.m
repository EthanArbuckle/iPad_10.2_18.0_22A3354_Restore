@implementation SUUIPassKitUIFramework

void *__SUUIPassKitUIFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/PassKitUI.framework/PassKitUI", 1);
  SUUIPassKitUIFramework_sHandle = (uint64_t)result;
  return result;
}

@end
