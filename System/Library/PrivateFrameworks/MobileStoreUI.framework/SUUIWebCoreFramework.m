@implementation SUUIWebCoreFramework

void *__SUUIWebCoreFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/WebCore.framework/WebCore", 1);
  SUUIWebCoreFramework_sHandle = (uint64_t)result;
  return result;
}

@end
