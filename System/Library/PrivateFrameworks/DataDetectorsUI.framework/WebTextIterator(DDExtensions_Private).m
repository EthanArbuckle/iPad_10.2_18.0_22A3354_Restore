@implementation WebTextIterator(DDExtensions_Private)

- (BOOL)dd_checkCurrentRangeAgainstString:()DDExtensions_Private
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  char isKindOfClass;
  const __CFString *v11;
  CFComparisonResult v12;

  objc_msgSend(a1, "currentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    objc_msgSend(v5, "startContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v11 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UniChar *)objc_msgSend(a1, "currentTextPointer"), objc_msgSend(a1, "currentTextLength"));
      v12 = CFStringCompare(v11, a3, 0);
      v8 = v12 == kCFCompareEqualTo;
      if (v12)
        DDLog();
      CFRelease(v11);
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    DDLog();
    v8 = 0;
  }

  return v8;
}

@end
