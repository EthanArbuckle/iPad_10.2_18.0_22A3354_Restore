@implementation NSCharacterSet(EMFEmojiExtras)

+ (id)_emojiCharacterSet
{
  if (_emojiCharacterSet___onceToken != -1)
    dispatch_once(&_emojiCharacterSet___onceToken, &__block_literal_global_10);
  return (id)_emojiCharacterSet___emojiCharacterSet;
}

@end
