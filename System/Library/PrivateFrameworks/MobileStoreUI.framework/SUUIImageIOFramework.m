@implementation SUUIImageIOFramework

void *__SUUIImageIOFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ImageIO.framework/ImageIO", 1);
  SUUIImageIOFramework_sHandle = (uint64_t)result;
  return result;
}

@end
