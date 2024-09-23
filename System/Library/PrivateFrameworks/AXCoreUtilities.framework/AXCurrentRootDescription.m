@implementation AXCurrentRootDescription

void __AXCurrentRootDescription_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries"), "lastPathComponent");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&AXCurrentRootDescription_rootDescription, v12);
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("Accessibility")))
  {
    v0 = (void *)AXCurrentRootDescription_rootDescription;
    AXCurrentRootDescription_rootDescription = (uint64_t)CFSTR("Release Root");

  }
  if (AXCurrentRootLooksLikeBNI_onceToken != -1)
    dispatch_once(&AXCurrentRootLooksLikeBNI_onceToken, &__block_literal_global_217);
  if (AXCurrentRootLooksLikeBNI_looksLikeBNI == 1)
  {
    v1 = v12;
    v2 = (void *)AXCurrentRootDescription_rootDescription;
    AXCurrentRootDescription_rootDescription = (uint64_t)v1;
LABEL_13:

    v4 = v12;
    goto LABEL_14;
  }
  v3 = objc_msgSend(v12, "hasPrefix:", CFSTR("AccessibilityFrameworks-SHA__"));
  v4 = v12;
  if (v3)
  {
    v5 = objc_msgSend(v12, "hasSuffix:", CFSTR("_Frameworks_Accessibility"));
    v4 = v12;
    if (v5)
    {
      v6 = objc_msgSend(v12, "rangeOfString:", CFSTR("_Frameworks_Accessibility"));
      v7 = objc_msgSend(CFSTR("AccessibilityFrameworks-SHA__"), "length");
      v8 = objc_msgSend(CFSTR("AccessibilityFrameworks-SHA__"), "length");
      if ((unint64_t)(v6 - v8) >= 8)
        v9 = 8;
      else
        v9 = v6 - v8;
      objc_msgSend(v12, "substringWithRange:", v7, v9);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ATP Root: %@"), v2);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)AXCurrentRootDescription_rootDescription;
      AXCurrentRootDescription_rootDescription = v10;

      goto LABEL_13;
    }
  }
LABEL_14:

}

@end
