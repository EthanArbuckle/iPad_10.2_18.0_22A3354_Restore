@implementation SUUIMPUFoundationFramework

void *__SUUIMPUFoundationFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MPUFoundation.framework/MPUFoundation", 1);
  SUUIMPUFoundationFramework_sHandle = (uint64_t)result;
  return result;
}

@end
