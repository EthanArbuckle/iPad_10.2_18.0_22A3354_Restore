@implementation EmojiFoundationLibraryCore

uint64_t __EmojiFoundationLibraryCore_block_invoke()
{
  uint64_t result;

  result = _sl_dlopen();
  EmojiFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

@end
