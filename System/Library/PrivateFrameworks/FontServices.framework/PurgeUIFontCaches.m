@implementation PurgeUIFontCaches

void *__PurgeUIFontCaches_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/UIFoundation.framework/UIFoundation", 1);
  if (result)
  {
    result = NSClassFromString(CFSTR("UIFont"));
    PurgeUIFontCaches_sUIFont = (uint64_t)result;
  }
  return result;
}

@end
