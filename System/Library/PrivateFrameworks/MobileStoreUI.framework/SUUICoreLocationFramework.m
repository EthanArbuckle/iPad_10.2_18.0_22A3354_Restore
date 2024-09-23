@implementation SUUICoreLocationFramework

void *__SUUICoreLocationFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 1);
  SUUICoreLocationFramework_sHandle = (uint64_t)result;
  return result;
}

@end
