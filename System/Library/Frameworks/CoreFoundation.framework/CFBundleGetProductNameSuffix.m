@implementation CFBundleGetProductNameSuffix

CFStringRef ___CFBundleGetProductNameSuffix_block_invoke()
{
  uint64_t v0;
  int v1;
  const __CFString *v2;
  CFStringRef result;

  if (_CFGetProductName_onceToken != -1)
    dispatch_once(&_CFGetProductName_onceToken, &__block_literal_global_46);
  v0 = _CFGetProductName__cfBundlePlatform;
  v1 = CFEqual((CFTypeRef)_CFGetProductName__cfBundlePlatform, CFSTR("ipod"));
  v2 = CFSTR("iphone");
  if (!v1)
    v2 = (const __CFString *)v0;
  result = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("~%@"), v2);
  _CFBundleGetProductNameSuffix__cfBundlePlatformSuffix = (uint64_t)result;
  return result;
}

@end
