@implementation IMAPLibraryCore

uint64_t __IMAPLibraryCore_block_invoke()
{
  uint64_t result;

  result = _sl_dlopen();
  IMAPLibraryCore_frameworkLibrary = result;
  return result;
}

@end
