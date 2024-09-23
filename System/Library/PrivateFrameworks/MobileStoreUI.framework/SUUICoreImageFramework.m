@implementation SUUICoreImageFramework

void *__SUUICoreImageFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreImage.framework/CoreImage", 1);
  SUUICoreImageFramework_sHandle = (uint64_t)result;
  return result;
}

@end
