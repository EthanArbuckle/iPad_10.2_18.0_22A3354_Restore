@implementation CNEmojiCharacterSet

void __CNEmojiCharacterSet_block_invoke()
{
  uint64_t v0;
  const void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (LoadCoreText_loadPredicate != -1)
    dispatch_once(&LoadCoreText_loadPredicate, &__block_literal_global_37);
  v0 = softLinkCTFontCreateWithName((uint64_t)CFSTR("AppleColorEmoji"), 0, 0.0);
  if (v0)
  {
    v1 = (const void *)v0;
    v5 = (id)softLinkCTFontCopyCharacterSet(v0);
    CFRelease(v1);
    v2 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v2, "removeCharactersInRange:", 0, 128);
    v3 = objc_msgSend(v2, "copy");
    v4 = (void *)CNEmojiCharacterSet_sEmoji;
    CNEmojiCharacterSet_sEmoji = v3;

  }
}

@end
