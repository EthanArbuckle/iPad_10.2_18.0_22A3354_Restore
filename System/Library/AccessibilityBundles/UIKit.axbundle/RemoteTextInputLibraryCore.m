@implementation RemoteTextInputLibraryCore

uint64_t __RemoteTextInputLibraryCore_block_invoke()
{
  uint64_t result;

  result = _sl_dlopen();
  RemoteTextInputLibraryCore_frameworkLibrary = result;
  return result;
}

@end
