@implementation IntelligencePlatformLibraryCore

uint64_t __IntelligencePlatformLibraryCore_block_invoke()
{
  uint64_t result;

  result = _sl_dlopen();
  IntelligencePlatformLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __IntelligencePlatformLibraryCore_block_invoke_0()
{
  uint64_t result;

  result = _sl_dlopen();
  IntelligencePlatformLibraryCore_frameworkLibrary_0 = result;
  return result;
}

@end
