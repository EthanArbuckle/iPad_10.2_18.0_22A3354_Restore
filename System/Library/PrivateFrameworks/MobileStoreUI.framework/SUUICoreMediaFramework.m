@implementation SUUICoreMediaFramework

void *__SUUICoreMediaFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 1);
  SUUICoreMediaFramework_sHandle = (uint64_t)result;
  return result;
}

@end
