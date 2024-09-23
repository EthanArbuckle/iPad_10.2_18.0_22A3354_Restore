@implementation SUUISocialFramework

void *__SUUISocialFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/Social.framework/Social", 1);
  SUUISocialFramework_sHandle = (uint64_t)result;
  return result;
}

@end
