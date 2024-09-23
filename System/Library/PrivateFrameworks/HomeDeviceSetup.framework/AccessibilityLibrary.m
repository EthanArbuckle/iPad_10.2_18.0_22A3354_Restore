@implementation AccessibilityLibrary

void *__AccessibilityLibrary_block_invoke()
{
  void *result;

  result = dlopen("/usr/lib/libAccessibility.dylib", 2);
  AccessibilityLibrary_sLib = (uint64_t)result;
  return result;
}

void *__AccessibilityLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/usr/lib/libAccessibility.dylib", 2);
  AccessibilityLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
