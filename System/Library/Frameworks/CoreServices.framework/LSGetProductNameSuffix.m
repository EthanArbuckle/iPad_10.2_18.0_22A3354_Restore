@implementation LSGetProductNameSuffix

CFStringRef ___LSGetProductNameSuffix_block_invoke()
{
  uint64_t v0;
  int v1;
  const __CFString *v2;
  CFStringRef result;

  if (_LSGetProductName(void)::onceToken != -1)
    dispatch_once(&_LSGetProductName(void)::onceToken, &__block_literal_global_108);
  v0 = _LSGetProductName(void)::_cfBundlePlatform;
  v1 = CFEqual((CFTypeRef)_LSGetProductName(void)::_cfBundlePlatform, CFSTR("ipod"));
  v2 = CFSTR("iphone");
  if (!v1)
    v2 = (const __CFString *)v0;
  result = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, CFSTR("~%@"), v2);
  _LSGetProductNameSuffix::suffix = (uint64_t)result;
  return result;
}

@end
