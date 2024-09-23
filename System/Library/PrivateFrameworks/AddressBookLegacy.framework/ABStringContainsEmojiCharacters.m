@implementation ABStringContainsEmojiCharacters

void ___ABStringContainsEmojiCharacters_block_invoke()
{
  uint64_t (*v0)(const __CFString *, _QWORD, double);
  uint64_t (*v1)(void);
  uint64_t v2;
  const void *v3;
  void *v4;
  void *v5;
  void *__handle;

  __handle = 0;
  +[ABDynamicLoader loadFrameworkAtPath:andStoreHandle:bundle:](ABDynamicLoader, "loadFrameworkAtPath:andStoreHandle:bundle:", CFSTR("/System/Library/Frameworks/CoreText.framework/CoreText"), &__handle, 0);
  v0 = (uint64_t (*)(const __CFString *, _QWORD, double))dlsym(__handle, "CTFontCreateWithName");
  v1 = (uint64_t (*)(void))dlsym(__handle, "CTFontCopyCharacterSet");
  v2 = v0(CFSTR("AppleColorEmoji"), 0, 0.0);
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (void *)v1();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "removeCharactersInRange:", 0, 128);

    CFRelease(v3);
    _ABStringContainsEmojiCharacters___emojiSet = (uint64_t)v5;
  }
}

@end
