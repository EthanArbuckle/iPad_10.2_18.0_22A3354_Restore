@implementation EmojiFoundationLibrary

void *__EmojiFoundationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/EmojiFoundation.framework/EmojiFoundation", 2);
  EmojiFoundationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
