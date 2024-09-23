@implementation AXCurrentRootLooksLikeBNI

void __AXCurrentRootLooksLikeBNI_block_invoke()
{
  int v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries"), "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v8, "hasPrefix:", CFSTR("AccessibilityFrameworks-"));
  v1 = v8;
  if (v0)
  {
    v2 = objc_msgSend(v8, "rangeOfString:", CFSTR("AccessibilityFrameworks-"));
    objc_msgSend(v8, "substringFromIndex:", v2 + v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("1234567890.-"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invertedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      AXCurrentRootLooksLikeBNI_looksLikeBNI = 1;

    v1 = v8;
  }

}

@end
