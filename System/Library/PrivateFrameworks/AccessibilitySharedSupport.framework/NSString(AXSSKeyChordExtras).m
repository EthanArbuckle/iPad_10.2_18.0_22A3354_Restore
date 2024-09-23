@implementation NSString(AXSSKeyChordExtras)

- (__CFString)axss_keyChordKeyDisplayValueForUSKeyboard:()AXSSKeyChordExtras
{
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;

  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("␣")) & 1) != 0
    || objc_msgSend(a1, "isEqualToString:", CFSTR(" ")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("AXSSKeySymbolSpace");
  }
  else if (objc_msgSend(a1, "isEqualToString:", CFSTR("⌤")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("AXSSKeySymbolEnter");
  }
  else if (objc_msgSend(a1, "isEqualToString:", CFSTR("⇱")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("AXSSKeySymbolHome");
  }
  else if (objc_msgSend(a1, "isEqualToString:", CFSTR("⇲")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("AXSSKeySymbolEnd");
  }
  else if (objc_msgSend(a1, "isEqualToString:", CFSTR("⇞")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("AXSSKeySymbolPageUp");
  }
  else
  {
    if (!objc_msgSend(a1, "isEqualToString:", CFSTR("⇟")))
    {
      if (a3)
      {
        if ((objc_msgSend(a1, "isEqualToString:", CFSTR("⇥")) & 1) != 0)
        {
          v8 = CFSTR("Tab");
          return v8;
        }
        if ((objc_msgSend(a1, "isEqualToString:", CFSTR("⏎")) & 1) != 0)
        {
          v8 = CFSTR("Return");
          return v8;
        }
        if ((objc_msgSend(a1, "isEqualToString:", CFSTR("⇪")) & 1) != 0)
        {
          v8 = CFSTR("Caps Lock");
          return v8;
        }
        if ((objc_msgSend(a1, "isEqualToString:", CFSTR("⌫")) & 1) != 0)
        {
          v8 = CFSTR("Delete");
          return v8;
        }
      }
      v8 = a1;
      return v8;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AccessibilitySharedSupport"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("AXSSKeySymbolPageDown");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E5F9A110, CFSTR("AccessibilitySharedSupport"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
